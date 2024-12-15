import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bookprovider.dart'; // State management file
import 'detailspage.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Library Management',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 13, 67, 162),
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Books: ${bookProvider.books.length}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bookProvider.books.length,
              itemBuilder: (context, index) {
                final book = bookProvider.books[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(book: book),
                      ),
                    );
                  },
                  onLongPress: () {
                    bookProvider.deleteBook(book.name);
                  },
                  child: ListTile(
                    tileColor: Colors.deepPurple,
                    title: Text(book.name,
                    style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(book.genre,style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => _showAddBookDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddBookDialog(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    final TextEditingController nameController = TextEditingController();
    String? selectedGenre;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Book'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Book Name'),
            ),
            DropdownButton<String>(
              hint: Text('Select Genre'),
              value: selectedGenre,
              items: ['Fiction', 'Non-Fiction', 'Fantasy', 'Mystery']
                  .map((genre) => DropdownMenuItem(
                        value: genre,
                        child: Text(genre),
                      ))
                  .toList(),
              onChanged: (value) {
                selectedGenre = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (nameController.text.isEmpty || selectedGenre == null) {
                // Optional: Show error toast
              } else if (bookProvider.addBook(
                nameController.text.trim(),
                selectedGenre!,context
              )) {
                Navigator.pop(context);
              } else {
                // Optional: Show error for duplicate book
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}