import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';
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
            return _postItem(index, context);
          }),
    );
  }

  Column _postItem(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _postHeader('username $index'),
              _postImage(index),
              _postActions(),
              _postLikes(),
              _postCaption(context, index)
            ],
          );
  }

  Padding _postCaption(BuildContext context, int index) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: common_gap),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'username $index',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    TextSpan(
                      text: ' '
                    ),
                    TextSpan(
                      text: 'I am missing summer soooooooooooooo~~~~~~~~~~~much~~'
                    ),
                  ]
                )
              ),
            );
  }

  Padding _postLikes() {
    return Padding(
              padding: const EdgeInsets.only(left: common_gap),
              child: Text('80 likes', style: TextStyle(fontWeight: FontWeight.bold)),
            );
  }

  Row _postActions() {
    return Row(
              children: <Widget>[
                IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/bookmark.png'),
                    color: Colors.black87,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/comment.png'),
                    color: Colors.black87,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/direct_message.png'),
                    color: Colors.black87,
                  ),
                  onPressed: null,
                ),
                Spacer(),
                IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/heart_selected.png'),
                    color: Colors.black87,
                  ),
                  onPressed: null,
                ),
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
                    radius: profile_radius,
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
