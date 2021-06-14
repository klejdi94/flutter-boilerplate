import 'package:boilerplate/app/self_improvement/esempio9/model/profileModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<ProfileModel> downloadUserProfile() async {
  //final response = await http.get(Uri.parse("https://www.instagram.com/thisisbillgates/?__a=1"));

  //final dynamic data = json.decode(response.body);
  //return ProfileModel.fromData(data);
  return ProfileModel.fromData(null);
}
