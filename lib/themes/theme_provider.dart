import 'package:flutter/material.dart';

// class ThemeProvider extends  ChangeNotifier{
//
//   ThemeData? _themeData;
//   bool? isDark;
//   ThemeProvider(isDark){
//     _themeData=isDark?ThemeData.dark():ThemeData.light();
//   }
//   getTheme()=>_themeData;
//
//   setTheme(ThemeData theme){
//     _themeData=theme;
//     notifyListeners();
//   }
//   notifyListeners();
//
// // }
// class ThemeProvider with ChangeNotifier {
//   ThemeData? themeData=ThemeData.dark();
//   get geTheme=> themeData;
//
//   void toggleTheme() {
//    final isDark=themeData==ThemeData.dark();
//     if( isDark){
//         themeData=ThemeData.light();
//     }
//     else{
//       themeData=ThemeData.dark();
//
//     }
//
//  }
//
// }

// class ThemeProvider extends ChangeNotifier{
//   ThemeData? _lightThemeData;
//   ThemeData? _darkThemeData;
//   ThemeMode themeMode;
//   ThemeProvider(this.themeMode,this._darkThemeData,this._lightThemeData);
//
//
//       setTheme(ThemeMode themeMode){
//       this.themeMode=themeMode;
//      }
//
//      ThemeData? get getThemeData{
//         if(themeMode==ThemeMode.dark) {
//           return _darkThemeData;
//         }else{
//           return _lightThemeData;
//         }
//
//      }
//      ThemeMode get getThemeMode=>themeMode;
//       setThemeMode(ThemeMode themeMode){
//          this.themeMode=themeMode;
//          notifyListeners();
//       }
//
//
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

// class ThemeNotifier extends ChangeNotifier {
//   final String key = "theme";
//   SharedPreferences? _prefs;
//   bool _darkTheme=false;
//
//   bool get darkTheme => _darkTheme;
//
//   ThemeNotifier() {
//     _darkTheme = false;
//     _loadTheme();
//   }
//
//     toggleTheme() {
//     _darkTheme = !_darkTheme;
//     _saveTheme();
//     notifyListeners();
//   }
//
//   _initializePrefs() async {
//     if (_prefs == null) {
//       _prefs = await SharedPreferences.getInstance();
//     }
//   }
//
//   _loadTheme() async {
//     await _initializePrefs();
//     _darkTheme = _prefs?.getBool(key) ?? false;
//     notifyListeners();
//   }
//
//   _saveTheme() async {
//     await _initializePrefs();
//     _prefs?.setBool(key, _darkTheme);
//   }
// }

class DarkThemee {
  static ThemeData getTheme() {
    return ThemeData.dark().copyWith(
      // errorColor: blackColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.black,
      //  backgroundColor: containerColorForBlack,
      hintColor: Colors.grey,
      secondaryHeaderColor: containerColorForBlack,
      cardColor: buttonColorForBlack,
      shadowColor: Colors.black,
      // colorScheme: ColorScheme(
      //     brightness: Brightness.dark, primary: Colors.white,
      //     onPrimary: Colors.white, secondary: Colors.white,
      //     onSecondary: Colors.white, error: Colors.white,
      //     onError: Colors.white, background: Colors.white,
      //     onBackground: Colors.white, surface: Colors.white,
      //     onSurface: Colors.white)
      // ...
    );
  }
}

class LightThemee {
  static ThemeData getTheme() {
    return ThemeData.light().copyWith(
      // errorColor: appBarColor,
      shadowColor: Colors.black,
      secondaryHeaderColor: Colors.white,
      hintColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarColor,
      ),
      // Customize the light theme colors here
      // backgroundColor:Colors.white,
      scaffoldBackgroundColor: backgroundColorForLightMode,
      cardColor: buttonColorForBlack,

      //   colorScheme: ColorScheme(
      //       brightness: Brightness.light, primary: Colors.white,
      //       onPrimary: Colors.black, secondary:Colors.black,
      //       onSecondary: Colors.black, error: Colors.black,
      //       onError:Colors.black, background:Colors.black,
      //       onBackground: Colors.black, surface: Colors.black,
      //       onSurface: Colors.black,)
      // // ...

      // ...
    );
  }
}

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _prefs;
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _loadTheme();
  }

  _loadTheme() async {
    await _initializePrefs();
    _darkTheme = _prefs?.getBool(key) ?? false;
    notifyListeners();
  }

  _saveTheme() async {
    await _initializePrefs();
    _prefs?.setBool(key, _darkTheme);
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveTheme();
    notifyListeners();
  }

  _initializePrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }
}
