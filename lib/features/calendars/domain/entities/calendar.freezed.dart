// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarEntity {

 String get id; String get link; String get name; UserEntity get owner; CalendarVisibility get visibility; bool get delegated; String? get description; String? get colorLight; String? get colorDark; DelegationAccessEntity? get access; String? get syncToken; List<CalendarInviteEntity> get invite;
/// Create a copy of CalendarEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarEntityCopyWith<CalendarEntity> get copyWith => _$CalendarEntityCopyWithImpl<CalendarEntity>(this as CalendarEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.link, link) || other.link == link)&&(identical(other.name, name) || other.name == name)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.delegated, delegated) || other.delegated == delegated)&&(identical(other.description, description) || other.description == description)&&(identical(other.colorLight, colorLight) || other.colorLight == colorLight)&&(identical(other.colorDark, colorDark) || other.colorDark == colorDark)&&(identical(other.access, access) || other.access == access)&&(identical(other.syncToken, syncToken) || other.syncToken == syncToken)&&const DeepCollectionEquality().equals(other.invite, invite));
}


@override
int get hashCode => Object.hash(runtimeType,id,link,name,owner,visibility,delegated,description,colorLight,colorDark,access,syncToken,const DeepCollectionEquality().hash(invite));

@override
String toString() {
  return 'CalendarEntity(id: $id, link: $link, name: $name, owner: $owner, visibility: $visibility, delegated: $delegated, description: $description, colorLight: $colorLight, colorDark: $colorDark, access: $access, syncToken: $syncToken, invite: $invite)';
}


}

/// @nodoc
abstract mixin class $CalendarEntityCopyWith<$Res>  {
  factory $CalendarEntityCopyWith(CalendarEntity value, $Res Function(CalendarEntity) _then) = _$CalendarEntityCopyWithImpl;
@useResult
$Res call({
 String id, String link, String name, UserEntity owner, CalendarVisibility visibility, bool delegated, String? description, String? colorLight, String? colorDark, DelegationAccessEntity? access, String? syncToken, List<CalendarInviteEntity> invite
});


$UserEntityCopyWith<$Res> get owner;$DelegationAccessEntityCopyWith<$Res>? get access;

}
/// @nodoc
class _$CalendarEntityCopyWithImpl<$Res>
    implements $CalendarEntityCopyWith<$Res> {
  _$CalendarEntityCopyWithImpl(this._self, this._then);

  final CalendarEntity _self;
  final $Res Function(CalendarEntity) _then;

/// Create a copy of CalendarEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? link = null,Object? name = null,Object? owner = null,Object? visibility = null,Object? delegated = null,Object? description = freezed,Object? colorLight = freezed,Object? colorDark = freezed,Object? access = freezed,Object? syncToken = freezed,Object? invite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as UserEntity,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as CalendarVisibility,delegated: null == delegated ? _self.delegated : delegated // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,colorLight: freezed == colorLight ? _self.colorLight : colorLight // ignore: cast_nullable_to_non_nullable
as String?,colorDark: freezed == colorDark ? _self.colorDark : colorDark // ignore: cast_nullable_to_non_nullable
as String?,access: freezed == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as DelegationAccessEntity?,syncToken: freezed == syncToken ? _self.syncToken : syncToken // ignore: cast_nullable_to_non_nullable
as String?,invite: null == invite ? _self.invite : invite // ignore: cast_nullable_to_non_nullable
as List<CalendarInviteEntity>,
  ));
}
/// Create a copy of CalendarEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get owner {
  
  return $UserEntityCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of CalendarEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DelegationAccessEntityCopyWith<$Res>? get access {
    if (_self.access == null) {
    return null;
  }

  return $DelegationAccessEntityCopyWith<$Res>(_self.access!, (value) {
    return _then(_self.copyWith(access: value));
  });
}
}


/// @nodoc


class _CalendarEntity implements CalendarEntity {
  const _CalendarEntity({required this.id, required this.link, required this.name, required this.owner, this.visibility = CalendarVisibility.privateVisibility, this.delegated = false, this.description, this.colorLight, this.colorDark, this.access, this.syncToken, final  List<CalendarInviteEntity> invite = const <CalendarInviteEntity>[]}): _invite = invite;
  

@override final  String id;
@override final  String link;
@override final  String name;
@override final  UserEntity owner;
@override@JsonKey() final  CalendarVisibility visibility;
@override@JsonKey() final  bool delegated;
@override final  String? description;
@override final  String? colorLight;
@override final  String? colorDark;
@override final  DelegationAccessEntity? access;
@override final  String? syncToken;
 final  List<CalendarInviteEntity> _invite;
@override@JsonKey() List<CalendarInviteEntity> get invite {
  if (_invite is EqualUnmodifiableListView) return _invite;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invite);
}


/// Create a copy of CalendarEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarEntityCopyWith<_CalendarEntity> get copyWith => __$CalendarEntityCopyWithImpl<_CalendarEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.link, link) || other.link == link)&&(identical(other.name, name) || other.name == name)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.delegated, delegated) || other.delegated == delegated)&&(identical(other.description, description) || other.description == description)&&(identical(other.colorLight, colorLight) || other.colorLight == colorLight)&&(identical(other.colorDark, colorDark) || other.colorDark == colorDark)&&(identical(other.access, access) || other.access == access)&&(identical(other.syncToken, syncToken) || other.syncToken == syncToken)&&const DeepCollectionEquality().equals(other._invite, _invite));
}


@override
int get hashCode => Object.hash(runtimeType,id,link,name,owner,visibility,delegated,description,colorLight,colorDark,access,syncToken,const DeepCollectionEquality().hash(_invite));

@override
String toString() {
  return 'CalendarEntity(id: $id, link: $link, name: $name, owner: $owner, visibility: $visibility, delegated: $delegated, description: $description, colorLight: $colorLight, colorDark: $colorDark, access: $access, syncToken: $syncToken, invite: $invite)';
}


}

/// @nodoc
abstract mixin class _$CalendarEntityCopyWith<$Res> implements $CalendarEntityCopyWith<$Res> {
  factory _$CalendarEntityCopyWith(_CalendarEntity value, $Res Function(_CalendarEntity) _then) = __$CalendarEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String link, String name, UserEntity owner, CalendarVisibility visibility, bool delegated, String? description, String? colorLight, String? colorDark, DelegationAccessEntity? access, String? syncToken, List<CalendarInviteEntity> invite
});


@override $UserEntityCopyWith<$Res> get owner;@override $DelegationAccessEntityCopyWith<$Res>? get access;

}
/// @nodoc
class __$CalendarEntityCopyWithImpl<$Res>
    implements _$CalendarEntityCopyWith<$Res> {
  __$CalendarEntityCopyWithImpl(this._self, this._then);

  final _CalendarEntity _self;
  final $Res Function(_CalendarEntity) _then;

/// Create a copy of CalendarEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? link = null,Object? name = null,Object? owner = null,Object? visibility = null,Object? delegated = null,Object? description = freezed,Object? colorLight = freezed,Object? colorDark = freezed,Object? access = freezed,Object? syncToken = freezed,Object? invite = null,}) {
  return _then(_CalendarEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as UserEntity,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as CalendarVisibility,delegated: null == delegated ? _self.delegated : delegated // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,colorLight: freezed == colorLight ? _self.colorLight : colorLight // ignore: cast_nullable_to_non_nullable
as String?,colorDark: freezed == colorDark ? _self.colorDark : colorDark // ignore: cast_nullable_to_non_nullable
as String?,access: freezed == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as DelegationAccessEntity?,syncToken: freezed == syncToken ? _self.syncToken : syncToken // ignore: cast_nullable_to_non_nullable
as String?,invite: null == invite ? _self._invite : invite // ignore: cast_nullable_to_non_nullable
as List<CalendarInviteEntity>,
  ));
}

/// Create a copy of CalendarEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get owner {
  
  return $UserEntityCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of CalendarEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DelegationAccessEntityCopyWith<$Res>? get access {
    if (_self.access == null) {
    return null;
  }

  return $DelegationAccessEntityCopyWith<$Res>(_self.access!, (value) {
    return _then(_self.copyWith(access: value));
  });
}
}

// dart format on
