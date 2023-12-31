import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/api_services.dart';
import '../../../../../core/app_color.dart';
import '../../../../news web view/view/news_web_view.dart';
import '../../view_model/news_cubit.dart';
import '../../view_model/news_states.dart';

class TabListView extends StatelessWidget {
  const TabListView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getNews(category),
      child: BlocBuilder<NewsCubit, NewsStates>(
          builder: (context, state) {
            if (state is GetNewsSuccessState) {
              var data = state.news!.articles;
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewsWebView(url: data[index].url!),
                      ));
                      // var url = data[index].url;
                      // if (await canLaunch(url!)) {
                      //   await launch(url);
                      // } else {
                      //   throw 'Could not launch $url';
                      // }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: AppColor.containerColor,
                          borderRadius: BorderRadius.circular(15)),
                      // height: 80,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              data[index].urlToImage ?? '',
                              width: 150,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 150,
                                  height: 120,
                                  color: AppColor.containerColor,
                                  child: Icon(Icons.error,
                                      color: AppColor.whiteColor),
                                );
                              },
                              fit: BoxFit.cover,
                              height: 120,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].title ?? '',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    data[index].author ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/read.png',
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'Read',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is GetNewsErrorState) {
              return Text(state.error);
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.lomanadaColor,
                ),
              );
            }
          },
      ),
    );
  }
}

