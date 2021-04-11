import 'package:flutter/material.dart';
import '../widgets/details.dart';
import '../model/hero.dart';
import '../globals.dart' as global;


class BackgroundScreen extends StatefulWidget {
  static const routeName = 'background';
  @override
  _BackgroundScreenState createState() => _BackgroundScreenState();
}

class _BackgroundScreenState extends State<BackgroundScreen> {
  // ignore: deprecated_member_use
  List _heroTypeList = List<HeroType>();
  double _screenWidthAdjustment;
  @override
  void initState() {
    super.initState();
    _heroTypeList = HeroType().createSampleList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidthAdjustment = MediaQuery.of(context).size.width - 48.0 - 64.0;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Background'),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemExtent: 220.0, //height of each card=180
            itemCount: _heroTypeList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Card(
                  margin: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  clipBehavior: Clip.antiAlias, //
                  child: Stack(
                    children: <Widget>[
                      Hero(
                        tag: 'background' + _heroTypeList[index].title,
                        child: Container(
                          color: _heroTypeList[index].materialColor,
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        bottom: 50.0,
                        child: Hero(
                          tag: 'image' + _heroTypeList[index].title,
                          child: Image.asset(
                            _heroTypeList[index].image,
                            fit: BoxFit.fitWidth,
                            height: 80.0,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150.0,
                        left: 32.0,
                        width: _screenWidthAdjustment,
                        child: Hero(
                          tag: 'text' + _heroTypeList[index].title,
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              '${_heroTypeList[index].title}',
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                color:
                                    _heroTypeList[index].materialColor.shade900,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                      //subtitle
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    global.background_id = _heroTypeList[index].id;
                    print(global.background_id);
                  });
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     fullscreenDialog: true,
                  //     builder: (BuildContext context)=> Details(
                  //       heroType:
                  //       HeroType(_hero))
                  //   )
                  // )
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      fullscreenDialog: true,
                      transitionDuration: Duration(milliseconds: 1000),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return Details(
                          heroType: HeroType(
                            title: _heroTypeList[index].title,
                            image: _heroTypeList[index].image,
                            materialColor: _heroTypeList[index].materialColor,
                            id: _heroTypeList[index].id,
                          ),
                        );
                      },
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
