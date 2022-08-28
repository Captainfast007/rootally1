
import 'package:get/get.dart';
import 'package:rootally/Services/Service.dart';

import '../Model/Data_Model.dart';

class DataController extends GetxController {
  var datalist = <Session>[].obs;
  service ser = service();
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    var data = await ser.read();
    if (data != null) {
      datalist.value = data;
    }
  }
}

class DataController2 extends GetxController{
  var datalist = <Slot>[].obs;
  Service2 ser = Service2();
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    var data = await ser.read();
    if (data != null) {
      datalist.value = data;
    }
  }
}
