import 'package:dev_yahia/config/colors.dart';
import 'package:dev_yahia/providers/data_provider.dart';
import 'package:dev_yahia/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        title: 'DevYahia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(
            secondary: AppColors.yellow,
          ),
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme.copyWith(
                  headline1: TextStyle(color: Colors.white),
                  headline2: TextStyle(color: Colors.white),
                  headline3: TextStyle(color: Colors.white),
                  headline4: TextStyle(color: Colors.white),
                  headline5: TextStyle(color: Colors.white),
                  headline6: TextStyle(color: Colors.white),
                  subtitle1: TextStyle(color: Colors.white),
                  subtitle2: TextStyle(color: Colors.white),
                  bodyText1: TextStyle(color: Colors.white),
                  bodyText2: TextStyle(color: Colors.white),
                  caption: TextStyle(color: Colors.white),
                  button: TextStyle(color: Colors.white),
                  overline: TextStyle(color: Colors.white),
                ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: Routes.routes,
      ),
    );
  }
}
