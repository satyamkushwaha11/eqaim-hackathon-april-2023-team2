import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_photo_editor/flutter_photo_editor.dart';
import 'package:image_picker/image_picker.dart';



class MyApp2 extends StatefulWidget {
  final String selectedImages;
  const MyApp2({Key? key, required this.selectedImages}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  String _platformVersion = 'Unknown';
  final _flutterPhotoEditorPlugin = FlutterPhotoEditor();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    editImage();

  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _flutterPhotoEditorPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('team 2 '),
        ),
        body: Center(
          child: Column(
            children: [
              Center(
                child: TextButton(
                  onPressed: () {
                    editImage();
                  },
                  child: Text("Edit "),
                ),
              ),
        
              if(imagePath != null)
                Image.file(File(imagePath!), width: 300, height: 500,)
            ]
          ),
        ),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
           
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.upload),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  String? imagePath;

  void test() async {
    print("start");

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    String? path = image?.path;
    // onImageEdit(path);
    if(path != null) {
      editImage();
    }
  }

  void editImage() async {
 final path =widget.selectedImages;
    print("path: $path");

    var b = await FlutterPhotoEditor().editImage(path);

    setState(() {
      imagePath = path;

    });
    print("end : $b");
  }


}