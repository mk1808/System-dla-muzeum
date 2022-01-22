import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:mguidevisitor/models/models.dart';
import 'package:mguidevisitor/services/restService.dart';

class ChangeHtmlStyleService extends ChangeNotifier {
  final List<Exhibit> _exhibits = [];
  
final String DIV_OPEN = "<div>";
final String DIV_CLOSE = "</div>";

final String STYLES = '''<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
<style>
    p {
        font-family: 'Roboto';
        line-height: 1.5;
    }

    h1,
    h2 {
        font-family: 'Roboto';
    }

    .ql-align-center {
        text-align: center;
    }

    .ql-align-justify {
        text-align: justify;
    }

    .ql-align-left {
        text-align: left;
    }

    .ql-align-right {
        text-align: right;
    }

    p br:first-child {
        line-height: 0.9;
    }
</style> ''';


  UnmodifiableListView<Exhibit> get items => UnmodifiableListView(_exhibits);

  String changeHtml(String? html){
    if(html!=null)
    return STYLES+DIV_OPEN+html+DIV_CLOSE;
    return "";

  }
}
