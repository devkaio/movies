import 'package:http/http.dart';

import 'api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get(
      Uri.parse(
          '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}'),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode.toString().startsWith('2')) {
      return response.body;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
