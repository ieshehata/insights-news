import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_color.dart';
import '../../news/presentation/view/news_view.dart';
import '../../notification/notification_view.dart';
import '../../profile/profile_view.dart';
import '../../search/view/search_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> screens = [
     NewsView(),
     SearchView(),
    const NotificationView(),
    const ProfileView(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: screens[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.backgroundColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColor.lomanadaColor,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            label: '',
            activeIcon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 20,
              colorFilter:
              ColorFilter.mode(AppColor.lomanadaColor, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/search.svg'),
            label: '',
            activeIcon: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 20,
              colorFilter:
              ColorFilter.mode(AppColor.lomanadaColor, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Notification.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/Notification.svg',
                width: 20,
                colorFilter:
                ColorFilter.mode(AppColor.lomanadaColor, BlendMode.srcIn),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Profile.svg'),
              activeIcon: SvgPicture.asset(
                'assets/icons/Profile.svg',
                width: 20,
                colorFilter:
                ColorFilter.mode(AppColor.lomanadaColor, BlendMode.srcIn),
              ),
              label: ''),
        ],
      ),
    );
  }
}
