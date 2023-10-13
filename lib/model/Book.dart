class Book {
  int? id;
  String title;
  int pages;

  Book({
    this.id,
    required this.title,
    required this.pages,
  });

  // Convert Book object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'pages': pages,
    };
  }

  // Convert a Map to a Book object
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      pages: map['pages'],
    );
  }
}