import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zoo_app/app/features/find_zoo/logic/zoo_repository.dart';
import 'package:zoo_app/app/features/find_zoo/logic/zoo_service.dart';

import '../models/zoo.dart';

class ZooController extends GetxController {
  var zoos = <Place>[];

  late Dio dio;
  late ZooService service;
  late ZooRepository repository;

  @override
  void onInit() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.foursquare.com/v3',
        headers: {
          'Authorization': 'fsq32JnDWaluKSLu63g33l+hxsSj9dN53P8hP16qRpOdX0I='
        },
      ),
    );
    repository = ZooRepository(dio: dio);
    service = ZooService(repository: repository);
    getZoos();
    super.onInit();
  }

  void getZoos() async {
    await service.getZoos();
  }
}
