# Twake Calendar — Mobile

> Personal proof-of-concept Flutter port of [twake-calendar-frontend](https://github.com/linagora/twake-calendar-frontend) (© Linagora, AGPL v3). Not an official Linagora project.

**License**: AGPL v3 (see [`LICENSE`](./LICENSE)).

## Documentation

- [`ARCHITECTURE.md`](./ARCHITECTURE.md) — project architecture (feature-first + Clean Architecture + Riverpod 3 + go_router)
- [`GUIDELINES.md`](./GUIDELINES.md) — Linagora Twake Flutter/Dart engineering guidelines (style, naming, tests, git)

Refer to these two documents before contributing or running an AI agent on the codebase.

## Stack

Flutter 3.41 / Dart 3.11 · Riverpod 3 · Freezed · go_router · Retrofit + Dio · Drift · flutter_appauth (OIDC PKCE) · firebase_messaging · ARB i18n.

## Getting started

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
flutter run
```

Configuration runtime via `--dart-define` :

```bash
flutter run \
  --dart-define=ENV=dev \
  --dart-define=CALENDAR_BASE_URL=https://calendar-dev.example.com \
  --dart-define=SSO_BASE_URL=https://sso-dev.example.com \
  --dart-define=SSO_CLIENT_ID=twake-calendar-mobile \
  --dart-define=WEBSOCKET_URL=wss://calendar-dev.example.com
```

## Status

Work in progress. See [`ARCHITECTURE.md`](./ARCHITECTURE.md) §15 for the feature-by-feature checklist.
