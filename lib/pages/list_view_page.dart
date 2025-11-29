import 'package:dev_fest_product_list/pages/favorite/favorite_page.dart';
import 'package:dev_fest_product_list/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:dev_fest_product_list/pages/home/home_page.dart';
import 'package:flutter_svg/svg.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  int _selectedIndex = 0;
  late final PageController _pageController;

  final List<Widget> _pages = [HomePage(), FavoritesScreen()];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: 95,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade100, width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/home.svg",
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0 ? AppColors.primary : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/heart.svg",
                width: 20,
                height: 24,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1 ? AppColors.primary : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Favoritos',
            ),
          ],
        ),
      ),
    );
  }
}
