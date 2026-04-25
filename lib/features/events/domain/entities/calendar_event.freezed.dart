// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarEventEntity {

 String get uid; String get calId; String get url; String get start; String get timezone; String? get end; String? get title; String? get description; String? get location; OrganizerEntity? get organizer; List<AttendeeEntity> get attendees; RepetitionEntity? get repetition; AlarmEntity? get alarm; EventClass get classification; Transparency get transp; EventStatus? get status; bool get allday; String? get recurrenceId; List<String> get exdates; int? get sequence; String? get videoConferenceUrl; List<List<dynamic>> get passthroughProps;
/// Create a copy of CalendarEventEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarEventEntityCopyWith<CalendarEventEntity> get copyWith => _$CalendarEventEntityCopyWithImpl<CalendarEventEntity>(this as CalendarEventEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarEventEntity&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.calId, calId) || other.calId == calId)&&(identical(other.url, url) || other.url == url)&&(identical(other.start, start) || other.start == start)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.end, end) || other.end == end)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&const DeepCollectionEquality().equals(other.attendees, attendees)&&(identical(other.repetition, repetition) || other.repetition == repetition)&&(identical(other.alarm, alarm) || other.alarm == alarm)&&(identical(other.classification, classification) || other.classification == classification)&&(identical(other.transp, transp) || other.transp == transp)&&(identical(other.status, status) || other.status == status)&&(identical(other.allday, allday) || other.allday == allday)&&(identical(other.recurrenceId, recurrenceId) || other.recurrenceId == recurrenceId)&&const DeepCollectionEquality().equals(other.exdates, exdates)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.videoConferenceUrl, videoConferenceUrl) || other.videoConferenceUrl == videoConferenceUrl)&&const DeepCollectionEquality().equals(other.passthroughProps, passthroughProps));
}


@override
int get hashCode => Object.hashAll([runtimeType,uid,calId,url,start,timezone,end,title,description,location,organizer,const DeepCollectionEquality().hash(attendees),repetition,alarm,classification,transp,status,allday,recurrenceId,const DeepCollectionEquality().hash(exdates),sequence,videoConferenceUrl,const DeepCollectionEquality().hash(passthroughProps)]);

@override
String toString() {
  return 'CalendarEventEntity(uid: $uid, calId: $calId, url: $url, start: $start, timezone: $timezone, end: $end, title: $title, description: $description, location: $location, organizer: $organizer, attendees: $attendees, repetition: $repetition, alarm: $alarm, classification: $classification, transp: $transp, status: $status, allday: $allday, recurrenceId: $recurrenceId, exdates: $exdates, sequence: $sequence, videoConferenceUrl: $videoConferenceUrl, passthroughProps: $passthroughProps)';
}


}

/// @nodoc
abstract mixin class $CalendarEventEntityCopyWith<$Res>  {
  factory $CalendarEventEntityCopyWith(CalendarEventEntity value, $Res Function(CalendarEventEntity) _then) = _$CalendarEventEntityCopyWithImpl;
@useResult
$Res call({
 String uid, String calId, String url, String start, String timezone, String? end, String? title, String? description, String? location, OrganizerEntity? organizer, List<AttendeeEntity> attendees, RepetitionEntity? repetition, AlarmEntity? alarm, EventClass classification, Transparency transp, EventStatus? status, bool allday, String? recurrenceId, List<String> exdates, int? sequence, String? videoConferenceUrl, List<List<dynamic>> passthroughProps
});


$OrganizerEntityCopyWith<$Res>? get organizer;$RepetitionEntityCopyWith<$Res>? get repetition;$AlarmEntityCopyWith<$Res>? get alarm;

}
/// @nodoc
class _$CalendarEventEntityCopyWithImpl<$Res>
    implements $CalendarEventEntityCopyWith<$Res> {
  _$CalendarEventEntityCopyWithImpl(this._self, this._then);

  final CalendarEventEntity _self;
  final $Res Function(CalendarEventEntity) _then;

/// Create a copy of CalendarEventEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? calId = null,Object? url = null,Object? start = null,Object? timezone = null,Object? end = freezed,Object? title = freezed,Object? description = freezed,Object? location = freezed,Object? organizer = freezed,Object? attendees = null,Object? repetition = freezed,Object? alarm = freezed,Object? classification = null,Object? transp = null,Object? status = freezed,Object? allday = null,Object? recurrenceId = freezed,Object? exdates = null,Object? sequence = freezed,Object? videoConferenceUrl = freezed,Object? passthroughProps = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,calId: null == calId ? _self.calId : calId // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,organizer: freezed == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as OrganizerEntity?,attendees: null == attendees ? _self.attendees : attendees // ignore: cast_nullable_to_non_nullable
as List<AttendeeEntity>,repetition: freezed == repetition ? _self.repetition : repetition // ignore: cast_nullable_to_non_nullable
as RepetitionEntity?,alarm: freezed == alarm ? _self.alarm : alarm // ignore: cast_nullable_to_non_nullable
as AlarmEntity?,classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as EventClass,transp: null == transp ? _self.transp : transp // ignore: cast_nullable_to_non_nullable
as Transparency,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EventStatus?,allday: null == allday ? _self.allday : allday // ignore: cast_nullable_to_non_nullable
as bool,recurrenceId: freezed == recurrenceId ? _self.recurrenceId : recurrenceId // ignore: cast_nullable_to_non_nullable
as String?,exdates: null == exdates ? _self.exdates : exdates // ignore: cast_nullable_to_non_nullable
as List<String>,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int?,videoConferenceUrl: freezed == videoConferenceUrl ? _self.videoConferenceUrl : videoConferenceUrl // ignore: cast_nullable_to_non_nullable
as String?,passthroughProps: null == passthroughProps ? _self.passthroughProps : passthroughProps // ignore: cast_nullable_to_non_nullable
as List<List<dynamic>>,
  ));
}
/// Create a copy of CalendarEventEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrganizerEntityCopyWith<$Res>? get organizer {
    if (_self.organizer == null) {
    return null;
  }

  return $OrganizerEntityCopyWith<$Res>(_self.organizer!, (value) {
    return _then(_self.copyWith(organizer: value));
  });
}/// Create a copy of CalendarEventEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RepetitionEntityCopyWith<$Res>? get repetition {
    if (_self.repetition == null) {
    return null;
  }

  return $RepetitionEntityCopyWith<$Res>(_self.repetition!, (value) {
    return _then(_self.copyWith(repetition: value));
  });
}/// Create a copy of CalendarEventEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlarmEntityCopyWith<$Res>? get alarm {
    if (_self.alarm == null) {
    return null;
  }

  return $AlarmEntityCopyWith<$Res>(_self.alarm!, (value) {
    return _then(_self.copyWith(alarm: value));
  });
}
}


/// @nodoc


class _CalendarEventEntity implements CalendarEventEntity {
  const _CalendarEventEntity({required this.uid, required this.calId, required this.url, required this.start, required this.timezone, this.end, this.title, this.description, this.location, this.organizer, final  List<AttendeeEntity> attendees = const <AttendeeEntity>[], this.repetition, this.alarm, this.classification = EventClass.publicClass, this.transp = Transparency.opaque, this.status, this.allday = false, this.recurrenceId, final  List<String> exdates = const <String>[], this.sequence, this.videoConferenceUrl, final  List<List<dynamic>> passthroughProps = const <List<dynamic>>[]}): _attendees = attendees,_exdates = exdates,_passthroughProps = passthroughProps;
  

@override final  String uid;
@override final  String calId;
@override final  String url;
@override final  String start;
@override final  String timezone;
@override final  String? end;
@override final  String? title;
@override final  String? description;
@override final  String? location;
@override final  OrganizerEntity? organizer;
 final  List<AttendeeEntity> _attendees;
@override@JsonKey() List<AttendeeEntity> get attendees {
  if (_attendees is EqualUnmodifiableListView) return _attendees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attendees);
}

@override final  RepetitionEntity? repetition;
@override final  AlarmEntity? alarm;
@override@JsonKey() final  EventClass classification;
@override@JsonKey() final  Transparency transp;
@override final  EventStatus? status;
@override@JsonKey() final  bool allday;
@override final  String? recurrenceId;
 final  List<String> _exdates;
@override@JsonKey() List<String> get exdates {
  if (_exdates is EqualUnmodifiableListView) return _exdates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exdates);
}

@override final  int? sequence;
@override final  String? videoConferenceUrl;
 final  List<List<dynamic>> _passthroughProps;
@override@JsonKey() List<List<dynamic>> get passthroughProps {
  if (_passthroughProps is EqualUnmodifiableListView) return _passthroughProps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_passthroughProps);
}


/// Create a copy of CalendarEventEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarEventEntityCopyWith<_CalendarEventEntity> get copyWith => __$CalendarEventEntityCopyWithImpl<_CalendarEventEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarEventEntity&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.calId, calId) || other.calId == calId)&&(identical(other.url, url) || other.url == url)&&(identical(other.start, start) || other.start == start)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.end, end) || other.end == end)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&const DeepCollectionEquality().equals(other._attendees, _attendees)&&(identical(other.repetition, repetition) || other.repetition == repetition)&&(identical(other.alarm, alarm) || other.alarm == alarm)&&(identical(other.classification, classification) || other.classification == classification)&&(identical(other.transp, transp) || other.transp == transp)&&(identical(other.status, status) || other.status == status)&&(identical(other.allday, allday) || other.allday == allday)&&(identical(other.recurrenceId, recurrenceId) || other.recurrenceId == recurrenceId)&&const DeepCollectionEquality().equals(other._exdates, _exdates)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.videoConferenceUrl, videoConferenceUrl) || other.videoConferenceUrl == videoConferenceUrl)&&const DeepCollectionEquality().equals(other._passthroughProps, _passthroughProps));
}


@override
int get hashCode => Object.hashAll([runtimeType,uid,calId,url,start,timezone,end,title,description,location,organizer,const DeepCollectionEquality().hash(_attendees),repetition,alarm,classification,transp,status,allday,recurrenceId,const DeepCollectionEquality().hash(_exdates),sequence,videoConferenceUrl,const DeepCollectionEquality().hash(_passthroughProps)]);

@override
String toString() {
  return 'CalendarEventEntity(uid: $uid, calId: $calId, url: $url, start: $start, timezone: $timezone, end: $end, title: $title, description: $description, location: $location, organizer: $organizer, attendees: $attendees, repetition: $repetition, alarm: $alarm, classification: $classification, transp: $transp, status: $status, allday: $allday, recurrenceId: $recurrenceId, exdates: $exdates, sequence: $sequence, videoConferenceUrl: $videoConferenceUrl, passthroughProps: $passthroughProps)';
}


}

/// @nodoc
abstract mixin class _$CalendarEventEntityCopyWith<$Res> implements $CalendarEventEntityCopyWith<$Res> {
  factory _$CalendarEventEntityCopyWith(_CalendarEventEntity value, $Res Function(_CalendarEventEntity) _then) = __$CalendarEventEntityCopyWithImpl;
@override @useResult
$Res call({
 String uid, String calId, String url, String start, String timezone, String? end, String? title, String? description, String? location, OrganizerEntity? organizer, List<AttendeeEntity> attendees, RepetitionEntity? repetition, AlarmEntity? alarm, EventClass classification, Transparency transp, EventStatus? status, bool allday, String? recurrenceId, List<String> exdates, int? sequence, String? videoConferenceUrl, List<List<dynamic>> passthroughProps
});


@override $OrganizerEntityCopyWith<$Res>? get organizer;@override $RepetitionEntityCopyWith<$Res>? get repetition;@override $AlarmEntityCopyWith<$Res>? get alarm;

}
/// @nodoc
class __$CalendarEventEntityCopyWithImpl<$Res>
    implements _$CalendarEventEntityCopyWith<$Res> {
  __$CalendarEventEntityCopyWithImpl(this._self, this._then);

  final _CalendarEventEntity _self;
  final $Res Function(_CalendarEventEntity) _then;

/// Create a copy of CalendarEventEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? calId = null,Object? url = null,Object? start = null,Object? timezone = null,Object? end = freezed,Object? title = freezed,Object? description = freezed,Object? location = freezed,Object? organizer = freezed,Object? attendees = null,Object? repetition = freezed,Object? alarm = freezed,Object? classification = null,Object? transp = null,Object? status = freezed,Object? allday = null,Object? recurrenceId = freezed,Object? exdates = null,Object? sequence = freezed,Object? videoConferenceUrl = freezed,Object? passthroughProps = null,}) {
  return _then(_CalendarEventEntity(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,calId: null == calId ? _self.calId : calId // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,organizer: freezed == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as OrganizerEntity?,attendees: null == attendees ? _self._attendees : attendees // ignore: cast_nullable_to_non_nullable
as List<AttendeeEntity>,repetition: freezed == repetition ? _self.repetition : repetition // ignore: cast_nullable_to_non_nullable
as RepetitionEntity?,alarm: freezed == alarm ? _self.alarm : alarm // ignore: cast_nullable_to_non_nullable
as AlarmEntity?,classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as EventClass,transp: null == transp ? _self.transp : transp // ignore: cast_nullable_to_non_nullable
as Transparency,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EventStatus?,allday: null == allday ? _self.allday : allday // ignore: cast_nullable_to_non_nullable
as bool,recurrenceId: freezed == recurrenceId ? _self.recurrenceId : recurrenceId // ignore: cast_nullable_to_non_nullable
as String?,exdates: null == exdates ? _self._exdates : exdates // ignore: cast_nullable_to_non_nullable
as List<String>,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int?,videoConferenceUrl: freezed == videoConferenceUrl ? _self.videoConferenceUrl : videoConferenceUrl // ignore: cast_nullable_to_non_nullable
as String?,passthroughProps: null == passthroughProps ? _self._passthroughProps : passthroughProps // ignore: cast_nullable_to_non_nullable
as List<List<dynamic>>,
  ));
}

/// Create a copy of CalendarEventEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrganizerEntityCopyWith<$Res>? get organizer {
    if (_self.organizer == null) {
    return null;
  }

  return $OrganizerEntityCopyWith<$Res>(_self.organizer!, (value) {
    return _then(_self.copyWith(organizer: value));
  });
}/// Create a copy of CalendarEventEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RepetitionEntityCopyWith<$Res>? get repetition {
    if (_self.repetition == null) {
    return null;
  }

  return $RepetitionEntityCopyWith<$Res>(_self.repetition!, (value) {
    return _then(_self.copyWith(repetition: value));
  });
}/// Create a copy of CalendarEventEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlarmEntityCopyWith<$Res>? get alarm {
    if (_self.alarm == null) {
    return null;
  }

  return $AlarmEntityCopyWith<$Res>(_self.alarm!, (value) {
    return _then(_self.copyWith(alarm: value));
  });
}
}

// dart format on
