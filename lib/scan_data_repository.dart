import 'package:concetto_security/scan_model.dart';
import 'package:dio/dio.dart';

class ScanDataRepository {
  String url = 'https://admin.concetto.in/participants/';

  Future<ScanModel?> getData(String id) async {
    try {
      //https://admin.concetto.in/participants/1/
      final apiResponse = await Dio().get('$url$id/');
      Map<String, dynamic> responseData = apiResponse.data;
      ScanModel scanModel = ScanModel.fromJson(responseData);
      return scanModel;
    } on Exception catch (e) {
      return null;
    }
  }
}
