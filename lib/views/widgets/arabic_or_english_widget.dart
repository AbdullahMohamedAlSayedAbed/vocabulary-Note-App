import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabularynoteapp/controllers/write_cubit/write_cubit.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';

class ArabicOrEnglishWidget extends StatelessWidget {
  const ArabicOrEnglishWidget({
    super.key, required this.colorCode, required this.isArabic,
  });
  final int colorCode;
  final bool isArabic;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        GetArabicOrEnglishDesign(
          arabicIsSelected: true,
          colorCode: colorCode,
          isArabic: isArabic,
        ),
        SizedBox(width: 5),
        GetArabicOrEnglishDesign(
          arabicIsSelected: false,
          colorCode: colorCode,
          isArabic: isArabic,
        ),
      ],
    );
  }
}

class GetArabicOrEnglishDesign extends StatelessWidget {
  const GetArabicOrEnglishDesign({
    super.key,
    required this.arabicIsSelected, required this.colorCode, required this.isArabic,
  });
  final bool arabicIsSelected;
  final int colorCode;
  final bool isArabic;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        WriteCubit.get(context).updateIsArabic(arabicIsSelected);
      },
      child: BlocBuilder<WriteCubit, WriteState>(
        builder: (context, state) {
          return Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: ColorManager.white),
                color: isArabic == arabicIsSelected
                    ? ColorManager.white
                    : Color(colorCode),
                shape: BoxShape.circle),
            child: Center(
                child: Text(
              arabicIsSelected ? "AR" : "EN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: !(isArabic == arabicIsSelected)
                    ? ColorManager.white
                    : Color(colorCode),
              ),
            )),
          );
        },
      ),
    );
  }
}
