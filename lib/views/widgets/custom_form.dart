import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/controllers/write_cubit/write_cubit.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';

class CustomForm extends StatefulWidget {
  const CustomForm(
      {super.key,
      required this.formKey,
      required this.labelText,
      required this.hintText});
  final GlobalKey<FormState> formKey;
  final String labelText;
  final String hintText;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: TextFormField(
          autofocus: true,
          controller: controller,
          maxLines: 3,
          minLines: 1,
          onChanged: (value) => WriteCubit.get(context).updateText(value),
          validator: (value) {
            return _validateText(value!, WriteCubit.get(context).isArabic);
          },
          cursorColor: ColorManager.white,
          style: const TextStyle(color: ColorManager.white),
          decoration: InputDecoration(
            label: Text(widget.labelText,
                style: const TextStyle(color: ColorManager.white)),
            enabledBorder: _buildOutlineInputBorder(),
            focusedBorder: _buildOutlineInputBorder(),
            errorBorder:
                _buildOutlineInputBorder(borderColor: ColorManager.red),
            focusedErrorBorder:
                _buildOutlineInputBorder(borderColor: ColorManager.red),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: ColorManager.white),
          ),
        ));
  }

  String? _validateText(String value, bool isArabic) {
    if (value.trim().isEmpty) {
      return 'This field is required';
    }
    for (var i = 0; i < value.length; i++) {
      CharType charType = _getCharType(value.codeUnitAt(i));
      if (charType == CharType.notValid) {
        return 'char number ${i + 1} is not valid';
      }
      if (isArabic && charType == CharType.english) {
        return 'char number ${i + 1} is not english char';
      }
      if (!isArabic && charType == CharType.arabic) {
        return 'char number ${i + 1} is not arabic char';
      }
    }
    return null;
  }

  OutlineInputBorder _buildOutlineInputBorder({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide:
          BorderSide(color: borderColor ?? ColorManager.white, width: 2),
    );
  }
  
  CharType _getCharType(int asciiCode) {
    if ((asciiCode >= 65 && asciiCode <= 90)||(asciiCode >= 97 && asciiCode <= 122)) {
      return CharType.english;
    } else if (asciiCode>=1569 && asciiCode<=1610) {
      return CharType.arabic;
    } else if (asciiCode == 32) {
      return CharType.space;
    } else {
      return CharType.notValid;
    }
  }
  
}

enum CharType { english, arabic, space, notValid }
