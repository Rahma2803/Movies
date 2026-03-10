import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Model/movie.dart';
import 'package:movies/homeItems/watch_now.dart';
import 'package:movies/provider/movies_cubit.dart';
import 'package:movies/utitities/app_assets.dart';
import 'package:movies/utitities/conext_extentions.dart';
import 'package:movies/widgets/custom_carrsoul.dart';
import 'package:movies/widgets/movie_card.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => MoviesCubit()..loadMovies(),
  child: SingleChildScrollView(
    child: Column(
      children: [

        Image.asset(AppAssets.availableNow),

        BlocBuilder<MoviesCubit, List<Movie>>(
          builder: (context, movies) {
            if (movies.isEmpty) {
              return const CircularProgressIndicator();
            }

            return SizedBox(
              height: context.h * 0.35,
              child: CustomCarousel(
                items: movies.map((movie) {
                  return MovieCard(
                    imagePath: movie.mediumCoverImage ?? "",
                    rating: movie.rating.toString(),
                  );
                }).toList(),
                autoPlay: true,
                onPressed: () {},
                onPageChanged: (index) {
                  context.read<MoviesCubit>().changeIndex(index);
                },
              ),
            );
          },
        ),

        Image.asset(AppAssets.watchNow),

        WatchNow()
      ],
    ),
  ),
);
      }
    }