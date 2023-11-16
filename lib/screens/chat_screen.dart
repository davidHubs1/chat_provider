import 'package:chat_provider_ia/chats/her_message_bubble.dart';
import 'package:chat_provider_ia/provider/chat_provider.dart';
import 'package:chat_provider_ia/provider/message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../chats/my_message_bubble.dart';
import '../shared/text_form_field.dart';

class ChatScreenBubble extends StatelessWidget {
  const ChatScreenBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(1.0),
          child: CircleAvatar(backgroundImage: AssetImage('assets/img/1.jpeg')),
        ),
        title: const Text('provider  II xd'),
        actions: const [
          Text('by David'),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: AssetImage('assets/img/2.jpeg'),
          ),
        ],
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: chatProvider.chatScrollController,
            itemCount: chatProvider.message.length,
            itemBuilder: (context, index) {
              final message = chatProvider.message[index];
              message.imageUrl;
              return (message.quienEs == QuienEs.she)
                  ? HerChatMessageBubble(
                      message: message,
                    )
                  : MyChatMessageBubble(
                      message: message,
                    );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormFieldBubble(
            onValue: chatProvider.sendMessage,
          ),
        ),
      ],
    );
  }
}
