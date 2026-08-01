import 'package:flutter/widgets.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

part 'counter.stories.g.dart';

const meta = Meta(Counter.new);

final $Default = _Story(
  name: 'Default',
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=7284-8778&t=N6qwmLP7MP59ClWB-4',
  args: _Args(
    value: IntArg(0),
    onIncrement: Arg.fixed(() {}),
    onDecrement: Arg.fixed(() {}),
  ),
);
