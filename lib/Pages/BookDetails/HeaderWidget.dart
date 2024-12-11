import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For accessing PDF assets
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart'; // For viewing PDF

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xC83DFFDD), // Primary color
        title: const Text(
          "BOOK MART",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Book Cover Photo
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage(
                      "Assets/Images/book_cover.jpg"), // Replace with your book cover path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Book Title
            const Text(
              "Book Title Here",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Read Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PDFViewerPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C236), // Secondary color
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "READ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// PDF Viewer Page
class PDFViewerPage extends StatelessWidget {
  const PDFViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Read Book",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xC83DFFDD), // Primary color
      ),
      body: SfPdfViewer.asset(
          'Assets/pdf/sample.pdf'), // Replace with your PDF path
    );
  }
}
