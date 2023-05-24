class Comment{
  String content;
  String user;
  String id;
  Comment(this.content, this.user, this.id) {
    if (content == '') {
      throw ArgumentError('Content cannot be empty');
    }
    if (user == '') {
      throw ArgumentError('User cannot be empty');
    }
  }
}