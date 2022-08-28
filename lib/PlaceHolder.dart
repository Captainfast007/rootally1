import 'package:flutter/material.dart';
import 'package:rootally/Home.dart';
import 'package:rootally/Rehab.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _index = 0;

 final  screens=[
   Home(),
   Rehab(),
   Center(child: Text('Nothing Here'),),
   Center(child: Text('Nothing Here'),),
 ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: SalomonBottomBar(
          items: [
            SalomonBottomBarItem(
                selectedColor: Colors.blue,
                icon: Icon(Icons.home),
                title: Text('Home')),
            SalomonBottomBarItem(
                selectedColor: Colors.orange,
                icon: Icon(Icons.accessibility),
                title: Text('Rehab')),
            SalomonBottomBarItem(
                selectedColor: Colors.red,
                icon: Icon(Icons.bookmark),
                title: Text('Practice')),
            SalomonBottomBarItem(
                selectedColor: Colors.green,
                icon: Icon(Icons.person_outline),
                title: Text('Profile')),
          ],
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
        ),
        body: screens[_index]
      ),
    );
  }
}
