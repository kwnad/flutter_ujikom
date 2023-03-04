import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:ujikom/binding/binding.dart';
import 'package:ujikom/injector.dart';
import 'package:ujikom/movie/pages/movie_page.dart';
import 'package:ujikom/movie/providers/movie_get_discover_provider.dart';
import 'package:ujikom/movie/providers/movie_get_now_playing_provider.dart';
import 'package:ujikom/movie/providers/movie_get_top_rated_provider.dart';
import 'package:ujikom/splashscreen/splash_screen_logo.dart';

import 'movie/providers/movie_serach_provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GetStorage.init();

  setup();
  runApp(const App());
  FlutterNativeSplash.remove();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetDiscoverProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetTopRatedProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetNowPlayingProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieSearchProvider>(),
        ),
      ],
      child: GetMaterialApp(
        
        title: 'Movie DB',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: const SplashLogo(),
        initialBinding: HomeBinding(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
