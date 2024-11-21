import 'package:bases2/features/main/presentation/view_model/main_vm.dart';
import 'package:bases2/shared/colors/colors.dart';
import 'package:bases2/shared/utils/image_paths.dart';
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
      () => Row(
        children: [
          const MegaMenuAppbar(),
          Expanded(
            child: SizedBox(
              height: Responsive(context).hp(100),
              width: Responsive(context).wp(80),
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
      decorationColor: MyColors.white,
      color: MyColors.white,
      fontWeight: FontWeight.bold,
      fontSize: responsive.fpw(18),
    );
    return Container(
      width: responsive.wp(20),
      height: responsive.hp(100),
      decoration: BoxDecoration(
        color: MyColors.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: responsive.hp(2)),
              Text(
                'Bienvenido a Mandalapp',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: responsive.fpw(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(AssetsPaths.images.logo, height: responsive.dp(4)),
            ],
          ),
          SizedBox(height: responsive.hp(5)),
          Icon(
            Icons.account_circle_sharp,
            size: responsive.hp(10),
            color: MyColors.white,
          ),
          SizedBox(height: responsive.hp(5)),
          ListTile(
            onTap: () => mainViewModel.modifyIndex(0),
            title: Text('Home', style: style),
          ),
          SizedBox(height: responsive.hp(5)),
          ListTile(
            titleTextStyle: style,
            onTap: () => mainViewModel.modifyIndex(1),
            title: Text('Inventories', style: style),
          ),
          SizedBox(height: responsive.hp(5)),
          ListTile(
            titleTextStyle: style,
            onTap: () => mainViewModel.modifyIndex(2),
            title: Text('Mi cuenta', style: style),
          ),
          SizedBox(height: responsive.hp(5)),
          ListTile(
            titleTextStyle: style,
            onTap: () => mainViewModel.modifyIndex(3),
            title: Text('Mis referidos', style: style),
          ),
        ],
      ),
    );
  }
}
