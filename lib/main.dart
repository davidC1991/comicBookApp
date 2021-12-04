import 'package:comic_book_app/services/warning_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




import 'package:comic_book_app/routes/routes.dart';

import 'package:comic_book_app/services/comic_provider.dart';
import 'package:comic_book_app/services/mode_presentation_provider.dart';
import 'package:comic_book_app/services/filter_provider.dart';
import 'package:comic_book_app/services/layout_provider.dart';
void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ComicsProvider(), lazy: false),
        ChangeNotifierProvider(create: ( _ ) => ModePresentation()),
        ChangeNotifierProvider(create: ( _ ) => FilterProvider()),
        ChangeNotifierProvider(create: ( _ ) => LayoutProvier()),
        ChangeNotifierProvider(create: ( _ ) => WarningProvider())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comic Book',
      initialRoute: 'home',
      routes: app_routes,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        primaryColor: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400),
          headline2: TextStyle(color: Colors.black54, fontSize: 12.0),
          headline3: TextStyle(color: Colors.black54, fontSize: 20.0),
          headline4: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
          headline5: TextStyle(color: Colors.green[800], fontSize: 14.0, fontWeight: FontWeight.w400),
        ),  
        appBarTheme:  AppBarTheme(
          color: Colors.grey[300]
        )
      ),
      // home: OrientationBuilder(
      //   builder: ( BuildContext context, Orientation orientation){
      //     final screenSize = MediaQuery.of(context).size;
      //     if( screenSize.width > 500){
      //         WidgetsBinding.instance!.addPostFrameCallback((_){
      //           layoutProvider.stateScreenIsTable = true;
      //         });
      //       return HomeScreen_tablet();
      //     }else{
      //         WidgetsBinding.instance!.addPostFrameCallback((_){
      //           layoutProvider.stateScreenIsTable = false;
      //         });
      //       return HomeScreen();
      //     }
      //   }
      //  ) 
    );
  }
}



      
   
