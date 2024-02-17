import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../api.dart';
import 'package:mod2/user.dart';
import 'package:http/http.dart'as http;

class Userprovider with ChangeNotifier{
  late User user;

  Future<void> getUserprofile(String username)async
  {
    final url='${Api.api}/users/${username}';

    try{
    final responce=await http.get(url as Uri,headers:{'Authorization': 'token ${Api.token}'});

    final responceData=json.decode(responce.body)as Map<String,dynamic>;

    print(responceData['name']);
    user= User(
        username: responceData['login'],
        imageUrl: responceData['avathar_url'],
        followers: responceData['followers'],
        followings: responceData['following'],
        public_repo: responceData['public_repos'],
        joined_date: responceData['created_at'],
    );
    notifyListeners();

    }catch(e){
      print(e);
    }
  }
}