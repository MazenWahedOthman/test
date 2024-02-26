import 'package:task/model/trip/location.dart';

class Place{
  final String name;
  final Location laction;
  const Place({required this.name,required this.laction,});

  Place.fromMap(Map<String,dynamic> map):
  name=map['name']??"",
  laction=Location.fromMap(map['geometry']?['location']??{})
;
  static List<Place> fromList(List list) =>
      list.map((e) => Place.fromMap(e)).toList();
}