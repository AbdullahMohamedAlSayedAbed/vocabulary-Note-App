import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabularynoteapp/controllers/write_cubit/write_cubit.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';

class ArabicOrEnglishWidget extends StatelessWidget {
  const ArabicOrEnglishWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        GetArabicOrEnglishDesign(
          arabicIsSelected: true,
        ),
        SizedBox(width: 5),
        GetArabicOrEnglishDesign(
          arabicIsSelected: false,
        ),
      ],
    );
  }
}

class GetArabicOrEnglishDesign extends StatelessWidget {
  const GetArabicOrEnglishDesign({
    super.key,
    required this.arabicIsSelected,
  });
  final bool arabicIsSelected;
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
                color: WriteCubit.get(context).isArabic == arabicIsSelected
                    ? ColorManager.white
                    : Color(WriteCubit.get(context).colorCode),
                shape: BoxShape.circle),
            child: Center(
                child: Text(
              arabicIsSelected ? "AR" : "EN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: !(WriteCubit.get(context).isArabic == arabicIsSelected)
                    ? ColorManager.white
                    : Color(WriteCubit.get(context).colorCode),
              ),
            )),
          );
        },
      ),
    );
  }
}
