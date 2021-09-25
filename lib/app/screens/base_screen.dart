import 'package:flutter/material.dart';
import 'package:justa_challenge/app/models/photo.dart';
import 'package:justa_challenge/app/provider/provider_images.dart';
import 'package:justa_challenge/app/screens/showdialog_details.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  final Photo? photo;

  BaseScreen({this.photo});
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
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
    return Consumer<ProviderImages>(builder: (_, providerImages, __) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            itemCount: providerImages.photoList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 3,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (context, index) {
              return _buildPhoto(providerImages.photoList[index]);
            },
          ),
        ),
      );
    });
  }

  Widget _buildPhoto(Photo photo) {
    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (_) => ShowDialogDetails(photo));
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(photo.src?.original ?? ''),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
