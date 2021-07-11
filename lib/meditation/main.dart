import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:appoint/meditation/constants/theme.dart';
import 'package:appoint/meditation/constants/ui.dart';
import 'package:appoint/meditation/providers/settings_provider.dart';
import 'package:appoint/meditation/utils/utils.dart';
import 'package:appoint/meditation/pages_routes.dart';
import 'package:appoint/meditation/screens/main_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'generated/l10n.dart';

void main() {
  loadLicenses();
  // Ensure services are loaded before the widgets get loaded
  // WidgetsFlutterBinding.ensureInitialized();
  // // Restrict device orientiation to portraitUp
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((_) {
    runApp(
      ProviderScope(
        child: MyAppmedi(),
      ),
    );
  
}

class MyAppmedi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context,
          T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
        final _appState = watch(appStateProvider.state);
        return MaterialApp(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          builder: (context, widget) {
            return ResponsiveWrapper.builder(
              widget,
              maxWidth: 1200,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint(breakpoint: 450, name: MOBILE),
                ResponsiveBreakpoint(
                    breakpoint: 800, name: TABLET /*auto_size_t: true)*/),
                ResponsiveBreakpoint(
                    breakpoint: 1000, name: TABLET),
                ResponsiveBreakpoint(breakpoint: 1200, name: DESKTOP),
                ResponsiveBreakpoint(
                    breakpoint: 2460, name: "4K"),
              ],
              background: Container(
                color: isDark(context) ? bgDark : fgDark,
              ),
            );
          },
          title: appTitle,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: _appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          // home:MainScreen()
          // ignore: missing_return
          onGenerateRoute: (settings) {
            if (settings.name == '/') {
              return PageRoutes.fade(() => MainScreen(
                    startingAnimation: true,
                  ));
            }
          },
        );
      },
    );
  }
}
