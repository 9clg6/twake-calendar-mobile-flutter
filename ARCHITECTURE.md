# Architecture — twake-calendar-mobile

> Source de vérité architecturale du projet (PoC personnel de portage Twake Calendar en Flutter). Tout agent IA générant du code DOIT le lire et le respecter intégralement avant de produire la moindre ligne.
>
> **Référence transverse complémentaire et obligatoire** : [`GUIDELINES.md`](./GUIDELINES.md) (Linagora Twake Flutter/Dart Engineering Guide). Ce fichier-ci décrit la structure du projet et les patterns spécifiques au domaine "calendrier" (CalDAV, jCal, WebSocket temps-réel, sync bidirectionnelle). `GUIDELINES.md` fait foi pour : naming, style Dart, tests, git, lints, conventions de méthodes, booléens, enums, redirection routes. **En cas de conflit, `GUIDELINES.md` prime sur les patterns de code (style/naming) ; ce fichier prime sur la structure du projet et les choix d'outillage.**

---

## Sommaire

1. [Vue d'ensemble](#1-vue-densemble)
2. [Principes directeurs](#2-principes-directeurs)
3. [Structure de fichiers](#3-structure-de-fichiers)
4. [Couche Domain](#4-couche-domain)
5. [Couche Data](#5-couche-data)
6. [Couche Presentation](#6-couche-presentation)
7. [Core (infrastructure)](#7-core-infrastructure)
8. [Shared (cross-feature)](#8-shared-cross-feature)
9. [Riverpod 3 — DI et controllers](#9-riverpod-3--di-et-controllers)
10. [Localisation (ARB)](#10-localisation-arb)
11. [Assets (flutter_gen)](#11-assets-flutter_gen)
12. [Navigation (go_router)](#12-navigation-go_router)
13. [Génération de code](#13-génération-de-code)
14. [Spécificités Twake Calendar](#14-spécificités-twake-calendar)
15. [Checklist : ajouter une feature](#15-checklist--ajouter-une-feature)
16. [Erreurs interdites](#16-erreurs-interdites)
17. [Templates](#17-templates)

---

## 1. Vue d'ensemble

**Application Flutter unique**, pas de monorepo. Architecture **feature-first** + **Clean Architecture** (3 couches Domain / Data / Presentation par feature) + **Riverpod 3** (DI + state).

```
twake-calendar-mobile/
├── lib/
│   ├── core/              # Infrastructure pure, pas d'entité métier
│   ├── shared/            # Domaine partagé entre plusieurs features
│   ├── features/          # Features isolées (data + domain + presentation)
│   ├── foundation/        # Routing, app shell
│   ├── l10n/              # ARB (en, fr, ru, vi)
│   ├── gen/               # flutter_gen
│   └── main.dart
├── assets/
│   └── images/
├── test/                  # Mirror exact de lib/
├── ARCHITECTURE.md        # Ce fichier
├── GUIDELINES.md          # Conventions Dart/style/tests/git
└── pubspec.yaml
```

### 1.1 Stack technique imposée

| Domaine | Lib |
|---|---|
| Flutter | 3.x stable |
| Dart | 3.9+ |
| State management | **Riverpod 3** code-gen (`@riverpod`) |
| Routing | **go_router** + `go_router_builder` (`@TypedGoRoute`) |
| i18n | **flutter_localizations + intl** + ARB (`flutter gen-l10n`) |
| Sérialisation | **freezed** + `json_serializable` |
| HTTP | **Dio** + **Retrofit** (`@RestApi`, `@HTTP` pour verbes WebDAV) |
| Auth | **flutter_appauth** (OIDC PKCE) |
| WebSocket | `web_socket_channel` |
| Persistance locale | **Drift** (SQLite typé, code-gen) |
| Secure storage | `flutter_secure_storage` |
| Préférences | `shared_preferences` |
| Notifications push | `firebase_messaging` |
| Notifications locales | `flutter_local_notifications` |
| Connectivité | `connectivity_plus` |
| Timezone | `timezone` (Olson DB) |
| Lottie | `lottie` |
| SVG | `flutter_svg` |
| Réactif | `rxdart` (BehaviorSubject pour services) |
| Assets | `flutter_gen_runner` |
| Tests | `flutter_test`, `mockito`, `patrol` |

---

## 2. Principes directeurs

### 2.1 Clean Architecture — règles de dépendance

```
┌────────────────────────────────────────────────────────────────┐
│                         PRESENTATION                           │
│        Screens • Controllers (Riverpod) • States • Widgets     │
└────────────────────────────────┬───────────────────────────────┘
                                 │ depends on
                                 ▼
┌────────────────────────────────────────────────────────────────┐
│                      DOMAIN  (feature + shared)                │
│       Entities • Enums • Use Cases • Repository Interfaces     │
│                     Services • Exceptions                       │
└────────────────────────────────▲───────────────────────────────┘
                                 │ implemented by
                                 │
┌────────────────────────────────┴───────────────────────────────┐
│                       DATA  (feature + shared)                 │
│     Repository Impl • DataSources • DTOs/Models • Endpoints    │
└─────────────────────────────────┬──────────────────────────────┘
                                  │ uses
                                  ▼
┌────────────────────────────────────────────────────────────────┐
│                              CORE                              │
│   Network • Theme • Utils • Extensions • Storage • iCal • WS   │
└────────────────────────────────────────────────────────────────┘

Call flow: Screen → Controller → Service → UseCase → Repository → DataSource
Data flow: DataSource → Model.toEntity() → Entity → State → Widget
```

**Règles absolues** :
- Aucun import de `data/` ou `presentation/` dans `domain/`. Le domaine est du Dart pur — pas de Flutter, pas de Riverpod, pas de Dio, pas de Drift.
- Aucun cross-import entre features (`features/calendars/` n'importe **jamais** depuis `features/events/`). Le partage passe par `shared/` ou `core/`.
- Le domaine déclare des interfaces ; la data les implémente ; la présentation consomme via Riverpod.

### 2.2 SOLID, KISS, DRY, immutabilité — voir [`GUIDELINES.md`](./GUIDELINES.md) §1.

### 2.3 Décisions transverses du projet
Voir `analysis/00-decisions/01-technical-decisions.md` pour : Riverpod 3 verrouillé, calendar OSS uniquement (pas de Syncfusion), FCM pour push, sync bidirectionnelle Drift+outbox+conflits async, AGPL v3 dès le `LICENSE`, Firebase perso, repo perso GitHub.

---

## 3. Structure de fichiers

```
lib/
├── core/                              # Pas d'entités métier, pas d'imports de features/
│   ├── config/
│   │   ├── app_config.dart            # abstract AppConfig
│   │   ├── environment.dart           # enum Environment {dev, staging, prod}
│   │   └── impl/
│   │       ├── app_config_dev.dart
│   │       ├── app_config_staging.dart
│   │       └── app_config_prod.dart
│   ├── errors/
│   │   ├── app_exception.dart
│   │   ├── network_exception.dart
│   │   ├── caldav_exception.dart
│   │   ├── ical_exception.dart
│   │   └── auth_exception.dart
│   ├── interfaces/
│   │   ├── usecase.dart               # BaseUseCase, BaseUseCaseWithParams
│   │   ├── future_usecase.dart        # FutureUseCase<T>, FutureUseCaseWithParams<T,P>
│   │   ├── stream_usecase.dart
│   │   └── result_state.dart          # ResultState<T> (success/failure)
│   ├── logging/
│   │   └── log.dart                   # Log.named('Component')
│   ├── network/
│   │   ├── dio_client.dart            # config + interceptors
│   │   ├── auth_interceptor.dart      # Bearer token
│   │   ├── ws_alive_interceptor.dart  # bloque mutations si WS down
│   │   └── retry_interceptor.dart     # backoff 1s→120s
│   ├── ical/
│   │   ├── jcal_codec.dart            # parse/build VEVENT jCal
│   │   ├── jcal_event_builder.dart    # CalendarEventEntity → vevent jCal
│   │   ├── jcal_event_parser.dart     # vevent jCal → CalendarEventEntity
│   │   ├── vtimezone_builder.dart     # depuis package timezone
│   │   └── ical_string_codec.dart     # ICS texte (uniquement pour COUNTER)
│   ├── websocket/
│   │   ├── twake_ws_client.dart       # singleton WS (ticket, ping, reconnect)
│   │   ├── ws_message_parser.dart
│   │   └── ws_state.dart              # enum WsConnectionState
│   ├── storage/
│   │   ├── twake_database.dart        # @DriftDatabase
│   │   ├── tables/
│   │   │   ├── calendars_table.dart
│   │   │   ├── events_table.dart
│   │   │   ├── outbox_table.dart
│   │   │   ├── conflicts_table.dart
│   │   │   └── sync_meta_table.dart
│   │   ├── secure_storage.dart        # wrapper flutter_secure_storage
│   │   └── prefs_storage.dart         # wrapper shared_preferences
│   ├── theme/
│   │   ├── app_theme.dart             # ThemeData light/dark
│   │   ├── color_tokens.dart          # primary, secondary, background...
│   │   └── text_styles.dart
│   ├── extensions/
│   │   ├── build_context_x.dart       # context.l10n, context.colorScheme, ...
│   │   ├── string_x.dart
│   │   └── date_time_x.dart
│   └── services/                      # Services purs (pas d'entité métier)
│       ├── connectivity_service.dart
│       └── logging_service.dart
│
├── shared/                            # Domaine partagé entre features
│   ├── domain/
│   │   ├── entities/
│   │   │   └── user.dart              # UserEntity (consommée par auth, calendars, events)
│   │   ├── repositories/
│   │   │   └── user_repository.dart   # interface
│   │   └── services/
│   └── data/
│       ├── models/
│       │   └── user.remote_model.dart
│       ├── datasources/
│       │   ├── user_remote_datasource.dart
│       │   └── impl/
│       │       └── user_remote_datasource_impl.dart
│       └── repositories/
│           └── user_repository_impl.dart
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── oidc_remote_datasource.dart
│   │   │   │   ├── auth_local_datasource.dart
│   │   │   │   └── impl/
│   │   │   ├── models/
│   │   │   │   └── auth_token.remote_model.dart
│   │   │   └── repositories/
│   │   │       └── oidc_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── auth_token.dart
│   │   │   ├── repositories/
│   │   │   │   └── oidc_repository.dart
│   │   │   ├── usecases/
│   │   │   │   ├── login_usecase.dart
│   │   │   │   ├── logout_usecase.dart
│   │   │   │   └── refresh_token_usecase.dart
│   │   │   └── services/
│   │   │       └── auth_service.dart        # BehaviorSubject<bool isLoggedIn>
│   │   └── presentation/
│   │       ├── controllers/
│   │       │   ├── auth_controller.dart     # @riverpod class AuthController
│   │       │   └── auth_state.dart
│   │       ├── screens/
│   │       │   ├── splash_screen.dart
│   │       │   └── login_callback_screen.dart
│   │       └── widgets/
│   │
│   ├── calendars/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── caldav_calendar_remote_datasource.dart
│   │   │   │   ├── calendar_local_datasource.dart
│   │   │   │   └── impl/
│   │   │   ├── endpoints/
│   │   │   │   └── caldav_calendar_endpoint.dart  # @RestApi + @HTTP('REPORT', ...)
│   │   │   ├── models/
│   │   │   │   ├── calendar.remote_model.dart
│   │   │   │   ├── calendar_item.remote_model.dart
│   │   │   │   ├── acl_entry.remote_model.dart
│   │   │   │   ├── invite.remote_model.dart
│   │   │   │   └── calendar.local_model.dart
│   │   │   ├── mappers/
│   │   │   │   └── calendar_mapper.dart            # extension CalendarRemoteModelX
│   │   │   └── repositories/
│   │   │       └── calendar_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── calendar.dart                   # CalendarEntity
│   │   │   │   ├── delegation_access.dart
│   │   │   │   └── calendar_invite.dart
│   │   │   ├── enums/
│   │   │   │   ├── calendar_visibility.dart
│   │   │   │   └── access_right.dart
│   │   │   ├── repositories/
│   │   │   │   └── calendar_repository.dart
│   │   │   ├── usecases/
│   │   │   │   ├── get_calendars_usecase.dart
│   │   │   │   ├── create_calendar_usecase.dart
│   │   │   │   ├── update_calendar_usecase.dart
│   │   │   │   ├── delete_calendar_usecase.dart
│   │   │   │   ├── update_calendar_acl_usecase.dart
│   │   │   │   ├── add_shared_calendar_usecase.dart
│   │   │   │   ├── update_delegation_usecase.dart
│   │   │   │   ├── export_calendar_usecase.dart
│   │   │   │   ├── import_calendar_usecase.dart
│   │   │   │   └── sync_calendar_with_token_usecase.dart
│   │   │   └── services/
│   │   │       └── calendar_service.dart           # BehaviorSubject<List<CalendarEntity>>
│   │   └── presentation/
│   │       ├── controllers/
│   │       │   ├── sidebar_controller.dart
│   │       │   ├── sidebar_state.dart
│   │       │   ├── calendar_modal_controller.dart
│   │       │   └── calendar_modal_state.dart
│   │       ├── screens/
│   │       │   ├── sidebar_screen.dart
│   │       │   ├── calendar_modal_screen.dart
│   │       │   └── delete_calendar_dialog.dart
│   │       └── widgets/
│   │           ├── calendar_accordion.dart
│   │           ├── calendar_item_tile.dart
│   │           └── access_row.dart
│   │
│   ├── events/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── caldav_event_remote_datasource.dart
│   │   │   │   ├── caldav_freebusy_remote_datasource.dart
│   │   │   │   ├── event_local_datasource.dart
│   │   │   │   └── impl/
│   │   │   ├── endpoints/
│   │   │   │   ├── caldav_event_endpoint.dart
│   │   │   │   └── caldav_freebusy_endpoint.dart
│   │   │   ├── models/
│   │   │   │   ├── event.local_model.dart
│   │   │   │   ├── free_busy.remote_model.dart
│   │   │   │   └── search_response.remote_model.dart
│   │   │   ├── mappers/
│   │   │   │   └── calendar_event_mapper.dart      # passe par core/ical/jcal_codec
│   │   │   └── repositories/
│   │   │       ├── event_repository_impl.dart
│   │   │       └── free_busy_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── calendar_event.dart
│   │   │   │   ├── repetition.dart
│   │   │   │   ├── attendee.dart
│   │   │   │   ├── organizer.dart
│   │   │   │   ├── alarm.dart
│   │   │   │   └── free_busy.dart
│   │   │   ├── enums/
│   │   │   │   ├── partstat.dart
│   │   │   │   ├── attendee_role.dart
│   │   │   │   ├── cutype.dart
│   │   │   │   ├── transparency.dart
│   │   │   │   ├── event_class.dart
│   │   │   │   ├── event_status.dart
│   │   │   │   ├── repeat_freq.dart
│   │   │   │   └── itip_method.dart
│   │   │   ├── repositories/
│   │   │   │   ├── event_repository.dart
│   │   │   │   └── free_busy_repository.dart
│   │   │   ├── usecases/
│   │   │   │   ├── get_event_usecase.dart
│   │   │   │   ├── put_event_usecase.dart
│   │   │   │   ├── delete_event_usecase.dart
│   │   │   │   ├── delete_event_instance_usecase.dart
│   │   │   │   ├── update_event_instance_usecase.dart
│   │   │   │   ├── update_series_usecase.dart
│   │   │   │   ├── move_event_usecase.dart
│   │   │   │   ├── post_counter_usecase.dart
│   │   │   │   ├── update_partstat_usecase.dart
│   │   │   │   └── get_free_busy_usecase.dart
│   │   │   └── services/
│   │   │       └── event_service.dart
│   │   └── presentation/
│   │       ├── controllers/
│   │       │   ├── event_preview_controller.dart
│   │       │   ├── event_form_controller.dart
│   │       │   ├── event_recurrence_controller.dart
│   │       │   ├── attendance_validation_controller.dart
│   │       │   ├── counter_proposal_controller.dart
│   │       │   └── *.state.dart
│   │       ├── screens/
│   │       │   ├── event_preview_screen.dart
│   │       │   ├── event_form_screen.dart
│   │       │   ├── event_recurrence_modal.dart
│   │       │   ├── attendance_validation_screen.dart
│   │       │   ├── counter_proposal_screen.dart
│   │       │   └── edit_mode_dialog.dart
│   │       └── widgets/
│   │           ├── event_chip.dart
│   │           ├── attendee_search.dart
│   │           ├── attendee_badge.dart
│   │           ├── date_time_field.dart
│   │           ├── recurrence_field.dart
│   │           ├── visibility_field.dart
│   │           └── notification_field.dart
│   │
│   ├── calendar_view/                     # Vues mois/semaine/jour
│   │   ├── domain/
│   │   │   └── services/
│   │   │       └── calendar_loader_service.dart    # équivalent useCalendarLoader
│   │   └── presentation/
│   │       ├── controllers/
│   │       │   ├── calendar_layout_controller.dart
│   │       │   ├── month_view_controller.dart
│   │       │   ├── week_view_controller.dart
│   │       │   └── day_view_controller.dart
│   │       ├── screens/
│   │       │   ├── calendar_layout_screen.dart    # shell : menubar + sidebar + view
│   │       │   ├── month_view_screen.dart
│   │       │   ├── week_view_screen.dart
│   │       │   ├── day_view_screen.dart
│   │       │   └── agenda_view_screen.dart
│   │       └── widgets/
│   │           ├── menubar.dart
│   │           ├── app_grid_popover.dart
│   │           ├── calendar_grid.dart
│   │           ├── time_grid.dart
│   │           ├── now_indicator.dart
│   │           └── multi_day_band.dart
│   │
│   ├── search/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── endpoints/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── controllers/
│   │       └── screens/
│   │
│   ├── settings/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user_settings.dart
│   │   │   ├── repositories/
│   │   │   │   └── user_settings_repository.dart
│   │   │   ├── usecases/
│   │   │   │   ├── get_user_settings_usecase.dart
│   │   │   │   └── update_user_settings_usecase.dart
│   │   │   └── services/
│   │   ├── data/
│   │   │   ├── datasources/                # use core/network User endpoint
│   │   │   ├── models/
│   │   │   ├── mappers/
│   │   │   └── repositories/
│   │   └── presentation/
│   │       ├── controllers/
│   │       └── screens/
│   │           ├── settings_home_screen.dart
│   │           ├── language_screen.dart
│   │           ├── timezone_screen.dart
│   │           ├── general_settings_screen.dart
│   │           └── notification_settings_screen.dart
│   │
│   ├── sync/                               # Outbox + résolution conflits
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── outbox_local_datasource.dart
│   │   │   │   ├── conflict_local_datasource.dart
│   │   │   │   └── sync_meta_local_datasource.dart
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── outbox_entry.dart
│   │   │   │   └── conflict.dart
│   │   │   ├── repositories/
│   │   │   ├── usecases/
│   │   │   └── services/
│   │   │       └── sync_coordinator_service.dart
│   │   └── presentation/
│   │       ├── controllers/
│   │       └── screens/
│   │           └── conflict_resolution_screen.dart
│   │
│   ├── notifications/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── fcm_remote_datasource.dart
│   │   │   │   ├── local_notifications_datasource.dart
│   │   │   │   └── device_remote_datasource.dart
│   │   │   ├── endpoints/
│   │   │   │   └── device_endpoint.dart        # backend Linagora à venir
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── device_registration.dart
│   │   │   ├── repositories/
│   │   │   ├── usecases/
│   │   │   └── services/
│   │   │       ├── push_notifications_service.dart
│   │   │       └── local_reminder_service.dart  # planification VALARM
│   │   └── presentation/
│   │
│   ├── realtime/                            # WebSocket events
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── ws_remote_datasource.dart   # wraps core/websocket/twake_ws_client
│   │   │   └── repositories/
│   │   │       └── ws_realtime_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── ws_message.dart             # sealed Freezed union
│   │   │   ├── repositories/
│   │   │   │   └── ws_realtime_repository.dart
│   │   │   └── services/
│   │   │       └── ws_realtime_service.dart
│   │   └── presentation/                       # invisible (provider monté en root)
│   │
│   └── shared/                              # Cross-feature UI uniquement
│       └── presentation/
│           ├── screens/
│           │   ├── error_screen.dart
│           │   └── loading_overlay.dart
│           └── widgets/
│               ├── responsive_dialog.dart
│               ├── twake_loading.dart
│               └── twake_app_bar.dart
│
├── foundation/
│   ├── routing/
│   │   ├── app_router.dart                   # @TypedGoRoute classes
│   │   └── router_provider.dart              # @Riverpod(keepAlive: true) GoRouter
│   └── app/
│       └── twake_calendar_app.dart           # MaterialApp.router racine
│
├── l10n/
│   ├── app_en.arb                            # template
│   ├── app_fr.arb
│   ├── app_ru.arb
│   └── app_vi.arb
│
├── gen/                                      # flutter_gen (Assets)
└── main.dart
```

> **Distinction `core/` vs `shared/` vs `features/X/`** :
> - **`core/`** : utilitaires sans entité métier (réseau, theme, logger, codec iCal, client WS, base de données). Stable, modifié rarement.
> - **`shared/`** : entités/repos/services partagés entre **plusieurs** features (ex. `UserEntity`).
> - **`features/X/`** : tout ce qui est propre à une fonctionnalité.
>
> **Règle anti-bloat** : si quelque chose n'est utilisé que par une feature, il **ne** va pas dans `core/` ni `shared/`.

---

## 4. Couche Domain

### 4.1 Entité (`features/X/domain/entities/`)

```dart
// fichier : lib/features/events/domain/entities/calendar_event.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/repetition.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/event_class.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/transparency.dart';

part 'calendar_event.freezed.dart';

/// Événement calendrier (modèle métier).
@freezed
abstract class CalendarEventEntity with _$CalendarEventEntity {
  const factory CalendarEventEntity({
    required String uid,
    required String calId,
    required String url,
    required String start,
    required String timezone,
    String? end,
    String? title,
    String? description,
    String? location,
    @Default(<AttendeeEntity>[]) List<AttendeeEntity> attendees,
    RepetitionEntity? repetition,
    @Default(EventClass.publicClass) EventClass classification,
    @Default(Transparency.opaque) Transparency transp,
    @Default(false) bool allday,
    String? recurrenceId,
    @Default(<String>[]) List<String> exdates,
    int? sequence,
    String? videoConferenceUrl,
  }) = _CalendarEventEntity;
}
```

**Règles** :
- `@freezed abstract class XxxEntity with _$XxxEntity`
- Part `.freezed.dart` uniquement (pas de `.g.dart` — pas de JSON sur les entités)
- `const factory` avec named parameters et `@Default(...)` pour les défauts
- Pas de logique métier dans l'entité ; les getters de présentation passent par une extension dans `presentation/extensions/`

### 4.2 Enum (Dart enhanced enum)

```dart
// fichier : lib/features/events/domain/enums/partstat.dart
enum Partstat {
  needsAction('NEEDS-ACTION'),
  accepted('ACCEPTED'),
  declined('DECLINED'),
  tentative('TENTATIVE'),
  delegated('DELEGATED'),
  completed('COMPLETED');

  const Partstat(this.icalValue);
  final String icalValue;

  static Partstat fromIcal(String value) => values.firstWhere(
        (Partstat e) => e.icalValue == value,
        orElse: () => Partstat.needsAction,
      );

  bool get isResponded =>
      this == Partstat.accepted || this == Partstat.declined || this == Partstat.tentative;
}
```

### 4.3 Repository (interface)

```dart
// fichier : lib/features/events/domain/repositories/event_repository.dart
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';

/// Contrat du repository d'événements.
abstract interface class EventRepository {
  /// Récupère un événement par son URL CalDAV.
  Future<CalendarEventEntity?> getEvent(String url);

  /// Crée ou met à jour un événement (PUT CalDAV jCal).
  Future<void> putEvent(CalendarEventEntity event);

  /// Supprime un événement.
  Future<void> deleteEvent(String url);

  /// Supprime une occurrence d'une série récurrente.
  Future<void> deleteEventInstance({
    required String eventUrl,
    required String recurrenceId,
  });

  /// Déplace un événement entre calendriers.
  Future<void> moveEvent({required String fromUrl, required String toUrl});
}
```

**Règles** :
- `abstract interface class` (Dart 3)
- Types de retour = entités domain ; jamais de model data
- Doc `///` sur chaque méthode

### 4.4 Use Case

```dart
// fichier : lib/features/events/domain/usecases/put_event_usecase.dart
import 'package:twake_calendar_mobile/core/interfaces/future_usecase.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';

/// Met à jour ou crée un événement.
final class PutEventUseCase
    extends FutureUseCaseWithParams<void, CalendarEventEntity> {
  PutEventUseCase({required EventRepository eventRepository})
      : _eventRepository = eventRepository;

  final EventRepository _eventRepository;

  @override
  Future<void> invoke(CalendarEventEntity params) =>
      _eventRepository.putEvent(params);
}
```

**Règles** :
- `final class` étend `FutureUseCase<T>` ou `FutureUseCaseWithParams<T, P>` (depuis `core/interfaces/`)
- Implémente **uniquement** `invoke()` ; ne jamais surcharger `execute()`
- Un seul repository par use case (SRP). Si plusieurs sont nécessaires, créer un Service.

### 4.5 Service domain

```dart
// fichier : lib/features/calendars/domain/services/calendar_service.dart
final class CalendarService {
  CalendarService({
    required GetCalendarsUseCase getCalendarsUseCase,
    required CreateCalendarUseCase createCalendarUseCase,
    required UpdateCalendarUseCase updateCalendarUseCase,
    required DeleteCalendarUseCase deleteCalendarUseCase,
  })  : _getCalendarsUseCase = getCalendarsUseCase,
        _createCalendarUseCase = createCalendarUseCase,
        _updateCalendarUseCase = updateCalendarUseCase,
        _deleteCalendarUseCase = deleteCalendarUseCase;

  final GetCalendarsUseCase _getCalendarsUseCase;
  // ...

  final BehaviorSubject<List<CalendarEntity>> calendarsStream =
      BehaviorSubject<List<CalendarEntity>>.seeded(<CalendarEntity>[]);

  Future<void> loadCalendars() async {
    final ResultState<List<CalendarEntity>> result =
        await _getCalendarsUseCase.execute();
    result.when(
      success: (List<CalendarEntity> data) => calendarsStream.add(data),
      failure: (Exception e) =>
          Log.named('CalendarService').error('loadCalendars', e),
    );
  }
}
```

**Règles** :
- Orchestre plusieurs use cases et/ou maintient un état réactif (`BehaviorSubject`).
- Vit dans `features/X/domain/services/` si propre à la feature, dans `shared/domain/services/` si partagé.
- Aucune dépendance UI / Flutter.

### 4.6 Param (avec sérialisation JSON si nécessaire)

```dart
// fichier : lib/features/events/domain/params/put_event_param.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_event_param.freezed.dart';
part 'put_event_param.g.dart';

@Freezed()
abstract class PutEventParam with _$PutEventParam {
  const factory PutEventParam({
    required String url,
    required List<dynamic> jcal,
  }) = _PutEventParam;

  factory PutEventParam.fromJson(Map<String, dynamic> json) =>
      _$PutEventParamFromJson(json);
}
```

> Beaucoup d'use cases prennent directement une entité en paramètre (cf. `PutEventUseCase` ci-dessus) ; les params Freezed dédiés ne sont créés que si la signature combine plusieurs valeurs hétérogènes.

---

## 5. Couche Data

### 5.1 Remote model (Freezed + JSON)

```dart
// fichier : lib/features/calendars/data/models/calendar.remote_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar.remote_model.freezed.dart';
part 'calendar.remote_model.g.dart';

/// Modèle distant pour un calendrier (HAL CalDAV).
@freezed
abstract class CalendarRemoteModel with _$CalendarRemoteModel {
  const factory CalendarRemoteModel({
    required String id,
    @JsonKey(name: 'dav:name') required String name,
    @JsonKey(name: 'apple:color') String? color,
    @JsonKey(name: 'caldav:description') String? description,
    @JsonKey(name: 'acl') @Default(<AclEntryRemoteModel>[]) List<AclEntryRemoteModel> acl,
    @JsonKey(name: 'invite') @Default(<InviteRemoteModel>[]) List<InviteRemoteModel> invite,
  }) = _CalendarRemoteModel;

  factory CalendarRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarRemoteModelFromJson(json);
}
```

**Convention** : nommage `xxx.remote_model.dart` (point pour séparer domaine du type, sans tirets), part `.freezed.dart` ET `.g.dart`.

### 5.2 Endpoint Retrofit

```dart
// fichier : lib/features/calendars/data/endpoints/caldav_calendar_endpoint.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:twake_calendar_mobile/features/calendars/data/models/calendar.remote_model.dart';

part 'caldav_calendar_endpoint.g.dart';

@RestApi()
abstract class CaldavCalendarEndpoint {
  factory CaldavCalendarEndpoint(Dio dio) = _CaldavCalendarEndpoint;

  @GET('/dav/calendars/{userId}.json')
  Future<CalendarListRemoteModel> listCalendars(
    @Path('userId') String userId,
    @Queries() Map<String, dynamic> scope,
  );

  /// Verbe WebDAV non-standard via @HTTP.
  @HTTP('REPORT', '/dav/calendars/{calId}.json')
  Future<CalendarReportRemoteModel> reportRange(
    @Path('calId') String calId,
    @Body() Map<String, dynamic> body,
  );

  @HTTP('PROPPATCH', '/dav{calLink}')
  Future<void> proppatchCalendar(
    @Path('calLink', encoded: true) String calLink,
    @Body() Map<String, dynamic> body,
  );
}
```

**Règles** :
- `@RestApi()` sans `baseUrl` (configuré sur Dio)
- `@HTTP('VERB', '/path')` pour REPORT, PROPPATCH, ACL, MOVE
- Si la génération Retrofit échoue pour un verbe : fallback en Dio direct dans le DataSourceImpl, l'interface `RemoteDataSource` reste identique.
- `factory XxxEndpoint(Dio dio) = _XxxEndpoint;`

### 5.3 DataSource (interface + impl)

```dart
// fichier : lib/features/calendars/data/datasources/caldav_calendar_remote_datasource.dart
abstract interface class CaldavCalendarRemoteDataSource {
  Future<List<CalendarRemoteModel>> fetchCalendars({required String userId});

  Future<List<CalendarItemRemoteModel>> reportRange({
    required String calId,
    required DateTime start,
    required DateTime end,
  });
}

// fichier : lib/features/calendars/data/datasources/impl/caldav_calendar_remote_datasource_impl.dart
final class CaldavCalendarRemoteDataSourceImpl
    implements CaldavCalendarRemoteDataSource {
  CaldavCalendarRemoteDataSourceImpl({required CaldavCalendarEndpoint endpoint})
      : _endpoint = endpoint;

  final CaldavCalendarEndpoint _endpoint;

  static const Map<String, dynamic> _defaultScope = <String, dynamic>{
    'personal': 'true',
    'sharedDelegationStatus': 'accepted',
    'sharedPublicSubscription': 'true',
    'withRights': 'true',
  };

  @override
  Future<List<CalendarRemoteModel>> fetchCalendars({required String userId}) async {
    final CalendarListRemoteModel response =
        await _endpoint.listCalendars(userId, _defaultScope);
    return response.embedded.calendars;
  }
  // ...
}
```

**Vocabulaire des méthodes** (cf. GUIDELINES §3.5) :
- `fetch*` → accès réseau
- `get*` → accès local (cache, mémoire, Drift)
- `save*` → create/update
- `delete*` → suppression

### 5.4 Mapper (extension)

```dart
// fichier : lib/features/calendars/data/mappers/calendar_mapper.dart
import 'package:twake_calendar_mobile/features/calendars/data/models/calendar.remote_model.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';
import 'package:twake_calendar_mobile/shared/domain/entities/user.dart';

extension CalendarRemoteModelX on CalendarRemoteModel {
  CalendarEntity toEntity({required UserEntity owner}) => CalendarEntity(
        id: id,
        link: '/calendars/${owner.openpaasId}/$id.json',
        name: name,
        owner: owner,
        // ...
      );
}

extension CalendarEntityToRemoteX on CalendarEntity {
  CalendarRemoteModel toRemoteModel() => CalendarRemoteModel(
        id: id,
        name: name,
        description: description,
      );
}
```

### 5.5 Repository impl

```dart
// fichier : lib/features/calendars/data/repositories/calendar_repository_impl.dart
final class CalendarRepositoryImpl implements CalendarRepository {
  CalendarRepositoryImpl({
    required CaldavCalendarRemoteDataSource remoteDataSource,
    required CalendarLocalDataSource localDataSource,
    required UserRepository userRepository,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _userRepository = userRepository;

  final CaldavCalendarRemoteDataSource _remoteDataSource;
  final CalendarLocalDataSource _localDataSource;
  final UserRepository _userRepository;

  @override
  Future<List<CalendarEntity>> getCalendars() async {
    final UserEntity user = await _userRepository.getCurrentUser();

    // Lecture locale d'abord (offline-first), puis sync
    final List<CalendarEntity> cached = await _localDataSource.getAll();
    if (cached.isNotEmpty && !await _isStale()) {
      return cached;
    }
    final List<CalendarRemoteModel> remoteList =
        await _remoteDataSource.fetchCalendars(userId: user.openpaasId);
    final List<CalendarEntity> entities = remoteList
        .map((CalendarRemoteModel m) => m.toEntity(owner: user))
        .toList();
    await _localDataSource.replaceAll(
      entities.map((CalendarEntity e) => e.toLocalModel()).toList(),
    );
    return entities;
  }

  // ...
}
```

**Règles** :
- `final class XxxRepositoryImpl implements XxxRepository`
- Reçoit DataSource(s) par injection
- **C'est ici et uniquement ici** que le mapping `RemoteModel ↔ Entity` se fait
- Orchestration cache local (Drift) + remote (HTTP) + mapping

---

## 6. Couche Presentation

### 6.1 State (Freezed)

```dart
// fichier : lib/features/calendars/presentation/controllers/sidebar_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';

part 'sidebar_state.freezed.dart';

@Freezed(copyWith: true)
abstract class SidebarState with _$SidebarState {
  const factory SidebarState({
    required List<CalendarEntity> myCalendars,
    required List<CalendarEntity> sharedCalendars,
    required List<CalendarEntity> delegatedCalendars,
    required Set<String> selectedCalendarIds,
    @Default(false) bool isRefreshing,
  }) = _SidebarState;

  factory SidebarState.initial() => const SidebarState(
        myCalendars: <CalendarEntity>[],
        sharedCalendars: <CalendarEntity>[],
        delegatedCalendars: <CalendarEntity>[],
        selectedCalendarIds: <String>{},
      );
}
```

**Règles** :
- `@Freezed(copyWith: true) abstract class XxxState with _$XxxState`
- Factory `.initial()`
- Part `.freezed.dart` uniquement
- Sealed class quand l'état a des variantes mutuellement exclusives.

### 6.2 Controller (Riverpod 3 code-gen)

Le **controller** est le pivot de la couche présentation. Annotation `@riverpod` sur une classe. Le type de retour de `build()` détermine la nature du provider (cf. GUIDELINES §2.5.0bis) :

| Source canonique | Retour de `build()` |
|---|---|
| Stream continu (CalDAV sync, WebSocket) | `Stream<T>` |
| One-shot async (REST, charge initiale) | `Future<T>` |
| Local synchrone | `T` |

#### Controller async (cas typique d'écran avec fetch)

```dart
// fichier : lib/features/calendars/presentation/controllers/sidebar_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/services/calendar_service.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_state.dart';
// ...

part 'sidebar_controller.g.dart';

@riverpod
class SidebarController extends _$SidebarController {
  late CalendarService _calendarService;

  @override
  Future<SidebarState> build() async {
    _calendarService = await ref.watch(calendarServiceProvider.future);
    return _fetch();
  }

  Future<SidebarState> _fetch() async {
    await _calendarService.loadCalendars();
    final List<CalendarEntity> all = _calendarService.calendarsStream.value;
    return SidebarState(
      myCalendars: all.where((CalendarEntity c) => c.owner.isCurrentUser).toList(),
      sharedCalendars: all.where((CalendarEntity c) => c.invite.isNotEmpty).toList(),
      delegatedCalendars: all.where((CalendarEntity c) => c.delegated).toList(),
      selectedCalendarIds: <String>{},
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading<SidebarState>();
    state = await AsyncValue.guard<SidebarState>(_fetch);
  }

  Future<void> toggleSelection(String calendarId) async {
    final SidebarState? current = state.valueOrNull;
    if (current == null) return;
    final Set<String> next = <String>{...current.selectedCalendarIds};
    next.contains(calendarId) ? next.remove(calendarId) : next.add(calendarId);
    state = AsyncData<SidebarState>(current.copyWith(selectedCalendarIds: next));
  }
}
```

#### Controller stream (cas WS / Drift watch)

```dart
@riverpod
class CalendarRealtimeController extends _$CalendarRealtimeController {
  @override
  Stream<List<CalendarEntity>> build() {
    return ref.watch(calendarServiceProvider).calendarsStream;
  }
}
```

#### Controller sync (cas local pur)

```dart
@riverpod
class SettingsHomeController extends _$SettingsHomeController {
  @override
  SettingsHomeState build() {
    final UserEntity? user = ref.watch(currentUserProvider).valueOrNull;
    return SettingsHomeState(userName: user?.firstName ?? '');
  }

  void selectLanguage(String code) {
    state = state.copyWith(selectedLanguageCode: code);
  }
}
```

**Règles** :
- `@riverpod class XxxController extends _$XxxController`
- `build()` async, sync ou stream selon source canonique (cf. GUIDELINES §2.5.0bis)
- `ref.watch` dans `build()` ; **jamais** `ref.read` dans `build()`
- `ref.read` dans les méthodes (callbacks)
- `ref.listen` pour les effets de bord
- `AsyncValue.guard()` pour les opérations async des méthodes
- Pattern "confirmation passée en paramètre" : la vue passe `confirm: () => showDialog(...)` au controller, le controller décide (cf. GUIDELINES §2.5)
- **Anti-pattern à fuir** : `Future<T>` + `ref.listen` sur stream dans `build()`. Si la source est un stream, `build()` retourne `Stream<T>`.

### 6.3 Screen (ConsumerStatefulWidget ou ConsumerWidget)

```dart
// fichier : lib/features/calendars/presentation/screens/sidebar_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_controller.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_state.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/widgets/calendar_accordion.dart';

class SidebarScreen extends ConsumerWidget {
  const SidebarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<SidebarState> asyncState = ref.watch(sidebarControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.calendarPersonal)),
      body: asyncState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object e, StackTrace _) =>
            Center(child: Text(context.l10n.errorUnknown)),
        data: (SidebarState state) => _SidebarContent(state: state),
      ),
    );
  }
}

class _SidebarContent extends ConsumerWidget {
  const _SidebarContent({required this.state});
  final SidebarState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => ref.read(sidebarControllerProvider.notifier).refresh(),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          CalendarAccordion(
            title: context.l10n.calendarPersonal,
            calendars: state.myCalendars,
            selectedIds: state.selectedCalendarIds,
            onToggle: (String id) => ref
                .read(sidebarControllerProvider.notifier)
                .toggleSelection(id),
          ),
          const Gap(16),
          CalendarAccordion(
            title: context.l10n.calendarShared,
            calendars: state.sharedCalendars,
            selectedIds: state.selectedCalendarIds,
            onToggle: (String id) => ref
                .read(sidebarControllerProvider.notifier)
                .toggleSelection(id),
          ),
        ],
      ),
    );
  }
}
```

**Règles critiques** :
1. **`ConsumerWidget`** ou **`ConsumerStatefulWidget`** — toujours.
2. **`asyncState.when(loading:, error:, data:)`** pour les controllers async.
3. **Zéro string en dur** — `context.l10n.xxx`.
4. **Zéro couleur en dur** — `context.colorScheme.xxx`.
5. **`Gap(n)`** pour les espacements (cf. GUIDELINES §3.7).
6. **`ref.watch(xxxControllerProvider)`** pour s'abonner.
7. **`ref.read(xxxControllerProvider.notifier).method()`** pour les actions.
8. **Aucune logique métier** — juste `f(state) → widgets`.
9. La route est définie dans `foundation/routing/app_router.dart` ; le `build()` de la `XxxRoute` retourne le screen.

### 6.4 Extensions de présentation

Plutôt que d'enrichir les entités domain, créer des extensions dans `presentation/extensions/` :

```dart
// fichier : lib/features/events/presentation/extensions/calendar_event_x.dart
extension CalendarEventX on CalendarEventEntity {
  bool get isMultiDay {
    if (end == null) return false;
    final DateTime startDt = DateTime.parse(start);
    final DateTime endDt = DateTime.parse(end!);
    return startDt.day != endDt.day;
  }

  String get shortPreview =>
      (title ?? '').length > 60 ? '${title!.substring(0, 60)}…' : (title ?? '');
}
```

---

## 7. Core (infrastructure)

### 7.1 AppConfig (`core/config/`)

```dart
// fichier : lib/core/config/app_config.dart
abstract class AppConfig {
  const AppConfig({
    required this.appName,
    required this.env,
    required this.calendarBaseUrl,
    required this.ssoBaseUrl,
    required this.ssoClientId,
    required this.ssoScope,
    required this.ssoRedirectUri,
    required this.ssoPostLogoutRedirect,
    required this.webSocketUrl,
    required this.wsPingPeriodMs,
    required this.wsPingTimeoutPeriodMs,
  });

  final Environment env;
  final String appName;
  final String calendarBaseUrl;
  final String ssoBaseUrl;
  final String ssoClientId;
  final String ssoScope;
  final String ssoRedirectUri;
  final String ssoPostLogoutRedirect;
  final String webSocketUrl;
  final int wsPingPeriodMs;
  final int wsPingTimeoutPeriodMs;

  bool get isProd => env == Environment.production;
}
```

3 implémentations (dev, staging, prod), choisies au build via `--dart-define=ENV=dev`.

### 7.2 Base usecase + ResultState (`core/interfaces/`)

```dart
abstract class FutureUseCase<T> implements BaseUseCase<Future<ResultState<T>>> {
  @override
  Future<ResultState<T>> execute() async => _futureCatcher(invoke);
  Future<T> invoke();
}

abstract class FutureUseCaseWithParams<T, P>
    implements BaseUseCaseWithParams<Future<ResultState<T>>, P> {
  @override
  Future<ResultState<T>> execute(P params) async =>
      _futureCatcher(() => invoke(params));
  Future<T> invoke(P params);
}
```

`execute()` enveloppe `invoke()` avec try/catch + timeout (15 s) ; retourne `ResultState<T>` (`success` / `failure`). **Ne jamais surcharger `execute()`** dans une sous-classe — implémenter `invoke()` uniquement.

### 7.3 Logging

```dart
final Log _log = Log.named('CalendarRepositoryImpl');
_log.info('Fetching calendars for user: $userId');
_log.error('Failed to fetch', error, stackTrace);
```

Voir GUIDELINES §2.4.7 pour les niveaux et règles de sécurité (jamais de PII / token / payload sensible en log).

### 7.4 BuildContext extension

```dart
// fichier : lib/core/extensions/build_context_x.dart
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
```

---

## 8. Shared (cross-feature)

`lib/shared/` contient le domaine + data partagés par **plusieurs** features.

Cas typiques pour Twake Calendar :
- `UserEntity` : utilisé par auth, calendars (owner), events (organizer/attendee), settings.
- `UserRepository` + impl : un seul accès à `/api/user`.

Si un widget est partagé : il va dans `lib/features/shared/presentation/widgets/` (sous `features/shared/`, pas `shared/`).

---

## 9. Riverpod 3 — DI et controllers

### 9.1 Chaîne d'injection

```
appConfigProvider (keepAlive)
    └→ dioClientProvider (keepAlive)
        └→ xxxEndpointProvider
            └→ xxxRemoteDataSourceProvider
                └→ xxxRepositoryProvider
                    └→ xxxUseCaseProvider
                        └→ xxxServiceProvider (keepAlive si singleton)
                            └→ xxxControllerProvider (auto-dispose)
```

### 9.2 Organisation

**Pas de `core/providers/`** centralisé : chaque provider est colocalisé avec son implémentation. Exemple :

```
lib/features/calendars/data/datasources/impl/caldav_calendar_remote_datasource_impl.dart
lib/features/calendars/data/datasources/caldav_calendar_remote_datasource.providers.dart   # @riverpod
```

ou plus simple : ajouter le provider dans le même fichier que la classe (`part`-style).

**Convention** : un fichier `xxx.providers.dart` par couche/feature regroupe les providers Riverpod proches. Les providers de bootstrap globaux (`appConfig`, `dioClient`, `router`, `kernel`) vivent dans `lib/foundation/providers/`.

### 9.3 Annotations

| Annotation | Usage | Auto-dispose |
|---|---|---|
| `@riverpod` | Endpoints, datasources, repositories, use cases, controllers | Oui |
| `@Riverpod(keepAlive: true)` | Singletons : `appConfig`, `dioClient`, `router`, `userService`, `wsClient`, `kernel` | Non |

### 9.4 Règles
- `ref.watch(xxxProvider.future)` pour les Future à dépendre.
- **Jamais** `ref.read` dans `build()`.
- `ref.read` uniquement dans les callbacks utilisateur (méthodes du controller).
- `ref.listen` pour réagir à un changement sans rebuild.
- Providers = fonctions/classes top-level annotées ; **jamais** de `Provider` global mutable.

### 9.5 Kernel (bootstrap)

```dart
// fichier : lib/foundation/providers/kernel.dart
@Riverpod(keepAlive: true)
Future<void> kernel(Ref ref) async {
  ref.watch(appConfigProvider);

  final (DioClient dio, AuthLocalDataSource authLocal) = await (
    ref.watch(dioClientProvider.future),
    ref.watch(authLocalDataSourceProvider.future),
  ).wait;

  dio.attachAuthInterceptor(authLocal);

  // Démarrage du WS client (singleton keepAlive)
  await ref.watch(twakeWsClientProvider.future);
  // Démarrage du sync coordinator (singleton keepAlive)
  await ref.watch(syncCoordinatorServiceProvider.future);
}
```

### 9.6 Tests : `ProviderContainer`

cf. GUIDELINES §6 pour les patterns de test (fakes injectés via `overrideWith`, `ProviderContainer` pour les tests unitaires de controller, `pumpWidget` + `ProviderScope` pour les widget tests).

---

## 10. Localisation (ARB)

### 10.1 Configuration `pubspec.yaml`

```yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: ^0.19.0

flutter:
  generate: true
```

### 10.2 `l10n.yaml` à la racine

```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
output-class: AppLocalizations
nullable-getter: false
```

### 10.3 ARB

```
lib/l10n/
├── app_en.arb            # template (langue de référence)
├── app_fr.arb
├── app_ru.arb
└── app_vi.arb
```

```json
{
  "@@locale": "en",
  "calendarPersonal": "My calendars",
  "@calendarPersonal": {
    "description": "Section header for the user's own calendars in the sidebar"
  },
  "errorUnknown": "An unknown error occurred",
  "greeting": "Hello {name}",
  "@greeting": {
    "placeholders": {
      "name": { "type": "String" }
    }
  }
}
```

### 10.4 Génération

```bash
flutter gen-l10n        # génère lib/l10n/app_localizations.dart
```

### 10.5 Utilisation

```dart
Text(context.l10n.calendarPersonal)
Text(context.l10n.greeting('Alice'))
```

**Règle absolue** : aucune string utilisateur en dur. Tout passe par `context.l10n.xxx` (extension `BuildContextX`).

---

## 11. Assets (flutter_gen)

### 11.1 `pubspec.yaml`

```yaml
flutter_gen:
  output: lib/gen
  integrations:
    flutter_svg: true
```

### 11.2 Usage

```dart
Image.asset(Assets.images.logoCalendar.path);
SvgPicture.asset(Assets.images.iconCamera.path);
```

**Règle** : jamais de path d'asset en string brute.

---

## 12. Navigation (go_router)

### 12.1 Routes typées (`@TypedGoRoute` + `go_router_builder`)

```dart
// fichier : lib/foundation/routing/app_router.dart
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
// ...

part 'app_router.g.dart';

@TypedGoRoute<SplashRoute>(path: '/')
@immutable
class SplashRoute extends GoRouteData with _$SplashRoute {
  const SplashRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}

@TypedGoRoute<LoginCallbackRoute>(path: '/callback')
@immutable
class LoginCallbackRoute extends GoRouteData with _$LoginCallbackRoute {
  const LoginCallbackRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginCallbackScreen();
}

@TypedGoRoute<CalendarRoute>(
  path: '/calendar',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<EventPreviewRoute>(path: 'events/:eventUid'),
    TypedGoRoute<EventFormRoute>(path: 'events/new'),
    TypedGoRoute<SearchRoute>(path: 'search'),
    TypedGoRoute<SettingsRoute>(path: 'settings'),
    TypedGoRoute<ConflictsRoute>(path: 'conflicts'),
  ],
)
@immutable
class CalendarRoute extends GoRouteData with _$CalendarRoute {
  const CalendarRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final bool isLoggedIn = ProviderScope.containerOf(context)
        .read(authControllerProvider)
        .isLoggedIn;
    return isLoggedIn ? null : const SplashRoute().location;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CalendarLayoutScreen();
}

@immutable
class EventPreviewRoute extends GoRouteData with _$EventPreviewRoute {
  const EventPreviewRoute({required this.eventUid, this.$extra});
  final String eventUid;
  final CalendarEventEntity? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EventPreviewScreen(eventUid: eventUid, initial: $extra);
}
```

### 12.2 Provider GoRouter

```dart
// fichier : lib/foundation/routing/router_provider.dart
@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    debugLogDiagnostics: !ref.watch(appConfigProvider).isProd,
  );
}
```

### 12.3 Navigation

```dart
const CalendarRoute().go(context);
EventPreviewRoute(eventUid: event.uid, $extra: event).push(context);
```

### 12.4 Guards via `redirect`

Voir GUIDELINES §5.3 :
- `redirect` synchrone et pur (pas d'`await`, pas d'effets de bord, pas de navigation impérative).
- Lit l'état d'auth via un provider Riverpod synchrone.
- Pour les checks async (refresh token), exposer un statut sync dans le controller, le `redirect` lit ce statut.

---

## 13. Génération de code

```bash
# Tout générer (Freezed, json_serializable, Retrofit, Riverpod, go_router_builder, flutter_gen, Drift)
dart run build_runner build --delete-conflicting-outputs

# Localisations ARB → AppLocalizations
flutter gen-l10n

# Mode watch (dev)
dart run build_runner watch --delete-conflicting-outputs

# Format + analyse (cf. GUIDELINES §8.5 §8.6)
dart format .
flutter analyze
```

**Fichiers générés** — ne **jamais** modifier à la main :
- `*.freezed.dart`
- `*.g.dart`
- `app_localizations*.dart`
- `lib/gen/*.gen.dart`

---

## 14. Spécificités Twake Calendar

### 14.1 Codec jCal (`core/ical/`)

Le backend esn-sabre attend **du jCal JSON** (pas de l'ICS texte), structure `List<dynamic>` imbriquée. Le codec `core/ical/` parse et build sans dépendre de ical.js (réimplémentation Dart).

Référence d'implémentation détaillée : [`analysis/08-deep-dives/02-jcal-format-reference.md`](./analysis/08-deep-dives/02-jcal-format-reference.md).

```dart
abstract interface class JCalCodec {
  CalendarEventEntity parseVevent(List<dynamic> jcalVevent, {String? calId});
  List<dynamic> buildVcalendar(CalendarEventEntity event, {bool isMaster = true});
  List<dynamic> buildVcalendarWithOverrides(
    CalendarEventEntity master,
    List<CalendarEventEntity> overrides,
  );
}
```

Tests round-trip obligatoires (parse → build → parse) sur les exemples du deep-dive jCal.

### 14.2 WebSocket (`core/websocket/`)

`TwakeWsClient` est un singleton (`@Riverpod(keepAlive: true)`). Il gère :
- Récupération du ticket via `/ws/ticket`
- Connexion `wss://...?ticket=...`
- Ping toutes les 30 s, pong attendu sous 35 s
- Reconnect avec exponential backoff + jitter (max 10 tentatives, 1 s → 30 s)
- État `WsConnectionState` exposé via stream

Référence : [`analysis/08-deep-dives/03-websocket-protocol.md`](./analysis/08-deep-dives/03-websocket-protocol.md).

L'interface `WsRealtimeRepository` (dans `features/realtime/domain/repositories/`) expose `Stream<WsMessageEntity>`. Le `WsRealtimeService` consomme ce stream et pousse les invalidations Riverpod aux controllers concernés.

`assertWebSocketAlive()` : méthode du `TwakeWsClient` appelée par l'`auth_interceptor` Dio avant chaque mutation HTTP (POST/PUT/PATCH/DELETE) pour garantir que le WS est actif (cohérence backend Twake).

### 14.3 CalDAV custom verbs

Les endpoints `caldav_*_endpoint.dart` utilisent `@HTTP('VERB', '/path')` pour REPORT, PROPPATCH, ACL, MOVE.

Si la génération échoue pour un verbe (Retrofit ne supporte pas tout) : implémenter directement en Dio dans le DataSourceImpl, en gardant l'interface `RemoteDataSource` identique côté domain.

Référence complète des endpoints : [`analysis/08-deep-dives/01-caldav-rest-endpoints.md`](./analysis/08-deep-dives/01-caldav-rest-endpoints.md).

### 14.4 Sync bidirectionnelle (`features/sync/`)

`SyncCoordinatorService` (`@Riverpod(keepAlive: true)`) :
- Au démarrage et au retour online : flush outbox FIFO (Drift)
- Sur 412 ETag mismatch : enqueue dans `ConflictRepository` + badge "n conflits à résoudre"
- Sync-token incrémental par calendrier (use case `SyncCalendarWithTokenUseCase`)
- Écoute `WsRealtimeRepository.messages` → invalidation des providers Riverpod concernés

Stratégie de chargement initial calquée sur le frontend web (cf. `analysis/00-decisions/§6.4`) :
- Pas de pagination par count, charge **par fenêtre temporelle** (mois visible + semaine prefetch)
- Batch 5 calendriers en parallèle
- Index Drift `(cal_id, dtstart)` pour requêtes range rapides

### 14.5 Notifications

- **Push (FCM)** : `firebase_messaging` dans `features/notifications/data/`. **Endpoint backend `/api/devices` à créer côté Linagora** (proposition à porter ; en attendant le PoC, `Option A` du doc décisions = local notifications uniquement).
- **Rappels locaux (VALARM)** : `LocalReminderService` planifie via `flutter_local_notifications` à partir de `event.alarm.trigger`. Fonctionne offline.

### 14.6 Storage local (Drift)

```
core/storage/twake_database.dart
core/storage/tables/
  ├── calendars_table.dart
  ├── events_table.dart       # uid, calId, jcalMaster, jcalOverridesJson, etag, dtstart, dtend, status, isDirty
  ├── outbox_table.dart       # opType, payload, attempts, nextRetryAt
  ├── conflicts_table.dart
  └── sync_meta_table.dart
```

Chaque feature qui touche au stockage local définit ses **DAOs** dans son `data/datasources/` (avec ses queries Drift), pas dans `core/`. Le **schéma de base** (tables) reste centralisé dans `core/storage/`.

---

## 15. Checklist : ajouter une feature

Pour chaque nouvelle feature, suivre cet ordre :

### Phase 1 — Domain
- [ ] Entités `lib/features/X/domain/entities/{nom}.dart` (`@freezed`, pas de `.g.dart`)
- [ ] Enums `lib/features/X/domain/enums/{nom}.dart` (enhanced enum)
- [ ] Params `lib/features/X/domain/params/{nom}_param.dart` si nécessaire (`@Freezed()` + `fromJson`)
- [ ] Repository interfaces `lib/features/X/domain/repositories/{nom}_repository.dart`
- [ ] Use cases `lib/features/X/domain/usecases/{action}_{nom}_usecase.dart`
- [ ] Service `lib/features/X/domain/services/{nom}_service.dart` si orchestration multi-use-cases

### Phase 2 — Data
- [ ] Remote models `lib/features/X/data/models/{nom}.remote_model.dart` (Freezed + JSON)
- [ ] Local models `lib/features/X/data/models/{nom}.local_model.dart` si Drift custom (sinon table dans `core/storage/tables/`)
- [ ] Mappers `lib/features/X/data/mappers/{nom}_mapper.dart` (extensions)
- [ ] Endpoints `lib/features/X/data/endpoints/{nom}_endpoint.dart` (Retrofit)
- [ ] DataSource interfaces `lib/features/X/data/datasources/{nom}_remote_datasource.dart`
- [ ] DataSource impls `lib/features/X/data/datasources/impl/{nom}_remote_datasource_impl.dart`
- [ ] Repository impls `lib/features/X/data/repositories/{nom}_repository_impl.dart`

### Phase 3 — Providers
- [ ] Provider de chaque endpoint, datasource, repository, use case, service (`@riverpod`).
- [ ] Colocalisés (mêmes fichiers ou `xxx.providers.dart` voisin).

### Phase 4 — Presentation
- [ ] State `lib/features/X/presentation/controllers/{nom}_state.dart`
- [ ] Controller `lib/features/X/presentation/controllers/{nom}_controller.dart`
- [ ] Screen `lib/features/X/presentation/screens/{nom}_screen.dart`
- [ ] Widgets `lib/features/X/presentation/widgets/`
- [ ] Extensions présentation `lib/features/X/presentation/extensions/`
- [ ] Route ajoutée dans `lib/foundation/routing/app_router.dart` (`@TypedGoRoute<XxxRoute>`)
- [ ] Traductions ajoutées dans `lib/l10n/app_en.arb` (template) et propagées en fr/ru/vi

### Phase 5 — Tests
- [ ] `test/features/X/domain/usecases/{action}_{nom}_usecase_test.dart`
- [ ] `test/features/X/data/repositories/{nom}_repository_impl_test.dart`
- [ ] `test/features/X/presentation/controllers/{nom}_controller_test.dart`
- [ ] Widget test pour les écrans clés (cf. GUIDELINES §6)

### Phase 6 — Génération + qualité
- [ ] `dart run build_runner build --delete-conflicting-outputs`
- [ ] `flutter gen-l10n`
- [ ] `flutter analyze` zéro warning
- [ ] `dart format .`
- [ ] Imports en `package:` (jamais relatifs)
- [ ] `///` sur tous les membres publics
- [ ] Aucune string en dur, aucune couleur en dur, aucun asset path en dur

---

## 16. Erreurs interdites

```dart
// INTERDIT — import data dans domain
import 'package:twake_calendar_mobile/features/events/data/models/event.remote_model.dart';
// dans un fichier de features/events/domain/...

// INTERDIT — cross-import entre features
import 'package:twake_calendar_mobile/features/calendars/...';
// dans un fichier de features/events/...
// → passer par shared/ ou core/

// INTERDIT — logique métier dans le screen
class _MyScreenState extends ConsumerState<MyScreen> {
  @override
  Widget build(BuildContext context) {
    final unreadCount = events.where((e) => !e.isRead).length;  // INTERDIT
  }
}

// INTERDIT — appel HTTP direct dans le controller
Future<void> loadData() async {
  final response = await Dio().get('/api/data');  // INTERDIT
}

// INTERDIT — string en dur
Text('My calendars')                     // INTERDIT → Text(context.l10n.calendarPersonal)

// INTERDIT — couleur en dur
Container(color: Colors.blue)            // INTERDIT → Container(color: context.colorScheme.primary)

// INTERDIT — asset path en dur
Image.asset('assets/images/logo.png')    // INTERDIT → Image.asset(Assets.images.logo.path)

// INTERDIT — modifier un fichier généré
*.g.dart, *.freezed.dart, app_localizations*.dart

// INTERDIT — import relatif
import '../../core/utils/x.dart';        // INTERDIT
import 'package:twake_calendar_mobile/core/utils/x.dart';  // CORRECT

// INTERDIT — mutation d'un état
state.items.add('new');                   // INTERDIT → copyWith

// INTERDIT — ref.read dans build()
@override
Future<MyState> build() async {
  final s = ref.read(myServiceProvider); // INTERDIT → ref.watch
}

// INTERDIT — surcharger execute()
class MyUC extends FutureUseCase<int> {
  @override
  Future<ResultState<int>> execute() async { ... }  // INTERDIT
}

// INTERDIT — navigation par string
context.go('/calendar/events/${event.uid}');                       // INTERDIT
EventPreviewRoute(eventUid: event.uid).push(context);              // CORRECT

// INTERDIT — async dans redirect()
@override
FutureOr<String?> redirect(BuildContext c, GoRouterState s) async {
  final user = await fetchUser();  // INTERDIT
  return null;
}

// INTERDIT — SizedBox pour spacing
SizedBox(height: 16)                      // INTERDIT → Gap(16)

// INTERDIT — Future<T> + ref.listen sur un stream dans build() (cf. GUIDELINES §2.5.0bis)
@riverpod
class C extends _$C {
  @override
  Future<S> build() async {
    ref.listen(streamProv, (_, m) => state = AsyncData(...));   // INTERDIT
    return S.initial();
  }
}
// → si la source est un stream, build() retourne Stream<T>
```

---

## 17. Templates

### 17.1 Use case

```dart
// fichier : lib/features/{feat}/domain/usecases/{action}_{nom}_usecase.dart
import 'package:twake_calendar_mobile/core/interfaces/future_usecase.dart';
import 'package:twake_calendar_mobile/features/{feat}/domain/repositories/{nom}_repository.dart';

final class {Action}{Nom}UseCase extends FutureUseCase<{TypeRetour}> {
  {Action}{Nom}UseCase({required {Nom}Repository {nom}Repository})
      : _{nom}Repository = {nom}Repository;

  final {Nom}Repository _{nom}Repository;

  @override
  Future<{TypeRetour}> invoke() => _{nom}Repository.{methode}();
}
```

### 17.2 Écran (state + controller + screen + route)

```dart
// === STATE ===
// lib/features/{feat}/presentation/controllers/{nom}_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part '{nom}_state.freezed.dart';

@Freezed(copyWith: true)
abstract class {Nom}State with _${Nom}State {
  const factory {Nom}State({
    @Default(false) bool isLoading,
  }) = _{Nom}State;
  factory {Nom}State.initial() => const {Nom}State();
}

// === CONTROLLER ===
// lib/features/{feat}/presentation/controllers/{nom}_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part '{nom}_controller.g.dart';

@riverpod
class {Nom}Controller extends _${Nom}Controller {
  @override
  Future<{Nom}State> build() async {
    return {Nom}State.initial();
  }
}

// === SCREEN ===
// lib/features/{feat}/presentation/screens/{nom}_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';

class {Nom}Screen extends ConsumerWidget {
  const {Nom}Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<{Nom}State> async = ref.watch({nom}ControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.{section}{Nom}Title)),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object e, StackTrace _) =>
            Center(child: Text(context.l10n.errorUnknown)),
        data: ({Nom}State state) => const Placeholder(),
      ),
    );
  }
}

// === ROUTE ===
// lib/foundation/routing/app_router.dart (ajouter)
@TypedGoRoute<{Nom}Route>(path: '/{path}')
@immutable
class {Nom}Route extends GoRouteData with _${Nom}Route {
  const {Nom}Route();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const {Nom}Screen();
}
```

---

## Annexe — arbre de décision

```
Où placer mon code ?

C'est de l'infrastructure (réseau, theme, codec, WS, base) ?      → core/
C'est une entité partagée par 2+ features ?                       → shared/
C'est propre à une feature ?                                      → features/X/
  Une donnée immutable ?
    Concept métier ?                                              → features/X/domain/entities/
    Payload API ?                                                 → features/X/data/models/{nom}.remote_model.dart
    Storage local ?                                               → features/X/data/models/{nom}.local_model.dart
    État d'écran ?                                                → features/X/presentation/controllers/{nom}_state.dart
    Paramètres d'appel ?                                          → features/X/domain/params/
  De la logique ?
    Une opération métier ?                                        → features/X/domain/usecases/
    Orchestration multi-use-case ?                                → features/X/domain/services/
    Appel HTTP ?                                                  → features/X/data/endpoints/ + datasources/
    Logique de présentation ?                                     → features/X/presentation/controllers/
    Mapping model ↔ entity ?                                      → features/X/data/mappers/
  Un contrat ?
    Source de données ?                                           → features/X/data/datasources/{...}.dart (interface)
    Accès métier ?                                                → features/X/domain/repositories/
  De l'UI ?
    Spécifique à un écran ?                                       → features/X/presentation/widgets/
    Partagé cross-feature ?                                       → features/shared/presentation/widgets/
    Écran complet ?                                               → features/X/presentation/screens/ + route dans foundation/routing/

Quel provider utiliser ?

  Singleton (vie = durée app) ?                                   → @Riverpod(keepAlive: true)
  Sinon ?                                                         → @riverpod
  build() retourne Future<T> ?                                    → source one-shot async
  build() retourne Stream<T> ?                                    → source continue (WS, Drift watch)
  build() retourne T ?                                            → source locale synchrone
  C'est un controller (state + actions) ?                         → @riverpod class
  C'est un read-only (projection / dérivation) ?                  → @riverpod function top-level
```
