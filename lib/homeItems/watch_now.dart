import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Model/movie.dart';
import 'package:movies/provider/geners_cudit.dart';
import 'package:movies/utitities/app_colors.dart';
import 'package:movies/utitities/app_styles.dart';
import 'package:movies/utitities/conext_extentions.dart';
import 'package:movies/widgets/movie_card.dart';

class WatchNow extends StatelessWidget {
  const WatchNow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresCubit, Map<String, List<Movie>>>(
      builder: (context, genresMovies) {
        if (genresMovies.isEmpty) {
          return const Center(child: CircularProgressIndicator(color: AppColors.yellow,));
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.w * 0.04),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: genresMovies.length,
            itemBuilder: (context, index) {
              String genre = genresMovies.keys.elementAt(index);
              List<Movie> movies = genresMovies[genre]!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(genre,style: AppStyles.robotoRegular16White,),
                      TextButton.icon(
                        icon: Icon(Icons.arrow_forward,color: AppColors.yellow,),
                        iconAlignment: IconAlignment.end,
                        onPressed: () {},
                        label: Text("See More",style: AppStyles.robotoRegular14Yellow,),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: context.w*0.015,);
                      },
                      itemBuilder: (context, movieIndex) {
                        var movie = movies[movieIndex];
                        return MovieCard(
                          imagePath: movie.backgroundImageOriginal!,
                          rating: movie.rating?.toString() ?? "0",
                        );
                      },
                    ),
                  ),
                  SizedBox(height: context.h*0.02,)
                ],
              );
            },
          ),
        );
      },
    );
  }
}