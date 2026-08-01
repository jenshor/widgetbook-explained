import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

part 'icon_button.stories.g.dart';

const meta = Meta(IconButton.new);

final $Default = _Story(
  name: 'Default',
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=7337-3250&t=N6qwmLP7MP59ClWB-4',
  args: _Args(
    icon: Arg.fixed(FontAwesomeIcons.user),
    onPressed: Arg.fixed(() {}),
  ),
);
