import 'package:zoo_app/app/features/find_zoo/logic/zoo_repository.dart';
import 'package:zoo_app/app/features/find_zoo/models/zoo.dart';

class ZooService {
  final ZooRepository repository;

  ZooService({required this.repository});

  Future<List<Place>> getZoos() async {
    return await repository.getZoos();
  }
}
