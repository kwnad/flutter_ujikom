import 'package:flutter/material.dart';
import 'package:ujikom/movie/components/movie_discover_component.dart';
import 'package:ujikom/movie/components/movie_now_playing_component.dart';
import 'package:ujikom/movie/components/movie_top_rated_component.dart';
import 'package:ujikom/movie/pages/movie_search_page.dart';

import 'movie_pagination_page.dart';

class MoviePage extends StatefulWidget {
  MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  bool _iconBool = false;

  IconData _iconLight = Icons.nightlight_outlined;

  IconData _iconDark = Icons.light_mode_rounded;

  ThemeData _lightTheme = ThemeData(
    textTheme: TextTheme(displayMedium: TextStyle(color: Colors.white)),
    primarySwatch: Colors.indigo,
    brightness: Brightness.light,
  );

  ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? _darkTheme : _lightTheme,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                  ),
                  const Text('Movie DB'),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _iconBool = !_iconBool;
                      });
                    },
                    icon: Icon(_iconBool ? _iconDark : _iconLight)),
                // IconButton(
                //   onPressed: () => showSearch(
                //     context: context,
                //     delegate: MovieSearchPage(),
                //   ),
                //   icon: const Icon(Icons.search),
                // ),
              ],
              floating: true,
              snap: true,
              centerTitle: true,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            _WidgetTitle(
              title: 'Discover Movies',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MoviePaginationPage(
                      type: TypeMovie.discover,
                    ),
                  ),
                );
              },
            ),
            const MovieDiscoverComponent(),
            _WidgetTitle(
              title: 'Top Rated Movies',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MoviePaginationPage(
                      type: TypeMovie.topRated,
                    ),
                  ),
                );
              },
            ),
            const MovieTopRatedComponent(),
            _WidgetTitle(
              title: 'Now Playing Movies',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MoviePaginationPage(
                      type: TypeMovie.nowPlaying,
                    ),
                  ),
                );
              },
            ),
            const MovieNowPlayingComponent(),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class _WidgetTitle extends SliverToBoxAdapter {
  final String title;
  final void Function() onPressed;

  const _WidgetTitle({required this.title, required this.onPressed});

  @override
  Widget? get child => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                shape: const StadiumBorder(),
                side: const BorderSide(
                  color: Colors.black54,
                ),
              ),
              child: const Text('See All'),
            )
          ],
        ),
      );
}
