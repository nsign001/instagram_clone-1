import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';
import 'package:instagram_clone/widgets/my_progress_indicator.dart';

class CameraPage extends StatefulWidget {
  final CameraDescription camera;

  const CameraPage({Key key, @required this.camera}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  int _selectedIndex = 1;
  var _pageController = PageController(initialPage: 1);
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          _galleryPage(),
          _takePhotoPage(),
          _takeVideoPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[50],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/grid.png')),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/grid.png')),
            label: 'Photo',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/grid.png')),
            label: 'Video',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  Widget _galleryPage() {
    return Container(color: Colors.green);
  }

  Widget _takePhotoPage() {
    return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: <Widget>[
                Container(
                    width: size.width,
                    height: size.width,
                    child: ClipRect(
                        child: OverflowBox(
                            alignment: Alignment.topCenter,
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Container(
                                  width: size.width,
                                  height: size.width /
                                      _controller.value.aspectRatio,
                                  child: CameraPreview(_controller),
                                )))))
              ],
            );
          } else {
            return MyProgressIndicator();
          }
        });
  }

  Widget _takeVideoPage() {
    return Container(color: Colors.deepOrange);
  }
}
