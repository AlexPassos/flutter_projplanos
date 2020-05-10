import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  MaterialColor primaryColorShades = MaterialColor(
    0xFF98191C,
    <int, Color>{
      50: Color(0xFFA4A4BF),
      100: Color(0xFFA4A4BF),
      200: Color(0xFFA4A4BF),
      300: Color(0xFF9191B3),
      400: Color(0xFF7F7FA6),
      500: Color(0xFF181861),
      600: Color(0xFF6D6D99),
      700: Color(0xFF5B5B8D),
      800: Color(0xFF494980),
      900: Color(0xFF181861),
    },
  );

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        navigatorKey: Modular.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Planos',
        theme: ThemeData(
          primarySwatch: primaryColorShades,
        ),
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
      
    );
  }
}
