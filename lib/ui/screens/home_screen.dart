import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/views/history_view.dart';
import 'package:flutter_application_1/ui/views/home_view.dart';

import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(
          onChanged: (type) => _onBottomTypeChanged(context, type),
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeView(),
            HistoryView(),
            Center(
              child: Text("Account Page"),
            ),
          ],
        ));
  }

  void _onBottomTypeChanged(BuildContext context, BottomNavBarTypes type) {
    int pageIndex;

    switch (type) {
      case BottomNavBarTypes.remote:
        pageIndex = 0;
        break;
      case BottomNavBarTypes.history:
        pageIndex = 1;
        break;
      case BottomNavBarTypes.account:
        pageIndex = 2;
        break;
    }

    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 750),
      curve: Curves.ease,
    );
  }
}
