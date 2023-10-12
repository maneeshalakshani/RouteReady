// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fine_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FineStore on _FineStore, Store {
  late final _$showSummaryAtom =
      Atom(name: '_FineStore.showSummary', context: context);

  @override
  bool get showSummary {
    _$showSummaryAtom.reportRead();
    return super.showSummary;
  }

  @override
  set showSummary(bool value) {
    _$showSummaryAtom.reportWrite(value, super.showSummary, () {
      super.showSummary = value;
    });
  }

  late final _$loc1latAtom = Atom(name: '_FineStore.loc1lat', context: context);

  @override
  double? get loc1lat {
    _$loc1latAtom.reportRead();
    return super.loc1lat;
  }

  @override
  set loc1lat(double? value) {
    _$loc1latAtom.reportWrite(value, super.loc1lat, () {
      super.loc1lat = value;
    });
  }

  late final _$loc1lonAtom = Atom(name: '_FineStore.loc1lon', context: context);

  @override
  double? get loc1lon {
    _$loc1lonAtom.reportRead();
    return super.loc1lon;
  }

  @override
  set loc1lon(double? value) {
    _$loc1lonAtom.reportWrite(value, super.loc1lon, () {
      super.loc1lon = value;
    });
  }

  late final _$loc2latAtom = Atom(name: '_FineStore.loc2lat', context: context);

  @override
  double? get loc2lat {
    _$loc2latAtom.reportRead();
    return super.loc2lat;
  }

  @override
  set loc2lat(double? value) {
    _$loc2latAtom.reportWrite(value, super.loc2lat, () {
      super.loc2lat = value;
    });
  }

  late final _$loc2lonAtom = Atom(name: '_FineStore.loc2lon', context: context);

  @override
  double? get loc2lon {
    _$loc2lonAtom.reportRead();
    return super.loc2lon;
  }

  @override
  set loc2lon(double? value) {
    _$loc2lonAtom.reportWrite(value, super.loc2lon, () {
      super.loc2lon = value;
    });
  }

  late final _$totalPriceAtom =
      Atom(name: '_FineStore.totalPrice', context: context);

  @override
  double? get totalPrice {
    _$totalPriceAtom.reportRead();
    return super.totalPrice;
  }

  @override
  set totalPrice(double? value) {
    _$totalPriceAtom.reportWrite(value, super.totalPrice, () {
      super.totalPrice = value;
    });
  }

  late final _$_FineStoreActionController =
      ActionController(name: '_FineStore', context: context);

  @override
  void setShowSummary({required bool showSummary}) {
    final _$actionInfo = _$_FineStoreActionController.startAction(
        name: '_FineStore.setShowSummary');
    try {
      return super.setShowSummary(showSummary: showSummary);
    } finally {
      _$_FineStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLonLoc1({required double loc1lon}) {
    final _$actionInfo =
        _$_FineStoreActionController.startAction(name: '_FineStore.setLonLoc1');
    try {
      return super.setLonLoc1(loc1lon: loc1lon);
    } finally {
      _$_FineStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLonLoc2({required double loc2lon}) {
    final _$actionInfo =
        _$_FineStoreActionController.startAction(name: '_FineStore.setLonLoc2');
    try {
      return super.setLonLoc2(loc2lon: loc2lon);
    } finally {
      _$_FineStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLatLoc1({required double loc1lat}) {
    final _$actionInfo =
        _$_FineStoreActionController.startAction(name: '_FineStore.setLatLoc1');
    try {
      return super.setLatLoc1(loc1lat: loc1lat);
    } finally {
      _$_FineStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLatLoc2({required double loc2lat}) {
    final _$actionInfo =
        _$_FineStoreActionController.startAction(name: '_FineStore.setLatLoc2');
    try {
      return super.setLatLoc2(loc2lat: loc2lat);
    } finally {
      _$_FineStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotalPrice({required double totalPrice}) {
    final _$actionInfo = _$_FineStoreActionController.startAction(
        name: '_FineStore.setTotalPrice');
    try {
      return super.setTotalPrice(totalPrice: totalPrice);
    } finally {
      _$_FineStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showSummary: ${showSummary},
loc1lat: ${loc1lat},
loc1lon: ${loc1lon},
loc2lat: ${loc2lat},
loc2lon: ${loc2lon},
totalPrice: ${totalPrice}
    ''';
  }
}
