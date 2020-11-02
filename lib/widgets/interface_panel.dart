import 'package:extreme_assistant/services/voice_recognition.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

///This widget is contains the keyboard and the microphone.dart icon
class InterfacePanel extends StatefulWidget {
  @override
  _InterfacePanelState createState() => _InterfacePanelState();
}

class _InterfacePanelState extends State<InterfacePanel> {
  @override
  Widget build(BuildContext context) {
    VoiceRecognition voiceRecognition = context.watch<VoiceRecognition>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Hamburger menu
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),

        //Microphone
        voiceRecognition.isListening
            ?
            //Show Wave
            Expanded(
                child: WaveWidget(
                  config: CustomConfig(
                    //Colors
                    gradients: [
                      [
                        Color(0xff342de9).withAlpha(100),
                        Color(0xff342de9),
                        Color(0xff342de9).withAlpha(100),
                      ],
                      [
                        Color(0xff20196e).withAlpha(100),
                        Color(0xff20196e),
                        Color(0xff20196e).withAlpha(100),
                      ],
                    ],

                    //Speed of the wave
                    durations: [4500, 2940],

                    //Height of the wave
                    heightPercentages: [0.10, 0.13],

                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.bottomRight,
                    blur: MaskFilter.blur(BlurStyle.inner, 5),
                  ),

                  //Amplitude
                  waveAmplitude: 0,

                  //Size
                  size: Size(MediaQuery.of(context).size.width - 100, 50),
                ),
              )
            //Show microphone
            : IconButton(
                icon: Icon(Icons.mic),
                onPressed: () {
                  if (voiceRecognition.isListening) {
                    //Stop the voice recognition
                    voiceRecognition.stop();
                  } else {
                    //Start the voice recognition
                    voiceRecognition.start();
                  }
                },
              ),

        //Keyboard
        IconButton(
          icon: Icon(Icons.keyboard),
          onPressed: () {},
        ),
      ],
    );
  }
}
