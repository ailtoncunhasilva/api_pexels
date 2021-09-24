import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  void initState() {
    super.initState();

    testApi();
  }

  testApi() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=50'),
        headers: {
          'Authorization':
              '563492ad6f91700001000001c3cb4ba8d9cf4d6d8a393bbea7d666da'
        }).then((value) {
      print(value.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('@ Justa Challenge'),
        centerTitle: true,
        actions: [
          _buildIconSearch(),
        ],
      ),
      body: Column(
        children: [
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildIconSearch() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.search),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: 51,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 3,
            childAspectRatio: 2 / 3,
          ),
          itemBuilder: (context, builder) {
            return Container(color: Colors.grey);
          },
        ),
      ),
    );
  }
}
