import 'package:blood_donor/bindings/general_bindings.dart';
import 'package:blood_donor/utils/constants/colors.dart';
import 'package:blood_donor/utils/constants/text_strings.dart';
import 'package:blood_donor/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: TTexts.appName,
        themeMode: ThemeMode.system,
        initialBinding: GeneralBindings(),
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        // initialBinding: GeneralBindings(),
        home: const Scaffold(
          backgroundColor: TColors.primary,
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ));
  }
}
