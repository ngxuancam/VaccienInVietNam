import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class TotalInfo {
  DateTime? allocatedDate;
  late int objectInjection; // tong so nguyoi da tiem
  late int totalPopulation; // tong so mui tiem hom qua
  late int? totalOneInjected; // so ng tim 1 mui

  TotalInfo({
    required this.allocatedDate,
    required this.objectInjection,
    required this.totalPopulation,
    this.totalOneInjected,
  });

  factory TotalInfo.fromJson(Map<String, dynamic> json) {
    return TotalInfo(
      allocatedDate: json['allocatedDate'],
      objectInjection: json['objectInjection'],
      totalPopulation: json['totalPopulation'],
      totalOneInjected: json['totalOneInjected'],
    );
  }

  Future<TotalInfo> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://tiemchungcovid19.gov.vn/api/public/dashboard/vaccination-statistics/get-detail-latest'));

    if (response.statusCode == 200) {
      return TotalInfo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
