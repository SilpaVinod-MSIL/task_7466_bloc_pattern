import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:task_7466_bloc_pattern/data_class/fetch_data.dart';

class ApiResponse{
  Future<List<FetchUIData>> fetchData() async {

    var url=Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var response=await http.get(url);
    if(response.statusCode == 200){
      List jsonResponse=json.decode(response.body);
      return jsonResponse.map((data) => FetchUIData.fromJson(data)).toList();
    }else{
      throw Exception("Error occured");
    }

  }

}