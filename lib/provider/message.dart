enum QuienEs {
  me,
  she,
}

class Message {
  final String text;
  final String? imageUrl;
  final QuienEs quienEs;
  Message({
    required this.text,
    this.imageUrl,
    required this.quienEs,
  });
}
