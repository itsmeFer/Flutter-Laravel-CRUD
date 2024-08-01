import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item.dart';

class ItemService {
  final String apiUrl = "http://10.0.2.2:8000/api/items";

  Future<List<Item>> getItems() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Item> items =
          body.map((dynamic item) => Item.fromJson(item)).toList();
      return items;
    } else {
      throw "Failed to load items";
    }
  }

  Future<Item> createItem(Item item) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(item.toJson()),
    );
    if (response.statusCode == 201) {
      return Item.fromJson(jsonDecode(response.body));
    } else {
      throw "Failed to create item";
    }
  }

  Future<Item> updateItem(Item item) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await http.put(
      Uri.parse("$apiUrl/${item.id}"),
      headers: headers,
      body: jsonEncode(item.toJson()),
    );
    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    } else {
      throw "Failed to update item";
    }
  }

  Future<void> deleteItem(int id) async {
    final response = await http.delete(Uri.parse("$apiUrl/$id"));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 204) {
      throw "Failed to delete item";
    }
  }
}
