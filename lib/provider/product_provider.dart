import 'package:flutter/foundation.dart';
import 'package:flutter_skill_test/models/ProductData.dart';



class ProductProvider extends ChangeNotifier {

  List<ProductData> dataList = [];

  void updateDataModel(List<ProductData> dataList) {
    this.dataList = dataList;
    notifyListeners();
  }

}