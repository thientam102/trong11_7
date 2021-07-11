import 'package:flutter/material.dart';
import 'package:appoint/macro/utils/helpers.dart';
import 'package:appoint/macro/utils/textStyles.dart';
import 'package:appoint/macro/widgets/tile.dart';

class ResultTile extends StatelessWidget {
  const ResultTile({
    Key key,
    @required this.title,
    @required this.value,
    this.units,
  }) : super(key: key);

  final String title;
  final String value;
  final String units;

  @override
  Widget build(BuildContext context) {
    return Tile(
      child: Column(
        children: [
          Text(
            value,
            style: ResultValueStyle.lightDark,
          ),
          Text(
            units,
            style: isThemeDark(context)
                ? ResultUnitStyle.dark
                : ResultUnitStyle.light,
          ),
          Text(
            title,
            style: isThemeDark(context)
                ? ResultTitleStyle.dark
                : ResultTitleStyle.light,
          ),
        ],
      ),
    );
  }
}
