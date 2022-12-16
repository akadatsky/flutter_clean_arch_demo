import 'package:data/data.dart';

abstract class IGifRepository {
  Future<List<Gif>> getGifs(String request);
}
