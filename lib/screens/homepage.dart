import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_runner_flutter/methods/restuartants_list_method.dart';
import 'package:food_runner_flutter/model/restaurant.dart';
import 'package:food_runner_flutter/themes/colors.dart';
import 'package:food_runner_flutter/themes/text_styles.dart';
import 'package:food_runner_flutter/widgets/custom_drawer_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Scaffold state for opening and closing drawer.
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  // Other variables.
  late RestaurantList restaurantList;
  int _selectedDrawerItemIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text('My Profile', style: optionStyle),
    Text('Favorite Restaurants', style: optionStyle),
    Text('FAQ', style: optionStyle),
    Text('Log out', style: optionStyle),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedDrawerItemIndex = index;
    });
  }

  Future<RestaurantList> getAllRestaurant() async {
    const String url = 'http://13.235.250.119/v2/restaurants/fetch_result/';
    final res = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "token": dotenv.env['TOKEN'].toString()
    });
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      restaurantList = RestaurantList.fromJson(data['data']['data']);
    } else {
      throw Exception('Error: ${res.statusCode}');
    }
    return restaurantList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      // Custom Drawer.
      drawer: CustomDrawer(index: _selectedDrawerItemIndex),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: orange,
          systemNavigationBarColor: orange,
          systemNavigationBarContrastEnforced: true,
          systemStatusBarContrastEnforced: true
        ),
        leading: IconButton(
          onPressed: () {
            _scaffoldState.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        backgroundColor: orange,
        title: const Text(
          'All Restaurants',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _selectedDrawerItemIndex == 0
          ? buildFutureRestaurantsList(future: getAllRestaurant())
          : _widgetOptions[_selectedDrawerItemIndex],
    );
  }
}
