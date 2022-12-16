import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:remote/mapper/gif_mapper.dart';
import 'package:remote/model/gif_response.dart';

const giphyApiKey = '0j9Xqu22PvHYPcNpjlzyIZ46l2bi9uP9';
const giphyAuthority = 'api.giphy.com';
const giphyPath = '/v1/gifs/search';

class GifDs implements IGifRepository {
  final Dio client;

  GifDs(this.client);

  @override
  Future<List<Gif>> getGifs(String request) async {
    var queryParams = {
      'api_key': giphyApiKey,
      'q': request,
    };
    var uri = Uri.https(giphyAuthority, giphyPath, queryParams);
    var response = await client.getUri(uri);
    if (response.statusCode == 200) {
      GifResponse apiResponse = GifResponse.fromJson(response.data);
      return GifMapper().map(apiResponse.data);
    }
    return [];
  }
}
