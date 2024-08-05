import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:vocabularynoteapp/views/widgets/custon_language_filter.dart';

import 'widgets/custom_floating_action_button.dart';
import 'widgets/filter_dialog_button.dart';
import 'widgets/words_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomFloatingActionButton(),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomLanguageFilter(),
                FilterDialogButton(),
              ],
            ),
            SizedBox(height: 10),
            Expanded(child: WordsWidget()),
          ],
        ),
      ),
    );
  }
}
