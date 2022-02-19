import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;

Future postvalue(name, email, password, mobile_no, address) async {
  // // print(user_type);
  // // print(sign_up_status);
  // print(name);
  // print(email);
  // print(password);
  // print(mobile_no);
  // // print(map_location);
  // // print(latitude);
  // // print(longitude);
  // print(address);
  var body = {
    'user_type': "Customer",
    'sign_up_status': jsonEncode(true),
    'name': "harsh",
    'email': "harsh0750@gmail.com",
    'password': "deepa321",
    'mobile_no': "8208240369",
    'map_location': "Delhi",
    'latitude': "21.2536521",
    'longitude': "79.36255222",
    'address': "nagpur",
  };
  var url = Uri.parse('http://3.14.153.182:8000/create_account_customer/');
  var data = await http.post(url, body: body);

  if (data.statusCode == 200) {
    var utfDecode = utf8.decode(data.bodyBytes);
    var response = json.decode(utfDecode);
    print(response);
    // return response;
  } else {
    print(data.statusCode.toString());
    return data.body;
  }
}
