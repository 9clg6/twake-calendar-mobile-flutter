// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conflict.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConflictEntity {

 int get id; String get eventUid; String get calId; String get localJcal; String get serverJcal; DateTime get occurredAt;
/// Create a copy of ConflictEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConflictEntityCopyWith<ConflictEntity> get copyWith => _$ConflictEntityCopyWithImpl<ConflictEntity>(this as ConflictEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConflictEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.eventUid, eventUid) || other.eventUid == eventUid)&&(identical(other.calId, calId) || other.calId == calId)&&(identical(other.localJcal, localJcal) || other.localJcal == localJcal)&&(identical(other.serverJcal, serverJcal) || other.serverJcal == serverJcal)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,eventUid,calId,localJcal,serverJcal,occurredAt);

@override
String toString() {
  return 'ConflictEntity(id: $id, eventUid: $eventUid, calId: $calId, localJcal: $localJcal, serverJcal: $serverJcal, occurredAt: $occurredAt)';
}


}

/// @nodoc
abstract mixin class $ConflictEntityCopyWith<$Res>  {
  factory $ConflictEntityCopyWith(ConflictEntity value, $Res Function(ConflictEntity) _then) = _$ConflictEntityCopyWithImpl;
@useResult
$Res call({
 int id, String eventUid, String calId, String localJcal, String serverJcal, DateTime occurredAt
});




}
/// @nodoc
class _$ConflictEntityCopyWithImpl<$Res>
    implements $ConflictEntityCopyWith<$Res> {
  _$ConflictEntityCopyWithImpl(this._self, this._then);

  final ConflictEntity _self;
  final $Res Function(ConflictEntity) _then;

/// Create a copy of ConflictEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? eventUid = null,Object? calId = null,Object? localJcal = null,Object? serverJcal = null,Object? occurredAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,eventUid: null == eventUid ? _self.eventUid : eventUid // ignore: cast_nullable_to_non_nullable
as String,calId: null == calId ? _self.calId : calId // ignore: cast_nullable_to_non_nullable
as String,localJcal: null == localJcal ? _self.localJcal : localJcal // ignore: cast_nullable_to_non_nullable
as String,serverJcal: null == serverJcal ? _self.serverJcal : serverJcal // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc


class _ConflictEntity implements ConflictEntity {
  const _ConflictEntity({required this.id, required this.eventUid, required this.calId, required this.localJcal, required this.serverJcal, required this.occurredAt});
  

@override final  int id;
@override final  String eventUid;
@override final  String calId;
@override final  String localJcal;
@override final  String serverJcal;
@override final  DateTime occurredAt;

/// Create a copy of ConflictEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConflictEntityCopyWith<_ConflictEntity> get copyWith => __$ConflictEntityCopyWithImpl<_ConflictEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConflictEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.eventUid, eventUid) || other.eventUid == eventUid)&&(identical(other.calId, calId) || other.calId == calId)&&(identical(other.localJcal, localJcal) || other.localJcal == localJcal)&&(identical(other.serverJcal, serverJcal) || other.serverJcal == serverJcal)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,eventUid,calId,localJcal,serverJcal,occurredAt);

@override
String toString() {
  return 'ConflictEntity(id: $id, eventUid: $eventUid, calId: $calId, localJcal: $localJcal, serverJcal: $serverJcal, occurredAt: $occurredAt)';
}


}

/// @nodoc
abstract mixin class _$ConflictEntityCopyWith<$Res> implements $ConflictEntityCopyWith<$Res> {
  factory _$ConflictEntityCopyWith(_ConflictEntity value, $Res Function(_ConflictEntity) _then) = __$ConflictEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String eventUid, String calId, String localJcal, String serverJcal, DateTime occurredAt
});




}
/// @nodoc
class __$ConflictEntityCopyWithImpl<$Res>
    implements _$ConflictEntityCopyWith<$Res> {
  __$ConflictEntityCopyWithImpl(this._self, this._then);

  final _ConflictEntity _self;
  final $Res Function(_ConflictEntity) _then;

/// Create a copy of ConflictEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? eventUid = null,Object? calId = null,Object? localJcal = null,Object? serverJcal = null,Object? occurredAt = null,}) {
  return _then(_ConflictEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,eventUid: null == eventUid ? _self.eventUid : eventUid // ignore: cast_nullable_to_non_nullable
as String,calId: null == calId ? _self.calId : calId // ignore: cast_nullable_to_non_nullable
as String,localJcal: null == localJcal ? _self.localJcal : localJcal // ignore: cast_nullable_to_non_nullable
as String,serverJcal: null == serverJcal ? _self.serverJcal : serverJcal // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
