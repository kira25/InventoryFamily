import 'package:calculator/classes/reunion.dart';

import 'package:calculator/services/Peliculasmodel.dart';
import 'package:calculator/widgets/ReusableMember.dart';
import 'package:flutter/material.dart';

Reunion miembros = Reunion();
Color backgroundColor = Colors.blueGrey[700];

class First_Page extends StatefulWidget {
  @override
  _First_PageState createState() => _First_PageState();
}

class _First_PageState extends State<First_Page>
    with SingleTickerProviderStateMixin {
  // int _selectedIndex = 0;
  bool isCollapsed = true;
  double screenWidth, screenHeigh;
  final Duration duration = const Duration(milliseconds: 300);
  PeliculasModel pelicula = PeliculasModel();
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuscaleAnimation;

  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuscaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;

  //     switch (_selectedIndex) {
  //       case 0:
  //         Navigator.pushNamed(context, '/peliculas');

  //         break;
  //       case 1:
  //         Navigator.pushNamed(context, '/compras');
  //         break;
  //       case 2:
  //         Navigator.pushNamed(context, '/inventario');
  //         break;
  //       default:
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeigh = size.height;
    screenWidth = size.width;
    return Scaffold(
        backgroundColor: Colors.blueGrey[700],
        body: Stack(
          children: <Widget>[
            menu(context),
            dashboard(context),
          ],
        ));
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuscaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/inventario');
                  },
                  child: Text(
                    'Inventario',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/compras');
                  },
                  child: Text(
                    'Compras',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/peliculas');
                  },
                  child: Text(
                    'Peliculas',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // NeumorphicButton(
                //   boxShape: NeumorphicBoxShape.circle(),
                //   onClick: () {},
                //   padding: EdgeInsets.all(10),
                //   child: Icon(Icons.play_arrow),
                //   style: NeumorphicStyle(color: Colors.white),
                // ),

                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.5 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 10,
          child: Container(
            color: backgroundColor,
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         colors: [Color(0xFF031A8C), Color(0xFF418CFF)],
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight)),
            padding: EdgeInsets.only(left: 16, right: 16, top: 48),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();
                          });

                          isCollapsed = !isCollapsed;
                        },
                      ),
                      Text(
                        'My Family',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 100,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        ReusableMember(
                          memberName: miembros.getMemberName(0),
                          memberEdad: miembros.getMemberEdad(0),
                          memberPhoneNumber: miembros.getMemberphoneNumber(0),
                        ),
                        ReusableMember(
                          memberName: miembros.getMemberName(1),
                          memberEdad: miembros.getMemberEdad(1),
                          memberPhoneNumber: miembros.getMemberphoneNumber(1),
                        ),
                        ReusableMember(
                          memberName: miembros.getMemberName(2),
                          memberEdad: miembros.getMemberEdad(2),
                          memberPhoneNumber: miembros.getMemberphoneNumber(2),
                        ),
                        ReusableMember(
                          memberName: miembros.getMemberName(3),
                          memberEdad: miembros.getMemberEdad(3),
                          memberPhoneNumber: miembros.getMemberphoneNumber(3),
                        ),
                        ReusableMember(
                          memberName: miembros.getMemberName(3),
                          memberEdad: miembros.getMemberEdad(3),
                          memberPhoneNumber: miembros.getMemberphoneNumber(3),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Elementos',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Macbook'),
                          subtitle: Text('Apple'),
                          trailing: Text('-299'),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 10,
                        );
                      },
                      itemCount: 10)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
