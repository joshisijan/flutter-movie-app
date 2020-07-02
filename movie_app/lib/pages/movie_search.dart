import 'package:flutter/material.dart';
import 'package:movie_app/widgets/search_result.dart';


class MovieSearch extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return SearchResult(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return SearchResult(query);
  }
  

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return super.appBarTheme(context).copyWith(
      unselectedWidgetColor: ThemeData.dark().unselectedWidgetColor,
      typography: ThemeData.dark().typography,
      tooltipTheme: ThemeData.dark().tooltipTheme,
      toggleButtonsTheme: ThemeData.dark().toggleButtonsTheme,
      toggleableActiveColor: ThemeData.dark().toggleableActiveColor,
      textSelectionHandleColor: ThemeData.dark().textSelectionHandleColor,
      textSelectionColor: ThemeData.dark().textSelectionColor,
      tabBarTheme: ThemeData.dark().tabBarTheme,
      splashColor: ThemeData.dark().splashColor,
      splashFactory: ThemeData.dark().splashFactory,
      snackBarTheme: ThemeData.dark().snackBarTheme,
      sliderTheme: ThemeData.dark().sliderTheme,
      selectedRowColor: ThemeData.dark().selectedRowColor,
      secondaryHeaderColor: ThemeData.dark().secondaryHeaderColor,
      scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      primaryTextTheme: ThemeData.dark().primaryTextTheme,
      primaryIconTheme: ThemeData.dark().primaryIconTheme,
      primaryColorLight: ThemeData.dark().primaryColorLight,
      primaryColorDark: ThemeData.dark().primaryColorDark,
      primaryColorBrightness: ThemeData.dark().primaryColorBrightness,
      popupMenuTheme: ThemeData.dark().popupMenuTheme,
      platform: ThemeData.dark().platform,
      pageTransitionsTheme: ThemeData.dark().pageTransitionsTheme,
      materialTapTargetSize: ThemeData.dark().materialTapTargetSize,
      indicatorColor: ThemeData.dark().indicatorColor,
      hoverColor: ThemeData.dark().hoverColor,
      highlightColor: ThemeData.dark().highlightColor,
      focusColor: ThemeData.dark().focusColor,
      floatingActionButtonTheme: ThemeData.dark().floatingActionButtonTheme,
      errorColor: ThemeData.dark().errorColor,
      dividerTheme: ThemeData.dark().dividerTheme,
      dividerColor: ThemeData.dark().disabledColor,
      disabledColor: ThemeData.dark().disabledColor,
      dialogTheme: ThemeData.dark().dialogTheme,
      dialogBackgroundColor: ThemeData.dark().dialogBackgroundColor,
      cursorColor: ThemeData.dark().cursorColor,
      cupertinoOverrideTheme: ThemeData.dark().cupertinoOverrideTheme,
      chipTheme: ThemeData.dark().chipTheme,
      cardTheme: ThemeData.dark().cardTheme,
      cardColor: ThemeData.dark().cardColor,
      canvasColor: ThemeData.dark().canvasColor,
      buttonTheme: ThemeData.dark().buttonTheme,
      buttonBarTheme: ThemeData.dark().buttonBarTheme,
      brightness: ThemeData.dark().brightness,
      bottomSheetTheme: ThemeData.dark().bottomSheetTheme,
      bottomAppBarTheme: ThemeData.dark().bottomAppBarTheme,
      bottomAppBarColor: ThemeData.dark().bottomAppBarColor,
      bannerTheme: ThemeData.dark().bannerTheme,
      applyElevationOverlayColor: ThemeData.dark().applyElevationOverlayColor,
      accentTextTheme: ThemeData.dark().accentTextTheme,
      accentIconTheme: ThemeData.dark().accentIconTheme,
      accentColorBrightness: ThemeData.dark().accentColorBrightness,
      inputDecorationTheme: ThemeData.dark().inputDecorationTheme,
      accentColor: ThemeData.dark().accentColor,
      backgroundColor: ThemeData.dark().backgroundColor,
      buttonColor: ThemeData.dark().buttonColor,
      hintColor: ThemeData.dark().hintColor,
      iconTheme: ThemeData.dark().iconTheme,
      textTheme: ThemeData.dark().textTheme,
      appBarTheme: ThemeData.dark().appBarTheme,
      colorScheme: ThemeData.dark().colorScheme,
      primaryColor: ThemeData.dark().primaryColor,
    );
  }

}