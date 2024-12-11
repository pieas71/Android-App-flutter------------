import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookTile extends StatelessWidget {
  final String title;
  final String coverUrl;
  final String author;

  final String rating;
  final int totalRating;
  final String pdfPath; // Added pdfPath property

  const BookTile({
    super.key,
    required this.title,
    required this.coverUrl,
    required this.author,
    required this.rating,
    required this.totalRating,
    required this.pdfPath, // Receive pdfPath here
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PDFScreen(pdfPath: pdfPath),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 23, 156, 134).withOpacity(0.4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    coverUrl,
                    width: 100,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(height: 5),
                    Text("By: $author",
                        style: Theme.of(context).textTheme.labelMedium),
                    Text("Genre : ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary)),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset("Assets/Icons/star.svg"),
                        Text(rating,
                            style: Theme.of(context).textTheme.bodySmall),
                        Text("($totalRating ratings)",
                            style: Theme.of(context).textTheme.labelSmall)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PDFScreen extends StatelessWidget {
  final String pdfPath;

  const PDFScreen({super.key, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("বইয়ের - হাট")),
      body: SfPdfViewer.asset(
        pdfPath,
        canShowScrollHead: false,
        enableDoubleTapZooming: true,
      ),
    );
  }
}
