import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:mguidevisitor/models/models.dart';
import 'package:mguidevisitor/services/restService.dart';

class PointService extends ChangeNotifier {
  final List<Point> _points = [];
  Point? _point;

  UnmodifiableListView<Point> get items => UnmodifiableListView(_points);
  Point? get item => (_point);

  void getAll(text) {
    print('in exhibit service');
    RestService rest = RestService();
    rest.get<List<dynamic>>(
        path: "api/exhibits?name=${text}", onSuccess: onSuccess);
  }

  void create(Point point) {
    print('in point service');
    RestService rest = RestService();
    rest.post<dynamic>(
        path: "api/points", body: point.toJson(), onSuccess: onSuccessCreate);
  }

  void onSuccess(dynamic object) {
    print('crested' + object['id']);
    // _points.clear();
    //list.forEach((element) => _points.add(Exhibit.fromJson(element)));
    print(object);
    notifyListeners();
  }

  void onSuccessCreate(dynamic object) {
    // _points.clear();
    //list.forEach((element) => _points.add(Exhibit.fromJson(element)));
    print(object);
    _point = Point.fromJson(object);
    notifyListeners();
  }
}
