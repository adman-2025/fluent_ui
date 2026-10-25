import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'fluent_localizations_af.dart';
import 'fluent_localizations_am.dart';
import 'fluent_localizations_ar.dart';
import 'fluent_localizations_as.dart';
import 'fluent_localizations_az.dart';
import 'fluent_localizations_be.dart';
import 'fluent_localizations_bg.dart';
import 'fluent_localizations_bn.dart';
import 'fluent_localizations_bo.dart';
import 'fluent_localizations_bs.dart';
import 'fluent_localizations_ca.dart';
import 'fluent_localizations_cs.dart';
import 'fluent_localizations_cy.dart';
import 'fluent_localizations_da.dart';
import 'fluent_localizations_de.dart';
import 'fluent_localizations_el.dart';
import 'fluent_localizations_en.dart';
import 'fluent_localizations_es.dart';
import 'fluent_localizations_et.dart';
import 'fluent_localizations_eu.dart';
import 'fluent_localizations_fa.dart';
import 'fluent_localizations_fi.dart';
import 'fluent_localizations_fil.dart';
import 'fluent_localizations_fr.dart';
import 'fluent_localizations_ga.dart';
import 'fluent_localizations_gl.dart';
import 'fluent_localizations_gsw.dart';
import 'fluent_localizations_gu.dart';
import 'fluent_localizations_he.dart';
import 'fluent_localizations_hi.dart';
import 'fluent_localizations_hr.dart';
import 'fluent_localizations_hu.dart';
import 'fluent_localizations_hy.dart';
import 'fluent_localizations_id.dart';
import 'fluent_localizations_is.dart';
import 'fluent_localizations_it.dart';
import 'fluent_localizations_ja.dart';
import 'fluent_localizations_ka.dart';
import 'fluent_localizations_kk.dart';
import 'fluent_localizations_km.dart';
import 'fluent_localizations_kn.dart';
import 'fluent_localizations_ko.dart';
import 'fluent_localizations_ky.dart';
import 'fluent_localizations_lo.dart';
import 'fluent_localizations_lt.dart';
import 'fluent_localizations_lv.dart';
import 'fluent_localizations_mk.dart';
import 'fluent_localizations_ml.dart';
import 'fluent_localizations_mn.dart';
import 'fluent_localizations_mr.dart';
import 'fluent_localizations_ms.dart';
import 'fluent_localizations_my.dart';
import 'fluent_localizations_nb.dart';
import 'fluent_localizations_ne.dart';
import 'fluent_localizations_nl.dart';
import 'fluent_localizations_no.dart';
import 'fluent_localizations_or.dart';
import 'fluent_localizations_pa.dart';
import 'fluent_localizations_pl.dart';
import 'fluent_localizations_ps.dart';
import 'fluent_localizations_pt.dart';
import 'fluent_localizations_ro.dart';
import 'fluent_localizations_ru.dart';
import 'fluent_localizations_si.dart';
import 'fluent_localizations_sk.dart';
import 'fluent_localizations_sl.dart';
import 'fluent_localizations_sq.dart';
import 'fluent_localizations_sr.dart';
import 'fluent_localizations_sv.dart';
import 'fluent_localizations_sw.dart';
import 'fluent_localizations_ta.dart';
import 'fluent_localizations_te.dart';
import 'fluent_localizations_th.dart';
import 'fluent_localizations_tl.dart';
import 'fluent_localizations_tr.dart';
import 'fluent_localizations_ug.dart';
import 'fluent_localizations_uk.dart';
import 'fluent_localizations_ur.dart';
import 'fluent_localizations_uz.dart';
import 'fluent_localizations_vi.dart';
import 'fluent_localizations_zh.dart';
import 'fluent_localizations_zu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of FluentLocalizations
/// returned by `FluentLocalizations.of(context)`.
///
/// Applications need to include `FluentLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/fluent_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: FluentLocalizations.localizationsDelegates,
///   supportedLocales: FluentLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the FluentLocalizations.supportedLocales
/// property.
abstract class FluentLocalizations {
  FluentLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static FluentLocalizations of(BuildContext context) {
    return Localizations.of<FluentLocalizations>(context, FluentLocalizations)!;
  }

  static const LocalizationsDelegate<FluentLocalizations> delegate =
      _FluentLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('af'),
    Locale('am'),
    Locale('ar'),
    Locale('as'),
    Locale('az'),
    Locale('be'),
    Locale('bg'),
    Locale('bn'),
    Locale('bo'),
    Locale('bs'),
    Locale('ca'),
    Locale('cs'),
    Locale('cy'),
    Locale('da'),
    Locale('de'),
    Locale('de', 'CH'),
    Locale('el'),
    Locale('en', 'AU'),
    Locale('en', 'CA'),
    Locale('en', 'GB'),
    Locale('en', 'IE'),
    Locale('en', 'IN'),
    Locale('en', 'NZ'),
    Locale('en', 'SG'),
    Locale('en', 'ZA'),
    Locale('es'),
    Locale('et'),
    Locale('eu'),
    Locale('fa'),
    Locale('fi'),
    Locale('fil'),
    Locale('fr'),
    Locale('ga'),
    Locale('gl'),
    Locale('gsw'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('hy'),
    Locale('id'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('kk'),
    Locale('km'),
    Locale('kn'),
    Locale('ko'),
    Locale('ky'),
    Locale('lo'),
    Locale('lt'),
    Locale('lv'),
    Locale('mk'),
    Locale('ml'),
    Locale('mn'),
    Locale('mr'),
    Locale('ms'),
    Locale('my'),
    Locale('nb'),
    Locale('ne'),
    Locale('nl'),
    Locale('no'),
    Locale('or'),
    Locale('pa'),
    Locale('pl'),
    Locale('ps'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('pt', 'PT'),
    Locale('ro'),
    Locale('ru'),
    Locale('si'),
    Locale('sk'),
    Locale('sl'),
    Locale('sq'),
    Locale('sr'),
    Locale.fromSubtags(languageCode: 'sr', scriptCode: 'Latn'),
    Locale('sv'),
    Locale('sw'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tl'),
    Locale('tr'),
    Locale('ug'),
    Locale('uk'),
    Locale('ur'),
    Locale('uz'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    Locale('zu'),
  ];

  /// No description provided for @backButtonTooltip.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButtonTooltip;

  /// No description provided for @closeButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeButtonLabel;

  /// No description provided for @searchLabel.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchLabel;

  /// No description provided for @closeNavigationTooltip.
  ///
  /// In en, this message translates to:
  /// **'Close Navigation'**
  String get closeNavigationTooltip;

  /// No description provided for @openNavigationTooltip.
  ///
  /// In en, this message translates to:
  /// **'Open Navigation'**
  String get openNavigationTooltip;

  /// No description provided for @clickToSearch.
  ///
  /// In en, this message translates to:
  /// **'Click to search'**
  String get clickToSearch;

  /// No description provided for @modalBarrierDismissLabel.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get modalBarrierDismissLabel;

  /// No description provided for @minimizeWindowTooltip.
  ///
  /// In en, this message translates to:
  /// **'Minimize'**
  String get minimizeWindowTooltip;

  /// No description provided for @restoreWindowTooltip.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restoreWindowTooltip;

  /// No description provided for @closeWindowTooltip.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeWindowTooltip;

  /// No description provided for @dialogLabel.
  ///
  /// In en, this message translates to:
  /// **'Dialog'**
  String get dialogLabel;

  /// No description provided for @cutActionLabel.
  ///
  /// In en, this message translates to:
  /// **'Cut'**
  String get cutActionLabel;

  /// No description provided for @copyActionLabel.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copyActionLabel;

  /// No description provided for @pasteActionLabel.
  ///
  /// In en, this message translates to:
  /// **'Paste'**
  String get pasteActionLabel;

  /// No description provided for @selectAllActionLabel.
  ///
  /// In en, this message translates to:
  /// **'Select all'**
  String get selectAllActionLabel;

  /// No description provided for @undoActionLabel.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undoActionLabel;

  /// No description provided for @newTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Add new tab'**
  String get newTabLabel;

  /// No description provided for @closeTabLabelSuffix.
  ///
  /// In en, this message translates to:
  /// **'Close tab'**
  String get closeTabLabelSuffix;

  /// No description provided for @scrollTabBackwardLabel.
  ///
  /// In en, this message translates to:
  /// **'Scroll tab list backward'**
  String get scrollTabBackwardLabel;

  /// No description provided for @scrollTabForwardLabel.
  ///
  /// In en, this message translates to:
  /// **'Scroll tab list forward'**
  String get scrollTabForwardLabel;

  /// No description provided for @noResultsFoundLabel.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFoundLabel;

  /// No description provided for @copyActionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy the selected content to the clipboard'**
  String get copyActionTooltip;

  /// No description provided for @cutActionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove the selected content and put it in the clipboard'**
  String get cutActionTooltip;

  /// No description provided for @pasteActionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Inserts the contents of the clipboard at the current location'**
  String get pasteActionTooltip;

  /// No description provided for @selectAllActionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Select all content'**
  String get selectAllActionTooltip;

  /// No description provided for @undoActionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Undo the last action'**
  String get undoActionTooltip;

  /// No description provided for @hour.
  ///
  /// In en, this message translates to:
  /// **'hour'**
  String get hour;

  /// No description provided for @minute.
  ///
  /// In en, this message translates to:
  /// **'minute'**
  String get minute;

  /// No description provided for @am.
  ///
  /// In en, this message translates to:
  /// **'AM'**
  String get am;

  /// No description provided for @pm.
  ///
  /// In en, this message translates to:
  /// **'PM'**
  String get pm;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get month;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get day;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get year;

  /// No description provided for @pickADate.
  ///
  /// In en, this message translates to:
  /// **'Pick a date'**
  String get pickADate;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get seeMore;

  /// No description provided for @seeLess.
  ///
  /// In en, this message translates to:
  /// **'See less'**
  String get seeLess;

  /// No description provided for @redLabel.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get redLabel;

  /// No description provided for @greenLabel.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get greenLabel;

  /// No description provided for @blueLabel.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get blueLabel;

  /// No description provided for @opacityLabel.
  ///
  /// In en, this message translates to:
  /// **'Opacity'**
  String get opacityLabel;

  /// No description provided for @hueLabel.
  ///
  /// In en, this message translates to:
  /// **'Hue'**
  String get hueLabel;

  /// No description provided for @saturationLabel.
  ///
  /// In en, this message translates to:
  /// **'Saturation'**
  String get saturationLabel;

  /// No description provided for @valueLabel.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get valueLabel;

  /// No description provided for @moreText.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get moreText;

  /// No description provided for @lessText.
  ///
  /// In en, this message translates to:
  /// **'Less'**
  String get lessText;

  /// No description provided for @valueSliderTooltip.
  ///
  /// In en, this message translates to:
  /// **'Value {value} ({colorName})'**
  String valueSliderTooltip(int value, String colorName);

  /// No description provided for @alphaSliderTooltip.
  ///
  /// In en, this message translates to:
  /// **'{value}% opacity'**
  String alphaSliderTooltip(int value);

  /// No description provided for @colorBlack.
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get colorBlack;

  /// No description provided for @colorNavy.
  ///
  /// In en, this message translates to:
  /// **'Dark blue'**
  String get colorNavy;

  /// No description provided for @colorDarkBlue.
  ///
  /// In en, this message translates to:
  /// **'Dark blue'**
  String get colorDarkBlue;

  /// No description provided for @colorMediumBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get colorMediumBlue;

  /// No description provided for @colorBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get colorBlue;

  /// No description provided for @colorDarkGreen.
  ///
  /// In en, this message translates to:
  /// **'Dark green'**
  String get colorDarkGreen;

  /// No description provided for @colorGreen.
  ///
  /// In en, this message translates to:
  /// **'Dark green'**
  String get colorGreen;

  /// No description provided for @colorTeal.
  ///
  /// In en, this message translates to:
  /// **'Dark teal'**
  String get colorTeal;

  /// No description provided for @colorDarkCyan.
  ///
  /// In en, this message translates to:
  /// **'Dark teal'**
  String get colorDarkCyan;

  /// No description provided for @colorDeepSkyBlue.
  ///
  /// In en, this message translates to:
  /// **'Turquoise'**
  String get colorDeepSkyBlue;

  /// No description provided for @colorDarkTurquoise.
  ///
  /// In en, this message translates to:
  /// **'Aqua'**
  String get colorDarkTurquoise;

  /// No description provided for @colorMediumSpringGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorMediumSpringGreen;

  /// No description provided for @colorLime.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorLime;

  /// No description provided for @colorSpringGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorSpringGreen;

  /// No description provided for @colorCyan.
  ///
  /// In en, this message translates to:
  /// **'Aqua'**
  String get colorCyan;

  /// No description provided for @colorMidnightBlue.
  ///
  /// In en, this message translates to:
  /// **'Dark blue'**
  String get colorMidnightBlue;

  /// No description provided for @colorDodgerBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get colorDodgerBlue;

  /// No description provided for @colorLightSeaGreen.
  ///
  /// In en, this message translates to:
  /// **'Teal'**
  String get colorLightSeaGreen;

  /// No description provided for @colorForestGreen.
  ///
  /// In en, this message translates to:
  /// **'Dark green'**
  String get colorForestGreen;

  /// No description provided for @colorSeaGreen.
  ///
  /// In en, this message translates to:
  /// **'Dark green'**
  String get colorSeaGreen;

  /// No description provided for @colorDarkSlateGray.
  ///
  /// In en, this message translates to:
  /// **'Dark teal'**
  String get colorDarkSlateGray;

  /// No description provided for @colorLimeGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorLimeGreen;

  /// No description provided for @colorMediumSeaGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorMediumSeaGreen;

  /// No description provided for @colorTurquoise.
  ///
  /// In en, this message translates to:
  /// **'Teal'**
  String get colorTurquoise;

  /// No description provided for @colorRoyalBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get colorRoyalBlue;

  /// No description provided for @colorSteelBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue-gray'**
  String get colorSteelBlue;

  /// No description provided for @colorDarkSlateBlue.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get colorDarkSlateBlue;

  /// No description provided for @colorMediumTurquoise.
  ///
  /// In en, this message translates to:
  /// **'Teal'**
  String get colorMediumTurquoise;

  /// No description provided for @colorIndigo.
  ///
  /// In en, this message translates to:
  /// **'Dark purple'**
  String get colorIndigo;

  /// No description provided for @colorDarkOliveGreen.
  ///
  /// In en, this message translates to:
  /// **'Dark green'**
  String get colorDarkOliveGreen;

  /// No description provided for @colorCadetBlue.
  ///
  /// In en, this message translates to:
  /// **'Teal'**
  String get colorCadetBlue;

  /// No description provided for @colorCornflowerBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get colorCornflowerBlue;

  /// No description provided for @colorMediumAquamarine.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorMediumAquamarine;

  /// No description provided for @colorDimGray.
  ///
  /// In en, this message translates to:
  /// **'Gray'**
  String get colorDimGray;

  /// No description provided for @colorSlateBlue.
  ///
  /// In en, this message translates to:
  /// **'Indigo'**
  String get colorSlateBlue;

  /// No description provided for @colorOliveDrab.
  ///
  /// In en, this message translates to:
  /// **'Dark green'**
  String get colorOliveDrab;

  /// No description provided for @colorSlateGray.
  ///
  /// In en, this message translates to:
  /// **'Blue-gray'**
  String get colorSlateGray;

  /// No description provided for @colorLightSlateGray.
  ///
  /// In en, this message translates to:
  /// **'Blue-gray'**
  String get colorLightSlateGray;

  /// No description provided for @colorMediumSlateBlue.
  ///
  /// In en, this message translates to:
  /// **'Light blue'**
  String get colorMediumSlateBlue;

  /// No description provided for @colorLawnGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorLawnGreen;

  /// No description provided for @colorChartreuse.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorChartreuse;

  /// No description provided for @colorAquamarine.
  ///
  /// In en, this message translates to:
  /// **'Light green'**
  String get colorAquamarine;

  /// No description provided for @colorMaroon.
  ///
  /// In en, this message translates to:
  /// **'Dark red'**
  String get colorMaroon;

  /// No description provided for @colorPurple.
  ///
  /// In en, this message translates to:
  /// **'Dark purple'**
  String get colorPurple;

  /// No description provided for @colorOlive.
  ///
  /// In en, this message translates to:
  /// **'Dark yellow'**
  String get colorOlive;

  /// No description provided for @colorGray.
  ///
  /// In en, this message translates to:
  /// **'Gray'**
  String get colorGray;

  /// No description provided for @colorSkyBlue.
  ///
  /// In en, this message translates to:
  /// **'Light turquoise'**
  String get colorSkyBlue;

  /// No description provided for @colorLightSkyBlue.
  ///
  /// In en, this message translates to:
  /// **'Light blue'**
  String get colorLightSkyBlue;

  /// No description provided for @colorBlueViolet.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get colorBlueViolet;

  /// No description provided for @colorDarkRed.
  ///
  /// In en, this message translates to:
  /// **'Dark red'**
  String get colorDarkRed;

  /// No description provided for @colorDarkMagenta.
  ///
  /// In en, this message translates to:
  /// **'Dark purple'**
  String get colorDarkMagenta;

  /// No description provided for @colorSaddleBrown.
  ///
  /// In en, this message translates to:
  /// **'Brown'**
  String get colorSaddleBrown;

  /// No description provided for @colorDarkSeaGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorDarkSeaGreen;

  /// No description provided for @colorLightGreen.
  ///
  /// In en, this message translates to:
  /// **'Light green'**
  String get colorLightGreen;

  /// No description provided for @colorMediumPurple.
  ///
  /// In en, this message translates to:
  /// **'Lavender'**
  String get colorMediumPurple;

  /// No description provided for @colorDarkViolet.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get colorDarkViolet;

  /// No description provided for @colorPaleGreen.
  ///
  /// In en, this message translates to:
  /// **'Light green'**
  String get colorPaleGreen;

  /// No description provided for @colorDarkOrchid.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get colorDarkOrchid;

  /// No description provided for @colorYellowGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorYellowGreen;

  /// No description provided for @colorSienna.
  ///
  /// In en, this message translates to:
  /// **'Tan'**
  String get colorSienna;

  /// No description provided for @colorBrown.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get colorBrown;

  /// No description provided for @colorDarkGray.
  ///
  /// In en, this message translates to:
  /// **'Gray'**
  String get colorDarkGray;

  /// No description provided for @colorLightBlue.
  ///
  /// In en, this message translates to:
  /// **'Sky blue'**
  String get colorLightBlue;

  /// No description provided for @colorGreenYellow.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorGreenYellow;

  /// No description provided for @colorPaleTurquoise.
  ///
  /// In en, this message translates to:
  /// **'Aqua'**
  String get colorPaleTurquoise;

  /// No description provided for @colorLightSteelBlue.
  ///
  /// In en, this message translates to:
  /// **'Ice blue'**
  String get colorLightSteelBlue;

  /// No description provided for @colorPowderBlue.
  ///
  /// In en, this message translates to:
  /// **'Sky blue'**
  String get colorPowderBlue;

  /// No description provided for @colorFirebrick.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get colorFirebrick;

  /// No description provided for @colorDarkGoldenrod.
  ///
  /// In en, this message translates to:
  /// **'Dark yellow'**
  String get colorDarkGoldenrod;

  /// No description provided for @colorMediumOrchid.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get colorMediumOrchid;

  /// No description provided for @colorRosyBrown.
  ///
  /// In en, this message translates to:
  /// **'Coral'**
  String get colorRosyBrown;

  /// No description provided for @colorDarkKhaki.
  ///
  /// In en, this message translates to:
  /// **'Tan'**
  String get colorDarkKhaki;

  /// No description provided for @colorSilver.
  ///
  /// In en, this message translates to:
  /// **'Light gray'**
  String get colorSilver;

  /// No description provided for @colorMediumVioletRed.
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get colorMediumVioletRed;

  /// No description provided for @colorIndianRed.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get colorIndianRed;

  /// No description provided for @colorPeru.
  ///
  /// In en, this message translates to:
  /// **'Tan'**
  String get colorPeru;

  /// No description provided for @colorChocolate.
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get colorChocolate;

  /// No description provided for @colorTan.
  ///
  /// In en, this message translates to:
  /// **'Tan'**
  String get colorTan;

  /// No description provided for @colorLightGray.
  ///
  /// In en, this message translates to:
  /// **'Light gray'**
  String get colorLightGray;

  /// No description provided for @colorThistle.
  ///
  /// In en, this message translates to:
  /// **'Lavender'**
  String get colorThistle;

  /// No description provided for @colorOrchid.
  ///
  /// In en, this message translates to:
  /// **'Lavender'**
  String get colorOrchid;

  /// No description provided for @colorGoldenrod.
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get colorGoldenrod;

  /// No description provided for @colorPaleVioletRed.
  ///
  /// In en, this message translates to:
  /// **'Rose'**
  String get colorPaleVioletRed;

  /// No description provided for @colorCrimson.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get colorCrimson;

  /// No description provided for @colorGainsboro.
  ///
  /// In en, this message translates to:
  /// **'Light gray'**
  String get colorGainsboro;

  /// No description provided for @colorPlum.
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get colorPlum;

  /// No description provided for @colorBurlyWood.
  ///
  /// In en, this message translates to:
  /// **'Tan'**
  String get colorBurlyWood;

  /// No description provided for @colorLightCyan.
  ///
  /// In en, this message translates to:
  /// **'Sky blue'**
  String get colorLightCyan;

  /// No description provided for @colorLavender.
  ///
  /// In en, this message translates to:
  /// **'Light blue'**
  String get colorLavender;

  /// No description provided for @colorDarkSalmon.
  ///
  /// In en, this message translates to:
  /// **'Rose'**
  String get colorDarkSalmon;

  /// No description provided for @colorViolet.
  ///
  /// In en, this message translates to:
  /// **'Lavender'**
  String get colorViolet;

  /// No description provided for @colorPaleGoldenrod.
  ///
  /// In en, this message translates to:
  /// **'Light yellow'**
  String get colorPaleGoldenrod;

  /// No description provided for @colorLightCoral.
  ///
  /// In en, this message translates to:
  /// **'Rose'**
  String get colorLightCoral;

  /// No description provided for @colorKhaki.
  ///
  /// In en, this message translates to:
  /// **'Light yellow'**
  String get colorKhaki;

  /// No description provided for @colorAliceBlue.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorAliceBlue;

  /// No description provided for @colorHoneydew.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorHoneydew;

  /// No description provided for @colorAzure.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorAzure;

  /// No description provided for @colorSandyBrown.
  ///
  /// In en, this message translates to:
  /// **'Light orange'**
  String get colorSandyBrown;

  /// No description provided for @colorWheat.
  ///
  /// In en, this message translates to:
  /// **'Light yellow'**
  String get colorWheat;

  /// No description provided for @colorBeige.
  ///
  /// In en, this message translates to:
  /// **'Light yellow'**
  String get colorBeige;

  /// No description provided for @colorWhiteSmoke.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorWhiteSmoke;

  /// No description provided for @colorMintCream.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorMintCream;

  /// No description provided for @colorGhostWhite.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorGhostWhite;

  /// No description provided for @colorSalmon.
  ///
  /// In en, this message translates to:
  /// **'Rose'**
  String get colorSalmon;

  /// No description provided for @colorAntiqueWhite.
  ///
  /// In en, this message translates to:
  /// **'Light orange'**
  String get colorAntiqueWhite;

  /// No description provided for @colorLinen.
  ///
  /// In en, this message translates to:
  /// **'Light orange'**
  String get colorLinen;

  /// No description provided for @colorLightGoldenrodYellow.
  ///
  /// In en, this message translates to:
  /// **'Light yellow'**
  String get colorLightGoldenrodYellow;

  /// No description provided for @colorOldLace.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorOldLace;

  /// No description provided for @colorRed.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get colorRed;

  /// No description provided for @colorMagenta.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get colorMagenta;

  /// No description provided for @colorDeepPink.
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get colorDeepPink;

  /// No description provided for @colorOrangeRed.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get colorOrangeRed;

  /// No description provided for @colorTomato.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get colorTomato;

  /// No description provided for @colorHotPink.
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get colorHotPink;

  /// No description provided for @colorCoral.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get colorCoral;

  /// No description provided for @colorDarkOrange.
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get colorDarkOrange;

  /// No description provided for @colorLightSalmon.
  ///
  /// In en, this message translates to:
  /// **'Rose'**
  String get colorLightSalmon;

  /// No description provided for @colorOrange.
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get colorOrange;

  /// No description provided for @colorLightPink.
  ///
  /// In en, this message translates to:
  /// **'Rose'**
  String get colorLightPink;

  /// No description provided for @colorPink.
  ///
  /// In en, this message translates to:
  /// **'Rose'**
  String get colorPink;

  /// No description provided for @colorGold.
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get colorGold;

  /// No description provided for @colorPeachPuff.
  ///
  /// In en, this message translates to:
  /// **'Light orange'**
  String get colorPeachPuff;

  /// No description provided for @colorNavajoWhite.
  ///
  /// In en, this message translates to:
  /// **'Light orange'**
  String get colorNavajoWhite;

  /// No description provided for @colorMoccasin.
  ///
  /// In en, this message translates to:
  /// **'Light orange'**
  String get colorMoccasin;

  /// No description provided for @colorBisque.
  ///
  /// In en, this message translates to:
  /// **'Light orange'**
  String get colorBisque;

  /// No description provided for @colorMistyRose.
  ///
  /// In en, this message translates to:
  /// **'Rose'**
  String get colorMistyRose;

  /// No description provided for @colorBlanchedAlmond.
  ///
  /// In en, this message translates to:
  /// **'Light orange'**
  String get colorBlanchedAlmond;

  /// No description provided for @colorPapayaWhip.
  ///
  /// In en, this message translates to:
  /// **'Light orange'**
  String get colorPapayaWhip;

  /// No description provided for @colorLavenderBlush.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorLavenderBlush;

  /// No description provided for @colorSeaShell.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorSeaShell;

  /// No description provided for @colorCornsilk.
  ///
  /// In en, this message translates to:
  /// **'Light yellow'**
  String get colorCornsilk;

  /// No description provided for @colorLemonChiffon.
  ///
  /// In en, this message translates to:
  /// **'Light yellow'**
  String get colorLemonChiffon;

  /// No description provided for @colorFloralWhite.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorFloralWhite;

  /// No description provided for @colorSnow.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorSnow;

  /// No description provided for @colorYellow.
  ///
  /// In en, this message translates to:
  /// **'Yellow'**
  String get colorYellow;

  /// No description provided for @colorLightYellow.
  ///
  /// In en, this message translates to:
  /// **'Light yellow'**
  String get colorLightYellow;

  /// No description provided for @colorIvory.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorIvory;

  /// No description provided for @colorWhite.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorWhite;
}

class _FluentLocalizationsDelegate
    extends LocalizationsDelegate<FluentLocalizations> {
  const _FluentLocalizationsDelegate();

  @override
  Future<FluentLocalizations> load(Locale locale) {
    return SynchronousFuture<FluentLocalizations>(
      lookupFluentLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'af',
    'am',
    'ar',
    'as',
    'az',
    'be',
    'bg',
    'bn',
    'bo',
    'bs',
    'ca',
    'cs',
    'cy',
    'da',
    'de',
    'el',
    'en',
    'es',
    'et',
    'eu',
    'fa',
    'fi',
    'fil',
    'fr',
    'ga',
    'gl',
    'gsw',
    'gu',
    'he',
    'hi',
    'hr',
    'hu',
    'hy',
    'id',
    'is',
    'it',
    'ja',
    'ka',
    'kk',
    'km',
    'kn',
    'ko',
    'ky',
    'lo',
    'lt',
    'lv',
    'mk',
    'ml',
    'mn',
    'mr',
    'ms',
    'my',
    'nb',
    'ne',
    'nl',
    'no',
    'or',
    'pa',
    'pl',
    'ps',
    'pt',
    'ro',
    'ru',
    'si',
    'sk',
    'sl',
    'sq',
    'sr',
    'sv',
    'sw',
    'ta',
    'te',
    'th',
    'tl',
    'tr',
    'ug',
    'uk',
    'ur',
    'uz',
    'vi',
    'zh',
    'zu',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_FluentLocalizationsDelegate old) => false;
}

FluentLocalizations lookupFluentLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'sr':
      {
        switch (locale.scriptCode) {
          case 'Latn':
            return FluentLocalizationsSrLatn();
        }
        break;
      }
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return FluentLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'de':
      {
        switch (locale.countryCode) {
          case 'CH':
            return FluentLocalizationsDeCh();
        }
        break;
      }
    case 'en':
      {
        switch (locale.countryCode) {
          case 'AU':
            return FluentLocalizationsEnAu();
          case 'CA':
            return FluentLocalizationsEnCa();
          case 'GB':
            return FluentLocalizationsEnGb();
          case 'IE':
            return FluentLocalizationsEnIe();
          case 'IN':
            return FluentLocalizationsEnIn();
          case 'NZ':
            return FluentLocalizationsEnNz();
          case 'SG':
            return FluentLocalizationsEnSg();
          case 'ZA':
            return FluentLocalizationsEnZa();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return FluentLocalizationsPtBr();
          case 'PT':
            return FluentLocalizationsPtPt();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af':
      return FluentLocalizationsAf();
    case 'am':
      return FluentLocalizationsAm();
    case 'ar':
      return FluentLocalizationsAr();
    case 'as':
      return FluentLocalizationsAs();
    case 'az':
      return FluentLocalizationsAz();
    case 'be':
      return FluentLocalizationsBe();
    case 'bg':
      return FluentLocalizationsBg();
    case 'bn':
      return FluentLocalizationsBn();
    case 'bo':
      return FluentLocalizationsBo();
    case 'bs':
      return FluentLocalizationsBs();
    case 'ca':
      return FluentLocalizationsCa();
    case 'cs':
      return FluentLocalizationsCs();
    case 'cy':
      return FluentLocalizationsCy();
    case 'da':
      return FluentLocalizationsDa();
    case 'de':
      return FluentLocalizationsDe();
    case 'el':
      return FluentLocalizationsEl();
    case 'en':
      return FluentLocalizationsEn();
    case 'es':
      return FluentLocalizationsEs();
    case 'et':
      return FluentLocalizationsEt();
    case 'eu':
      return FluentLocalizationsEu();
    case 'fa':
      return FluentLocalizationsFa();
    case 'fi':
      return FluentLocalizationsFi();
    case 'fil':
      return FluentLocalizationsFil();
    case 'fr':
      return FluentLocalizationsFr();
    case 'ga':
      return FluentLocalizationsGa();
    case 'gl':
      return FluentLocalizationsGl();
    case 'gsw':
      return FluentLocalizationsGsw();
    case 'gu':
      return FluentLocalizationsGu();
    case 'he':
      return FluentLocalizationsHe();
    case 'hi':
      return FluentLocalizationsHi();
    case 'hr':
      return FluentLocalizationsHr();
    case 'hu':
      return FluentLocalizationsHu();
    case 'hy':
      return FluentLocalizationsHy();
    case 'id':
      return FluentLocalizationsId();
    case 'is':
      return FluentLocalizationsIs();
    case 'it':
      return FluentLocalizationsIt();
    case 'ja':
      return FluentLocalizationsJa();
    case 'ka':
      return FluentLocalizationsKa();
    case 'kk':
      return FluentLocalizationsKk();
    case 'km':
      return FluentLocalizationsKm();
    case 'kn':
      return FluentLocalizationsKn();
    case 'ko':
      return FluentLocalizationsKo();
    case 'ky':
      return FluentLocalizationsKy();
    case 'lo':
      return FluentLocalizationsLo();
    case 'lt':
      return FluentLocalizationsLt();
    case 'lv':
      return FluentLocalizationsLv();
    case 'mk':
      return FluentLocalizationsMk();
    case 'ml':
      return FluentLocalizationsMl();
    case 'mn':
      return FluentLocalizationsMn();
    case 'mr':
      return FluentLocalizationsMr();
    case 'ms':
      return FluentLocalizationsMs();
    case 'my':
      return FluentLocalizationsMy();
    case 'nb':
      return FluentLocalizationsNb();
    case 'ne':
      return FluentLocalizationsNe();
    case 'nl':
      return FluentLocalizationsNl();
    case 'no':
      return FluentLocalizationsNo();
    case 'or':
      return FluentLocalizationsOr();
    case 'pa':
      return FluentLocalizationsPa();
    case 'pl':
      return FluentLocalizationsPl();
    case 'ps':
      return FluentLocalizationsPs();
    case 'pt':
      return FluentLocalizationsPt();
    case 'ro':
      return FluentLocalizationsRo();
    case 'ru':
      return FluentLocalizationsRu();
    case 'si':
      return FluentLocalizationsSi();
    case 'sk':
      return FluentLocalizationsSk();
    case 'sl':
      return FluentLocalizationsSl();
    case 'sq':
      return FluentLocalizationsSq();
    case 'sr':
      return FluentLocalizationsSr();
    case 'sv':
      return FluentLocalizationsSv();
    case 'sw':
      return FluentLocalizationsSw();
    case 'ta':
      return FluentLocalizationsTa();
    case 'te':
      return FluentLocalizationsTe();
    case 'th':
      return FluentLocalizationsTh();
    case 'tl':
      return FluentLocalizationsTl();
    case 'tr':
      return FluentLocalizationsTr();
    case 'ug':
      return FluentLocalizationsUg();
    case 'uk':
      return FluentLocalizationsUk();
    case 'ur':
      return FluentLocalizationsUr();
    case 'uz':
      return FluentLocalizationsUz();
    case 'vi':
      return FluentLocalizationsVi();
    case 'zh':
      return FluentLocalizationsZh();
    case 'zu':
      return FluentLocalizationsZu();
  }

  throw FlutterError(
    'FluentLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
