import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  DetailScreen({required this.imageUrl, Key? key}) : super(key: key);
  Map imageUrl;
  final storage = FirebaseStorage.instance;

  Future<String> urlImages(Map linkUrl) async {
    final ref = await FirebaseStorage.instance
        .ref()
        .child("data/image/${linkUrl['url']}");
    final url = await ref.getDownloadURL();
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          imageUrl['waktu'],
          style: TextStyle(color: Colors.grey[400]),
        ),
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: urlImages(imageUrl),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Center(
                      child: PhotoView(
                    backgroundDecoration: const BoxDecoration(
                      color: Colors.black87,
                    ),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2.0,
                    imageProvider: NetworkImage(snapshot.data!),
                  ));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
