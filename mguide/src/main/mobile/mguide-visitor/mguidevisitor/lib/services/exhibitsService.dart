import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:mguidevisitor/models/models.dart';
import 'package:mguidevisitor/services/restService.dart';

class ExhibitsService extends ChangeNotifier {
  final List<Exhibit> _exhibits = [];

  UnmodifiableListView<Exhibit> get items => UnmodifiableListView(_exhibits);

  void add(Exhibit exhibit) {
    _exhibits.add(exhibit);
    notifyListeners();
  }

  void removeAll() {
    _exhibits.clear();
    notifyListeners();
  }

  void getAll(text) {
    print('in exhibit service');
    RestService rest = RestService();
    rest.get<List<dynamic>>(
        path: "api/exhibits?name=${text}", onSuccess: onSuccess);
  }

  void onSuccess(List<dynamic> list) {
    print(list[0]['id']);
    _exhibits.clear();
    list.forEach((element) => _exhibits.add(Exhibit.fromJson(element)));
    print(list);
    notifyListeners();
  }
}
