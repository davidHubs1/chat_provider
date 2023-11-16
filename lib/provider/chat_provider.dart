import 'package:chat_provider_ia/model/get_yes_no_model.dart';
import 'package:chat_provider_ia/provider/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final GetYesNoModel getYesNoModel = GetYesNoModel();
  final chatScrollController = ScrollController();
  final List<Message> message = [];
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, quienEs: QuienEs.me);
    if (text.endsWith('?')) {
      hintMessageShe();
    }
    message.add(newMessage);
    notifyListeners();
    moveToScroll();
  }

  Future<void> hintMessageShe() async {
    final hintText = await getYesNoModel.yesAnswer();
    message.add(hintText);
    notifyListeners();
    moveToScroll();
  }

  Future<void> moveToScroll() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
