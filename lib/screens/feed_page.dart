import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('instagram'),
        actions: <Widget>[
          ImageIcon(AssetImage('assets/actionbar_camera.png')),
          ImageIcon(AssetImage('assets/direct_message.png')),
        ],
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 300,
              color: Colors.primaries[index % Colors.primaries.length]
            );
          }),
    );
  }
}
