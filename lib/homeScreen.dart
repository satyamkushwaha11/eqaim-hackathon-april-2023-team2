import 'package:flutter/material.dart';

import 'chooseFromGallery.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onItemTapped(int index) {
    if (index == 0) {
      print('Take a picture');
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
      body: ListView.separated(
          itemBuilder: ((context, index) {
            return Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                      'https://images.pexels.com/photos/1213294/pexels-photo-1213294.jpeg?auto=compress&cs=tinysrgb&w=600'),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                      'https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg?auto=compress&cs=tinysrgb&w=600'),
                ))
              ],
            );
          }),
          separatorBuilder: (context, int index) => const Divider(),
          itemCount: 20),
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
