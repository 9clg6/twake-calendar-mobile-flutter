// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WsMessage {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WsMessage()';
}


}

/// @nodoc
class $WsMessageCopyWith<$Res>  {
$WsMessageCopyWith(WsMessage _, $Res Function(WsMessage) __);
}


/// @nodoc


class WsCalendarChanged implements WsMessage {
  const WsCalendarChanged({required this.calendarUri, this.syncToken});
  

 final  String calendarUri;
 final  String? syncToken;

/// Create a copy of WsMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsCalendarChangedCopyWith<WsCalendarChanged> get copyWith => _$WsCalendarChangedCopyWithImpl<WsCalendarChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsCalendarChanged&&(identical(other.calendarUri, calendarUri) || other.calendarUri == calendarUri)&&(identical(other.syncToken, syncToken) || other.syncToken == syncToken));
}


@override
int get hashCode => Object.hash(runtimeType,calendarUri,syncToken);

@override
String toString() {
  return 'WsMessage.calendarChanged(calendarUri: $calendarUri, syncToken: $syncToken)';
}


}

/// @nodoc
abstract mixin class $WsCalendarChangedCopyWith<$Res> implements $WsMessageCopyWith<$Res> {
  factory $WsCalendarChangedCopyWith(WsCalendarChanged value, $Res Function(WsCalendarChanged) _then) = _$WsCalendarChangedCopyWithImpl;
@useResult
$Res call({
 String calendarUri, String? syncToken
});




}
/// @nodoc
class _$WsCalendarChangedCopyWithImpl<$Res>
    implements $WsCalendarChangedCopyWith<$Res> {
  _$WsCalendarChangedCopyWithImpl(this._self, this._then);

  final WsCalendarChanged _self;
  final $Res Function(WsCalendarChanged) _then;

/// Create a copy of WsMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? calendarUri = null,Object? syncToken = freezed,}) {
  return _then(WsCalendarChanged(
calendarUri: null == calendarUri ? _self.calendarUri : calendarUri // ignore: cast_nullable_to_non_nullable
as String,syncToken: freezed == syncToken ? _self.syncToken : syncToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class WsRegistered implements WsMessage {
  const WsRegistered({required final  List<String> uris}): _uris = uris;
  

 final  List<String> _uris;
 List<String> get uris {
  if (_uris is EqualUnmodifiableListView) return _uris;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uris);
}


/// Create a copy of WsMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsRegisteredCopyWith<WsRegistered> get copyWith => _$WsRegisteredCopyWithImpl<WsRegistered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsRegistered&&const DeepCollectionEquality().equals(other._uris, _uris));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_uris));

@override
String toString() {
  return 'WsMessage.registered(uris: $uris)';
}


}

/// @nodoc
abstract mixin class $WsRegisteredCopyWith<$Res> implements $WsMessageCopyWith<$Res> {
  factory $WsRegisteredCopyWith(WsRegistered value, $Res Function(WsRegistered) _then) = _$WsRegisteredCopyWithImpl;
@useResult
$Res call({
 List<String> uris
});




}
/// @nodoc
class _$WsRegisteredCopyWithImpl<$Res>
    implements $WsRegisteredCopyWith<$Res> {
  _$WsRegisteredCopyWithImpl(this._self, this._then);

  final WsRegistered _self;
  final $Res Function(WsRegistered) _then;

/// Create a copy of WsMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uris = null,}) {
  return _then(WsRegistered(
uris: null == uris ? _self._uris : uris // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class WsUnregistered implements WsMessage {
  const WsUnregistered({required final  List<String> uris}): _uris = uris;
  

 final  List<String> _uris;
 List<String> get uris {
  if (_uris is EqualUnmodifiableListView) return _uris;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uris);
}


/// Create a copy of WsMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsUnregisteredCopyWith<WsUnregistered> get copyWith => _$WsUnregisteredCopyWithImpl<WsUnregistered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsUnregistered&&const DeepCollectionEquality().equals(other._uris, _uris));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_uris));

@override
String toString() {
  return 'WsMessage.unregistered(uris: $uris)';
}


}

/// @nodoc
abstract mixin class $WsUnregisteredCopyWith<$Res> implements $WsMessageCopyWith<$Res> {
  factory $WsUnregisteredCopyWith(WsUnregistered value, $Res Function(WsUnregistered) _then) = _$WsUnregisteredCopyWithImpl;
@useResult
$Res call({
 List<String> uris
});




}
/// @nodoc
class _$WsUnregisteredCopyWithImpl<$Res>
    implements $WsUnregisteredCopyWith<$Res> {
  _$WsUnregisteredCopyWithImpl(this._self, this._then);

  final WsUnregistered _self;
  final $Res Function(WsUnregistered) _then;

/// Create a copy of WsMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uris = null,}) {
  return _then(WsUnregistered(
uris: null == uris ? _self._uris : uris // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class WsCalendarListUpdate implements WsMessage {
  const WsCalendarListUpdate({final  List<String> subscribed = const <String>[], this.deleted = false}): _subscribed = subscribed;
  

 final  List<String> _subscribed;
@JsonKey() List<String> get subscribed {
  if (_subscribed is EqualUnmodifiableListView) return _subscribed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subscribed);
}

@JsonKey() final  bool deleted;

/// Create a copy of WsMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsCalendarListUpdateCopyWith<WsCalendarListUpdate> get copyWith => _$WsCalendarListUpdateCopyWithImpl<WsCalendarListUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsCalendarListUpdate&&const DeepCollectionEquality().equals(other._subscribed, _subscribed)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_subscribed),deleted);

@override
String toString() {
  return 'WsMessage.calendarListUpdate(subscribed: $subscribed, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class $WsCalendarListUpdateCopyWith<$Res> implements $WsMessageCopyWith<$Res> {
  factory $WsCalendarListUpdateCopyWith(WsCalendarListUpdate value, $Res Function(WsCalendarListUpdate) _then) = _$WsCalendarListUpdateCopyWithImpl;
@useResult
$Res call({
 List<String> subscribed, bool deleted
});




}
/// @nodoc
class _$WsCalendarListUpdateCopyWithImpl<$Res>
    implements $WsCalendarListUpdateCopyWith<$Res> {
  _$WsCalendarListUpdateCopyWithImpl(this._self, this._then);

  final WsCalendarListUpdate _self;
  final $Res Function(WsCalendarListUpdate) _then;

/// Create a copy of WsMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? subscribed = null,Object? deleted = null,}) {
  return _then(WsCalendarListUpdate(
subscribed: null == subscribed ? _self._subscribed : subscribed // ignore: cast_nullable_to_non_nullable
as List<String>,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class WsPong implements WsMessage {
  const WsPong();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsPong);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WsMessage.pong()';
}


}




/// @nodoc


class WsUnknown implements WsMessage {
  const WsUnknown(final  Map<String, dynamic> payload): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of WsMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsUnknownCopyWith<WsUnknown> get copyWith => _$WsUnknownCopyWithImpl<WsUnknown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsUnknown&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'WsMessage.unknown(payload: $payload)';
}


}

/// @nodoc
abstract mixin class $WsUnknownCopyWith<$Res> implements $WsMessageCopyWith<$Res> {
  factory $WsUnknownCopyWith(WsUnknown value, $Res Function(WsUnknown) _then) = _$WsUnknownCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class _$WsUnknownCopyWithImpl<$Res>
    implements $WsUnknownCopyWith<$Res> {
  _$WsUnknownCopyWithImpl(this._self, this._then);

  final WsUnknown _self;
  final $Res Function(WsUnknown) _then;

/// Create a copy of WsMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(WsUnknown(
null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
