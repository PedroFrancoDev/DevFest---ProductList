import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  final bool? istitleRigth;
  final void Function()? onTap;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double horizontalPadding;

  const HeaderTitle({
    super.key,
    required this.title,
    this.color,
    this.istitleRigth = true,
    this.fontSize = 14.14,
    this.fontWeight = FontWeight.w400,
    this.horizontalPadding = 17.76,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: color ?? Color(0XFF000A14),
            ),
          ),
          GestureDetector(
            onTap: () => onTap?.call(),
            child: Text(
              istitleRigth! ? "Ver tudo" : "",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11.39,
                color: Color(0XFF828588),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderTitleH2 extends StatelessWidget {
  final String title;

  const HeaderTitleH2({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
