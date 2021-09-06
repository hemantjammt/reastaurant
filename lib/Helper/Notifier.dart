import 'package:demo/Model/banner_list_data_model.dart';
import 'package:demo/Model/category_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Notifier extends ChangeNotifier {
  Notifier() {
    getRestApi();
    postAPI();
  }
  BannerListDataModel dataModel = BannerListDataModel();
  CategoryDataModel categoryDataModel = CategoryDataModel();
  postAPI() async {
    String url =
        'http://chotu.proinnovativesoftware.co/Api/Rebliss/ResturantName';
    Response res = await http.post(
      Uri.parse(url),
      body: {"Number": 1.toString()},
    );
    if (res.statusCode == 200) {
      categoryDataModel = categoryDataModelFromJson(res.body);
      notifyListeners();
    }
  }

  getRestApi() async {
    var res = await http.get(Uri.parse(
        "http://chotu.proinnovativesoftware.co/Api/Rebliss/GetMarkAttendanceUserInfo/0"));
    dataModel = dataModelFromJson(res.body);
    notifyListeners();
  }
}
