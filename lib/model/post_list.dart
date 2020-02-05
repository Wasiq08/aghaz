class PostList {
  String imagePath = '';
  String description = '';
  String location = '';
  bool isFavourite;
  String category;
  String date;

  PostList(
      {this.imagePath = '',
      this.description = '',
      this.location = '',
      this.category = 'Cleanliness',
      this.date = '21 December 2019'});

  static List<PostList> postList = <PostList>[
    PostList(
        imagePath: 'assets/img.jpg',
        description: 'Kachra Overloaded',
        category: 'Cleanliness',
        location: 'Gulshan-e-Iqbal Block 5 Near Moti Mahal',
        date: '21 December 2019'),
    PostList(
        imagePath: 'assets/img.jpg',
        description: 'Water Issue',
        category: 'Water',
        location: 'BufferZone Block 10 Near Sakhi Hasan',
        date: '2 January 2020'),
    PostList(
        imagePath: 'assets/img.jpg',
        description: 'No Trees in Area',
        category: 'Tree',
        location: 'Gulshan-e-Azeem Near Rim Jhim Tower',
        date: '10 February 2029'),
    PostList(
        imagePath: 'assets/img.jpg',
        description: 'No Trees in Area',
        category: 'Tree',
        location: 'Gulshan-e-Azeem Near Rim Jhim Tower',
        date: '10 February 2029'),
    PostList(
        imagePath: 'assets/img.jpg',
        description: 'No Trees in Area',
        category: 'Tree',
        location: 'Gulshan-e-Azeem Near Rim Jhim Tower',
        date: '10 February 2029')
  ];
}
