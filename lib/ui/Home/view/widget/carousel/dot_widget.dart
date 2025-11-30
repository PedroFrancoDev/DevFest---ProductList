import 'package:dev_fest_product_list/ui/Home/view/widget/carousel/images_list.dart';
import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  final int currentIndex;

  const DotWidget({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 61,
      decoration: BoxDecoration(
          color: Color(0XFFB8BCBF).withAlpha(33),
          borderRadius: BorderRadius.all(Radius.circular(7))),
      child: Padding(
        padding: const EdgeInsets.only(left: 7, right: 7, bottom: 3, top: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 2),
              width: currentIndex == index ? 5 : 5,
              height: currentIndex == index ? 5 : 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index
                    ? Color(0XFF5C1A29)
                    : Colors.grey.shade400,
              ),
            );
          }),
        ),
      ),
    );
  }
}
