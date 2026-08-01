import 'package:flutter/widgets.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

part 'app_bar.stories.g.dart';

const meta = Meta(AppBar.new);

final $Default = _Story(
  name: 'Default',
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=7271-82082&t=N6qwmLP7MP59ClWB-4',
  args: _Args(
    title: StringArg('Title'),
  ),
);
