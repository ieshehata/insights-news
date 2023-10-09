import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api_services.dart';
import '../../../core/app_color.dart';
import '../../news web view/view/news_web_view.dart';
import '../view_model/search_cubit.dart';
import '../view_model/search_states.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()..getSearch(query),
      child: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          if (state is GetSearchSuccessState) {
            var data = state.news!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Results : ${data.totalResults}',
                  style: TextStyle(color: AppColor.lomanadaColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: data!.articles!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    NewsWebView(url: data.articles![index].url!),
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: AppColor.containerColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      data.articles![index].urlToImage ?? '',
                                      width: 150,
                                      errorBuilder:
                                          (context, error, stackTrace) {
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.articles![index].title ?? '',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            data.articles![index].author ?? '',
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
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
              ],
            );
          } else if (state is GetSearchErrorState) {
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
