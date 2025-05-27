import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../app/moduls/pokimon.dart';
import '../base_services.dart';
import '../base_url.dart';

class PokemonServices {

  Future<List<PokemonModel>?> getPokemon(int offset, int limit) async {
    try {

      final url = Uri.parse(ApiUrl.getPokemonPagination(limit: limit,offset: offset));

      // final response = await http.get(url);
      ApiResponse response = await BaseServices().getData(url.toString());
      if (response.statusCode == 200) {
        // final data = jsonDecode(response.body);
        // var foodModel = PokemonModel.fromJson(data);
        final results = response.data['results'] as List;
        final list = results.map((json) => PokemonModel.fromJson(json)).toList();
        return list;
      } else {
        log('==============> Error: Status code ${response.statusCode}');
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error ---> $e");
      }
      return null;
    }
  }
}
