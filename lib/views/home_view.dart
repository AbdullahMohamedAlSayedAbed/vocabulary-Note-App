import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';
import 'package:vocabularynoteapp/views/widgets/add_word_dialog.dart';
import 'package:vocabularynoteapp/views/widgets/color_widget.dart';

import 'widgets/custom_floating_action_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomFloatingActionButton(),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Column(
        children: [
          ColorWidget(),
        ],
      ),
    );
  }
}
