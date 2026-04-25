// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outbox_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OutboxEntryEntity {

 int get id; OutboxOpType get opType; String get calId; String get eventUid; String get payload; DateTime get createdAt; int get attempts; String? get lastError; DateTime? get nextRetryAt;
/// Create a copy of OutboxEntryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutboxEntryEntityCopyWith<OutboxEntryEntity> get copyWith => _$OutboxEntryEntityCopyWithImpl<OutboxEntryEntity>(this as OutboxEntryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutboxEntryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.opType, opType) || other.opType == opType)&&(identical(other.calId, calId) || other.calId == calId)&&(identical(other.eventUid, eventUid) || other.eventUid == eventUid)&&(identical(other.payload, payload) || other.payload == payload)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.lastError, lastError) || other.lastError == lastError)&&(identical(other.nextRetryAt, nextRetryAt) || other.nextRetryAt == nextRetryAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,opType,calId,eventUid,payload,createdAt,attempts,lastError,nextRetryAt);

@override
String toString() {
  return 'OutboxEntryEntity(id: $id, opType: $opType, calId: $calId, eventUid: $eventUid, payload: $payload, createdAt: $createdAt, attempts: $attempts, lastError: $lastError, nextRetryAt: $nextRetryAt)';
}


}

/// @nodoc
abstract mixin class $OutboxEntryEntityCopyWith<$Res>  {
  factory $OutboxEntryEntityCopyWith(OutboxEntryEntity value, $Res Function(OutboxEntryEntity) _then) = _$OutboxEntryEntityCopyWithImpl;
@useResult
$Res call({
 int id, OutboxOpType opType, String calId, String eventUid, String payload, DateTime createdAt, int attempts, String? lastError, DateTime? nextRetryAt
});




}
/// @nodoc
class _$OutboxEntryEntityCopyWithImpl<$Res>
    implements $OutboxEntryEntityCopyWith<$Res> {
  _$OutboxEntryEntityCopyWithImpl(this._self, this._then);

  final OutboxEntryEntity _self;
  final $Res Function(OutboxEntryEntity) _then;

/// Create a copy of OutboxEntryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? opType = null,Object? calId = null,Object? eventUid = null,Object? payload = null,Object? createdAt = null,Object? attempts = null,Object? lastError = freezed,Object? nextRetryAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,opType: null == opType ? _self.opType : opType // ignore: cast_nullable_to_non_nullable
as OutboxOpType,calId: null == calId ? _self.calId : calId // ignore: cast_nullable_to_non_nullable
as String,eventUid: null == eventUid ? _self.eventUid : eventUid // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,nextRetryAt: freezed == nextRetryAt ? _self.nextRetryAt : nextRetryAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc


class _OutboxEntryEntity implements OutboxEntryEntity {
  const _OutboxEntryEntity({required this.id, required this.opType, required this.calId, required this.eventUid, required this.payload, required this.createdAt, this.attempts = 0, this.lastError, this.nextRetryAt});
  

@override final  int id;
@override final  OutboxOpType opType;
@override final  String calId;
@override final  String eventUid;
@override final  String payload;
@override final  DateTime createdAt;
@override@JsonKey() final  int attempts;
@override final  String? lastError;
@override final  DateTime? nextRetryAt;

/// Create a copy of OutboxEntryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutboxEntryEntityCopyWith<_OutboxEntryEntity> get copyWith => __$OutboxEntryEntityCopyWithImpl<_OutboxEntryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutboxEntryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.opType, opType) || other.opType == opType)&&(identical(other.calId, calId) || other.calId == calId)&&(identical(other.eventUid, eventUid) || other.eventUid == eventUid)&&(identical(other.payload, payload) || other.payload == payload)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.lastError, lastError) || other.lastError == lastError)&&(identical(other.nextRetryAt, nextRetryAt) || other.nextRetryAt == nextRetryAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,opType,calId,eventUid,payload,createdAt,attempts,lastError,nextRetryAt);

@override
String toString() {
  return 'OutboxEntryEntity(id: $id, opType: $opType, calId: $calId, eventUid: $eventUid, payload: $payload, createdAt: $createdAt, attempts: $attempts, lastError: $lastError, nextRetryAt: $nextRetryAt)';
}


}

/// @nodoc
abstract mixin class _$OutboxEntryEntityCopyWith<$Res> implements $OutboxEntryEntityCopyWith<$Res> {
  factory _$OutboxEntryEntityCopyWith(_OutboxEntryEntity value, $Res Function(_OutboxEntryEntity) _then) = __$OutboxEntryEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, OutboxOpType opType, String calId, String eventUid, String payload, DateTime createdAt, int attempts, String? lastError, DateTime? nextRetryAt
});




}
/// @nodoc
class __$OutboxEntryEntityCopyWithImpl<$Res>
    implements _$OutboxEntryEntityCopyWith<$Res> {
  __$OutboxEntryEntityCopyWithImpl(this._self, this._then);

  final _OutboxEntryEntity _self;
  final $Res Function(_OutboxEntryEntity) _then;

/// Create a copy of OutboxEntryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? opType = null,Object? calId = null,Object? eventUid = null,Object? payload = null,Object? createdAt = null,Object? attempts = null,Object? lastError = freezed,Object? nextRetryAt = freezed,}) {
  return _then(_OutboxEntryEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,opType: null == opType ? _self.opType : opType // ignore: cast_nullable_to_non_nullable
as OutboxOpType,calId: null == calId ? _self.calId : calId // ignore: cast_nullable_to_non_nullable
as String,eventUid: null == eventUid ? _self.eventUid : eventUid // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,nextRetryAt: freezed == nextRetryAt ? _self.nextRetryAt : nextRetryAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
