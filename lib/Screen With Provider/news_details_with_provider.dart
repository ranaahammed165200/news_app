import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/Model/News_details_model.dart';
import 'package:news_app/Provider/news_provider.dart';
import 'package:news_app/Widget/news_card_widgts.dart';
class NewsDetailsWithProvider extends StatefulWidget {
  const NewsDetailsWithProvider({Key? key,required this.newsId}) : super(key: key);
  final String newsId;

  @override
  State<NewsDetailsWithProvider> createState() => _NewsDetailsWithProviderState();
}

class _NewsDetailsWithProviderState extends State<NewsDetailsWithProvider> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_,ref,watch){
      AsyncValue<NewsDetailsModel>newsDetails=ref.watch(getLatestNewsDetailsProvider(widget.newsId));
      return newsDetails.when(data: (details){    return SingleChildScrollView(
        child: Column(
          children: [

            FeaturesNewsCard(images:details.data?.image?[0].toString()??'', titles:details.data?.title ?? ''),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(color: Colors.red),
                    child: Text(details.data?.newsCategory ?? '',style: const TextStyle(color: Colors.white),),
                  ),
                  const Spacer(),
                  Text(details.data?.reporterName ?? '',style: const TextStyle(color: Colors.black),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(details.data?.description ?? '',style: const TextStyle(color: Colors.black,fontSize: 16.0),),
            ),
          ],
        ),
      );}, error: (e,stack){return Text(e.toString());}, loading:(){
        return Center(child: CircularProgressIndicator(),);
      });
    });
  }
}
