import 'package:data/data.dart';
import 'package:remote/model/gif_response.dart';

class GifMapper {

  List<Gif> map(List<Data>? data) {
    if (data == null) {
      return [];
    }
    return data.map((e) => Gif(e.images?.previewGif?.url ?? '')).toList();
  }

}