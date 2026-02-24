

import 'package:movies/utitities/app_assets.dart';

class Onboarding {
  final String image;
  final String title;
  final String description;

  Onboarding({
    required this.image,
    required this.title,
    required this.description,
  });
}

final  setUpDetails = Onboarding(
    image: AppAssets.onBoard1,
    title: 'Find Your Next Favorite Movie Here',
    description: 'Get access to a huge library of movies to suit all tastes. You will surely like it',
);


final List<Onboarding> onboardingPages = [
  Onboarding(
    image: AppAssets.onBoard2,
    title: 'Discover Movies',
    description: 'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
  ),

  Onboarding(
    image: AppAssets.onBoard3,
    title: 'Explore All Genres',
    description: 'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
  ),

    Onboarding(
    image: AppAssets.onBoard4,
    title: 'Create Watchlists',
    description: 'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
  ),

    Onboarding(
    image: AppAssets.onBoard5,
    title: 'Rate, Review, and Learn',
    description: "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
  ),

    Onboarding(
    image: AppAssets.onBoard6,
    title: 'Start Watching Now',
    description: '',
  ),
];
