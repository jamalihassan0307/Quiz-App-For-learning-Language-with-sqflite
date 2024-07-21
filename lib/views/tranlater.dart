// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print

// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/themes/color.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class TranslatePage extends StatefulWidget {
  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  final translator = GoogleTranslator();
  // final String apiKey = "567e14072dmsh536d5f2fbf38452p15efc4jsn5df5c3d12c97";
  // final String apiUrl =
  //     "https://google-translate1.p.rapidapi.com/language/translate/v2";
  final TextEditingController inputTextController = TextEditingController();
  final TextEditingController outputTextController = TextEditingController();
  String translatedText = '';
  String inputLanguage = 'en';
  String outputLanguage = 'ur';

  // Language codes and their display names
  final Map<String, String> languages = {
    'en': 'English',
    'es': 'Spanish',
    'fr': 'French',
    'de': 'German',
    'it': 'Italian',
    'pt': 'Portuguese',
    'ru': 'Russian',
    'ur': 'Urdu',
    'ar': 'Arabic',
    'zh': 'Chinese',
    'hi': 'Hindi',
    'ps': 'Pashto',
    'fa': 'Persian',
    'pa': 'Punjabi',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ThemeColor.white),
        backgroundColor: ThemeColor.lightPrimary,
        title: const Text('Translate Text Example',
            style: TextStyle(color: ThemeColor.white)),
      ),
      body: Container(
        color: ThemeColor.lightPrimary,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Input text field and language selection
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Input Text',
                      style:
                          TextStyle(fontSize: 16.0, color: ThemeColor.white)),
                  TextField(
                    controller: inputTextController,
                    minLines: 4,
                    maxLines: 8,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white, width: 2), // Border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 3), // Border color on focus
                      ),
                      hintText: 'Enter text to translate',
                      hintStyle:
                          TextStyle(fontSize: 16.0, color: ThemeColor.white),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // DropdownButton<String>(
                  //   value: inputLanguage,
                  //   onChanged: (String? newValue) {
                  //     if (newValue != null) {
                  //       setState(() {
                  //         inputLanguage = newValue;
                  //       });
                  //     }
                  //   },
                  //   items: languages.keys.map((String lang) {
                  //     return DropdownMenuItem<String>(
                  //       value: lang,
                  //       child: Text(languages[lang]!),
                  //     );
                  //   }).toList(),
                  // ),
                ],
              ),
              const SizedBox(height: 20.0),
              // Output text field and language selection
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Translated Text',
                      style:
                          TextStyle(fontSize: 16.0, color: ThemeColor.white)),
                  TextField(
                    controller: outputTextController,
                    minLines: 4,
                    maxLines: 8,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 3),
                      ),
                      hintText: 'Translated text will appear here',
                      hintStyle:
                          TextStyle(fontSize: 16.0, color: ThemeColor.white),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  DropdownButton<String>(
                    value: outputLanguage,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          outputLanguage = newValue;
                        });
                      }
                    },
                    focusColor: Colors.black,
                    iconEnabledColor: ThemeColor.white,
                    items: languages.keys.map((String lang) {
                      return DropdownMenuItem<String>(
                        value: lang,
                        child: Text(languages[lang]!,
                            style: const TextStyle(
                                fontSize: 16.0, color: ThemeColor.black)),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      translateText();
                    },
                    child: const Text('Translate'),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     swapLanguages();
                  //   },
                  //   child: const Text('Swap Languages'),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> translateText() async {
    String text = inputTextController.text.trim();
    try {
      final translator = GoogleTranslator();
      var translatedWord = await translator.translate(text, to: outputLanguage);
      print("Translated text: ${translatedWord.text}");
      if (translatedWord.text.isNotEmpty) {
        outputTextController.text = translatedWord.text;
      } else {
        setState(() {
          translatedText = 'Translation not found in response';
        });
      }
    } catch (error) {
      print("Error: $error");
      setState(() {
        translatedText = 'Failed to translate text: $error';
      });
    }
  }
  // if (translatedWord.text == _wordController.text) {
  //   messenger.toast(S.of(context).couldntFoundTranslate);
  // } else {
  //   _conceptController.text = translatedWord.text;
  // }

  // final response = await http.post(
  //   Uri.parse(apiUrl),
  //   headers: {
  //     'x-rapidapi-key': apiKey,
  //     'x-rapidapi-host': 'google-translate113.p.rapidapi.com',
  //     'Content-Type': 'application/json',
  //   },
  //   body: jsonEncode({
  //     "from": inputLanguage,
  //     "to": outputLanguage,
  //     "html": text,
  //   }),
  // );

  // print('API Response: ${response.body}');

  // if (response.statusCode == 200) {
  //   Map<String, dynamic> data = jsonDecode(response.body);
  //   if (data.containsKey('trans')) {
  //     setState(() {
  //       translatedText = data['trans'];
  //       outputTextController.text = translatedText;
  //     });
  //   } else {
  //     setState(() {
  //       translatedText = 'Translation not found in response';
  //     });
  //   }
  // } else {
  //   setState(() {
  //     translatedText =
  //         'Failed to translate text. Status Code: ${response.statusCode}';
  //   });
  // }

  // void swapLanguages() {
  //   setState(() {
  //     String temp = inputLanguage;
  //     inputLanguage = outputLanguage;
  //     outputLanguage = temp;
  //   });
  // }
}
