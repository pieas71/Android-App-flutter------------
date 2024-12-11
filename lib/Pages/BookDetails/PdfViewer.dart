import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart'; // You can use any PDF viewing library you like

class PDFViewerPage extends StatelessWidget {
  final String pdfPath; // Accept pdfPath as a parameter

  const PDFViewerPage({Key? key, required this.pdfPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
        backgroundColor: Colors.blue,
      ),
      body: PDFView(
        filePath: pdfPath, // Pass the pdfPath to the PDFView widget
      ),
    );
  }
}
