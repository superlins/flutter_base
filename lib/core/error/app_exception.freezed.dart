// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppException {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppException);
}


@override
int get hashCode => runtimeType.hashCode;



}

/// @nodoc
class $AppExceptionCopyWith<$Res>  {
$AppExceptionCopyWith(AppException _, $Res Function(AppException) __);
}


/// Adds pattern-matching-related methods to [AppException].
extension AppExceptionPatterns on AppException {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NetworkException value)?  network,TResult Function( _UnauthorizedException value)?  unauthorized,TResult Function( _BadRequestException value)?  badRequest,TResult Function( _ServerException value)?  server,TResult Function( _ModerationException value)?  moderation,TResult Function( _UnknownException value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkException() when network != null:
return network(_that);case _UnauthorizedException() when unauthorized != null:
return unauthorized(_that);case _BadRequestException() when badRequest != null:
return badRequest(_that);case _ServerException() when server != null:
return server(_that);case _ModerationException() when moderation != null:
return moderation(_that);case _UnknownException() when unknown != null:
return unknown(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NetworkException value)  network,required TResult Function( _UnauthorizedException value)  unauthorized,required TResult Function( _BadRequestException value)  badRequest,required TResult Function( _ServerException value)  server,required TResult Function( _ModerationException value)  moderation,required TResult Function( _UnknownException value)  unknown,}){
final _that = this;
switch (_that) {
case _NetworkException():
return network(_that);case _UnauthorizedException():
return unauthorized(_that);case _BadRequestException():
return badRequest(_that);case _ServerException():
return server(_that);case _ModerationException():
return moderation(_that);case _UnknownException():
return unknown(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NetworkException value)?  network,TResult? Function( _UnauthorizedException value)?  unauthorized,TResult? Function( _BadRequestException value)?  badRequest,TResult? Function( _ServerException value)?  server,TResult? Function( _ModerationException value)?  moderation,TResult? Function( _UnknownException value)?  unknown,}){
final _that = this;
switch (_that) {
case _NetworkException() when network != null:
return network(_that);case _UnauthorizedException() when unauthorized != null:
return unauthorized(_that);case _BadRequestException() when badRequest != null:
return badRequest(_that);case _ServerException() when server != null:
return server(_that);case _ModerationException() when moderation != null:
return moderation(_that);case _UnknownException() when unknown != null:
return unknown(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? message)?  network,TResult Function( String? message)?  unauthorized,TResult Function( String? message)?  badRequest,TResult Function( String? message)?  server,TResult Function( String reason,  List<String> riskWords)?  moderation,TResult Function( String? message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkException() when network != null:
return network(_that.message);case _UnauthorizedException() when unauthorized != null:
return unauthorized(_that.message);case _BadRequestException() when badRequest != null:
return badRequest(_that.message);case _ServerException() when server != null:
return server(_that.message);case _ModerationException() when moderation != null:
return moderation(_that.reason,_that.riskWords);case _UnknownException() when unknown != null:
return unknown(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? message)  network,required TResult Function( String? message)  unauthorized,required TResult Function( String? message)  badRequest,required TResult Function( String? message)  server,required TResult Function( String reason,  List<String> riskWords)  moderation,required TResult Function( String? message)  unknown,}) {final _that = this;
switch (_that) {
case _NetworkException():
return network(_that.message);case _UnauthorizedException():
return unauthorized(_that.message);case _BadRequestException():
return badRequest(_that.message);case _ServerException():
return server(_that.message);case _ModerationException():
return moderation(_that.reason,_that.riskWords);case _UnknownException():
return unknown(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? message)?  network,TResult? Function( String? message)?  unauthorized,TResult? Function( String? message)?  badRequest,TResult? Function( String? message)?  server,TResult? Function( String reason,  List<String> riskWords)?  moderation,TResult? Function( String? message)?  unknown,}) {final _that = this;
switch (_that) {
case _NetworkException() when network != null:
return network(_that.message);case _UnauthorizedException() when unauthorized != null:
return unauthorized(_that.message);case _BadRequestException() when badRequest != null:
return badRequest(_that.message);case _ServerException() when server != null:
return server(_that.message);case _ModerationException() when moderation != null:
return moderation(_that.reason,_that.riskWords);case _UnknownException() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _NetworkException extends AppException {
  const _NetworkException([this.message]): super._();
  

 final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkExceptionCopyWith<_NetworkException> get copyWith => __$NetworkExceptionCopyWithImpl<_NetworkException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);



}

/// @nodoc
abstract mixin class _$NetworkExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory _$NetworkExceptionCopyWith(_NetworkException value, $Res Function(_NetworkException) _then) = __$NetworkExceptionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$NetworkExceptionCopyWithImpl<$Res>
    implements _$NetworkExceptionCopyWith<$Res> {
  __$NetworkExceptionCopyWithImpl(this._self, this._then);

  final _NetworkException _self;
  final $Res Function(_NetworkException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_NetworkException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _UnauthorizedException extends AppException {
  const _UnauthorizedException([this.message]): super._();
  

 final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnauthorizedExceptionCopyWith<_UnauthorizedException> get copyWith => __$UnauthorizedExceptionCopyWithImpl<_UnauthorizedException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnauthorizedException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);



}

/// @nodoc
abstract mixin class _$UnauthorizedExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory _$UnauthorizedExceptionCopyWith(_UnauthorizedException value, $Res Function(_UnauthorizedException) _then) = __$UnauthorizedExceptionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$UnauthorizedExceptionCopyWithImpl<$Res>
    implements _$UnauthorizedExceptionCopyWith<$Res> {
  __$UnauthorizedExceptionCopyWithImpl(this._self, this._then);

  final _UnauthorizedException _self;
  final $Res Function(_UnauthorizedException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_UnauthorizedException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _BadRequestException extends AppException {
  const _BadRequestException([this.message]): super._();
  

 final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BadRequestExceptionCopyWith<_BadRequestException> get copyWith => __$BadRequestExceptionCopyWithImpl<_BadRequestException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadRequestException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);



}

/// @nodoc
abstract mixin class _$BadRequestExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory _$BadRequestExceptionCopyWith(_BadRequestException value, $Res Function(_BadRequestException) _then) = __$BadRequestExceptionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$BadRequestExceptionCopyWithImpl<$Res>
    implements _$BadRequestExceptionCopyWith<$Res> {
  __$BadRequestExceptionCopyWithImpl(this._self, this._then);

  final _BadRequestException _self;
  final $Res Function(_BadRequestException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_BadRequestException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ServerException extends AppException {
  const _ServerException([this.message]): super._();
  

 final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerExceptionCopyWith<_ServerException> get copyWith => __$ServerExceptionCopyWithImpl<_ServerException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);



}

/// @nodoc
abstract mixin class _$ServerExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory _$ServerExceptionCopyWith(_ServerException value, $Res Function(_ServerException) _then) = __$ServerExceptionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$ServerExceptionCopyWithImpl<$Res>
    implements _$ServerExceptionCopyWith<$Res> {
  __$ServerExceptionCopyWithImpl(this._self, this._then);

  final _ServerException _self;
  final $Res Function(_ServerException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_ServerException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ModerationException extends AppException {
  const _ModerationException(this.reason, final  List<String> riskWords): _riskWords = riskWords,super._();
  

 final  String reason;
 final  List<String> _riskWords;
 List<String> get riskWords {
  if (_riskWords is EqualUnmodifiableListView) return _riskWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_riskWords);
}


/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModerationExceptionCopyWith<_ModerationException> get copyWith => __$ModerationExceptionCopyWithImpl<_ModerationException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModerationException&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other._riskWords, _riskWords));
}


@override
int get hashCode => Object.hash(runtimeType,reason,const DeepCollectionEquality().hash(_riskWords));



}

/// @nodoc
abstract mixin class _$ModerationExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory _$ModerationExceptionCopyWith(_ModerationException value, $Res Function(_ModerationException) _then) = __$ModerationExceptionCopyWithImpl;
@useResult
$Res call({
 String reason, List<String> riskWords
});




}
/// @nodoc
class __$ModerationExceptionCopyWithImpl<$Res>
    implements _$ModerationExceptionCopyWith<$Res> {
  __$ModerationExceptionCopyWithImpl(this._self, this._then);

  final _ModerationException _self;
  final $Res Function(_ModerationException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? riskWords = null,}) {
  return _then(_ModerationException(
null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,null == riskWords ? _self._riskWords : riskWords // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class _UnknownException extends AppException {
  const _UnknownException([this.message]): super._();
  

 final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnknownExceptionCopyWith<_UnknownException> get copyWith => __$UnknownExceptionCopyWithImpl<_UnknownException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnknownException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);



}

/// @nodoc
abstract mixin class _$UnknownExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory _$UnknownExceptionCopyWith(_UnknownException value, $Res Function(_UnknownException) _then) = __$UnknownExceptionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$UnknownExceptionCopyWithImpl<$Res>
    implements _$UnknownExceptionCopyWith<$Res> {
  __$UnknownExceptionCopyWithImpl(this._self, this._then);

  final _UnknownException _self;
  final $Res Function(_UnknownException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_UnknownException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
