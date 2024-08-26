// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeatherModel> _$weatherModelSerializer =
    new _$WeatherModelSerializer();
Serializer<WeatherDescriptionModel> _$weatherDescriptionModelSerializer =
    new _$WeatherDescriptionModelSerializer();

class _$WeatherModelSerializer implements StructuredSerializer<WeatherModel> {
  @override
  final Iterable<Type> types = const [WeatherModel, _$WeatherModel];
  @override
  final String wireName = 'WeatherModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'dt',
      serializers.serialize(object.dt, specifiedType: const FullType(int)),
      'weather',
      serializers.serialize(object.weather,
          specifiedType: const FullType(
              BuiltList, const [const FullType(WeatherDescriptionModel)])),
      'visibility',
      serializers.serialize(object.visibility,
          specifiedType: const FullType(int)),
      'pop',
      serializers.serialize(object.pop, specifiedType: const FullType(double)),
      'dt_txt',
      serializers.serialize(object.dt_txt,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WeatherModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dt':
          result.dt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'weather':
          result.weather.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(WeatherDescriptionModel)
              ]))! as BuiltList<Object?>);
          break;
        case 'visibility':
          result.visibility = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'pop':
          result.pop = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'dt_txt':
          result.dt_txt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherDescriptionModelSerializer
    implements StructuredSerializer<WeatherDescriptionModel> {
  @override
  final Iterable<Type> types = const [
    WeatherDescriptionModel,
    _$WeatherDescriptionModel
  ];
  @override
  final String wireName = 'WeatherDescriptionModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WeatherDescriptionModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'main',
      serializers.serialize(object.main, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WeatherDescriptionModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherDescriptionModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'main':
          result.main = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherModel extends WeatherModel {
  @override
  final int dt;
  @override
  final BuiltList<WeatherDescriptionModel> weather;
  @override
  final int visibility;
  @override
  final double pop;
  @override
  final String dt_txt;

  factory _$WeatherModel([void Function(WeatherModelBuilder)? updates]) =>
      (new WeatherModelBuilder()..update(updates))._build();

  _$WeatherModel._(
      {required this.dt,
      required this.weather,
      required this.visibility,
      required this.pop,
      required this.dt_txt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(dt, r'WeatherModel', 'dt');
    BuiltValueNullFieldError.checkNotNull(weather, r'WeatherModel', 'weather');
    BuiltValueNullFieldError.checkNotNull(
        visibility, r'WeatherModel', 'visibility');
    BuiltValueNullFieldError.checkNotNull(pop, r'WeatherModel', 'pop');
    BuiltValueNullFieldError.checkNotNull(dt_txt, r'WeatherModel', 'dt_txt');
  }

  @override
  WeatherModel rebuild(void Function(WeatherModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherModelBuilder toBuilder() => new WeatherModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherModel &&
        dt == other.dt &&
        weather == other.weather &&
        visibility == other.visibility &&
        pop == other.pop &&
        dt_txt == other.dt_txt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dt.hashCode);
    _$hash = $jc(_$hash, weather.hashCode);
    _$hash = $jc(_$hash, visibility.hashCode);
    _$hash = $jc(_$hash, pop.hashCode);
    _$hash = $jc(_$hash, dt_txt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherModel')
          ..add('dt', dt)
          ..add('weather', weather)
          ..add('visibility', visibility)
          ..add('pop', pop)
          ..add('dt_txt', dt_txt))
        .toString();
  }
}

class WeatherModelBuilder
    implements Builder<WeatherModel, WeatherModelBuilder> {
  _$WeatherModel? _$v;

  int? _dt;
  int? get dt => _$this._dt;
  set dt(int? dt) => _$this._dt = dt;

  ListBuilder<WeatherDescriptionModel>? _weather;
  ListBuilder<WeatherDescriptionModel> get weather =>
      _$this._weather ??= new ListBuilder<WeatherDescriptionModel>();
  set weather(ListBuilder<WeatherDescriptionModel>? weather) =>
      _$this._weather = weather;

  int? _visibility;
  int? get visibility => _$this._visibility;
  set visibility(int? visibility) => _$this._visibility = visibility;

  double? _pop;
  double? get pop => _$this._pop;
  set pop(double? pop) => _$this._pop = pop;

  String? _dt_txt;
  String? get dt_txt => _$this._dt_txt;
  set dt_txt(String? dt_txt) => _$this._dt_txt = dt_txt;

  WeatherModelBuilder();

  WeatherModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dt = $v.dt;
      _weather = $v.weather.toBuilder();
      _visibility = $v.visibility;
      _pop = $v.pop;
      _dt_txt = $v.dt_txt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherModel;
  }

  @override
  void update(void Function(WeatherModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherModel build() => _build();

  _$WeatherModel _build() {
    _$WeatherModel _$result;
    try {
      _$result = _$v ??
          new _$WeatherModel._(
              dt: BuiltValueNullFieldError.checkNotNull(
                  dt, r'WeatherModel', 'dt'),
              weather: weather.build(),
              visibility: BuiltValueNullFieldError.checkNotNull(
                  visibility, r'WeatherModel', 'visibility'),
              pop: BuiltValueNullFieldError.checkNotNull(
                  pop, r'WeatherModel', 'pop'),
              dt_txt: BuiltValueNullFieldError.checkNotNull(
                  dt_txt, r'WeatherModel', 'dt_txt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'weather';
        weather.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WeatherModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$WeatherDescriptionModel extends WeatherDescriptionModel {
  @override
  final int id;
  @override
  final String main;
  @override
  final String description;
  @override
  final String icon;

  factory _$WeatherDescriptionModel(
          [void Function(WeatherDescriptionModelBuilder)? updates]) =>
      (new WeatherDescriptionModelBuilder()..update(updates))._build();

  _$WeatherDescriptionModel._(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'WeatherDescriptionModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        main, r'WeatherDescriptionModel', 'main');
    BuiltValueNullFieldError.checkNotNull(
        description, r'WeatherDescriptionModel', 'description');
    BuiltValueNullFieldError.checkNotNull(
        icon, r'WeatherDescriptionModel', 'icon');
  }

  @override
  WeatherDescriptionModel rebuild(
          void Function(WeatherDescriptionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherDescriptionModelBuilder toBuilder() =>
      new WeatherDescriptionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherDescriptionModel &&
        id == other.id &&
        main == other.main &&
        description == other.description &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, main.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherDescriptionModel')
          ..add('id', id)
          ..add('main', main)
          ..add('description', description)
          ..add('icon', icon))
        .toString();
  }
}

class WeatherDescriptionModelBuilder
    implements
        Builder<WeatherDescriptionModel, WeatherDescriptionModelBuilder> {
  _$WeatherDescriptionModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _main;
  String? get main => _$this._main;
  set main(String? main) => _$this._main = main;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  WeatherDescriptionModelBuilder();

  WeatherDescriptionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _main = $v.main;
      _description = $v.description;
      _icon = $v.icon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherDescriptionModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherDescriptionModel;
  }

  @override
  void update(void Function(WeatherDescriptionModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherDescriptionModel build() => _build();

  _$WeatherDescriptionModel _build() {
    final _$result = _$v ??
        new _$WeatherDescriptionModel._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'WeatherDescriptionModel', 'id'),
            main: BuiltValueNullFieldError.checkNotNull(
                main, r'WeatherDescriptionModel', 'main'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'WeatherDescriptionModel', 'description'),
            icon: BuiltValueNullFieldError.checkNotNull(
                icon, r'WeatherDescriptionModel', 'icon'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
