import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app/Model/News_model.dart';
import 'package:news_app/Provider/news_provider.dart';
import 'package:news_app/Screen/news_details.dart';
import 'package:news_app/Widget/news_card_widgts.dart';

import '../Screen/Reposetory/Auth_repo.dart';
class HomeScreeWithProvider extends StatefulWidget {
  const HomeScreeWithProvider({Key? key}) : super(key: key);

  @override
  State<HomeScreeWithProvider> createState() => _HomeScreeWithProviderState();
}

class _HomeScreeWithProviderState extends State<HomeScreeWithProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Consumer(builder: (_,ref,watch){
          AsyncValue<NewsModel> latestNews=ref.watch(getlatestNewsProvider);
          return latestNews.when(data: (news){return  ListView.builder(
              itemCount: news.datas?.data?.length??0,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    FeaturesNewsCard(images:news.datas?.data?[index].image?[0]. toString() ?? '', titles: news.datas?.data?[index].title ?? '').visible(index==0),
                    NewsCard(titles: news.datas?.data?[index].title ?? '', images: news.datas?.data?[index].image?[0]. toString() ?? '').visible(index!=0),
                  ],
                ).onTap(()=>NewsDetails(newsId:news.datas!.data![index].id.toString()).launch(context));
              });}, error: (e,stack){return Center(child: Text(e.toString()));}, loading:(){
            return const Center(child: CircularProgressIndicator(),);
          });
        })
    );;
  }
}
