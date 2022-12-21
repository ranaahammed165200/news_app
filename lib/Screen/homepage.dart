import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app/Model/News_model.dart';
import 'package:news_app/Screen/Reposetory/Auth_repo.dart';
import 'package:news_app/Screen/news_details.dart';
import 'package:news_app/Widget/news_card_widgts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder<NewsModel>(
        future: AuthRepo().getNews(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.datas?.data?.length ?? 0,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      FeaturesNewsCard(
                              images: snapshot
                                      .data?.datas?.data?[index].image?[0]
                                      .toString() ??
                                  '',
                              titles:
                                  snapshot.data?.datas?.data?[index].title ??
                                      '')
                          .visible(index == 0),
                      NewsCard(
                              titles:
                                  snapshot.data?.datas?.data?[index].title ??
                                      '',
                              images: snapshot
                                      .data?.datas?.data?[index].image?[0]
                                      .toString() ??
                                  '')
                          .visible(index != 0),
                    ],
                  ).onTap(() => NewsDetails(
                          newsId:
                              snapshot.data!.datas!.data![index].id.toString())
                      .launch(context));
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}
