import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:appoint/meditation/constants/quotes.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:appoint/meditation/model/quote.dart';
import 'package:appoint/meditation/providers/settings_provider.dart';

/// Loads the licenses and attributions used by this project
void loadLicenses() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/v_OFL.txt');
    yield LicenseEntryWithLineBreaks(['Varela Round Font'], license);

    final license2 = await rootBundle.loadString('google_fonts/m_OFL.txt');
    yield LicenseEntryWithLineBreaks(['Montserrat'], license2);

    final license3 = 'https://icons8.com';
    yield LicenseEntryWithLineBreaks(['Illustration by Ouch.pics'], license3);
  });
}

/// Determine if its currently dark or light mode
bool isDark(BuildContext context) {
  return context.read(appStateProvider.state).isDarkMode;
}

/// A function that returns a random quote from [kDefaultQuotes]
Quote getQuote(BuildContext context) {
  var r = Random(DateTime.now().millisecondsSinceEpoch);
  final quotes = kDefaultQuotes(context);
  var randInt = r.nextInt(quotes.length);
  return quotes[randInt];
}
