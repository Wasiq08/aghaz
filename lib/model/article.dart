class Article {
  String id;
  String title;
  String description;
  String publishedAt;
  String image;

  Article({this.id, this.title, this.description, this.image});

  // Article.fromJson(Map<dynamic, dynamic> json) {
  //   id = json['id'];
  //   title = json['title'];
  //   description = json['json'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map();
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['description'] = this.description;
  //   return data;
  // }

  Article.fromMap(Map snapshot, String id)
      : id = id ?? '',
        title = snapshot['title'] ?? '',
        description = snapshot['description'] ?? '';

  toJson() {
    return {
      "title": title,
      "description": description,
    };
  }
}
