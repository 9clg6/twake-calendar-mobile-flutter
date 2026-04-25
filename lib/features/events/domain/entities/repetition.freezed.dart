// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repetition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RepetitionEntity {

 RepeatFreq get freq; int get interval; List<String> get byday; int? get count; String? get until;
/// Create a copy of RepetitionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepetitionEntityCopyWith<RepetitionEntity> get copyWith => _$RepetitionEntityCopyWithImpl<RepetitionEntity>(this as RepetitionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepetitionEntity&&(identical(other.freq, freq) || other.freq == freq)&&(identical(other.interval, interval) || other.interval == interval)&&const DeepCollectionEquality().equals(other.byday, byday)&&(identical(other.count, count) || other.count == count)&&(identical(other.until, until) || other.until == until));
}


@override
int get hashCode => Object.hash(runtimeType,freq,interval,const DeepCollectionEquality().hash(byday),count,until);

@override
String toString() {
  return 'RepetitionEntity(freq: $freq, interval: $interval, byday: $byday, count: $count, until: $until)';
}


}

/// @nodoc
abstract mixin class $RepetitionEntityCopyWith<$Res>  {
  factory $RepetitionEntityCopyWith(RepetitionEntity value, $Res Function(RepetitionEntity) _then) = _$RepetitionEntityCopyWithImpl;
@useResult
$Res call({
 RepeatFreq freq, int interval, List<String> byday, int? count, String? until
});




}
/// @nodoc
class _$RepetitionEntityCopyWithImpl<$Res>
    implements $RepetitionEntityCopyWith<$Res> {
  _$RepetitionEntityCopyWithImpl(this._self, this._then);

  final RepetitionEntity _self;
  final $Res Function(RepetitionEntity) _then;

/// Create a copy of RepetitionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? freq = null,Object? interval = null,Object? byday = null,Object? count = freezed,Object? until = freezed,}) {
  return _then(_self.copyWith(
freq: null == freq ? _self.freq : freq // ignore: cast_nullable_to_non_nullable
as RepeatFreq,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,byday: null == byday ? _self.byday : byday // ignore: cast_nullable_to_non_nullable
as List<String>,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,until: freezed == until ? _self.until : until // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _RepetitionEntity implements RepetitionEntity {
  const _RepetitionEntity({required this.freq, this.interval = 1, final  List<String> byday = const <String>[], this.count, this.until}): _byday = byday;
  

@override final  RepeatFreq freq;
@override@JsonKey() final  int interval;
 final  List<String> _byday;
@override@JsonKey() List<String> get byday {
  if (_byday is EqualUnmodifiableListView) return _byday;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_byday);
}

@override final  int? count;
@override final  String? until;

/// Create a copy of RepetitionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepetitionEntityCopyWith<_RepetitionEntity> get copyWith => __$RepetitionEntityCopyWithImpl<_RepetitionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepetitionEntity&&(identical(other.freq, freq) || other.freq == freq)&&(identical(other.interval, interval) || other.interval == interval)&&const DeepCollectionEquality().equals(other._byday, _byday)&&(identical(other.count, count) || other.count == count)&&(identical(other.until, until) || other.until == until));
}


@override
int get hashCode => Object.hash(runtimeType,freq,interval,const DeepCollectionEquality().hash(_byday),count,until);

@override
String toString() {
  return 'RepetitionEntity(freq: $freq, interval: $interval, byday: $byday, count: $count, until: $until)';
}


}

/// @nodoc
abstract mixin class _$RepetitionEntityCopyWith<$Res> implements $RepetitionEntityCopyWith<$Res> {
  factory _$RepetitionEntityCopyWith(_RepetitionEntity value, $Res Function(_RepetitionEntity) _then) = __$RepetitionEntityCopyWithImpl;
@override @useResult
$Res call({
 RepeatFreq freq, int interval, List<String> byday, int? count, String? until
});




}
/// @nodoc
class __$RepetitionEntityCopyWithImpl<$Res>
    implements _$RepetitionEntityCopyWith<$Res> {
  __$RepetitionEntityCopyWithImpl(this._self, this._then);

  final _RepetitionEntity _self;
  final $Res Function(_RepetitionEntity) _then;

/// Create a copy of RepetitionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? freq = null,Object? interval = null,Object? byday = null,Object? count = freezed,Object? until = freezed,}) {
  return _then(_RepetitionEntity(
freq: null == freq ? _self.freq : freq // ignore: cast_nullable_to_non_nullable
as RepeatFreq,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,byday: null == byday ? _self._byday : byday // ignore: cast_nullable_to_non_nullable
as List<String>,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,until: freezed == until ? _self.until : until // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
