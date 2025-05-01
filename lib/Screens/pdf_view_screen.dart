// pdf_view_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewScreen extends StatefulWidget {
  final String pdfPath;
  PdfViewScreen({required this.pdfPath});

  @override
  _PdfViewScreenState createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pdfPath.split('/').last),
      ),
      body: PDFView(
        filePath: widget.pdfPath,
      ),
    );
  }
}