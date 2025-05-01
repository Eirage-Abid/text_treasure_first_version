import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'pdf_view_screen.dart';

class MyLibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<MyLibraryScreen> {
  List<Book> _books = [
    Book(title: 'The Secret Garden', author: 'Frances Hodgson Burnett', coverImage: 'assets/images/hide_and_seek.png', filePath: null),
    Book(title: 'Pride and Prejudice', author: 'Jane Austen', coverImage: 'assets/images/beyond_the _ocean_door.png', filePath: null),
    Book(title: 'To Kill a Mockingbird', author: 'Harper Lee', coverImage: 'assets/images/into_the_shadow.png', filePath: null),
    Book(title: '1984', author: 'George Orwell', coverImage: 'assets/images/really_good_actually.png', filePath: null),
   // Book(title: 'Little Women', author: 'Louisa May Alcott', coverImage: 'assets/pdf_icon.jpeg', filePath: null),
  ];


  Future<void> _uploadBook() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'], // Only allow PDF files
    );

    if (result != null) {
      String? path = result.files.single.path;
      String fileName = result.files.single.name;
      if (path != null) {
        Book newBook = Book(
          title: _getBookTitleFromFilename(fileName),
          author: 'Unknown Author',
          coverImage: 'assets/pdf_icon.png', // Use a PDF icon
          filePath: path,
          fileType: 'pdf',
        );

        setState(() {
          _books.add(newBook);
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('PDF "${newBook.title}" uploaded')),
        );
      }
    } else {
      // User canceled the picker
    }
  }

  String _getBookTitleFromFilename(String filename) {
    return filename.split('.').first.replaceAll(RegExp(r'[_|-]'), ' ').trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My PDF Library'),
      ),
      body: _books.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your PDF library is empty.',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(height: 24.0),
            _buildAttractiveUploadButton(),
          ],
        ),
      )
          : ListView.builder(
        itemCount: _books.length,
        itemBuilder: (context, index) {
          final book = _books[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: SizedBox(
                width: 50.0,
                height: 70.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    book.coverImage,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(child: Icon(Icons.picture_as_pdf)),
                      );
                    },
                  ),
                ),
              ),
              title: Text(book.title),
              subtitle: Text(book.author ?? 'Unknown'),
              onTap: () {
                if (book.filePath != null && book.fileType == 'pdf') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfViewScreen(pdfPath: book.filePath!),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cannot read this file format yet.')),
                  );
                }
              },
            ),
          );
        },
      ),
     /* floatingActionButton: _books.isNotEmpty
          ? FloatingActionButton(
        onPressed: _uploadBook,
        child: const Icon(Icons.add),
      )
          : null,*/
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _books.isNotEmpty ? _buildAttractiveUploadButton() : null,
      ),
    );
  }

  Widget _buildAttractiveUploadButton() {
    return ElevatedButton.icon(
      onPressed: _uploadBook,
      icon: const Icon(Icons.upload_file, size: 24.0),
      label: const Text(
        'Upload PDF Book',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: Colors.blueAccent, // Customize the color for PDF
        foregroundColor: Colors.white,
        elevation: 4.0,
      ),
    );
  }
}

class Book {
  final String title;
  final String? author;
  final String coverImage;
  final String? filePath;
  final String? fileType;

  Book({required this.title, this.author, required this.coverImage, this.filePath, this.fileType});
}


/**
  Future<void> _uploadBook() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt', 'epub', 'pdf'], // Specify supported formats
    );

    if (result != null) {
      String? path = result.files.single.path;
      String fileName = result.files.single.name;
      if (path != null) {
        // Create a new Book object
        Book newBook = Book(
          title: _getBookTitleFromFilename(fileName), // Extract title from filename (basic)
          author: 'Unknown Author', // You might want to add a step to get author
          coverImage: 'assets/default_book.png', // Use a default cover initially
          filePath: path,
        );

        setState(() {
          _books.add(newBook);
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Book "${newBook.title}" uploaded')),
        );
      }
    } else {
      // User canceled the picker
    }
  }

  String _getBookTitleFromFilename(String filename) {
    // Basic attempt to extract title (remove extension and underscores/hyphens)
    return filename.split('.').first.replaceAll(RegExp(r'[_|-]'), ' ').trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Library'),
      ),
      body: _books.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your library is empty.',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(height: 24.0),
            _buildAttractiveUploadButton(),
          ],
        ),
      )
          : ListView.builder(
        itemCount: _books.length,
        itemBuilder: (context, index) {
          final book = _books[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: SizedBox(
                width: 50.0,
                height: 70.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    book.coverImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(child: Icon(Icons.book_outlined)),
                      );
                    },
                  ),
                ),
              ),
              title: Text(book.title),
              subtitle: Text(book.author ?? 'Unknown'),
              onTap: () {
                // Handle tapping on a book to read
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Reading ${book.title}')),
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ReadingScreen(bookPath: book.filePath),
                //   ),
                // );
              },
            ),
          );
        },
      ),
     /* floatingActionButton: _books.isNotEmpty ? FloatingActionButton(
        onPressed: _uploadBook,
        child: const Icon(Icons.add),
      ) : null,*/ // Don't show FAB if the library is empty (button is in the center)
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _books.isNotEmpty ? _buildAttractiveUploadButton() : null, // Show button at the bottom if library isn't empty
      ),
    );
  }

  Widget _buildAttractiveUploadButton() {
    return ElevatedButton.icon(
      onPressed: _uploadBook,
      icon: const Icon(Icons.cloud_upload_outlined, size: 24.0),
      label: const Text(
        'Upload New Book',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: Colors.blueAccent, // Customize the color
        foregroundColor: Colors.white,
        elevation: 4.0,
      ),
    );
  }
}

class Book {
  final String title;
  final String? author;
  final String coverImage;
  final String? filePath;

  Book({required this.title, this.author, required this.coverImage, this.filePath});
}**/