import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

part 'navigation_item.stories.g.dart';

const meta = Meta(NavigationItem.new);

final $Default = _Story(
  name: 'Default',
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=7395-4299&t=N6qwmLP7MP59ClWB-4',
  args: _Args(
    isSelected: BoolArg(false),
    iconSelected: Arg.fixed(FontAwesomeIcons.solidLemon),
    iconUnselected: Arg.fixed(FontAwesomeIcons.lemon),
    text: StringArg('Account'),
  ),
);
