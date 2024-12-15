import 'package:flutter/material.dart';
import 'book.dart'; // Book model

class BookProvider with ChangeNotifier {
  final List<Book> _books = [];

  List<Book> get books => _books;

  bool addBook(String name, String genre,BuildContext context) {
    if (_books.any((book) => book.name.toLowerCase() == name.toLowerCase())) {
     showToast(context);     
 return false; // Duplicate book
    }

    _books.add(Book(name: name, genre: genre));
    notifyListeners();
    return true;
  }

  void deleteBook(String name) {
    _books.removeWhere((book) => book.name == name);
    notifyListeners();
  }

  void showToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("This book already exists"),
        duration: Duration(seconds: 5),
      ),
    );
  }
}
