import 'package:flutter/material.dart';
import 'book.dart'; // Book model

class DetailsPage extends StatelessWidget {
  final Book book;

  const DetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(179, 226, 183, 183),
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 179, 4, 4),
        title: Text('Book Details',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${book.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Genre: ${book.genre}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
