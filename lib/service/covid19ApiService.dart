import 'dart:convert';

import 'package:covid_tracking/model/countryDayOneRoute.dart';
import 'package:http/http.dart' as http;

class Covid19ApiService {
  Future<List<CountryDayOneRoute>> getCountryDayOneRoute(
      String countryName) async {
    String url = 'https://api.covid19api.com/country/' + countryName;
    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 3));
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<CountryDayOneRoute> data = List<CountryDayOneRoute>.from(
          l.map((model) => CountryDayOneRoute.fromJson(model)));

      var reversed = List.of(data.reversed);
      return reversed;
    } else {
      throw Exception('Failed to load countryDayOneRoute');
    }
  }
}
