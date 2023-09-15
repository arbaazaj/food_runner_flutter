import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_runner_flutter/model/restaurant.dart';
import 'package:food_runner_flutter/themes/colors.dart';
import 'package:food_runner_flutter/widgets/custom_drawer_widget.dart';
import 'package:food_runner_flutter/widgets/custom_restaurant_tile_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  late RestaurantList restaurantList;

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
      drawer: const CustomDrawer(),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
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
      body: FutureBuilder<RestaurantList>(
        future: getAllRestaurant(),
        builder: (context, snapshot) {
          //print(snapshot.data);
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = snapshot.data!.restaurants[index];
                //print(restaurant);
                return Card(
                  child: RestaurantTileWidget(restaurant: restaurant),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
