import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_stacked_sliver_app_bar/services/api_service.dart';
import 'package:test_stacked_sliver_app_bar/ui/home_page/home_view.dart';

final getIt = GetIt.instance;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton(() {
    return ApiService();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
