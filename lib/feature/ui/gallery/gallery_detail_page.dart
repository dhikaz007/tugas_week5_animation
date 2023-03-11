import 'package:flutter/material.dart';

class GalleryDetailPage extends StatefulWidget {
  final String image;
  const GalleryDetailPage({Key? key, required this.image}) : super(key: key);

  @override
  State<GalleryDetailPage> createState() => _GalleryDetailPageState();
}

class _GalleryDetailPageState extends State<GalleryDetailPage> {
  /// Inisialisasi parameter apakah gambar diklik atau tidak
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selected Image')),
      body: InkWell(
          onTap: () {
            if (!isClicked) {
              isClicked = true;
            } else {
              isClicked = false;
            }
            setState(() {});
          },
          child: Align(
            alignment: Alignment.center,
            /// Gambar yang dipilih dari halamannya sebelumnya dan diberi animasi
            child: AnimatedContainer(
                width: isClicked ? 600 : 300,
                height: isClicked ? 600 : 300,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(widget.image))),
                curve: Curves.bounceOut, /// jenis animasi yang digunakan
                duration: const Duration(seconds: 2)),
          )),
    );
  }
}
