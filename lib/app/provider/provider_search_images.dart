import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:justa_challenge/app/models/photo.dart';
import 'package:http/http.dart' as http;

class ProviderSearchImages extends ChangeNotifier{
  ProviderSearchImages(){
    getSearchImages(searchValue);
  }

  List<Photo> photoSearchList = [];

  String? searchValue;

  bool _isLoading = true;

  Future<void> getSearchImages(String? value) async {
    searchValue = value;
    _isLoading = true;

    var url = Uri.parse(
        'https://api.pexels.com/v1/search?query=$value&locale=pt_BR');
    final response = await http.get(url, headers: {
      'Authorization':
          '563492ad6f91700001000001c3cb4ba8d9cf4d6d8a393bbea7d666da'
    });

    try {
      if (response.statusCode == 200) {
        Iterable listSearch = json.decode(response.body)['photos'];

        photoSearchList = listSearch.map((e) => Photo.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    _isLoading = false;
    print(photoSearchList);

    notifyListeners();
  }

  bool get isLoading => _isLoading; 
}