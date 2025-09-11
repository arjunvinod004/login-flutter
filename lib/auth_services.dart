import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_one/staff_model/staff.dart';

import 'Login_model/req/Login_req_model.dart';
import 'Login_model/res/Login_res_model.dart' hide Datum;
import 'constant.dart';
import 'logger.dart';


class AuthServices {
  Future<LoginResModel> getLogin(LoginReqModel loginReqModel) async {
    try {
      var response = await http
          .post(
        Uri.parse(loginUrl),
        body: loginReqModel.toJson(),
      )
          .timeout(
              const Duration(
                seconds: 30,
              ), onTimeout: () {
        throw 'timeout';
      });
      Map<String, dynamic> mapData = json.decode(response.body);
      Logger.dsuccess(
        'getLogin called & response',
        sourcePath: 'services.dart',
        data: json.decode(response.body),
      );
      final data = LoginResModel.fromJson(mapData);
      if (data.isSuccess == true) {
        return data;
      } else {
        throw data.errorMessage;
      }
    } catch (e) {
      Logger.derror('getLogin error', sourcePath: 'services.dart');
      rethrow;
    }
  }


  Future<List<Datum>> getStaff() async {
    try {
      var response = await http.post(
        Uri.parse(homeUrl),
        body: {
          "CmpId": "1", // 👈 fixed company id
          "BrId": "2",  // 👈 fixed branch id
        },
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw 'timeout'; // ⏰ handle timeout
        },
      );

      print("📩 Staff API response: ${response.body}");

      // ✅ Parse into Staff model
      final staff = Staff.fromJson(json.decode(response.body));

      Logger.dsuccess(
        'getStaff called & response',
        sourcePath: 'services.dart',
        data: staff.toJson(),
      );

      return staff.data; // ✅ return list of Datum instead of map
    } catch (e) {
      Logger.derror('getStaff error', sourcePath: 'services.dart');
      rethrow;
    }
  }




}
