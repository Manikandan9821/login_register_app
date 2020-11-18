import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register_app/logics/provider/auth_provider.dart';
import 'package:login_register_app/view/screens/home_screen.dart';
import 'package:login_register_app/view/screens/login_screen.dart';
import 'package:login_register_app/view/screens/register_screen.dart';
import 'package:login_register_app/view/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Login Register using Provider',
        theme: ThemeData(
          primaryColor: Color(0xFFF4325C),
          textTheme: TextTheme(
            headline6: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w800),
            headline1: TextStyle(
                color: Color(0xFFC5A9B4),
                fontSize: 25.0,
                fontWeight: FontWeight.w700),
          ),
        ),

        routes: {
          '/': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
