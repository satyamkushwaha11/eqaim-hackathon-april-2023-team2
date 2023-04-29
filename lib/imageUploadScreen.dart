import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:team2/editImage.dart';

class Upload extends StatefulWidget {
  const Upload({super.key, required this.selectedImages});

  
  final List selectedImages;

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.file(widget.selectedImages[widget.selectedImages.length - 1]),
        ),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyApp2(selectedImages: widget.selectedImages[widget.selectedImages.length - 1])));
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.upload),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
