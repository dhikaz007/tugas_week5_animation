import 'package:flutter/material.dart';
import 'package:tugas_week5_animation/feature/widget/page_route_builder_widget.dart';

import '../../data/model/image_data.dart';
import 'gallery_detail_page.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      /// Menampilkan halaman galery
      body: GridView.builder(
        itemCount: imgList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => InkWell(
            onTap: () => _goToDetailPage(context, index),
            child: _listGallery(index)),
      ),
    );
  }
}

/// Fungsi menuju halaman gallery detail page
_goToDetailPage(context, index) {
  final route = PageRouteBuilderPage(
      page: GalleryDetailPage(image: imgList[index].imgPath),
      routeName: 'Gallery Detail');
  Navigator.of(context).push(route);
}

/// List assets yang ditampilkan
_listGallery(int index) {
  return GridTile(
    child: ClipRRect(
        child: Image.asset(imgList[index].imgPath, fit: BoxFit.cover)),
  );
}
