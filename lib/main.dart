import 'package:easy_localization/easy_localization.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:spinal_health/core/colors.dart';
import 'package:spinal_health/screens/login/login_cubit/login_cubit.dart';
import 'package:spinal_health/screens/splash/splash_cubit/splash_cubit.dart';
import 'package:spinal_health/screens/splash/splash_screen.dart';
import 'core/bloc_observer.dart';
import 'core/utils/constants/constant.dart';
import 'dio/sh/sh.dart';
import 'lang/codegen_loader.g.dart';
import 'lang/locale_keys.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  await SharedPreferencesHelper.init();
  await EasyLocalization.ensureInitialized();
  // DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en',""),
        Locale('ar',""),
      ],
      path: 'assets/lang',
      saveLocale: true,// <-- change the path of the translation files
      fallbackLocale: const Locale('en',""),
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child:  const MyApp()
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        // BlocProvider(create: (context) => HomeCubit()),
        // BlocProvider(create: (context) =>  CareTipsCubit()..getCareTipsData()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: LocaleKeys.spinalHealth.tr(),
        theme: ThemeData(
          fontFamily: fontApp,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.mainColor,
        ),
         home: const SplashScreen(),
        builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        ),
      ),
    );
  }
}