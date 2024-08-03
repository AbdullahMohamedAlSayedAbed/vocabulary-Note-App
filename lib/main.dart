import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocabularynoteapp/models/word_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordModelAdapter());
  runApp(const Vocabulary());
}

class Vocabulary extends StatelessWidget {
  const Vocabulary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Container(),
      ),
    );
  }
}
