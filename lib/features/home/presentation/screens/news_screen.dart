import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_digi/features/home/data/model/top_headlines_model.dart';
import 'package:news_app_digi/features/home/domain/services/services.dart';
import 'package:news_app_digi/features/home/presentation/news_bloc/cubit/get_news_cubit.dart';
import 'package:news_app_digi/features/home/presentation/widgets/articale_card_widget.dart';

class NewsScreen extends StatelessWidget {
   NewsScreen( {super.key, this.topHeadlinesModel});
  final TopHeadlinesModel? topHeadlinesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE9EEFA),
        toolbarHeight: 120.h,
        title: Text(
          "explore",
          style: TextStyle(
            fontSize: 24.sp,
            color: const Color(0xff231F20),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Color(0xff231F20)),
          ),
        ],
      ),
      body: BlocBuilder<GetNewsCubit, GetNewsState>(
        builder: (context, state) {
          if (state is GetNewsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }

          if (state is GetNewsError) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is GetNewsSuccess) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ListView.builder(
                      itemCount: state.topHeadlinesModel.articles.length,
                      itemBuilder: (context, index) {
                        Article article = state.topHeadlinesModel.articles[index];
                        return ArticleCardWidget(
                          title: article.title,
                          authorName: article.author ?? "",
                          date: article.publishedAt.day.toString(),
                          imageUrl: article.urlToImage,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }

          return Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}
