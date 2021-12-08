import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:xml/xml_events.dart';
import 'dart:io';

class TotalInfo {
  late final DateTime? allocatedDate;
  late final int objectInjection; // tong so nguyoi da tiem
  late final int totalPopulation; // tong so mui tiem hom qua

  TotalInfo({
    this.allocatedDate,
    required this.objectInjection,
    required this.totalPopulation,
  });

  factory TotalInfo.fromJson(Map<String, dynamic> json) {
    return TotalInfo(
      allocatedDate: json['allocatedDate'],
      objectInjection: json['objectInjection'],
      totalPopulation: json['totalPopulation'],
    );
  }

  static Future<TotalInfo> fetchTotalInfo() async {
    final response = await http.get(Uri.parse(
        'https://tiemchungcovid19.gov.vn/api/public/dashboard/vaccination-statistics/get-detail-latest'));

    if (response.statusCode == 200) {
      return TotalInfo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<Map> getTotalInfofromXML() async {
    final url = Uri.parse(
        'https://tiemchungcovid19.gov.vn/api/public/dashboard/vaccination-statistics/get-detail-latest');
    final request = await HttpClient().getUrl(url);
    final response = await request.close();
    int objectInjection = 0;
    int totalPopulation = 0;
    DateTime allocatedDate = DateTime.now();
    Map json = {};
    await response
        .transform(utf8.decoder)
        .toXmlEvents()
        .normalizeEvents()
        .forEachEvent(
            onText: (event) => {
                  // print(event.text),
                  json = jsonDecode(event.text),
                  // objectInjection = int.parse(event.text.substring(
                  //     event.text.indexOf("objectInjection") +
                  //         "objectInjection".length +
                  //         4,
                  //     event.text.indexOf("objectInjection") +
                  //         "objectInjection".length +
                  //         3 +
                  //         event.text
                  //             .substring(event.text.indexOf("objectInjection") +
                  //                 "objectInjection".length +
                  //                 3)
                  //             .indexOf(","))),
                  // totalPopulation = int.parse(event.text.substring(
                  //     event.text.indexOf("totalPopulation") +
                  //         "totalPopulation".length +
                  //         4,
                  //     event.text.indexOf("totalPopulation") +
                  //         "totalPopulation".length +
                  //         3 +
                  //         event.text
                  //             .substring(event.text.indexOf("totalPopulation") +
                  //                 "totalPopulation".length +
                  //                 3)
                  //             .indexOf(","))),
                  // allocatedDate = DateTime.parse(event.text
                  //     .substring(
                  //         event.text.indexOf("allocatedDate") +
                  //             "allocatedDate".length +
                  //             4,
                  //         event.text.indexOf("allocatedDate") +
                  //             "allocatedDate".length +
                  //             3 +
                  //             event.text
                  //                 .substring(
                  //                     event.text.indexOf("allocatedDate") +
                  //                         "allocatedDate".length +
                  //                         3)
                  //                 .indexOf(","))
                  //     .replaceAll('"', '')),
                });
    // print(json);
    return json;
  }
  static Future<List<dynamic>> getListInjectionByDay() async {
    final url = Uri.parse(
        'https://tiemchungcovid19.gov.vn/api/public/dashboard/injection-statistics/by-days');
    final request = await HttpClient().getUrl(url);
    final response = await request.close();
    int objectInjection = 0;
    int totalPopulation = 0;
    DateTime allocatedDate = DateTime.now();
    dynamic json = {};
    await response.transform(utf8.decoder)
        .toXmlEvents()
        .normalizeEvents()
        .forEachEvent(
          onText: (event) {
            json = jsonDecode(event.text);
          },
        );
    return json;
  }
}
