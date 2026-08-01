import 'package:flutter/widgets.dart';
import 'package:groceries_app/about/about_screen.dart';
import 'package:widgetbook/widgetbook.dart';

part 'about_screen.stories.g.dart';

// This story demonstrates how assets are loaded in both the app package and
// the widgetbook package simultaneously.
const meta = Meta(AboutScreen.new);

final $Default = _Story(
  name: 'Default',
);
