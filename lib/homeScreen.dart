import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team2/imageUploadScreen.dart';


class HomeScreen extends StatefulWidget {

import 'chooseFromGallery.dart';


  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _images = [];
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  void _onItemTapped(int index) async {
    if (index == 0) {
      await getImageFromCamera();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Upload(selectedImages: _images)));
    } else if (index == 1) {
      print('choose from gallery');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team 2 '),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children: List.generate(_images.length, (index) {
              return Center(
                child: Image.file(_images[index]),
              );
            })),
      ),

      bottomSheet: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Take a picture',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Choose from gallery',
          ),
        ],
        unselectedItemColor: Colors.blue,
        onTap: (int index) {
          if (index == 0) {
            // Handle "Take a picture" item tap
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImagePickerPage()),
            );
          }
        },
      ),
    );
  }
}
