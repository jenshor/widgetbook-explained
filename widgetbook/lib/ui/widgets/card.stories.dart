import 'package:flutter/widgets.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

part 'card.stories.g.dart';

const meta = Meta(Card.new);

final $Default = _Story(
  name: 'Default',
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=7340-24498&t=N6qwmLP7MP59ClWB-4',
  args: _Args(
    child: Arg.fixed(
      const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'This is some text',
        ),
      ),
    ),
  ),
);
