import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _imageFile;

  Future<void> _getImageFromPhone() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Image'),
      ),
      body: Container(
        color: Colors.black,
        padding:EdgeInsets.only(top: 20,bottom: 20),
        child: _imageFile != null
            ? Container(
                height: 500,
                width: 400,
                child: Image.file(_imageFile!),
              )
            : Text('No image selected'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImageFromPhone,
        tooltip: 'Pick Image',
        child: Icon(Icons.photo_library),
      ),
    );
  }
}
