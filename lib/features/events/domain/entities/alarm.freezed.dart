// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlarmEntity {

 String get trigger; String get action; String? get description;
/// Create a copy of AlarmEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmEntityCopyWith<AlarmEntity> get copyWith => _$AlarmEntityCopyWithImpl<AlarmEntity>(this as AlarmEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmEntity&&(identical(other.trigger, trigger) || other.trigger == trigger)&&(identical(other.action, action) || other.action == action)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,trigger,action,description);

@override
String toString() {
  return 'AlarmEntity(trigger: $trigger, action: $action, description: $description)';
}


}

/// @nodoc
abstract mixin class $AlarmEntityCopyWith<$Res>  {
  factory $AlarmEntityCopyWith(AlarmEntity value, $Res Function(AlarmEntity) _then) = _$AlarmEntityCopyWithImpl;
@useResult
$Res call({
 String trigger, String action, String? description
});




}
/// @nodoc
class _$AlarmEntityCopyWithImpl<$Res>
    implements $AlarmEntityCopyWith<$Res> {
  _$AlarmEntityCopyWithImpl(this._self, this._then);

  final AlarmEntity _self;
  final $Res Function(AlarmEntity) _then;

/// Create a copy of AlarmEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trigger = null,Object? action = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
trigger: null == trigger ? _self.trigger : trigger // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _AlarmEntity implements AlarmEntity {
  const _AlarmEntity({required this.trigger, this.action = 'DISPLAY', this.description});
  

@override final  String trigger;
@override@JsonKey() final  String action;
@override final  String? description;

/// Create a copy of AlarmEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlarmEntityCopyWith<_AlarmEntity> get copyWith => __$AlarmEntityCopyWithImpl<_AlarmEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlarmEntity&&(identical(other.trigger, trigger) || other.trigger == trigger)&&(identical(other.action, action) || other.action == action)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,trigger,action,description);

@override
String toString() {
  return 'AlarmEntity(trigger: $trigger, action: $action, description: $description)';
}


}

/// @nodoc
abstract mixin class _$AlarmEntityCopyWith<$Res> implements $AlarmEntityCopyWith<$Res> {
  factory _$AlarmEntityCopyWith(_AlarmEntity value, $Res Function(_AlarmEntity) _then) = __$AlarmEntityCopyWithImpl;
@override @useResult
$Res call({
 String trigger, String action, String? description
});




}
/// @nodoc
class __$AlarmEntityCopyWithImpl<$Res>
    implements _$AlarmEntityCopyWith<$Res> {
  __$AlarmEntityCopyWithImpl(this._self, this._then);

  final _AlarmEntity _self;
  final $Res Function(_AlarmEntity) _then;

/// Create a copy of AlarmEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trigger = null,Object? action = null,Object? description = freezed,}) {
  return _then(_AlarmEntity(
trigger: null == trigger ? _self.trigger : trigger // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
