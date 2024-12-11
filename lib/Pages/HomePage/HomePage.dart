import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/Components/BookTile.dart';
import 'package:mobile_app/Models/Data.dart';
import 'package:mobile_app/Pages/HomePage/Widgets/AppBar.dart';
import 'package:mobile_app/Pages/HomePage/Widgets/MyinputTextField.dart'; // Import BookDetails page

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  color: const Color.fromARGB(255, 78, 150, 128),
                  height: 400,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(height: 60),
                            HomeAppbar(),
                            SizedBox(height: 40),
                            Row(
                              children: [
                                Text(
                                  "Good To See You....",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background),
                                ),
                                Text(
                                  "Piash 👍",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    "Books are keys to unlock new worlds...",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Myinputtextfield(),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Best Seller",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        children: bookData
                            .map((e) => BookTile(
                                  title: e.title,
                                  coverUrl: e.coverUrl,
                                  author: e.author,
                                  rating: e.rating,
                                  totalRating: e.numberofRating,
                                  pdfPath: e.pdfPath,
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
