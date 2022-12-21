import 'package:flutter/material.dart';
import 'package:news_app/Model/News_details_model.dart';
import 'package:news_app/Screen/Reposetory/Auth_repo.dart';
import 'package:news_app/Screen/homepage.dart';
import 'package:news_app/Widget/news_card_widgts.dart';
class NewsDetails extends StatefulWidget {
  const NewsDetails({Key? key,required this.newsId}) : super(key: key);
final String newsId;

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  String description='Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body:FutureBuilder<NewsDetailsModel>(
          future: AuthRepo().getNewsDetails(widget.newsId),
          builder: (_,snapshot){
            if(snapshot.hasData){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    
                    FeaturesNewsCard(images:snapshot.data?.data?.image?[0].toString()??'', titles:snapshot.data?.data?.title ?? ''),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(color: Colors.red),
                            child: Text(snapshot.data?.data?.newsCategory ?? '',style: const TextStyle(color: Colors.white),),
                          ),
                          const Spacer(),
                          Text(snapshot.data?.data?.reporterName ?? '',style: const TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text( snapshot.data?.data?.description ?? '',style: const TextStyle(color: Colors.black,fontSize: 16.0),),
                    ),
                  ],
                ),
              );
            }else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        )
      ),
    );
  }
}
