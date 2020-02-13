import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';
import 'package:instagram_clone/utils/profile_image_path.dart';

class SearchPage extends StatelessWidget {

  final List<String> users = List.generate(10, (i) => 'user $i');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index){
          return _item(users[index]);
        },
        separatorBuilder: (context, index){
          return Divider(thickness: 1, color: Colors.grey[300]);
        },

      )
    );
  }

  ListTile _item(String user) {
    return ListTile(
      leading: CircleAvatar(
        radius: profile_radius,
        backgroundImage: NetworkImage(getProfileImgPath((user))),
      ),
      title: Text(user),
      subtitle: Text('this is $user bio.'),
      trailing: Container(
        height: 30,
        width: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(color: Colors.blue, width: 0.5),
          borderRadius: BorderRadius.circular(6)
        ),
        child: Text(
          '팔로우',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )
        )
      )
    );
  }
}
