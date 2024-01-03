import 'dart:convert';

import 'package:pkl_attendance/models/meta_model.dart';
import 'package:http/http.dart' as http;
import 'package:pkl_attendance/widgets/message/errorMessage.dart';

class AttendanceService {
  Future<MetaModel> postAttendance(String rfid) async {
    try {
      Uri uri =
          Uri.parse("https://pkl.hummatech.com/api/attendance-rfid/$rfid");
      final response = await http.post(uri);
      return MetaModel.fromJson(jsonDecode(response.body));
    } on Exception catch (_) {
      showErrorMessage("Kesalahan jaringan");
      return MetaModel(code: 500, message: "Kesalahan jaringan");
    }
  }
}
