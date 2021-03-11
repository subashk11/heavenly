import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/subash/AndroidStudioProjects/flutter_travel_ui_starter/lib/widgets/hotels_carousel.dart';
import 'package:heavenly/widgets/destination_carousel.dart';
import 'package:heavenly/models/hotel_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> iconLogo = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.biking
  ];

  Widget iconData(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        print(selectedIndex);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE)),
        child: Icon(
          iconLogo[index],
          size: 25.0,
          color: selectedIndex == index
              ? Colors.blueAccent
              : Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Heavenly',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500)),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: ListView(
              children: [
                Text(
                  'Where Do You Want To Explore?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: iconLogo
                      .asMap()
                      .entries
                      .map((MapEntry map) => iconData(map.key))
                      .toList(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                destinationCarousel(),
                SizedBox(
                  height: 20.0,
                ),
                hotelCarousel(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.search),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.pizzaSlice),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
