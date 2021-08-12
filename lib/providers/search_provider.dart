import 'package:cloud_firestore/cloud_firestore.dart';

// search provider for search bar in search page uses the search key to find the user and then display it!

class SearchService {
  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('searchKey',
            isEqualTo: searchField.substring(0, 1).toUpperCase())
        .get();
  }
}
