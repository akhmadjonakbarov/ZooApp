import 'package:dio/dio.dart';

import '../models/zoo.dart';

class ZooRepository {
  final Dio dio;

  ZooRepository({required this.dio});

  static const _url = '/places/search?query=zoo&limit=50&categories=10056';

  Future<List<Place>> getZoos() async {
    List<Place> zoos = [];
    try {
      Response response = await dio.get(_url);
      if (response.statusCode == 200) {
        var zooJson = response.data['results'];
        for (var zoo in zooJson) {
          zoos.add(Place.fromMap(zoo));
        }
      }
      return zoos;
    } catch (e) {
      rethrow;
    }
  }
}
