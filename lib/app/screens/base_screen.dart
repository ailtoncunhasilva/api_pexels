import 'package:flutter/material.dart';
import 'package:justa_challenge/app/models/photo.dart';
import 'package:justa_challenge/app/provider/provider_images.dart';
import 'package:justa_challenge/app/provider/provider_search_images.dart';
import 'package:justa_challenge/app/screens/showdialog_details.dart';
import 'package:justa_challenge/app/widgets/widget_error.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('@ Justa Challenge'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildTextFieldSearch(),
          (searchController.text.isEmpty)
              ? _buildRandomContent()
              : _buildSearchContent(),
        ],
      ),
    );
  }

  Widget _buildTextFieldSearch() {
    final searchContent = Provider.of<ProviderSearchImages>(context);

    final Color primaryColor = Theme.of(context).primaryColor;

    return Container(
      color: primaryColor,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: TextFormField(
            controller: searchController,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 16),
              border: InputBorder.none,
              suffixIcon: Icon(Icons.search, color: primaryColor),
              hintText: 'Pesquisar imagens',
              hintStyle: TextStyle(color: Colors.grey),
              isDense: false,
            ),
            onChanged: (value) => searchContent.getSearchImages(value),
          ),
        ),
      ),
    );
  }

  Widget _buildRandomContent() {
    return Expanded(
      child: Consumer<ProviderImages>(builder: (_, providerImages, __) {
        if (providerImages.isLoading == true) {
          return Center(
              child: CircularProgressIndicator(color: Colors.lightBlue[900]));
        } else if (providerImages.isLoading == false &&
            providerImages.photoList.isEmpty) {
          return WidgetError();
        } else {
          return Container(
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
          );
        }
      }),
    );
  }

  Widget _buildSearchContent() {
    return Expanded(
      child: Consumer<ProviderSearchImages>(builder: (_, searchImages, __) {
        if (searchImages.isLoading == false &&
            searchImages.photoSearchList.isEmpty) {
          return WidgetError();
        } else {
          return Container(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              itemCount: searchImages.photoSearchList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                return _buildPhoto(searchImages.photoSearchList[index]);
              },
            ),
          );
        }
      }),
    );
  }

  Widget _buildPhoto(Photo photo) {
    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (_) => ShowDialogDetails(photo));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(photo.src?.large ?? ''),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
