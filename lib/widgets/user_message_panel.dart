import 'package:extreme_assistant/services/voice_recognition.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

///This widget is contains the keyboard and the microphone.dart icon
class UserMessagePanel extends StatefulWidget {
  @override
  _UserMessagePanelState createState() => _UserMessagePanelState();
}

class _UserMessagePanelState extends State<UserMessagePanel> {
  @override
  Widget build(BuildContext context) {
    //Get the voice recognition data
    VoiceRecognition voiceRecognition = context.watch<VoiceRecognition>();

    //Return the User spoken text
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
      child: Text(
        voiceRecognition.transcription + (voiceRecognition.isListening ? "..." : ""),
        style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.left,
      ),
    );
  }
}
