import 'dart:io';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:insightsnews/feature/news/presentation/view/tabs/tab_view.dart';
import '../../../../core/app_color.dart';
import '../../../../core/cahed_data.dart';


class NewsView extends StatelessWidget {
   NewsView({super.key});
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: DefaultTabController(
            length: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  //Custom AppBar
                  Row(children: [
                    Column(
                      children: [
                        FutureBuilder(
                          future: CachedData().getName(),
                          builder: (context, snapshot) => Text(
                            'Hello, ${snapshot.data}',
                            style: TextStyle(
                                color: AppColor.whiteColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Have a nice day',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    FutureBuilder(
                      future: CachedData().getImage(),
                      builder: (context, snapshot) => CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColor.whiteColor,
                        child: CircleAvatar(
                            radius: 18,
                            backgroundImage: (snapshot.data != null)
                                ? FileImage(
                              File(snapshot.data.toString()),
                            ) as ImageProvider
                                : const AssetImage('assets/user.png')),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  CarouselSlider(
                      items: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/rodri.png',
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/rodri.png',
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/rodri.png',
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/rodri.png',
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 1,
                        initialPage: 0,
                        // enlargeFactor: 0.5,
                        enlargeCenterPage: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      )),
                  const SizedBox(height: 10),
                  ButtonsTabBar(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                    ),
                    backgroundColor: AppColor.lomanadaColor,
                    unselectedBackgroundColor: AppColor.containerColor,
                    unselectedLabelStyle: const TextStyle(color: Colors.white),
                    labelStyle: TextStyle(
                        color: AppColor.containerColor,
                        fontWeight: FontWeight.bold),
                    tabs: const [
                      Tab(
                        text: "Science",
                      ),
                      Tab(
                        text: "Sports",
                      ),
                      Tab(
                        text: "Business",
                      ),
                      Tab(
                        text: "Entertainment",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   const Expanded(
                    child: TabBarView(
                      children: [
                        TabListView(category: 'Science'),
                        TabListView(category: 'Sports'),
                        TabListView(category: 'Business'),
                        TabListView(category: 'Entertainment'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}