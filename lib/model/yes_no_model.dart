import 'package:chat_provider_ia/provider/message.dart';

class YesNoModel {
  final String answer;
  final String image;

  YesNoModel({
    required this.answer,
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json['answer'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        answer: answer,
        image: image,
      };

  Message toMessageEntity() => Message(
        text: answer == 'yes' ? 'si' : 'no',
        quienEs: QuienEs.she,
        imageUrl: image,
      );
}
