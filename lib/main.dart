import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocabularynoteapp/hive_cnstants.dart';
import 'package:vocabularynoteapp/models/word_model.dart';
import 'package:vocabularynoteapp/views/home_view.dart';
import 'package:vocabularynoteapp/views/styles/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordModelAdapter());
  await Hive.openBox<WordModel>(HiveConstants.wordsBox);
  runApp(const Vocabulary());
}

class Vocabulary extends StatelessWidget {
  const Vocabulary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.getAppTheme(),
        home: const HomeView());
  }
}
