import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/Screen/Reposetory/Auth_repo.dart';

final getlatestNewsProvider=FutureProvider((ref) => AuthRepo().getNews());
final getLatestNewsDetailsProvider=FutureProvider.family((ref,newsId) => AuthRepo().getNewsDetails(newsId.toString()));