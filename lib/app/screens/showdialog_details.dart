import 'package:flutter/material.dart';
import 'package:justa_challenge/app/models/photo.dart';

class ShowDialogDetails extends StatelessWidget {
  final Photo? photo;

  ShowDialogDetails(this.photo);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey,
                border: Border.all(
                  color: Colors.white,
                ),
                image: DecorationImage(
                  image: NetworkImage(photo?.src?.small ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 8.0,
              bottom: 8.0,
              child: Container(
                margin: const EdgeInsets.only(left: 8, bottom: 8),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'By ${photo?.photographerName ?? ''}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
