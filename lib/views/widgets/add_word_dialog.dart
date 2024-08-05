import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabularynoteapp/controllers/read_cubit/read_cubit.dart';
import 'package:vocabularynoteapp/controllers/write_cubit/write_cubit.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';
import 'package:vocabularynoteapp/views/widgets/arabic_or_english_widget.dart';
import 'package:vocabularynoteapp/views/widgets/color_widget.dart';
import 'package:vocabularynoteapp/views/widgets/custom_button.dart';
import 'package:vocabularynoteapp/views/widgets/custom_form.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocConsumer<WriteCubit, WriteState>(
        listener: (BuildContext context, WriteState state) {
          if (state is WriteSuccess) {
            Navigator.pop(context);
          }
          if (state is WriteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: ColorManager.red,
              content: Text(state.errMessage,style: const TextStyle(color: ColorManager.white),),
              duration: const Duration(seconds: 5),
            ));
          }
        },
        builder: (context, state) {
          return AnimatedContainer(
            padding: const EdgeInsets.all(15),
            color: Color(WriteCubit.get(context).colorCode),
            duration: const Duration(milliseconds: 500),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ArabicOrEnglishWidget(),
                  const SizedBox(height: 10),
                  const ColorWidget(),
                  const SizedBox(height: 10),
                  CustomForm(
                    formKey: formKey,
                    hintText: 'words',
                    labelText: 'new word',
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    colorCode: WriteCubit.get(context).colorCode,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        WriteCubit.get(context).addWord();
                        ReadCubit.get(context).getWords();
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
