import 'package:flutter/material.dart';

class ShowDialogDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Container(color: Colors.grey),
              Positioned(
                left: 8.0,
                bottom: 8.0,
                child: Text('Fotógrafo: ' + 'Fulano de Tal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
