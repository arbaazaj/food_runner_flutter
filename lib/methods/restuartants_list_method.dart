import 'package:flutter/material.dart';
import 'package:food_runner_flutter/model/restaurant.dart';
import 'package:food_runner_flutter/widgets/custom_restaurant_tile_widget.dart';

FutureBuilder<RestaurantList> buildFutureRestaurantsList(
    {required Future<RestaurantList> future}) {
  return FutureBuilder<RestaurantList>(
    future: future,
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
            return RestaurantTileWidget(restaurant: restaurant);
          },
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
