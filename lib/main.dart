import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_app/cart_provider.dart';
import 'package:third_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //MultiProvider(providers: [ChangeNotifierProvider(create: (context)=>CartProvider())]) this is used for multiple providers
      create: (context) => CartProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'lato',
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromRGBO(254, 206, 1, 1),
                primary: const Color.fromRGBO(254, 206, 1, 1),
              ),
              appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(fontSize: 20, color: Colors.black)),
              inputDecorationTheme: const InputDecorationTheme(
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
              ),
              textTheme: const TextTheme(
                titleLarge:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                titleMedium:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                bodySmall: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              useMaterial3: true),
          title: "Shopping",
          home: const HomePage()
          // ProductDetail(
          //   product: products[0],
          // )
          ),
    );
  }
}
