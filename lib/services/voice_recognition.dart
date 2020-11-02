import 'package:flutter/cupertino.dart';
import 'package:flutter_speech/flutter_speech.dart';

///This class handles all the voice recognition events
class VoiceRecognition extends ChangeNotifier {
  //All languages
  var languages = const [
    const Language('English', 'en_US'),
    // const Language('Pусский', 'ru_RU'),
    // const Language('Italiano', 'it_IT'),
    // const Language('Español', 'es_ES'),
  ];

  bool speechRecognitionAvailable = false;
  bool isListening = false;

  String transcription = "";

  //The current selected language
  Language selectedLang;

  //the speech recognizer object
  SpeechRecognition _speech;

  //Constructor
  VoiceRecognition({var languages}) {
    //update the languages
    this.languages = languages ??
        [
          const Language('English', 'en_US'),
          // const Language('Pусский', 'ru_RU'),
          // const Language('Italiano', 'it_IT'),
          // const Language('Español', 'es_ES'),
        ];

    //Update the selected language
    selectedLang = this.languages.first;

    //Activate the speech recognizer
    activateSpeechRecognizer();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate(selectedLang.code).then((res) => speechRecognitionAvailable = res);
  }


  //This starts the voice recognition listening
  void start() {
    _speech.activate(selectedLang.code).then((_) {
      return _speech.listen().then((result) {
        print('_MyAppState.start => result $result');
        isListening = result;
      });
    });

    notifyListeners();
  }

  //This cancels the voice recognition
  void cancel() {
    _speech.cancel().then((_) => isListening = false);

    notifyListeners();
  }

  //This stops the voice recognition
  void stop() {
    _speech.stop().then((_) => isListening = false);

    notifyListeners();
  }

  //This let's the the caller know about the speech availablity
  void onSpeechAvailability(bool result) {
    speechRecognitionAvailable = result;
  }

  void onCurrentLocale(String locale) {
    print('_MyAppState.onCurrentLocale... $locale');
    selectedLang = languages.firstWhere((l) => l.code == locale);

    notifyListeners();
  }

  //When the voice recognition started
  void onRecognitionStarted() {
    isListening = true;
    notifyListeners();
  }

  //When the voice recognition has partial results
  void onRecognitionResult(String text) {
    print('_MyAppState.onRecognitionResult... $text');
    transcription = text;
    notifyListeners();
  }

  //When the voice recognition is complete
  void onRecognitionComplete(String text) {
    print('_MyAppState.onRecognitionComplete... $text');
    isListening = false;
    notifyListeners();
  }

  //When the voice recognition returns an error
  void errorHandler() {
    //re initialize the voice  recognizer
    activateSpeechRecognizer();
  }
}

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}
