import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/models/word_model.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';
import 'package:vocabularynoteapp/views/word_details_view.dart';

import '../../controllers/read_cubit/read_cubit.dart';

class CustomWordItemSuccess extends StatelessWidget {
  const CustomWordItemSuccess({super.key, required this.wordModel});
  final WordModel wordModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return WordDetailsView(wordModel: wordModel);
          },
        )).then(
          (value) {
            Future.delayed(Duration(milliseconds: 500)).then((value) {
              ReadCubit.get(context).getWords();
            });
          },
        );
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(wordModel.colorCode),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Text(wordModel.text,
              style: const TextStyle(
                  color: ColorManager.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))),
    );
  }
}
