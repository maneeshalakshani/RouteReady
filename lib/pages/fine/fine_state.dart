import 'package:mobx/mobx.dart';

part 'fine_state.g.dart';

/// Use Command
/// <-- flutter packages pub run build_runner watch --delete-conflicting-outputs -->

class FineStore = _FineStore with _$FineStore;

abstract class _FineStore with Store {
  @observable
  bool showSummary = false;

  @observable
  double? loc1lat;

  @observable
  double? loc1lon;

  @observable
  double? loc2lat;

  @observable
  double? loc2lon;

  @observable
  int? totalPrice;

  @action
  void setShowSummary({required bool showSummary}) {
    this.showSummary = showSummary;
  }

  @action
  void setLonLoc1({required double loc1lon}) {
    this.loc1lon = loc1lon;
  }

  @action
  void setLonLoc2({required double loc2lon}) {
    this.loc2lon = loc2lon;
  }

  @action
  void setLatLoc1({required double loc1lat}) {
    this.loc1lat = loc1lat;
  }

  @action
  void setLatLoc2({required double loc2lat}) {
    this.loc2lat = loc2lat;
  }

  @action
  void setTotalPrice({required int totalPrice}) {
    this.totalPrice = totalPrice;
  }
}
