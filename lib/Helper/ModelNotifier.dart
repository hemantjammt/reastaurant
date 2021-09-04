import 'package:demo/Model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ModelNotifier extends ChangeNotifier {
  DataModel dataModel = DataModel();
  getRestApi() async {
    var res = await http.get(Uri.parse(
        "http://chotu.proinnovativesoftware.co/Api/Rebliss/GetMarkAttendanceUserInfo/0"));
    dataModel = dataModelFromJson(res.body);
    notifyListeners();
  }
}
