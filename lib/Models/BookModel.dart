class BookModel {
  final String id;
  final String title;
  final String description;
  final String aboutAuthor;
  final String audioLen;
  final String author;
  final String coverUrl;
  final String rating;
  final String category;
  final int numberofRating;
  final int price;
  final String pdfPath; // Added PDF Path
  final int? pages;
  final String? language;
  final String? audeourl;

  BookModel({
    required this.id,
    required this.title,
    required this.description,
    required this.aboutAuthor,
    required this.audioLen,
    required this.author,
    required this.coverUrl,
    required this.rating,
    required this.category,
    required this.numberofRating,
    required this.price,
    required this.pdfPath,
    this.pages,
    this.language,
    this.audeourl,
  });

  BookModel.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? '',
        title = json["title"] ?? '',
        description = json["description"] ?? '',
        aboutAuthor = json["aboutAuthor"] ?? '',
        audioLen = json["audioLen"] ?? '',
        author = json["author"] ?? '',
        coverUrl = json["coverUrl"] ?? '',
        rating = json["rating"] ?? '',
        category = json["category"] ?? '',
        numberofRating = json["numberofRating"] ?? 0,
        price = json["price"] ?? 0,
        pdfPath = json["pdfPath"] ?? '',
        pages = json["pages"],
        language = json["language"],
        audeourl = json["audeourl"];

  static List<BookModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(BookModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "aboutAuthor": aboutAuthor,
      "audioLen": audioLen,
      "author": author,
      "coverUrl": coverUrl,
      "rating": rating,
      "category": category,
      "numberofRating": numberofRating,
      "price": price,
      "pdfPath": pdfPath,
      "pages": pages,
      "language": language,
      "audeourl": audeourl,
    };
  }
}
