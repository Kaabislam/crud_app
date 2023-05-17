

import 'dart:convert';
import 'package:crud_app/Style/Style.dart';
import 'package:http/http.dart' as http;
Future<List> ProductGridViewListRequest() async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var getHeader = {"Content-Type":"application/json"};
  var response = await http.get(URL,headers: getHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody["status"] == "success"){
    SuccessToast("Success !");
    return resultBody["data"];
  }
  else{
    ErrorToast("Error on retrieving data");
    return [];
  }
}
Future<bool> ProductCreateRequest(FormValues) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody = json.encode(FormValues);
  var PostHeader = {"Content-Type":"application/json"};
  var response = await http.post(URL,headers: PostHeader,body: PostBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if(resultCode == 200 && resultBody["status"] == "success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request Fail ! Try again");
        return false;
  }
}
Future<bool> ProductDeleteRequest(id) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);

  var PostHeader = {"Content-Type":"application/json"};
  var response = await http.get(URL,headers: PostHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if(resultCode == 200 && resultBody["status"] == "success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request Fail ! Try again");
    return false;
  }
}
Future<bool> ProductUpdateRequest(FormValues,id) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/"+id);
  var PostBody = json.encode(FormValues);
  var PostHeader = {"Content-Type":"application/json"};
  var response = await http.post(URL,headers: PostHeader,body: PostBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if(resultCode == 200 && resultBody["status"] == "success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request Fail ! Try again");
    return false;
  }
}
