import 'package:flutter/material.dart';

class WidgetError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            Text(
              'Algo deu errado!\nPor vafor, tente mais tarde...',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
