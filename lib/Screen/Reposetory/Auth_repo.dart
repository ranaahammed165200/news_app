import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app/Config/server_config.dart';
import 'package:news_app/Model/News_details_model.dart';
import 'package:news_app/Model/News_model.dart';
import 'package:news_app/Model/sign_in_model.dart';
import 'package:news_app/Model/sign_up_model.dart';

class AuthRepo {
  Future<bool> signInWithEmail(String emailaddress, String password) async {
    String Url = Config.serverUrl + Config.signinUrl;
    final prefs = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(Url), body: <String, String>{
      'email': emailaddress,
      'password': password,
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var decodeData = SignInModel.fromJson(data);

      await prefs.setString('token', decodeData.accessToken!.toString());
      print(prefs.get('token'));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signupcall(String firstname, String lastname, String email,
      String phone, String password, String confirmpassword) async {
    String urll = Config.serverUrl + Config.signupUrl;
    final prefs = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(urll), body: <String, String>{
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': confirmpassword
    });

    var d = jsonDecode(response.body);
    if (response.statusCode == 201) {
      var decodeData = SignUpModel.fromJson(d);
      await setValue('token', decodeData.accessToken);
      await prefs.setString('token', decodeData.accessToken!.toString());
      return true;
    } else {
      return false;
    }
  }
  Future<NewsModel>getNews()async{
    var response=await http.get(Uri.parse(Config.serverUrl+Config.latestUrl));

    if(response.statusCode==200){
      return NewsModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error Ocured');
    }
  }
  Future<NewsDetailsModel>getNewsDetails(String id)async{
    var response=await http.get(Uri.parse('${Config.serverUrl + Config.latestDetailsUrl}/$id'));

    if(response.statusCode==200){
      return NewsDetailsModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error Ocured');
    }
  }
}
