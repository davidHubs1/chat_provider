import 'package:chat_provider_ia/config/theme/config_theme.dart';
import 'package:chat_provider_ia/provider/chat_provider.dart';
import 'package:chat_provider_ia/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        theme: AppTheme(colorSelected: 2).theme(),
        title: 'Yes no App ',
        home: const ChatScreenBubble(),
      ),
    );
  }
}
