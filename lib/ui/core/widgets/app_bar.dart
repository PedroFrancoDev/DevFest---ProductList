import 'package:dev_fest_product_list/ui/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.onTap,
    this.title,
    this.actionIcon,
    this.hasBorderBottom = true,
    this.hasBackButton = true,
    this.hasBackIconButton = true,
    this.backgroundColor = Colors.white,
    this.arrowRigth = 0,
  });

  final void Function() onTap;
  final String? title;
  final Widget? actionIcon;
  final bool hasBorderBottom;
  final bool hasBackButton;
  final bool hasBackIconButton;
  final Color? backgroundColor;
  final double arrowRigth;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: hasBorderBottom
                  ? BorderSide(color: Colors.grey.shade100, width: 1.5)
                  : BorderSide.none,
            ),
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (hasBackButton)
              Padding(
                padding: EdgeInsets.only(right: arrowRigth),
                child: GestureDetector(
                  onTap: () => onTap(),
                  child: Icon(
                    hasBackIconButton ? Icons.arrow_back : Icons.close,
                    color: AppColors.primaryDark4,
                    weight: 22,
                  ),
                ),
              ),
            if (!hasBackButton) SizedBox.shrink(),
            Text(
              title ?? "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryDark4,
              ),
            ),
            if (actionIcon == null) SizedBox(height: 22, width: 22),
            if (actionIcon != null) actionIcon ?? Container(),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
