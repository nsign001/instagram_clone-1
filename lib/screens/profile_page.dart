import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';
import 'package:instagram_clone/utils/profile_image_path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _menuOpened = false;
  double menuWidth;
  int duration = 200;
  AlignmentGeometry tabAlign = Alignment.centerLeft;
  bool _tabIconGridselected = true;
  double _gridMargin = 0;
  double _myImgGridMargin = size.width;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration));
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    menuWidth = size.width / 1.5;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _sideMenu(),
          _profile(),
        ],
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
        curve: Curves.easeInOut,
        color: Colors.grey[200],
        duration: Duration(milliseconds: duration),
        transform: Matrix4.translationValues(
          _menuOpened ? size.width - menuWidth : size.width,
          0,
          0,
        ),
        child: SafeArea(
          child: SizedBox(
            width: menuWidth,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FlatButton(child: Text('hacyeal'), onPressed: null)
              ],
            ),
          ),
        ));
  }

  Widget _profile() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: duration),
      color: Colors.transparent,
      transform: Matrix4.translationValues(
        _menuOpened ? -menuWidth : 0,
        0,
        0,
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _usernameIconButton(),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate([
                      _getProfileHeader,
                      _username(),
                      _userBio(),
                      _editProfileBtn(),
                      _getTabIconButtons,
                      _getAnimatedSeletedbar,
                    ]),
                  ),
                  _getImageGrid(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _getImageGrid(BuildContext context) => SliverToBoxAdapter(
          child: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: duration),
            transform: Matrix4.translationValues(_gridMargin, 0, 0),
            curve: Curves.easeInOut,
            child: _imageGrid,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: duration),
            transform: Matrix4.translationValues(_myImgGridMargin, 0, 0),
            curve: Curves.easeInOut,
            child: _imageGrid,
          ),
        ],
      ));

  GridView get _imageGrid => GridView.count(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 3,
    childAspectRatio: 1,
    children: List.generate(30, (index) => _gridImgItem(index)
    ),
  );

  CachedNetworkImage _gridImgItem(int index) => CachedNetworkImage(
    fit: BoxFit.cover,
    imageUrl: "https://picsum.photos/id/$index/100/100",
  );

  Padding _username() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child:
          Text('User Real Name', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Padding _userBio() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text('Bio from Uwer. So Say something.',
          style: TextStyle(fontWeight: FontWeight.w400)),
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.all(common_gap),
      child: SizedBox(
        height: 30,
        child: OutlineButton(
          onPressed: () {},
          borderSide: BorderSide(color: Colors.black45),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Text('Edit Profile',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Row get _getProfileHeader => Row(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(common_gap),
          child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                getProfileImgPath(('hacyeal')),
              )),
        ),
        Expanded(
          child: Table(
            children: [
              TableRow(children: [
                _getStatusValueWidget('123'),
                _getStatusValueWidget('324'),
                _getStatusValueWidget('4536'),
              ]),
              TableRow(children: [
                _getStatusLabelWidget('Posts'),
                _getStatusLabelWidget('Followers'),
                _getStatusLabelWidget('Following'),
              ])
            ],
          ),
        )
      ]);

  Widget _getStatusValueWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: common_s_gap),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(value,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ),
      );

  Widget _getStatusLabelWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: common_s_gap),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(value,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w300))),
        ),
      );

  Row _usernameIconButton() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: common_gap),
          child: Text('학열',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
        )),
        IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animationController,
            semanticLabel: 'Show menu',
          ),
          onPressed: () {
            _menuOpened ? _animationController.reverse() : _animationController.forward();
            setState(() {
              _menuOpened = !_menuOpened;
            });
          },
        )
      ],
    );
  }

  Widget get _getTabIconButtons => Row(
        children: <Widget>[
          Expanded(
            child: IconButton(
              icon: ImageIcon(AssetImage('assets/grid.png'),
                  color:
                      _tabIconGridselected ? Colors.black87 : Colors.black26),
              onPressed: () {
                _setTab(true);
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: ImageIcon(AssetImage('assets/saved.png'),
                  color:
                      _tabIconGridselected ? Colors.black26 : Colors.black87),
              onPressed: () {
                _setTab(false);
              },
            ),
          ),
        ],
      );

  Widget get _getAnimatedSeletedbar => AnimatedContainer(
      alignment: tabAlign,
      duration: Duration(milliseconds: duration),
      curve: Curves.easeInOut,
      color: Colors.transparent,
      height: 1,
      width: size.width,
      child: Container(
        height: 1,
        width: size.width / 2,
        color: Colors.black87,
      ));

  _setTab(bool tabLeft) {
    setState(() {
      if (tabLeft) {
        this.tabAlign = Alignment.centerLeft;
        this._tabIconGridselected = true;
        this._gridMargin = 0;
        this._myImgGridMargin = size.width;
      } else {
        this.tabAlign = Alignment.centerRight;
        this._tabIconGridselected = false;
        this._gridMargin = -size.width;
        this._myImgGridMargin = 0;
      }
    });
  }
}
