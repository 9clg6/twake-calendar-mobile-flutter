// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twake_database.dart';

// ignore_for_file: type=lint
class $CalendarsTableTable extends CalendarsTable
    with TableInfo<$CalendarsTableTable, CalendarRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
    'link',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorLightMeta = const VerificationMeta(
    'colorLight',
  );
  @override
  late final GeneratedColumn<String> colorLight = GeneratedColumn<String>(
    'color_light',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorDarkMeta = const VerificationMeta(
    'colorDark',
  );
  @override
  late final GeneratedColumn<String> colorDark = GeneratedColumn<String>(
    'color_dark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _delegatedMeta = const VerificationMeta(
    'delegated',
  );
  @override
  late final GeneratedColumn<bool> delegated = GeneratedColumn<bool>(
    'delegated',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("delegated" IN (0, 1))',
    ),
    defaultValue: const Constant<bool>(false),
  );
  static const VerificationMeta _syncTokenMeta = const VerificationMeta(
    'syncToken',
  );
  @override
  late final GeneratedColumn<String> syncToken = GeneratedColumn<String>(
    'sync_token',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastFetchedAtMeta = const VerificationMeta(
    'lastFetchedAt',
  );
  @override
  late final GeneratedColumn<int> lastFetchedAt = GeneratedColumn<int>(
    'last_fetched_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    link,
    name,
    ownerId,
    colorLight,
    colorDark,
    description,
    delegated,
    syncToken,
    lastFetchedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendars_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CalendarRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
        _linkMeta,
        link.isAcceptableOrUnknown(data['link']!, _linkMeta),
      );
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('color_light')) {
      context.handle(
        _colorLightMeta,
        colorLight.isAcceptableOrUnknown(data['color_light']!, _colorLightMeta),
      );
    }
    if (data.containsKey('color_dark')) {
      context.handle(
        _colorDarkMeta,
        colorDark.isAcceptableOrUnknown(data['color_dark']!, _colorDarkMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('delegated')) {
      context.handle(
        _delegatedMeta,
        delegated.isAcceptableOrUnknown(data['delegated']!, _delegatedMeta),
      );
    }
    if (data.containsKey('sync_token')) {
      context.handle(
        _syncTokenMeta,
        syncToken.isAcceptableOrUnknown(data['sync_token']!, _syncTokenMeta),
      );
    }
    if (data.containsKey('last_fetched_at')) {
      context.handle(
        _lastFetchedAtMeta,
        lastFetchedAt.isAcceptableOrUnknown(
          data['last_fetched_at']!,
          _lastFetchedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      link: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}link'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      colorLight: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_light'],
      ),
      colorDark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_dark'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      delegated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}delegated'],
      )!,
      syncToken: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_token'],
      ),
      lastFetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_fetched_at'],
      ),
    );
  }

  @override
  $CalendarsTableTable createAlias(String alias) {
    return $CalendarsTableTable(attachedDatabase, alias);
  }
}

class CalendarRow extends DataClass implements Insertable<CalendarRow> {
  /// Primary key — calendar id (server-assigned).
  final String id;

  /// CalDAV link relative to the side-service base.
  final String link;

  /// Display name.
  final String name;

  /// Owner ID (cross-references shared/UserEntity).
  final String ownerId;

  /// Hex color for the light theme, including the `#` prefix.
  final String? colorLight;

  /// Hex color for the dark theme.
  final String? colorDark;

  /// Free-form description.
  final String? description;

  /// Whether this calendar is delegated.
  final bool delegated;

  /// Sync token returned by the server on the last successful REPORT.
  final String? syncToken;

  /// Last successful refresh timestamp (millis since epoch).
  final int? lastFetchedAt;
  const CalendarRow({
    required this.id,
    required this.link,
    required this.name,
    required this.ownerId,
    this.colorLight,
    this.colorDark,
    this.description,
    required this.delegated,
    this.syncToken,
    this.lastFetchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['link'] = Variable<String>(link);
    map['name'] = Variable<String>(name);
    map['owner_id'] = Variable<String>(ownerId);
    if (!nullToAbsent || colorLight != null) {
      map['color_light'] = Variable<String>(colorLight);
    }
    if (!nullToAbsent || colorDark != null) {
      map['color_dark'] = Variable<String>(colorDark);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['delegated'] = Variable<bool>(delegated);
    if (!nullToAbsent || syncToken != null) {
      map['sync_token'] = Variable<String>(syncToken);
    }
    if (!nullToAbsent || lastFetchedAt != null) {
      map['last_fetched_at'] = Variable<int>(lastFetchedAt);
    }
    return map;
  }

  CalendarsTableCompanion toCompanion(bool nullToAbsent) {
    return CalendarsTableCompanion(
      id: Value(id),
      link: Value(link),
      name: Value(name),
      ownerId: Value(ownerId),
      colorLight: colorLight == null && nullToAbsent
          ? const Value.absent()
          : Value(colorLight),
      colorDark: colorDark == null && nullToAbsent
          ? const Value.absent()
          : Value(colorDark),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      delegated: Value(delegated),
      syncToken: syncToken == null && nullToAbsent
          ? const Value.absent()
          : Value(syncToken),
      lastFetchedAt: lastFetchedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastFetchedAt),
    );
  }

  factory CalendarRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarRow(
      id: serializer.fromJson<String>(json['id']),
      link: serializer.fromJson<String>(json['link']),
      name: serializer.fromJson<String>(json['name']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      colorLight: serializer.fromJson<String?>(json['colorLight']),
      colorDark: serializer.fromJson<String?>(json['colorDark']),
      description: serializer.fromJson<String?>(json['description']),
      delegated: serializer.fromJson<bool>(json['delegated']),
      syncToken: serializer.fromJson<String?>(json['syncToken']),
      lastFetchedAt: serializer.fromJson<int?>(json['lastFetchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'link': serializer.toJson<String>(link),
      'name': serializer.toJson<String>(name),
      'ownerId': serializer.toJson<String>(ownerId),
      'colorLight': serializer.toJson<String?>(colorLight),
      'colorDark': serializer.toJson<String?>(colorDark),
      'description': serializer.toJson<String?>(description),
      'delegated': serializer.toJson<bool>(delegated),
      'syncToken': serializer.toJson<String?>(syncToken),
      'lastFetchedAt': serializer.toJson<int?>(lastFetchedAt),
    };
  }

  CalendarRow copyWith({
    String? id,
    String? link,
    String? name,
    String? ownerId,
    Value<String?> colorLight = const Value.absent(),
    Value<String?> colorDark = const Value.absent(),
    Value<String?> description = const Value.absent(),
    bool? delegated,
    Value<String?> syncToken = const Value.absent(),
    Value<int?> lastFetchedAt = const Value.absent(),
  }) => CalendarRow(
    id: id ?? this.id,
    link: link ?? this.link,
    name: name ?? this.name,
    ownerId: ownerId ?? this.ownerId,
    colorLight: colorLight.present ? colorLight.value : this.colorLight,
    colorDark: colorDark.present ? colorDark.value : this.colorDark,
    description: description.present ? description.value : this.description,
    delegated: delegated ?? this.delegated,
    syncToken: syncToken.present ? syncToken.value : this.syncToken,
    lastFetchedAt: lastFetchedAt.present
        ? lastFetchedAt.value
        : this.lastFetchedAt,
  );
  CalendarRow copyWithCompanion(CalendarsTableCompanion data) {
    return CalendarRow(
      id: data.id.present ? data.id.value : this.id,
      link: data.link.present ? data.link.value : this.link,
      name: data.name.present ? data.name.value : this.name,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      colorLight: data.colorLight.present
          ? data.colorLight.value
          : this.colorLight,
      colorDark: data.colorDark.present ? data.colorDark.value : this.colorDark,
      description: data.description.present
          ? data.description.value
          : this.description,
      delegated: data.delegated.present ? data.delegated.value : this.delegated,
      syncToken: data.syncToken.present ? data.syncToken.value : this.syncToken,
      lastFetchedAt: data.lastFetchedAt.present
          ? data.lastFetchedAt.value
          : this.lastFetchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarRow(')
          ..write('id: $id, ')
          ..write('link: $link, ')
          ..write('name: $name, ')
          ..write('ownerId: $ownerId, ')
          ..write('colorLight: $colorLight, ')
          ..write('colorDark: $colorDark, ')
          ..write('description: $description, ')
          ..write('delegated: $delegated, ')
          ..write('syncToken: $syncToken, ')
          ..write('lastFetchedAt: $lastFetchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    link,
    name,
    ownerId,
    colorLight,
    colorDark,
    description,
    delegated,
    syncToken,
    lastFetchedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarRow &&
          other.id == this.id &&
          other.link == this.link &&
          other.name == this.name &&
          other.ownerId == this.ownerId &&
          other.colorLight == this.colorLight &&
          other.colorDark == this.colorDark &&
          other.description == this.description &&
          other.delegated == this.delegated &&
          other.syncToken == this.syncToken &&
          other.lastFetchedAt == this.lastFetchedAt);
}

class CalendarsTableCompanion extends UpdateCompanion<CalendarRow> {
  final Value<String> id;
  final Value<String> link;
  final Value<String> name;
  final Value<String> ownerId;
  final Value<String?> colorLight;
  final Value<String?> colorDark;
  final Value<String?> description;
  final Value<bool> delegated;
  final Value<String?> syncToken;
  final Value<int?> lastFetchedAt;
  final Value<int> rowid;
  const CalendarsTableCompanion({
    this.id = const Value.absent(),
    this.link = const Value.absent(),
    this.name = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.colorLight = const Value.absent(),
    this.colorDark = const Value.absent(),
    this.description = const Value.absent(),
    this.delegated = const Value.absent(),
    this.syncToken = const Value.absent(),
    this.lastFetchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CalendarsTableCompanion.insert({
    required String id,
    required String link,
    required String name,
    required String ownerId,
    this.colorLight = const Value.absent(),
    this.colorDark = const Value.absent(),
    this.description = const Value.absent(),
    this.delegated = const Value.absent(),
    this.syncToken = const Value.absent(),
    this.lastFetchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       link = Value(link),
       name = Value(name),
       ownerId = Value(ownerId);
  static Insertable<CalendarRow> custom({
    Expression<String>? id,
    Expression<String>? link,
    Expression<String>? name,
    Expression<String>? ownerId,
    Expression<String>? colorLight,
    Expression<String>? colorDark,
    Expression<String>? description,
    Expression<bool>? delegated,
    Expression<String>? syncToken,
    Expression<int>? lastFetchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (link != null) 'link': link,
      if (name != null) 'name': name,
      if (ownerId != null) 'owner_id': ownerId,
      if (colorLight != null) 'color_light': colorLight,
      if (colorDark != null) 'color_dark': colorDark,
      if (description != null) 'description': description,
      if (delegated != null) 'delegated': delegated,
      if (syncToken != null) 'sync_token': syncToken,
      if (lastFetchedAt != null) 'last_fetched_at': lastFetchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CalendarsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? link,
    Value<String>? name,
    Value<String>? ownerId,
    Value<String?>? colorLight,
    Value<String?>? colorDark,
    Value<String?>? description,
    Value<bool>? delegated,
    Value<String?>? syncToken,
    Value<int?>? lastFetchedAt,
    Value<int>? rowid,
  }) {
    return CalendarsTableCompanion(
      id: id ?? this.id,
      link: link ?? this.link,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      colorLight: colorLight ?? this.colorLight,
      colorDark: colorDark ?? this.colorDark,
      description: description ?? this.description,
      delegated: delegated ?? this.delegated,
      syncToken: syncToken ?? this.syncToken,
      lastFetchedAt: lastFetchedAt ?? this.lastFetchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (colorLight.present) {
      map['color_light'] = Variable<String>(colorLight.value);
    }
    if (colorDark.present) {
      map['color_dark'] = Variable<String>(colorDark.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (delegated.present) {
      map['delegated'] = Variable<bool>(delegated.value);
    }
    if (syncToken.present) {
      map['sync_token'] = Variable<String>(syncToken.value);
    }
    if (lastFetchedAt.present) {
      map['last_fetched_at'] = Variable<int>(lastFetchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarsTableCompanion(')
          ..write('id: $id, ')
          ..write('link: $link, ')
          ..write('name: $name, ')
          ..write('ownerId: $ownerId, ')
          ..write('colorLight: $colorLight, ')
          ..write('colorDark: $colorDark, ')
          ..write('description: $description, ')
          ..write('delegated: $delegated, ')
          ..write('syncToken: $syncToken, ')
          ..write('lastFetchedAt: $lastFetchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventsTableTable extends EventsTable
    with TableInfo<$EventsTableTable, EventRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _calIdMeta = const VerificationMeta('calId');
  @override
  late final GeneratedColumn<String> calId = GeneratedColumn<String>(
    'cal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _etagMeta = const VerificationMeta('etag');
  @override
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
    'etag',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jcalMasterMeta = const VerificationMeta(
    'jcalMaster',
  );
  @override
  late final GeneratedColumn<String> jcalMaster = GeneratedColumn<String>(
    'jcal_master',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jcalOverridesJsonMeta = const VerificationMeta(
    'jcalOverridesJson',
  );
  @override
  late final GeneratedColumn<String> jcalOverridesJson =
      GeneratedColumn<String>(
        'jcal_overrides_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant<String>('[]'),
      );
  static const VerificationMeta _dtstartMeta = const VerificationMeta(
    'dtstart',
  );
  @override
  late final GeneratedColumn<String> dtstart = GeneratedColumn<String>(
    'dtstart',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dtendMeta = const VerificationMeta('dtend');
  @override
  late final GeneratedColumn<String> dtend = GeneratedColumn<String>(
    'dtend',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDirtyMeta = const VerificationMeta(
    'isDirty',
  );
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
    'is_dirty',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_dirty" IN (0, 1))',
    ),
    defaultValue: const Constant<bool>(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    calId,
    url,
    etag,
    jcalMaster,
    jcalOverridesJson,
    dtstart,
    dtend,
    status,
    isDirty,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('cal_id')) {
      context.handle(
        _calIdMeta,
        calId.isAcceptableOrUnknown(data['cal_id']!, _calIdMeta),
      );
    } else if (isInserting) {
      context.missing(_calIdMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('etag')) {
      context.handle(
        _etagMeta,
        etag.isAcceptableOrUnknown(data['etag']!, _etagMeta),
      );
    }
    if (data.containsKey('jcal_master')) {
      context.handle(
        _jcalMasterMeta,
        jcalMaster.isAcceptableOrUnknown(data['jcal_master']!, _jcalMasterMeta),
      );
    } else if (isInserting) {
      context.missing(_jcalMasterMeta);
    }
    if (data.containsKey('jcal_overrides_json')) {
      context.handle(
        _jcalOverridesJsonMeta,
        jcalOverridesJson.isAcceptableOrUnknown(
          data['jcal_overrides_json']!,
          _jcalOverridesJsonMeta,
        ),
      );
    }
    if (data.containsKey('dtstart')) {
      context.handle(
        _dtstartMeta,
        dtstart.isAcceptableOrUnknown(data['dtstart']!, _dtstartMeta),
      );
    } else if (isInserting) {
      context.missing(_dtstartMeta);
    }
    if (data.containsKey('dtend')) {
      context.handle(
        _dtendMeta,
        dtend.isAcceptableOrUnknown(data['dtend']!, _dtendMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('is_dirty')) {
      context.handle(
        _isDirtyMeta,
        isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid, calId};
  @override
  EventRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventRow(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      calId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cal_id'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      etag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}etag'],
      ),
      jcalMaster: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jcal_master'],
      )!,
      jcalOverridesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jcal_overrides_json'],
      )!,
      dtstart: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dtstart'],
      )!,
      dtend: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dtend'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      isDirty: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_dirty'],
      )!,
    );
  }

  @override
  $EventsTableTable createAlias(String alias) {
    return $EventsTableTable(attachedDatabase, alias);
  }
}

class EventRow extends DataClass implements Insertable<EventRow> {
  /// Composite primary key part — event uid (with optional `/recurrenceId`
  /// suffix for occurrence overrides, mirroring the entity).
  final String uid;

  /// Calendar id this event belongs to.
  final String calId;

  /// CalDAV URL for the event.
  final String url;

  /// Optional ETag for optimistic concurrency.
  final String? etag;

  /// jCal master serialized as JSON.
  final String jcalMaster;

  /// jCal overrides serialized as JSON array (empty array when none).
  final String jcalOverridesJson;

  /// DTSTART (ISO 8601) — used for time-range queries.
  final String dtstart;

  /// DTEND (ISO 8601), nullable for instantaneous events.
  final String? dtend;

  /// iCalendar STATUS or null.
  final String? status;

  /// Whether the row is dirty and pending a flush via the outbox.
  final bool isDirty;
  const EventRow({
    required this.uid,
    required this.calId,
    required this.url,
    this.etag,
    required this.jcalMaster,
    required this.jcalOverridesJson,
    required this.dtstart,
    this.dtend,
    this.status,
    required this.isDirty,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['cal_id'] = Variable<String>(calId);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || etag != null) {
      map['etag'] = Variable<String>(etag);
    }
    map['jcal_master'] = Variable<String>(jcalMaster);
    map['jcal_overrides_json'] = Variable<String>(jcalOverridesJson);
    map['dtstart'] = Variable<String>(dtstart);
    if (!nullToAbsent || dtend != null) {
      map['dtend'] = Variable<String>(dtend);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    map['is_dirty'] = Variable<bool>(isDirty);
    return map;
  }

  EventsTableCompanion toCompanion(bool nullToAbsent) {
    return EventsTableCompanion(
      uid: Value(uid),
      calId: Value(calId),
      url: Value(url),
      etag: etag == null && nullToAbsent ? const Value.absent() : Value(etag),
      jcalMaster: Value(jcalMaster),
      jcalOverridesJson: Value(jcalOverridesJson),
      dtstart: Value(dtstart),
      dtend: dtend == null && nullToAbsent
          ? const Value.absent()
          : Value(dtend),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      isDirty: Value(isDirty),
    );
  }

  factory EventRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventRow(
      uid: serializer.fromJson<String>(json['uid']),
      calId: serializer.fromJson<String>(json['calId']),
      url: serializer.fromJson<String>(json['url']),
      etag: serializer.fromJson<String?>(json['etag']),
      jcalMaster: serializer.fromJson<String>(json['jcalMaster']),
      jcalOverridesJson: serializer.fromJson<String>(json['jcalOverridesJson']),
      dtstart: serializer.fromJson<String>(json['dtstart']),
      dtend: serializer.fromJson<String?>(json['dtend']),
      status: serializer.fromJson<String?>(json['status']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'calId': serializer.toJson<String>(calId),
      'url': serializer.toJson<String>(url),
      'etag': serializer.toJson<String?>(etag),
      'jcalMaster': serializer.toJson<String>(jcalMaster),
      'jcalOverridesJson': serializer.toJson<String>(jcalOverridesJson),
      'dtstart': serializer.toJson<String>(dtstart),
      'dtend': serializer.toJson<String?>(dtend),
      'status': serializer.toJson<String?>(status),
      'isDirty': serializer.toJson<bool>(isDirty),
    };
  }

  EventRow copyWith({
    String? uid,
    String? calId,
    String? url,
    Value<String?> etag = const Value.absent(),
    String? jcalMaster,
    String? jcalOverridesJson,
    String? dtstart,
    Value<String?> dtend = const Value.absent(),
    Value<String?> status = const Value.absent(),
    bool? isDirty,
  }) => EventRow(
    uid: uid ?? this.uid,
    calId: calId ?? this.calId,
    url: url ?? this.url,
    etag: etag.present ? etag.value : this.etag,
    jcalMaster: jcalMaster ?? this.jcalMaster,
    jcalOverridesJson: jcalOverridesJson ?? this.jcalOverridesJson,
    dtstart: dtstart ?? this.dtstart,
    dtend: dtend.present ? dtend.value : this.dtend,
    status: status.present ? status.value : this.status,
    isDirty: isDirty ?? this.isDirty,
  );
  EventRow copyWithCompanion(EventsTableCompanion data) {
    return EventRow(
      uid: data.uid.present ? data.uid.value : this.uid,
      calId: data.calId.present ? data.calId.value : this.calId,
      url: data.url.present ? data.url.value : this.url,
      etag: data.etag.present ? data.etag.value : this.etag,
      jcalMaster: data.jcalMaster.present
          ? data.jcalMaster.value
          : this.jcalMaster,
      jcalOverridesJson: data.jcalOverridesJson.present
          ? data.jcalOverridesJson.value
          : this.jcalOverridesJson,
      dtstart: data.dtstart.present ? data.dtstart.value : this.dtstart,
      dtend: data.dtend.present ? data.dtend.value : this.dtend,
      status: data.status.present ? data.status.value : this.status,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventRow(')
          ..write('uid: $uid, ')
          ..write('calId: $calId, ')
          ..write('url: $url, ')
          ..write('etag: $etag, ')
          ..write('jcalMaster: $jcalMaster, ')
          ..write('jcalOverridesJson: $jcalOverridesJson, ')
          ..write('dtstart: $dtstart, ')
          ..write('dtend: $dtend, ')
          ..write('status: $status, ')
          ..write('isDirty: $isDirty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    calId,
    url,
    etag,
    jcalMaster,
    jcalOverridesJson,
    dtstart,
    dtend,
    status,
    isDirty,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventRow &&
          other.uid == this.uid &&
          other.calId == this.calId &&
          other.url == this.url &&
          other.etag == this.etag &&
          other.jcalMaster == this.jcalMaster &&
          other.jcalOverridesJson == this.jcalOverridesJson &&
          other.dtstart == this.dtstart &&
          other.dtend == this.dtend &&
          other.status == this.status &&
          other.isDirty == this.isDirty);
}

class EventsTableCompanion extends UpdateCompanion<EventRow> {
  final Value<String> uid;
  final Value<String> calId;
  final Value<String> url;
  final Value<String?> etag;
  final Value<String> jcalMaster;
  final Value<String> jcalOverridesJson;
  final Value<String> dtstart;
  final Value<String?> dtend;
  final Value<String?> status;
  final Value<bool> isDirty;
  final Value<int> rowid;
  const EventsTableCompanion({
    this.uid = const Value.absent(),
    this.calId = const Value.absent(),
    this.url = const Value.absent(),
    this.etag = const Value.absent(),
    this.jcalMaster = const Value.absent(),
    this.jcalOverridesJson = const Value.absent(),
    this.dtstart = const Value.absent(),
    this.dtend = const Value.absent(),
    this.status = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventsTableCompanion.insert({
    required String uid,
    required String calId,
    required String url,
    this.etag = const Value.absent(),
    required String jcalMaster,
    this.jcalOverridesJson = const Value.absent(),
    required String dtstart,
    this.dtend = const Value.absent(),
    this.status = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       calId = Value(calId),
       url = Value(url),
       jcalMaster = Value(jcalMaster),
       dtstart = Value(dtstart);
  static Insertable<EventRow> custom({
    Expression<String>? uid,
    Expression<String>? calId,
    Expression<String>? url,
    Expression<String>? etag,
    Expression<String>? jcalMaster,
    Expression<String>? jcalOverridesJson,
    Expression<String>? dtstart,
    Expression<String>? dtend,
    Expression<String>? status,
    Expression<bool>? isDirty,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (calId != null) 'cal_id': calId,
      if (url != null) 'url': url,
      if (etag != null) 'etag': etag,
      if (jcalMaster != null) 'jcal_master': jcalMaster,
      if (jcalOverridesJson != null) 'jcal_overrides_json': jcalOverridesJson,
      if (dtstart != null) 'dtstart': dtstart,
      if (dtend != null) 'dtend': dtend,
      if (status != null) 'status': status,
      if (isDirty != null) 'is_dirty': isDirty,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsTableCompanion copyWith({
    Value<String>? uid,
    Value<String>? calId,
    Value<String>? url,
    Value<String?>? etag,
    Value<String>? jcalMaster,
    Value<String>? jcalOverridesJson,
    Value<String>? dtstart,
    Value<String?>? dtend,
    Value<String?>? status,
    Value<bool>? isDirty,
    Value<int>? rowid,
  }) {
    return EventsTableCompanion(
      uid: uid ?? this.uid,
      calId: calId ?? this.calId,
      url: url ?? this.url,
      etag: etag ?? this.etag,
      jcalMaster: jcalMaster ?? this.jcalMaster,
      jcalOverridesJson: jcalOverridesJson ?? this.jcalOverridesJson,
      dtstart: dtstart ?? this.dtstart,
      dtend: dtend ?? this.dtend,
      status: status ?? this.status,
      isDirty: isDirty ?? this.isDirty,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (calId.present) {
      map['cal_id'] = Variable<String>(calId.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (etag.present) {
      map['etag'] = Variable<String>(etag.value);
    }
    if (jcalMaster.present) {
      map['jcal_master'] = Variable<String>(jcalMaster.value);
    }
    if (jcalOverridesJson.present) {
      map['jcal_overrides_json'] = Variable<String>(jcalOverridesJson.value);
    }
    if (dtstart.present) {
      map['dtstart'] = Variable<String>(dtstart.value);
    }
    if (dtend.present) {
      map['dtend'] = Variable<String>(dtend.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsTableCompanion(')
          ..write('uid: $uid, ')
          ..write('calId: $calId, ')
          ..write('url: $url, ')
          ..write('etag: $etag, ')
          ..write('jcalMaster: $jcalMaster, ')
          ..write('jcalOverridesJson: $jcalOverridesJson, ')
          ..write('dtstart: $dtstart, ')
          ..write('dtend: $dtend, ')
          ..write('status: $status, ')
          ..write('isDirty: $isDirty, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OutboxTableTable extends OutboxTable
    with TableInfo<$OutboxTableTable, OutboxRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutboxTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _opTypeMeta = const VerificationMeta('opType');
  @override
  late final GeneratedColumn<String> opType = GeneratedColumn<String>(
    'op_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _calIdMeta = const VerificationMeta('calId');
  @override
  late final GeneratedColumn<String> calId = GeneratedColumn<String>(
    'cal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eventUidMeta = const VerificationMeta(
    'eventUid',
  );
  @override
  late final GeneratedColumn<String> eventUid = GeneratedColumn<String>(
    'event_uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta(
    'attempts',
  );
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant<int>(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nextRetryAtMeta = const VerificationMeta(
    'nextRetryAt',
  );
  @override
  late final GeneratedColumn<int> nextRetryAt = GeneratedColumn<int>(
    'next_retry_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant<int>(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    opType,
    calId,
    eventUid,
    payload,
    attempts,
    lastError,
    createdAt,
    nextRetryAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outbox_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<OutboxRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('op_type')) {
      context.handle(
        _opTypeMeta,
        opType.isAcceptableOrUnknown(data['op_type']!, _opTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_opTypeMeta);
    }
    if (data.containsKey('cal_id')) {
      context.handle(
        _calIdMeta,
        calId.isAcceptableOrUnknown(data['cal_id']!, _calIdMeta),
      );
    } else if (isInserting) {
      context.missing(_calIdMeta);
    }
    if (data.containsKey('event_uid')) {
      context.handle(
        _eventUidMeta,
        eventUid.isAcceptableOrUnknown(data['event_uid']!, _eventUidMeta),
      );
    } else if (isInserting) {
      context.missing(_eventUidMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(
        _attemptsMeta,
        attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('next_retry_at')) {
      context.handle(
        _nextRetryAtMeta,
        nextRetryAt.isAcceptableOrUnknown(
          data['next_retry_at']!,
          _nextRetryAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OutboxRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutboxRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      opType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}op_type'],
      )!,
      calId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cal_id'],
      )!,
      eventUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_uid'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      attempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempts'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      nextRetryAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_retry_at'],
      )!,
    );
  }

  @override
  $OutboxTableTable createAlias(String alias) {
    return $OutboxTableTable(attachedDatabase, alias);
  }
}

class OutboxRow extends DataClass implements Insertable<OutboxRow> {
  /// Auto-incrementing identifier.
  final int id;

  /// Operation type (`put`, `delete`, `move`, `counter`, `partstat`).
  final String opType;

  /// Calendar id targeted by the mutation.
  final String calId;

  /// Event uid targeted by the mutation.
  final String eventUid;

  /// Operation payload serialized as JSON.
  final String payload;

  /// Number of failed attempts so far.
  final int attempts;

  /// Last error message captured during a flush attempt.
  final String? lastError;

  /// Insertion timestamp (millis since epoch).
  final int createdAt;

  /// Earliest timestamp at which the next flush should be attempted.
  final int nextRetryAt;
  const OutboxRow({
    required this.id,
    required this.opType,
    required this.calId,
    required this.eventUid,
    required this.payload,
    required this.attempts,
    this.lastError,
    required this.createdAt,
    required this.nextRetryAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['op_type'] = Variable<String>(opType);
    map['cal_id'] = Variable<String>(calId);
    map['event_uid'] = Variable<String>(eventUid);
    map['payload'] = Variable<String>(payload);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['next_retry_at'] = Variable<int>(nextRetryAt);
    return map;
  }

  OutboxTableCompanion toCompanion(bool nullToAbsent) {
    return OutboxTableCompanion(
      id: Value(id),
      opType: Value(opType),
      calId: Value(calId),
      eventUid: Value(eventUid),
      payload: Value(payload),
      attempts: Value(attempts),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
      nextRetryAt: Value(nextRetryAt),
    );
  }

  factory OutboxRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutboxRow(
      id: serializer.fromJson<int>(json['id']),
      opType: serializer.fromJson<String>(json['opType']),
      calId: serializer.fromJson<String>(json['calId']),
      eventUid: serializer.fromJson<String>(json['eventUid']),
      payload: serializer.fromJson<String>(json['payload']),
      attempts: serializer.fromJson<int>(json['attempts']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      nextRetryAt: serializer.fromJson<int>(json['nextRetryAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'opType': serializer.toJson<String>(opType),
      'calId': serializer.toJson<String>(calId),
      'eventUid': serializer.toJson<String>(eventUid),
      'payload': serializer.toJson<String>(payload),
      'attempts': serializer.toJson<int>(attempts),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<int>(createdAt),
      'nextRetryAt': serializer.toJson<int>(nextRetryAt),
    };
  }

  OutboxRow copyWith({
    int? id,
    String? opType,
    String? calId,
    String? eventUid,
    String? payload,
    int? attempts,
    Value<String?> lastError = const Value.absent(),
    int? createdAt,
    int? nextRetryAt,
  }) => OutboxRow(
    id: id ?? this.id,
    opType: opType ?? this.opType,
    calId: calId ?? this.calId,
    eventUid: eventUid ?? this.eventUid,
    payload: payload ?? this.payload,
    attempts: attempts ?? this.attempts,
    lastError: lastError.present ? lastError.value : this.lastError,
    createdAt: createdAt ?? this.createdAt,
    nextRetryAt: nextRetryAt ?? this.nextRetryAt,
  );
  OutboxRow copyWithCompanion(OutboxTableCompanion data) {
    return OutboxRow(
      id: data.id.present ? data.id.value : this.id,
      opType: data.opType.present ? data.opType.value : this.opType,
      calId: data.calId.present ? data.calId.value : this.calId,
      eventUid: data.eventUid.present ? data.eventUid.value : this.eventUid,
      payload: data.payload.present ? data.payload.value : this.payload,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      nextRetryAt: data.nextRetryAt.present
          ? data.nextRetryAt.value
          : this.nextRetryAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OutboxRow(')
          ..write('id: $id, ')
          ..write('opType: $opType, ')
          ..write('calId: $calId, ')
          ..write('eventUid: $eventUid, ')
          ..write('payload: $payload, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('nextRetryAt: $nextRetryAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    opType,
    calId,
    eventUid,
    payload,
    attempts,
    lastError,
    createdAt,
    nextRetryAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutboxRow &&
          other.id == this.id &&
          other.opType == this.opType &&
          other.calId == this.calId &&
          other.eventUid == this.eventUid &&
          other.payload == this.payload &&
          other.attempts == this.attempts &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt &&
          other.nextRetryAt == this.nextRetryAt);
}

class OutboxTableCompanion extends UpdateCompanion<OutboxRow> {
  final Value<int> id;
  final Value<String> opType;
  final Value<String> calId;
  final Value<String> eventUid;
  final Value<String> payload;
  final Value<int> attempts;
  final Value<String?> lastError;
  final Value<int> createdAt;
  final Value<int> nextRetryAt;
  const OutboxTableCompanion({
    this.id = const Value.absent(),
    this.opType = const Value.absent(),
    this.calId = const Value.absent(),
    this.eventUid = const Value.absent(),
    this.payload = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.nextRetryAt = const Value.absent(),
  });
  OutboxTableCompanion.insert({
    this.id = const Value.absent(),
    required String opType,
    required String calId,
    required String eventUid,
    required String payload,
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
    required int createdAt,
    this.nextRetryAt = const Value.absent(),
  }) : opType = Value(opType),
       calId = Value(calId),
       eventUid = Value(eventUid),
       payload = Value(payload),
       createdAt = Value(createdAt);
  static Insertable<OutboxRow> custom({
    Expression<int>? id,
    Expression<String>? opType,
    Expression<String>? calId,
    Expression<String>? eventUid,
    Expression<String>? payload,
    Expression<int>? attempts,
    Expression<String>? lastError,
    Expression<int>? createdAt,
    Expression<int>? nextRetryAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (opType != null) 'op_type': opType,
      if (calId != null) 'cal_id': calId,
      if (eventUid != null) 'event_uid': eventUid,
      if (payload != null) 'payload': payload,
      if (attempts != null) 'attempts': attempts,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
      if (nextRetryAt != null) 'next_retry_at': nextRetryAt,
    });
  }

  OutboxTableCompanion copyWith({
    Value<int>? id,
    Value<String>? opType,
    Value<String>? calId,
    Value<String>? eventUid,
    Value<String>? payload,
    Value<int>? attempts,
    Value<String?>? lastError,
    Value<int>? createdAt,
    Value<int>? nextRetryAt,
  }) {
    return OutboxTableCompanion(
      id: id ?? this.id,
      opType: opType ?? this.opType,
      calId: calId ?? this.calId,
      eventUid: eventUid ?? this.eventUid,
      payload: payload ?? this.payload,
      attempts: attempts ?? this.attempts,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
      nextRetryAt: nextRetryAt ?? this.nextRetryAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (opType.present) {
      map['op_type'] = Variable<String>(opType.value);
    }
    if (calId.present) {
      map['cal_id'] = Variable<String>(calId.value);
    }
    if (eventUid.present) {
      map['event_uid'] = Variable<String>(eventUid.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (nextRetryAt.present) {
      map['next_retry_at'] = Variable<int>(nextRetryAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutboxTableCompanion(')
          ..write('id: $id, ')
          ..write('opType: $opType, ')
          ..write('calId: $calId, ')
          ..write('eventUid: $eventUid, ')
          ..write('payload: $payload, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('nextRetryAt: $nextRetryAt')
          ..write(')'))
        .toString();
  }
}

class $ConflictsTableTable extends ConflictsTable
    with TableInfo<$ConflictsTableTable, ConflictRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConflictsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _eventUidMeta = const VerificationMeta(
    'eventUid',
  );
  @override
  late final GeneratedColumn<String> eventUid = GeneratedColumn<String>(
    'event_uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _calIdMeta = const VerificationMeta('calId');
  @override
  late final GeneratedColumn<String> calId = GeneratedColumn<String>(
    'cal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localJcalMeta = const VerificationMeta(
    'localJcal',
  );
  @override
  late final GeneratedColumn<String> localJcal = GeneratedColumn<String>(
    'local_jcal',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverJcalMeta = const VerificationMeta(
    'serverJcal',
  );
  @override
  late final GeneratedColumn<String> serverJcal = GeneratedColumn<String>(
    'server_jcal',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<int> occurredAt = GeneratedColumn<int>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    eventUid,
    calId,
    localJcal,
    serverJcal,
    occurredAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conflicts_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConflictRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_uid')) {
      context.handle(
        _eventUidMeta,
        eventUid.isAcceptableOrUnknown(data['event_uid']!, _eventUidMeta),
      );
    } else if (isInserting) {
      context.missing(_eventUidMeta);
    }
    if (data.containsKey('cal_id')) {
      context.handle(
        _calIdMeta,
        calId.isAcceptableOrUnknown(data['cal_id']!, _calIdMeta),
      );
    } else if (isInserting) {
      context.missing(_calIdMeta);
    }
    if (data.containsKey('local_jcal')) {
      context.handle(
        _localJcalMeta,
        localJcal.isAcceptableOrUnknown(data['local_jcal']!, _localJcalMeta),
      );
    } else if (isInserting) {
      context.missing(_localJcalMeta);
    }
    if (data.containsKey('server_jcal')) {
      context.handle(
        _serverJcalMeta,
        serverJcal.isAcceptableOrUnknown(data['server_jcal']!, _serverJcalMeta),
      );
    } else if (isInserting) {
      context.missing(_serverJcalMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConflictRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConflictRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      eventUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_uid'],
      )!,
      calId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cal_id'],
      )!,
      localJcal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_jcal'],
      )!,
      serverJcal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_jcal'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}occurred_at'],
      )!,
    );
  }

  @override
  $ConflictsTableTable createAlias(String alias) {
    return $ConflictsTableTable(attachedDatabase, alias);
  }
}

class ConflictRow extends DataClass implements Insertable<ConflictRow> {
  /// Auto-incrementing identifier.
  final int id;

  /// Event uid in conflict.
  final String eventUid;

  /// Calendar id.
  final String calId;

  /// Local version (jCal serialized as JSON).
  final String localJcal;

  /// Server version (jCal serialized as JSON).
  final String serverJcal;

  /// Insertion timestamp.
  final int occurredAt;
  const ConflictRow({
    required this.id,
    required this.eventUid,
    required this.calId,
    required this.localJcal,
    required this.serverJcal,
    required this.occurredAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_uid'] = Variable<String>(eventUid);
    map['cal_id'] = Variable<String>(calId);
    map['local_jcal'] = Variable<String>(localJcal);
    map['server_jcal'] = Variable<String>(serverJcal);
    map['occurred_at'] = Variable<int>(occurredAt);
    return map;
  }

  ConflictsTableCompanion toCompanion(bool nullToAbsent) {
    return ConflictsTableCompanion(
      id: Value(id),
      eventUid: Value(eventUid),
      calId: Value(calId),
      localJcal: Value(localJcal),
      serverJcal: Value(serverJcal),
      occurredAt: Value(occurredAt),
    );
  }

  factory ConflictRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConflictRow(
      id: serializer.fromJson<int>(json['id']),
      eventUid: serializer.fromJson<String>(json['eventUid']),
      calId: serializer.fromJson<String>(json['calId']),
      localJcal: serializer.fromJson<String>(json['localJcal']),
      serverJcal: serializer.fromJson<String>(json['serverJcal']),
      occurredAt: serializer.fromJson<int>(json['occurredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventUid': serializer.toJson<String>(eventUid),
      'calId': serializer.toJson<String>(calId),
      'localJcal': serializer.toJson<String>(localJcal),
      'serverJcal': serializer.toJson<String>(serverJcal),
      'occurredAt': serializer.toJson<int>(occurredAt),
    };
  }

  ConflictRow copyWith({
    int? id,
    String? eventUid,
    String? calId,
    String? localJcal,
    String? serverJcal,
    int? occurredAt,
  }) => ConflictRow(
    id: id ?? this.id,
    eventUid: eventUid ?? this.eventUid,
    calId: calId ?? this.calId,
    localJcal: localJcal ?? this.localJcal,
    serverJcal: serverJcal ?? this.serverJcal,
    occurredAt: occurredAt ?? this.occurredAt,
  );
  ConflictRow copyWithCompanion(ConflictsTableCompanion data) {
    return ConflictRow(
      id: data.id.present ? data.id.value : this.id,
      eventUid: data.eventUid.present ? data.eventUid.value : this.eventUid,
      calId: data.calId.present ? data.calId.value : this.calId,
      localJcal: data.localJcal.present ? data.localJcal.value : this.localJcal,
      serverJcal: data.serverJcal.present
          ? data.serverJcal.value
          : this.serverJcal,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConflictRow(')
          ..write('id: $id, ')
          ..write('eventUid: $eventUid, ')
          ..write('calId: $calId, ')
          ..write('localJcal: $localJcal, ')
          ..write('serverJcal: $serverJcal, ')
          ..write('occurredAt: $occurredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, eventUid, calId, localJcal, serverJcal, occurredAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConflictRow &&
          other.id == this.id &&
          other.eventUid == this.eventUid &&
          other.calId == this.calId &&
          other.localJcal == this.localJcal &&
          other.serverJcal == this.serverJcal &&
          other.occurredAt == this.occurredAt);
}

class ConflictsTableCompanion extends UpdateCompanion<ConflictRow> {
  final Value<int> id;
  final Value<String> eventUid;
  final Value<String> calId;
  final Value<String> localJcal;
  final Value<String> serverJcal;
  final Value<int> occurredAt;
  const ConflictsTableCompanion({
    this.id = const Value.absent(),
    this.eventUid = const Value.absent(),
    this.calId = const Value.absent(),
    this.localJcal = const Value.absent(),
    this.serverJcal = const Value.absent(),
    this.occurredAt = const Value.absent(),
  });
  ConflictsTableCompanion.insert({
    this.id = const Value.absent(),
    required String eventUid,
    required String calId,
    required String localJcal,
    required String serverJcal,
    required int occurredAt,
  }) : eventUid = Value(eventUid),
       calId = Value(calId),
       localJcal = Value(localJcal),
       serverJcal = Value(serverJcal),
       occurredAt = Value(occurredAt);
  static Insertable<ConflictRow> custom({
    Expression<int>? id,
    Expression<String>? eventUid,
    Expression<String>? calId,
    Expression<String>? localJcal,
    Expression<String>? serverJcal,
    Expression<int>? occurredAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventUid != null) 'event_uid': eventUid,
      if (calId != null) 'cal_id': calId,
      if (localJcal != null) 'local_jcal': localJcal,
      if (serverJcal != null) 'server_jcal': serverJcal,
      if (occurredAt != null) 'occurred_at': occurredAt,
    });
  }

  ConflictsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? eventUid,
    Value<String>? calId,
    Value<String>? localJcal,
    Value<String>? serverJcal,
    Value<int>? occurredAt,
  }) {
    return ConflictsTableCompanion(
      id: id ?? this.id,
      eventUid: eventUid ?? this.eventUid,
      calId: calId ?? this.calId,
      localJcal: localJcal ?? this.localJcal,
      serverJcal: serverJcal ?? this.serverJcal,
      occurredAt: occurredAt ?? this.occurredAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventUid.present) {
      map['event_uid'] = Variable<String>(eventUid.value);
    }
    if (calId.present) {
      map['cal_id'] = Variable<String>(calId.value);
    }
    if (localJcal.present) {
      map['local_jcal'] = Variable<String>(localJcal.value);
    }
    if (serverJcal.present) {
      map['server_jcal'] = Variable<String>(serverJcal.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<int>(occurredAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConflictsTableCompanion(')
          ..write('id: $id, ')
          ..write('eventUid: $eventUid, ')
          ..write('calId: $calId, ')
          ..write('localJcal: $localJcal, ')
          ..write('serverJcal: $serverJcal, ')
          ..write('occurredAt: $occurredAt')
          ..write(')'))
        .toString();
  }
}

class $SyncMetaTableTable extends SyncMetaTable
    with TableInfo<$SyncMetaTableTable, SyncMetaRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetaTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_meta_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetaRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SyncMetaRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetaRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SyncMetaTableTable createAlias(String alias) {
    return $SyncMetaTableTable(attachedDatabase, alias);
  }
}

class SyncMetaRow extends DataClass implements Insertable<SyncMetaRow> {
  /// Metadata key (e.g. `lastFullSyncAt`).
  final String key;

  /// Stored value as a string (callers parse as needed).
  final String value;
  const SyncMetaRow({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SyncMetaTableCompanion toCompanion(bool nullToAbsent) {
    return SyncMetaTableCompanion(key: Value(key), value: Value(value));
  }

  factory SyncMetaRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetaRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  SyncMetaRow copyWith({String? key, String? value}) =>
      SyncMetaRow(key: key ?? this.key, value: value ?? this.value);
  SyncMetaRow copyWithCompanion(SyncMetaTableCompanion data) {
    return SyncMetaRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetaRow(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetaRow &&
          other.key == this.key &&
          other.value == this.value);
}

class SyncMetaTableCompanion extends UpdateCompanion<SyncMetaRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SyncMetaTableCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetaTableCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<SyncMetaRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetaTableCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SyncMetaTableCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetaTableCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$TwakeDatabase extends GeneratedDatabase {
  _$TwakeDatabase(QueryExecutor e) : super(e);
  $TwakeDatabaseManager get managers => $TwakeDatabaseManager(this);
  late final $CalendarsTableTable calendarsTable = $CalendarsTableTable(this);
  late final $EventsTableTable eventsTable = $EventsTableTable(this);
  late final $OutboxTableTable outboxTable = $OutboxTableTable(this);
  late final $ConflictsTableTable conflictsTable = $ConflictsTableTable(this);
  late final $SyncMetaTableTable syncMetaTable = $SyncMetaTableTable(this);
  late final OutboxDao outboxDao = OutboxDao(this as TwakeDatabase);
  late final ConflictDao conflictDao = ConflictDao(this as TwakeDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    calendarsTable,
    eventsTable,
    outboxTable,
    conflictsTable,
    syncMetaTable,
  ];
}

typedef $$CalendarsTableTableCreateCompanionBuilder =
    CalendarsTableCompanion Function({
      required String id,
      required String link,
      required String name,
      required String ownerId,
      Value<String?> colorLight,
      Value<String?> colorDark,
      Value<String?> description,
      Value<bool> delegated,
      Value<String?> syncToken,
      Value<int?> lastFetchedAt,
      Value<int> rowid,
    });
typedef $$CalendarsTableTableUpdateCompanionBuilder =
    CalendarsTableCompanion Function({
      Value<String> id,
      Value<String> link,
      Value<String> name,
      Value<String> ownerId,
      Value<String?> colorLight,
      Value<String?> colorDark,
      Value<String?> description,
      Value<bool> delegated,
      Value<String?> syncToken,
      Value<int?> lastFetchedAt,
      Value<int> rowid,
    });

class $$CalendarsTableTableFilterComposer
    extends Composer<_$TwakeDatabase, $CalendarsTableTable> {
  $$CalendarsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get link => $composableBuilder(
    column: $table.link,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorLight => $composableBuilder(
    column: $table.colorLight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorDark => $composableBuilder(
    column: $table.colorDark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get delegated => $composableBuilder(
    column: $table.delegated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncToken => $composableBuilder(
    column: $table.syncToken,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastFetchedAt => $composableBuilder(
    column: $table.lastFetchedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CalendarsTableTableOrderingComposer
    extends Composer<_$TwakeDatabase, $CalendarsTableTable> {
  $$CalendarsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get link => $composableBuilder(
    column: $table.link,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorLight => $composableBuilder(
    column: $table.colorLight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorDark => $composableBuilder(
    column: $table.colorDark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get delegated => $composableBuilder(
    column: $table.delegated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncToken => $composableBuilder(
    column: $table.syncToken,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastFetchedAt => $composableBuilder(
    column: $table.lastFetchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CalendarsTableTableAnnotationComposer
    extends Composer<_$TwakeDatabase, $CalendarsTableTable> {
  $$CalendarsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get link =>
      $composableBuilder(column: $table.link, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get colorLight => $composableBuilder(
    column: $table.colorLight,
    builder: (column) => column,
  );

  GeneratedColumn<String> get colorDark =>
      $composableBuilder(column: $table.colorDark, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get delegated =>
      $composableBuilder(column: $table.delegated, builder: (column) => column);

  GeneratedColumn<String> get syncToken =>
      $composableBuilder(column: $table.syncToken, builder: (column) => column);

  GeneratedColumn<int> get lastFetchedAt => $composableBuilder(
    column: $table.lastFetchedAt,
    builder: (column) => column,
  );
}

class $$CalendarsTableTableTableManager
    extends
        RootTableManager<
          _$TwakeDatabase,
          $CalendarsTableTable,
          CalendarRow,
          $$CalendarsTableTableFilterComposer,
          $$CalendarsTableTableOrderingComposer,
          $$CalendarsTableTableAnnotationComposer,
          $$CalendarsTableTableCreateCompanionBuilder,
          $$CalendarsTableTableUpdateCompanionBuilder,
          (
            CalendarRow,
            BaseReferences<_$TwakeDatabase, $CalendarsTableTable, CalendarRow>,
          ),
          CalendarRow,
          PrefetchHooks Function()
        > {
  $$CalendarsTableTableTableManager(
    _$TwakeDatabase db,
    $CalendarsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> link = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String?> colorLight = const Value.absent(),
                Value<String?> colorDark = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> delegated = const Value.absent(),
                Value<String?> syncToken = const Value.absent(),
                Value<int?> lastFetchedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CalendarsTableCompanion(
                id: id,
                link: link,
                name: name,
                ownerId: ownerId,
                colorLight: colorLight,
                colorDark: colorDark,
                description: description,
                delegated: delegated,
                syncToken: syncToken,
                lastFetchedAt: lastFetchedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String link,
                required String name,
                required String ownerId,
                Value<String?> colorLight = const Value.absent(),
                Value<String?> colorDark = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> delegated = const Value.absent(),
                Value<String?> syncToken = const Value.absent(),
                Value<int?> lastFetchedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CalendarsTableCompanion.insert(
                id: id,
                link: link,
                name: name,
                ownerId: ownerId,
                colorLight: colorLight,
                colorDark: colorDark,
                description: description,
                delegated: delegated,
                syncToken: syncToken,
                lastFetchedAt: lastFetchedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CalendarsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$TwakeDatabase,
      $CalendarsTableTable,
      CalendarRow,
      $$CalendarsTableTableFilterComposer,
      $$CalendarsTableTableOrderingComposer,
      $$CalendarsTableTableAnnotationComposer,
      $$CalendarsTableTableCreateCompanionBuilder,
      $$CalendarsTableTableUpdateCompanionBuilder,
      (
        CalendarRow,
        BaseReferences<_$TwakeDatabase, $CalendarsTableTable, CalendarRow>,
      ),
      CalendarRow,
      PrefetchHooks Function()
    >;
typedef $$EventsTableTableCreateCompanionBuilder =
    EventsTableCompanion Function({
      required String uid,
      required String calId,
      required String url,
      Value<String?> etag,
      required String jcalMaster,
      Value<String> jcalOverridesJson,
      required String dtstart,
      Value<String?> dtend,
      Value<String?> status,
      Value<bool> isDirty,
      Value<int> rowid,
    });
typedef $$EventsTableTableUpdateCompanionBuilder =
    EventsTableCompanion Function({
      Value<String> uid,
      Value<String> calId,
      Value<String> url,
      Value<String?> etag,
      Value<String> jcalMaster,
      Value<String> jcalOverridesJson,
      Value<String> dtstart,
      Value<String?> dtend,
      Value<String?> status,
      Value<bool> isDirty,
      Value<int> rowid,
    });

class $$EventsTableTableFilterComposer
    extends Composer<_$TwakeDatabase, $EventsTableTable> {
  $$EventsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calId => $composableBuilder(
    column: $table.calId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jcalMaster => $composableBuilder(
    column: $table.jcalMaster,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jcalOverridesJson => $composableBuilder(
    column: $table.jcalOverridesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dtstart => $composableBuilder(
    column: $table.dtstart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dtend => $composableBuilder(
    column: $table.dtend,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDirty => $composableBuilder(
    column: $table.isDirty,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EventsTableTableOrderingComposer
    extends Composer<_$TwakeDatabase, $EventsTableTable> {
  $$EventsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calId => $composableBuilder(
    column: $table.calId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jcalMaster => $composableBuilder(
    column: $table.jcalMaster,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jcalOverridesJson => $composableBuilder(
    column: $table.jcalOverridesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dtstart => $composableBuilder(
    column: $table.dtstart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dtend => $composableBuilder(
    column: $table.dtend,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDirty => $composableBuilder(
    column: $table.isDirty,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EventsTableTableAnnotationComposer
    extends Composer<_$TwakeDatabase, $EventsTableTable> {
  $$EventsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get calId =>
      $composableBuilder(column: $table.calId, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);

  GeneratedColumn<String> get jcalMaster => $composableBuilder(
    column: $table.jcalMaster,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jcalOverridesJson => $composableBuilder(
    column: $table.jcalOverridesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dtstart =>
      $composableBuilder(column: $table.dtstart, builder: (column) => column);

  GeneratedColumn<String> get dtend =>
      $composableBuilder(column: $table.dtend, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);
}

class $$EventsTableTableTableManager
    extends
        RootTableManager<
          _$TwakeDatabase,
          $EventsTableTable,
          EventRow,
          $$EventsTableTableFilterComposer,
          $$EventsTableTableOrderingComposer,
          $$EventsTableTableAnnotationComposer,
          $$EventsTableTableCreateCompanionBuilder,
          $$EventsTableTableUpdateCompanionBuilder,
          (
            EventRow,
            BaseReferences<_$TwakeDatabase, $EventsTableTable, EventRow>,
          ),
          EventRow,
          PrefetchHooks Function()
        > {
  $$EventsTableTableTableManager(_$TwakeDatabase db, $EventsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<String> calId = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String?> etag = const Value.absent(),
                Value<String> jcalMaster = const Value.absent(),
                Value<String> jcalOverridesJson = const Value.absent(),
                Value<String> dtstart = const Value.absent(),
                Value<String?> dtend = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventsTableCompanion(
                uid: uid,
                calId: calId,
                url: url,
                etag: etag,
                jcalMaster: jcalMaster,
                jcalOverridesJson: jcalOverridesJson,
                dtstart: dtstart,
                dtend: dtend,
                status: status,
                isDirty: isDirty,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uid,
                required String calId,
                required String url,
                Value<String?> etag = const Value.absent(),
                required String jcalMaster,
                Value<String> jcalOverridesJson = const Value.absent(),
                required String dtstart,
                Value<String?> dtend = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventsTableCompanion.insert(
                uid: uid,
                calId: calId,
                url: url,
                etag: etag,
                jcalMaster: jcalMaster,
                jcalOverridesJson: jcalOverridesJson,
                dtstart: dtstart,
                dtend: dtend,
                status: status,
                isDirty: isDirty,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EventsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$TwakeDatabase,
      $EventsTableTable,
      EventRow,
      $$EventsTableTableFilterComposer,
      $$EventsTableTableOrderingComposer,
      $$EventsTableTableAnnotationComposer,
      $$EventsTableTableCreateCompanionBuilder,
      $$EventsTableTableUpdateCompanionBuilder,
      (EventRow, BaseReferences<_$TwakeDatabase, $EventsTableTable, EventRow>),
      EventRow,
      PrefetchHooks Function()
    >;
typedef $$OutboxTableTableCreateCompanionBuilder =
    OutboxTableCompanion Function({
      Value<int> id,
      required String opType,
      required String calId,
      required String eventUid,
      required String payload,
      Value<int> attempts,
      Value<String?> lastError,
      required int createdAt,
      Value<int> nextRetryAt,
    });
typedef $$OutboxTableTableUpdateCompanionBuilder =
    OutboxTableCompanion Function({
      Value<int> id,
      Value<String> opType,
      Value<String> calId,
      Value<String> eventUid,
      Value<String> payload,
      Value<int> attempts,
      Value<String?> lastError,
      Value<int> createdAt,
      Value<int> nextRetryAt,
    });

class $$OutboxTableTableFilterComposer
    extends Composer<_$TwakeDatabase, $OutboxTableTable> {
  $$OutboxTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get opType => $composableBuilder(
    column: $table.opType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calId => $composableBuilder(
    column: $table.calId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventUid => $composableBuilder(
    column: $table.eventUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OutboxTableTableOrderingComposer
    extends Composer<_$TwakeDatabase, $OutboxTableTable> {
  $$OutboxTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get opType => $composableBuilder(
    column: $table.opType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calId => $composableBuilder(
    column: $table.calId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventUid => $composableBuilder(
    column: $table.eventUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OutboxTableTableAnnotationComposer
    extends Composer<_$TwakeDatabase, $OutboxTableTable> {
  $$OutboxTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get opType =>
      $composableBuilder(column: $table.opType, builder: (column) => column);

  GeneratedColumn<String> get calId =>
      $composableBuilder(column: $table.calId, builder: (column) => column);

  GeneratedColumn<String> get eventUid =>
      $composableBuilder(column: $table.eventUid, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => column,
  );
}

class $$OutboxTableTableTableManager
    extends
        RootTableManager<
          _$TwakeDatabase,
          $OutboxTableTable,
          OutboxRow,
          $$OutboxTableTableFilterComposer,
          $$OutboxTableTableOrderingComposer,
          $$OutboxTableTableAnnotationComposer,
          $$OutboxTableTableCreateCompanionBuilder,
          $$OutboxTableTableUpdateCompanionBuilder,
          (
            OutboxRow,
            BaseReferences<_$TwakeDatabase, $OutboxTableTable, OutboxRow>,
          ),
          OutboxRow,
          PrefetchHooks Function()
        > {
  $$OutboxTableTableTableManager(_$TwakeDatabase db, $OutboxTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutboxTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OutboxTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OutboxTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> opType = const Value.absent(),
                Value<String> calId = const Value.absent(),
                Value<String> eventUid = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> nextRetryAt = const Value.absent(),
              }) => OutboxTableCompanion(
                id: id,
                opType: opType,
                calId: calId,
                eventUid: eventUid,
                payload: payload,
                attempts: attempts,
                lastError: lastError,
                createdAt: createdAt,
                nextRetryAt: nextRetryAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String opType,
                required String calId,
                required String eventUid,
                required String payload,
                Value<int> attempts = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                required int createdAt,
                Value<int> nextRetryAt = const Value.absent(),
              }) => OutboxTableCompanion.insert(
                id: id,
                opType: opType,
                calId: calId,
                eventUid: eventUid,
                payload: payload,
                attempts: attempts,
                lastError: lastError,
                createdAt: createdAt,
                nextRetryAt: nextRetryAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OutboxTableTableProcessedTableManager =
    ProcessedTableManager<
      _$TwakeDatabase,
      $OutboxTableTable,
      OutboxRow,
      $$OutboxTableTableFilterComposer,
      $$OutboxTableTableOrderingComposer,
      $$OutboxTableTableAnnotationComposer,
      $$OutboxTableTableCreateCompanionBuilder,
      $$OutboxTableTableUpdateCompanionBuilder,
      (
        OutboxRow,
        BaseReferences<_$TwakeDatabase, $OutboxTableTable, OutboxRow>,
      ),
      OutboxRow,
      PrefetchHooks Function()
    >;
typedef $$ConflictsTableTableCreateCompanionBuilder =
    ConflictsTableCompanion Function({
      Value<int> id,
      required String eventUid,
      required String calId,
      required String localJcal,
      required String serverJcal,
      required int occurredAt,
    });
typedef $$ConflictsTableTableUpdateCompanionBuilder =
    ConflictsTableCompanion Function({
      Value<int> id,
      Value<String> eventUid,
      Value<String> calId,
      Value<String> localJcal,
      Value<String> serverJcal,
      Value<int> occurredAt,
    });

class $$ConflictsTableTableFilterComposer
    extends Composer<_$TwakeDatabase, $ConflictsTableTable> {
  $$ConflictsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventUid => $composableBuilder(
    column: $table.eventUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calId => $composableBuilder(
    column: $table.calId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localJcal => $composableBuilder(
    column: $table.localJcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverJcal => $composableBuilder(
    column: $table.serverJcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ConflictsTableTableOrderingComposer
    extends Composer<_$TwakeDatabase, $ConflictsTableTable> {
  $$ConflictsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventUid => $composableBuilder(
    column: $table.eventUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calId => $composableBuilder(
    column: $table.calId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localJcal => $composableBuilder(
    column: $table.localJcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverJcal => $composableBuilder(
    column: $table.serverJcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConflictsTableTableAnnotationComposer
    extends Composer<_$TwakeDatabase, $ConflictsTableTable> {
  $$ConflictsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get eventUid =>
      $composableBuilder(column: $table.eventUid, builder: (column) => column);

  GeneratedColumn<String> get calId =>
      $composableBuilder(column: $table.calId, builder: (column) => column);

  GeneratedColumn<String> get localJcal =>
      $composableBuilder(column: $table.localJcal, builder: (column) => column);

  GeneratedColumn<String> get serverJcal => $composableBuilder(
    column: $table.serverJcal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );
}

class $$ConflictsTableTableTableManager
    extends
        RootTableManager<
          _$TwakeDatabase,
          $ConflictsTableTable,
          ConflictRow,
          $$ConflictsTableTableFilterComposer,
          $$ConflictsTableTableOrderingComposer,
          $$ConflictsTableTableAnnotationComposer,
          $$ConflictsTableTableCreateCompanionBuilder,
          $$ConflictsTableTableUpdateCompanionBuilder,
          (
            ConflictRow,
            BaseReferences<_$TwakeDatabase, $ConflictsTableTable, ConflictRow>,
          ),
          ConflictRow,
          PrefetchHooks Function()
        > {
  $$ConflictsTableTableTableManager(
    _$TwakeDatabase db,
    $ConflictsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConflictsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConflictsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConflictsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> eventUid = const Value.absent(),
                Value<String> calId = const Value.absent(),
                Value<String> localJcal = const Value.absent(),
                Value<String> serverJcal = const Value.absent(),
                Value<int> occurredAt = const Value.absent(),
              }) => ConflictsTableCompanion(
                id: id,
                eventUid: eventUid,
                calId: calId,
                localJcal: localJcal,
                serverJcal: serverJcal,
                occurredAt: occurredAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String eventUid,
                required String calId,
                required String localJcal,
                required String serverJcal,
                required int occurredAt,
              }) => ConflictsTableCompanion.insert(
                id: id,
                eventUid: eventUid,
                calId: calId,
                localJcal: localJcal,
                serverJcal: serverJcal,
                occurredAt: occurredAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ConflictsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$TwakeDatabase,
      $ConflictsTableTable,
      ConflictRow,
      $$ConflictsTableTableFilterComposer,
      $$ConflictsTableTableOrderingComposer,
      $$ConflictsTableTableAnnotationComposer,
      $$ConflictsTableTableCreateCompanionBuilder,
      $$ConflictsTableTableUpdateCompanionBuilder,
      (
        ConflictRow,
        BaseReferences<_$TwakeDatabase, $ConflictsTableTable, ConflictRow>,
      ),
      ConflictRow,
      PrefetchHooks Function()
    >;
typedef $$SyncMetaTableTableCreateCompanionBuilder =
    SyncMetaTableCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$SyncMetaTableTableUpdateCompanionBuilder =
    SyncMetaTableCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$SyncMetaTableTableFilterComposer
    extends Composer<_$TwakeDatabase, $SyncMetaTableTable> {
  $$SyncMetaTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetaTableTableOrderingComposer
    extends Composer<_$TwakeDatabase, $SyncMetaTableTable> {
  $$SyncMetaTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetaTableTableAnnotationComposer
    extends Composer<_$TwakeDatabase, $SyncMetaTableTable> {
  $$SyncMetaTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SyncMetaTableTableTableManager
    extends
        RootTableManager<
          _$TwakeDatabase,
          $SyncMetaTableTable,
          SyncMetaRow,
          $$SyncMetaTableTableFilterComposer,
          $$SyncMetaTableTableOrderingComposer,
          $$SyncMetaTableTableAnnotationComposer,
          $$SyncMetaTableTableCreateCompanionBuilder,
          $$SyncMetaTableTableUpdateCompanionBuilder,
          (
            SyncMetaRow,
            BaseReferences<_$TwakeDatabase, $SyncMetaTableTable, SyncMetaRow>,
          ),
          SyncMetaRow,
          PrefetchHooks Function()
        > {
  $$SyncMetaTableTableTableManager(
    _$TwakeDatabase db,
    $SyncMetaTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetaTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetaTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetaTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) =>
                  SyncMetaTableCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => SyncMetaTableCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncMetaTableTableProcessedTableManager =
    ProcessedTableManager<
      _$TwakeDatabase,
      $SyncMetaTableTable,
      SyncMetaRow,
      $$SyncMetaTableTableFilterComposer,
      $$SyncMetaTableTableOrderingComposer,
      $$SyncMetaTableTableAnnotationComposer,
      $$SyncMetaTableTableCreateCompanionBuilder,
      $$SyncMetaTableTableUpdateCompanionBuilder,
      (
        SyncMetaRow,
        BaseReferences<_$TwakeDatabase, $SyncMetaTableTable, SyncMetaRow>,
      ),
      SyncMetaRow,
      PrefetchHooks Function()
    >;

class $TwakeDatabaseManager {
  final _$TwakeDatabase _db;
  $TwakeDatabaseManager(this._db);
  $$CalendarsTableTableTableManager get calendarsTable =>
      $$CalendarsTableTableTableManager(_db, _db.calendarsTable);
  $$EventsTableTableTableManager get eventsTable =>
      $$EventsTableTableTableManager(_db, _db.eventsTable);
  $$OutboxTableTableTableManager get outboxTable =>
      $$OutboxTableTableTableManager(_db, _db.outboxTable);
  $$ConflictsTableTableTableManager get conflictsTable =>
      $$ConflictsTableTableTableManager(_db, _db.conflictsTable);
  $$SyncMetaTableTableTableManager get syncMetaTable =>
      $$SyncMetaTableTableTableManager(_db, _db.syncMetaTable);
}
