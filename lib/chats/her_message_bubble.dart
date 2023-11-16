import 'package:chat_provider_ia/provider/message.dart';
import 'package:flutter/material.dart';

class HerChatMessageBubble extends StatelessWidget {
  final Message message;
  const HerChatMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final coolors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: coolors.inversePrimary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                message.text,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          _ImageSend(message.imageUrl!),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _ImageSend extends StatelessWidget {
  final String imageUrl;

  const _ImageSend(
    this.imageUrl,
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return SizedBox(
            height: 150,
            width: size.width * 0.7,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text('Cargando .. .. ..'),
            ),
          );
        },
      ),
    );
  }
}
