import 'package:flutter/material.dart';
import 'package:movies/utitities/app_colors.dart';
import 'package:movies/utitities/app_styles.dart';
import 'package:movies/utitities/conext_extentions.dart';

class MovieCard extends StatelessWidget {
  final String imagePath;
  final String rating;

  const MovieCard({
    super.key,
    required this.imagePath,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h *0.4,
      width: context.w *0.3,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: context.w * 0.02,
              top: context.h * 0.01,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.w * 0.02,
              vertical: context.h * 0.01,
            ),
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  rating,
                  style: AppStyles.robotoRegular16White,
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.star_rate_rounded,
                  color: AppColors.yellow,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}