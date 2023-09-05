

import 'package:addisbiz/pages/main_page.dart';
import 'package:addisbiz/themes/light_them.dart';
import 'package:addisbiz/pages/companyinfo.dart';
import 'package:addisbiz/pages/companylist.dart';
import 'package:addisbiz/themes/theme_provider.dart';
import 'package:addisbiz/widgets/subcatagories_widget.dart';
import 'package:flutter/material.dart';
import 'package:addisbiz/pages/homepage.dart';
import 'package:addisbiz/pages/accomodation.dart';
import 'package:provider/provider.dart';
import 'package:addisbiz/widgets/subcatagories_widget.dart';
import 'themes/dark_them.dart';
//
// void main() {
//   runApp(
//       MyApp()
//
//   );
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//         return ChangeNotifierProvider<ThemeProvider>(
//          create: (context)=>ThemeProvider(
//            ThemeMode.light,
//            DarkTheme.darkTheme,
//            LightTheme.lightTheme
//              ),
//
//           child: Builder(
//             builder: (context) {
//               final  themeProvider=Provider.of<ThemeProvider>(context,listen: false);
//               return MaterialApp(
//
//                 // themeMode: themeProvider.themeMode,
//                 // // theme: LightTheme.lightTheme,
//                 // darkTheme: DarkTheme.darkTheme,
//                 // theme: themeProvider.getTheme(),
//                 // theme: themeProvider.getThemeData,
//                   theme: ThemeData.light(),
//                   darkTheme: ThemeData.dark(),
//                 debugShowCheckedModeBanner: false,
//                 home: HomePage(),
//                 routes:{
//                   "/page1":(context)=>Accomodation(),
//                   // "/company":(context)=>CompanyList(),
//                   "/companyinfo":(context)=>CompanyInfo(),
//                   "/companylist":(context)=>CompanyList(),
//                 }
//               );
//             }
//           ),
//         );
//
//
//   }
//
// }




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, notifier, child) {
          return MaterialApp(
            title: 'App Theme Example',
            theme: notifier.darkTheme ? DarkThemee.getTheme() : LightThemee.getTheme(),
            home: MainPage(),
              debugShowCheckedModeBanner: false,
                            routes:{
                "/page1":(context)=>ScreenDesign(),
                  // "/company":(context)=>CompanyList(),
                  "/companyinfo":(context)=>CompanyInfo(),
                  "/companylist":(context)=>CompanyList(),
                }
          );
        },
      ),
    );
  }
}
//