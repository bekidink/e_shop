import 'package:e_shop/data/repositories/authentication/authentication_rep.dart';
import 'package:e_shop/features/authentication/screens/onboarding.dart';
import 'package:e_shop/firebase_options.dart';
import 'package:e_shop/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/general_binding.dart';

Future<void> main()async {
 final WidgetsBinding widgetsBinding= WidgetsFlutterBinding();
 FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
 await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home:const OnBoardingScreen()
    );
  }
}
