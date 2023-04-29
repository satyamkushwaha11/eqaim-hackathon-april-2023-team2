import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Upload extends StatelessWidget {
  const Upload({super.key, required this.selectedImages});

  final List selectedImages;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( 
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.file(selectedImages[0]),
        ),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: const Icon(Icons.upload), 
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    ); 
  }
}
