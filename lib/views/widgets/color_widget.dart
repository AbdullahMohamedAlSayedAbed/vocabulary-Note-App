import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabularynoteapp/controllers/write_cubit/write_cubit.dart';

import 'get_item_color_design.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({super.key});

  final List<int> colorCodes = const [
    0xff4a47a3,
    0xff0c7893,
    0xffbc6ff1,
    0xfff4a8c4,
    0xffc70039,
    0xff8fbc8f,
    0xfffa8072,
    0xff4d4c70
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                WriteCubit.get(context).updateColorCode(colorCodes[index]);
              },
              child: BlocBuilder<WriteCubit, WriteState>(
                builder: (context, state) {
                  return GetItemColorDesign(
                      activeColorCode: WriteCubit.get(context).colorCode,
                      index: index,
                      colorCodes: colorCodes);
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
          itemCount: colorCodes.length),
    );
  }
}
