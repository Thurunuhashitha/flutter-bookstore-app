// lib/main.dart
import 'package:flutter/material.dart';
import 'Book.dart';
import 'BookDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Book> books = [
      Book(
        title: 'The Lord of the Rings',
        author: 'J.R.R. Tolkien',
        imagePath: 'assets/images/lord_of_the_rings.jpg',
        price: 19.99,
        description: 'The epic adventure of Frodo Baggins and the One Ring.',
      ),
      Book(
        title: 'Harry Potter',
        author: 'J.K. Rowling',
        imagePath: 'assets/images/harry_potter.jpg',
        price: 14.99,
        description: 'The magical journey of the young wizard Harry Potter.',
      ),
      Book(
        title: 'The Command Of The Ocean',
        author: 'Nicholas A. M. Rodger',
        imagePath: 'assets/images/the_command_of_the_ocean.jpg',
        price: 20.99,
        description: 'Chronicles the rise of the British Royal Navy. The book covers the period from 1649 to 1815, when the British Navy became a dominant military force.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Book Store'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                  child: Image.asset(
                    books[index].imagePath,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        books[index].title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'by ${books[index].author}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${books[index].price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookDetails(book: books[index]),
                                ),
                              );
                            },
                            child: const Text('Details'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}