import 'package:extreme_assistant/services/voice_recognition.dart';
import 'package:extreme_assistant/widgets/interface_panel.dart';
import 'package:extreme_assistant/widgets/user_message_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      //Initialize voice recognition
      create: (_) => VoiceRecognition(),

      //Build the UI
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              //Get the user's message panel
              UserMessagePanel(),

              //Get the microphone and keyboard button
              InterfacePanel(),
            ],
          ),
        ),
      ),
    );
  }
}
