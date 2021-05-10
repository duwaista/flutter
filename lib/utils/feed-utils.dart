import 'dart:convert';
import 'package:http/http.dart';

class FeedUtils {
  static final String url = "https://quiet-ridge-83792.herokuapp.com/api/feed/";

  //Get data for feed
  static Future getFeed() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Fucking niggers not working');
    }
  }
}
