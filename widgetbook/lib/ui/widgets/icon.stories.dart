import 'package:flutter/widgets.dart' hide Icon;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

part 'icon.stories.g.dart';

const meta = Meta(Icon.new);

final $Default = _Story(
  name: 'Default',
  args: _Args(
    icon: Arg.fixed(FontAwesomeIcons.user),
  ),
);
