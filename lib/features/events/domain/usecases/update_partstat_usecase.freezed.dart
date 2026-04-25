// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_partstat_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdatePartstatParams {

 CalendarEventEntity get event; String get attendeeAddress; Partstat get partstat;
/// Create a copy of UpdatePartstatParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePartstatParamsCopyWith<UpdatePartstatParams> get copyWith => _$UpdatePartstatParamsCopyWithImpl<UpdatePartstatParams>(this as UpdatePartstatParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePartstatParams&&(identical(other.event, event) || other.event == event)&&(identical(other.attendeeAddress, attendeeAddress) || other.attendeeAddress == attendeeAddress)&&(identical(other.partstat, partstat) || other.partstat == partstat));
}


@override
int get hashCode => Object.hash(runtimeType,event,attendeeAddress,partstat);

@override
String toString() {
  return 'UpdatePartstatParams(event: $event, attendeeAddress: $attendeeAddress, partstat: $partstat)';
}


}

/// @nodoc
abstract mixin class $UpdatePartstatParamsCopyWith<$Res>  {
  factory $UpdatePartstatParamsCopyWith(UpdatePartstatParams value, $Res Function(UpdatePartstatParams) _then) = _$UpdatePartstatParamsCopyWithImpl;
@useResult
$Res call({
 CalendarEventEntity event, String attendeeAddress, Partstat partstat
});


$CalendarEventEntityCopyWith<$Res> get event;

}
/// @nodoc
class _$UpdatePartstatParamsCopyWithImpl<$Res>
    implements $UpdatePartstatParamsCopyWith<$Res> {
  _$UpdatePartstatParamsCopyWithImpl(this._self, this._then);

  final UpdatePartstatParams _self;
  final $Res Function(UpdatePartstatParams) _then;

/// Create a copy of UpdatePartstatParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? event = null,Object? attendeeAddress = null,Object? partstat = null,}) {
  return _then(_self.copyWith(
event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as CalendarEventEntity,attendeeAddress: null == attendeeAddress ? _self.attendeeAddress : attendeeAddress // ignore: cast_nullable_to_non_nullable
as String,partstat: null == partstat ? _self.partstat : partstat // ignore: cast_nullable_to_non_nullable
as Partstat,
  ));
}
/// Create a copy of UpdatePartstatParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalendarEventEntityCopyWith<$Res> get event {
  
  return $CalendarEventEntityCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}


/// @nodoc


class _UpdatePartstatParams implements UpdatePartstatParams {
  const _UpdatePartstatParams({required this.event, required this.attendeeAddress, required this.partstat});
  

@override final  CalendarEventEntity event;
@override final  String attendeeAddress;
@override final  Partstat partstat;

/// Create a copy of UpdatePartstatParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePartstatParamsCopyWith<_UpdatePartstatParams> get copyWith => __$UpdatePartstatParamsCopyWithImpl<_UpdatePartstatParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePartstatParams&&(identical(other.event, event) || other.event == event)&&(identical(other.attendeeAddress, attendeeAddress) || other.attendeeAddress == attendeeAddress)&&(identical(other.partstat, partstat) || other.partstat == partstat));
}


@override
int get hashCode => Object.hash(runtimeType,event,attendeeAddress,partstat);

@override
String toString() {
  return 'UpdatePartstatParams(event: $event, attendeeAddress: $attendeeAddress, partstat: $partstat)';
}


}

/// @nodoc
abstract mixin class _$UpdatePartstatParamsCopyWith<$Res> implements $UpdatePartstatParamsCopyWith<$Res> {
  factory _$UpdatePartstatParamsCopyWith(_UpdatePartstatParams value, $Res Function(_UpdatePartstatParams) _then) = __$UpdatePartstatParamsCopyWithImpl;
@override @useResult
$Res call({
 CalendarEventEntity event, String attendeeAddress, Partstat partstat
});


@override $CalendarEventEntityCopyWith<$Res> get event;

}
/// @nodoc
class __$UpdatePartstatParamsCopyWithImpl<$Res>
    implements _$UpdatePartstatParamsCopyWith<$Res> {
  __$UpdatePartstatParamsCopyWithImpl(this._self, this._then);

  final _UpdatePartstatParams _self;
  final $Res Function(_UpdatePartstatParams) _then;

/// Create a copy of UpdatePartstatParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = null,Object? attendeeAddress = null,Object? partstat = null,}) {
  return _then(_UpdatePartstatParams(
event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as CalendarEventEntity,attendeeAddress: null == attendeeAddress ? _self.attendeeAddress : attendeeAddress // ignore: cast_nullable_to_non_nullable
as String,partstat: null == partstat ? _self.partstat : partstat // ignore: cast_nullable_to_non_nullable
as Partstat,
  ));
}

/// Create a copy of UpdatePartstatParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalendarEventEntityCopyWith<$Res> get event {
  
  return $CalendarEventEntityCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

// dart format on
