import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:itunesdemo/service/service.dart';

class Apicall {
  String userUrl = 'https://itunes.apple.com/search?';

  search(searchtext, ref) async {
    print(searchtext);
    var temp = [];
    for (int i = 0; i < ref.length; i++) {
      temp.add("${ref[i]}=all");
    }
    print(
        "${userUrl}term=$searchtext${temp.isEmpty ? "" : "&${temp.join("&")}"}");
    var response = await http.get(Uri.parse(
        "${userUrl}term=$searchtext${temp.isEmpty ? "" : "&${temp.join("&")}"}"));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['results'];
      print(result);
      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

var servercall = Apicall();
