import 'package:dev_fest_productl_list/pages/home/widget/carousel/carousel_page.dart';
import 'package:dev_fest_productl_list/theme/colors.dart';
import 'package:dev_fest_productl_list/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () {
          Navigator.of(context).pop();
        },
        hasBackButton: false,
        title: 'DevFest Product List',
        hasBorderBottom: false,
      ),
      backgroundColor: AppColors.white,
      body: Column(children: [SizedBox(height: 24), Carousel()]),
    );
  }
}
