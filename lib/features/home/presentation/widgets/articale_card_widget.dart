import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleCardWidget extends StatelessWidget {
  final String title;
  final String authorName;
  final String date;
  final String? imageUrl;
  const ArticleCardWidget({
    super.key,
    required this.title,
    required this.authorName,
    required this.date,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(child: Text("$authorName . $date")),
              ],
            ),
          ),
          SizedBox(
            width: 112.w,
            height: 80.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl:
                    imageUrl ??
                    "https://static.toiimg.com/photo/msid-109960309/109960309.jpg",
                height: 206.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
