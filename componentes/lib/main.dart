//comando mateapp para crear codigo inicial de flutter
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //configuracionse fecha
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'), // English, no country code
          Locale('es', 'ES'), // Spanish, no country code
        ],
        title: 'Componentes app',
        //home: HomePage()
        initialRoute: '/',
        routes: getAplicationRoutes()
        //<String, WidgetBuilder>{
        //   '/' : (BuildContext context) => const HomePage(),
        //   'alert' : (BuildContext context) => const AlertPage(),
        //   'avatar' : (BuildContext context) => const AvatarPage(),
        // },
        );
  }
}
