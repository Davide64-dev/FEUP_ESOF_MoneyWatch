class Comment{
  String content;
  String user;
  Comment(this.content, this.user) {
    if (content == '') {
      throw ArgumentError('Content cannot be empty');
    }
    if (user == '') {
      throw ArgumentError('User cannot be empty');
    }
  }
}