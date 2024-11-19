import 'package:bases2/features/main/presentation/view_model/main_vm.dart';
import 'package:bases2/shared/colors/colors.dart';
import 'package:bases2/shared/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final mainViewModel = MainViewModel.findOrInitial;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Obx(
      () => Column(
        children: [
          const MegaMenuAppbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                mainViewModel.selectPage(),
              ]),
            ),
          )
        ],
      ),
    ));
  }
}

class MegaMenuAppbar extends StatelessWidget {
  const MegaMenuAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final mainViewModel = MainViewModel.findOrInitial;
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
              onTap: () => mainViewModel.modifyIndex(0),
              child: Text('Home', style: style)),
          InkWell(
              onTap: () => mainViewModel.modifyIndex(1),
              child: Text('Inventories', style: style)),
        ],
      ),
    );
  }
}
