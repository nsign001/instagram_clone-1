import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/profile_image_path.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(onPressed: null, icon: ImageIcon(AssetImage('assets/actionbar_camera.png'), color: Colors.black)),
        title: Image.asset('assets/insta_text_logo.png', height: 30,),
        actions: <Widget>[
          IconButton(
              onPressed: null,
              icon: ImageIcon(AssetImage('assets/actionbar_camera.png'), color: Colors.black)),
          IconButton(
              onPressed: null,
              icon: ImageIcon(AssetImage('assets/direct_message.png'), color: Colors.black))
        ],
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return _postItem(index);
          }),
    );
  }

  Column _postItem(int index) {
    return Column(
            children: <Widget>[
              _postHeader('username $index'),
              _postImage(index)
            ],
          );
  }

  Row _postHeader(String username) {
    return Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        getProfileImgPath(username)
                    ),
                    radius: 16,
                  ),
                ),
                Expanded(child: Text(username)),
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.black87),
                  onPressed: null,
                )
              ],
            );
  }

  CachedNetworkImage _postImage(int index) {
    return CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/id/$index/200/200',
                  imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover
                                )
                            ),
                        ),
                      ),
              );
  }
}
