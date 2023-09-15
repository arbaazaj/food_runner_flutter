class Restaurant {
  final String? id;
  final String? image;
  final String? name;
  final String? price;
  final String? rating;

  const Restaurant({this.id, this.image, this.name, this.price, this.rating});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      image: json['image_url'],
      name: json['name'],
      price: json['cost_for_one'],
      rating: json['rating'],
    );
  }
}

class RestaurantList {
  final List<Restaurant> restaurants;

  const RestaurantList({required this.restaurants});

  factory RestaurantList.fromJson(List<dynamic> json) {
    List<Restaurant> restaurants = <Restaurant>[];
    restaurants = json.map((i) => Restaurant.fromJson(i)).toList();

    return RestaurantList(
      restaurants: restaurants,
    );
  }
}
