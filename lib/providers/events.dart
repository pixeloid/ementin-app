import 'package:flutter/cupertino.dart';

import 'event.dart';

class Events with ChangeNotifier {
  List<Event> _items = [];

  List<Event> get items {
    return [..._items];
  }

  Event findById(String id) {
    return _items.firstWhere((event) => event.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    const url = 'https://flutter-update.firebaseio.com/products.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Event> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Event(
          id: prodId,
          name: prodData['title'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
