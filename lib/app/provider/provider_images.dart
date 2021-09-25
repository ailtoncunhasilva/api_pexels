import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:justa_challenge/app/models/photo.dart';

class ProviderImages extends ChangeNotifier {
  ProviderImages() {
    getImages();
  }

  List<Photo> photoList = [];

  Future<void> getImages() async {
    var url = Uri.parse('https://api.pexels.com/v1/curated?per_page=51');
    final response = await http.get(
        url,
        headers: {
          'Authorization':
              '563492ad6f91700001000001c3cb4ba8d9cf4d6d8a393bbea7d666da'
        });

    Iterable resp = json.decode(response.body)['photos'];

    photoList = resp.map((e) => Photo.fromJson(e)).toList();
    print(photoList);

    notifyListeners();
  }
}
