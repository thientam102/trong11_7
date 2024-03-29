import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appoint/meditation/constants/preset_timers.dart';
import 'package:appoint/meditation/constants/theme.dart';
import 'package:appoint/meditation/constants/ui.dart';
import 'package:appoint/meditation/generated/l10n.dart';
import 'package:appoint/meditation/pages_routes.dart';
import 'package:appoint/meditation/providers/settings_provider.dart';
import 'package:appoint/meditation/screens/about_screen.dart';
import 'package:appoint/meditation/screens/meditation_screen.dart';
import 'package:appoint/meditation/widgets/dark_mode_switcher.dart';
import 'package:appoint/meditation/widgets/settings_card.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  MainScreen({this.startingAnimation = false, Key key}) : super(key: key);

  /// Determins if the starting animation should be played. It should only be played when the app is first launched from quit.
  final bool startingAnimation;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  AnimationController _scaffold;
  AnimationController _logo;
  Animation<Offset> _animation;
  Animation<Offset> _logoAnimation;

  @override
  void initState() {
    super.initState();

    _scaffold = AnimationController(
        vsync: this,
        value: widget.startingAnimation ? 0.0 : 1.0,
        duration: Duration(milliseconds: 1800));
    _logo = AnimationController(
        vsync: this,
        value: widget.startingAnimation ? 0.0 : 1.0,
        duration: Duration(milliseconds: 1800));
    _animation =
        Tween<Offset>(begin: Offset(0, 0.25), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _scaffold, curve: Curves.easeOutQuart),
    );

    _logoAnimation =
        Tween<Offset>(begin: Offset(0, 0.65), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _logo,
        curve: Interval(
          0.25,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );

    if (widget.startingAnimation) {
      _scaffold.forward();
      _logo.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox.shrink(),
          actions: [
            DarkModeSwitcher(),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              Expanded(
                child: SlideTransition(
                  position: _logoAnimation,
                  child: SvgPicture.asset(
                    'assets/asset/images/lotus.svg',
                    semanticsLabel: '$appTitle logo',
                    color: accent,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Text(
                      appTitle,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      S.of(context).tagline,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    IconButton(
                        icon: Icon(
                          Feather.info,
                          color: Theme.of(context)
                              .iconTheme
                              .color
                              .withOpacity(0.25),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(PageRoutes.slide(
                              () => AboutScreen(),
                              startOffset: Offset(0, 1),
                              milliseconds: 580));
                        }),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: <Widget>[
                      SettingsCard(
                        start: true,
                        title: Text(
                          S.of(context).durationSettingLabel,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        leading: Icon(Ionicons.ios_hourglass),
                        trailing: Consumer(
                          builder: (BuildContext context,
                              T Function<T>(ProviderBase<Object, T>) watch,
                              Widget child) {
                            final _appState = watch(appStateProvider.state);
                            return DropdownButton<Duration>(
                              underline: Container(),
                              items: kPresetTimers.map((preset) {
                                return DropdownMenuItem<Duration>(
                                  value: preset,
                                  child: Text(
                                    S
                                        .of(context)
                                        .presetDuration(preset.inMinutes),
                                    textAlign: TextAlign.right,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                );
                              }).toList(),
                              value: _appState.duration,
                              onChanged: (value) {
                                context
                                    .read(appStateProvider)
                                    .setDuration(value);
                              },
                            );
                          },
                        ),
                      ),
                      SettingsCard(
                        title: Text(
                          S.of(context).playSoundSettingLabel,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        leading: Icon(Ionicons.ios_musical_note),
                        trailing: Consumer(
                          builder: (BuildContext context, ScopedReader watch,
                              Widget child) {
                            final _appState = watch(appStateProvider.state);
                            return cupertino.CupertinoSwitch(
                              activeColor: accent,
                              onChanged: (value) {
                                context
                                    .read(appStateProvider)
                                    .togglePlaySounds();
                              },
                              value: _appState.playSounds,
                            );
                          },
                        ),
                      ),
                      SettingsCard(
                        end: true,
                        title: Text(
                          S.of(context).zenModeSettingLabel,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        leading: Icon(Ionicons.ios_heart),
                        // ignore: missing_required_param
                        trailing: Consumer(
                          builder: (BuildContext context, ScopedReader watch,
                              Widget child) {
                            final _appState = watch(appStateProvider.state);
                            return cupertino.CupertinoSwitch(
                              activeColor: accent,
                              onChanged: (_) {
                                context.read(appStateProvider).toggleZenMode();
                              },
                              value: _appState.isZenMode,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(68.0),
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      Navigator.of(context).push(PageRoutes.fade(
                          () => MeditationScreen(),
                          milliseconds: 300));
                    },
                    child: Text(
                      S.of(context).beginButton.toUpperCase(),
                      style: GoogleFonts.varelaRound(
                        color: fgDark,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ).padding(all: 18.0),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
