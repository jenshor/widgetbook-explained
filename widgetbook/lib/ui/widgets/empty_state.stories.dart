import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

part 'empty_state.stories.g.dart';

const meta = Meta(EmptyState.new);

final $Default = _Story(
  name: 'Default',
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=6809-5957&t=N6qwmLP7MP59ClWB-4',
  args: _Args(
    icon: Arg.fixed(FontAwesomeIcons.triangleExclamation),
    title: StringArg('Title'),
    message: StringArg('A message conveying the state of the product'),
  ),
);
