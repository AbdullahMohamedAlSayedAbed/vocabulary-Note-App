import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabularynoteapp/controllers/read_cubit/read_cubit.dart';
import 'package:vocabularynoteapp/controllers/write_cubit/write_cubit.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';
import 'package:vocabularynoteapp/views/widgets/arabic_or_english_widget.dart';
import 'package:vocabularynoteapp/views/widgets/custom_button.dart';
import 'package:vocabularynoteapp/views/widgets/custom_form.dart';

class UpdateWordDialog extends StatefulWidget {
  const UpdateWordDialog(
      {super.key,
      required this.isExample,
      required this.colorCode,
      required this.indexAtDatabase});
  final bool isExample;
  final int colorCode;
  final int indexAtDatabase;

  @override
  State<UpdateWordDialog> createState() => _UpdateWordDialogState();
}

class _UpdateWordDialogState extends State<UpdateWordDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(widget.colorCode),
      child: BlocConsumer<WriteCubit, WriteState>(
        listener: (context, state) {
          if (state is WriteSuccess) {
            Navigator.pop(context);
          }
          if (state is WriteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: ColorManager.red,
              content: Text(
                state.errMessage,
                style: const TextStyle(color: ColorManager.white),
              ),
              duration: const Duration(seconds: 5),
            ));
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ArabicOrEnglishWidget(
                  colorCode: widget.colorCode,
                  isArabic: WriteCubit.get(context).isArabic,
                ),
                const SizedBox(height: 20),
                CustomForm(
                    formKey: formKey,
                    labelText:
                        widget.isExample ? 'New Example' : 'New Similar Word',
                    hintText: widget.isExample ? 'Example' : 'Similar Word'),
                const SizedBox(height: 20),
                CustomButton(
                  colorCode: widget.colorCode,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (widget.isExample) {
                        WriteCubit.get(context)
                            .addExample(widget.indexAtDatabase);
                      } else {
                        WriteCubit.get(context)
                            .addSimilarWord(widget.indexAtDatabase);
                      }
                      ReadCubit.get(context).getWords();
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
