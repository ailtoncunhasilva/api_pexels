import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Justa Challenge'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                itemCount: 50,
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
          ),
        ],
      ),
    );
  }
}
