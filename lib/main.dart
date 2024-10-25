import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/firebase_options.dart';
import 'package:tamang_food/res/services/controller/all_controller.dart';
import 'package:tamang_food/res/services/controller/consumer_provider.dart';
import 'package:tamang_food/res/services/controller/firebaseControler.dart';
import 'package:tamang_food/res/services/functions/filter_function.dart';
import 'package:tamang_food/utils/routes/routes.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Consumer_Data()),
        ChangeNotifierProvider(create: (context) => AllController()),
        ChangeNotifierProvider(create: (context) => AllFilterFunction()),
        ChangeNotifierProvider(create: (context) => FirebaseControler())
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Tamang Food Service',
          theme: ThemeData(brightness: Brightness.light),
          darkTheme: ThemeData(brightness: Brightness.dark),
          themeMode: ThemeMode.light,
          initialRoute: RouteName.school_homepage,
          onGenerateRoute: AppRoutes.getRoutes,
        ),
        designSize: Size(392, 783),
      ),
    );
  }
}
