import 'package:bases2/features/home/presentation/view_model/home_controller.dart';
import 'package:bases2/shared/colors/colors.dart';
import 'package:bases2/shared/utils/responsive.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeViewModel = HomeViewModel.findOrInitial;

  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}

class MegaMenuAppbar extends StatelessWidget {
  const MegaMenuAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = HomeViewModel.findOrInitial;

    final responsive = Responsive(context);
    final style = TextStyle(
        decoration: TextDecoration.underline,
        decorationColor: MyColors.white,
        color: MyColors.white,
        fontWeight: FontWeight.bold,
        fontSize: responsive.fpw(18));
    return Container(
      width: responsive.wp(100),
      height: responsive.hp(12),
      decoration: BoxDecoration(
        color: MyColors.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () => homeViewModel.modifyIndex(0),
              child: Text('Home', style: style)),
          InkWell(
              onTap: () => homeViewModel.modifyIndex(1),
              child: Text('Inventories', style: style)),
        ],
      ),
    );
  }
}
