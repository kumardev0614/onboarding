import 'package:get/get.dart';

class HomeState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;

  final _iamNotBusy = true.obs;
  get iamNotBusy => _iamNotBusy.value;
  set iamNotBusy(value) => _iamNotBusy.value = value;
}
