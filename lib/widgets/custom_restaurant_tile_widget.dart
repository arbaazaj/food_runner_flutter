import 'package:flutter/material.dart';
import 'package:food_runner_flutter/model/restaurant.dart';
import 'package:food_runner_flutter/themes/colors.dart';

class RestaurantTileWidget extends StatelessWidget {
  const RestaurantTileWidget({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              restaurant.image!,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
              errorBuilder: (ctx, object, error) {
                return Image.asset(
                  'assets/food_runner_logo.png',
                  width: 110,
                  height: 110,
                  color: orange,
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            restaurant.name!,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹ ${restaurant.price!}/person',
                            style: TextStyle(
                              color: Colors.green.shade800,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: orange,
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            restaurant.rating!,
                            style: TextStyle(
                              color: Colors.yellow.shade700,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
