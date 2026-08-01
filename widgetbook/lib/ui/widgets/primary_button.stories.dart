import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

part 'primary_button.stories.g.dart';

const meta = Meta(PrimaryButton.new);

final $Default = _Story(
  name: 'Default',
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=7235-4663&t=N6qwmLP7MP59ClWB-4',
  args: _Args(
    content: StringArg('Text'),
    trailing: BuilderArg(
      (context) => FaIcon(
        FontAwesomeIcons.arrowRight,
        color: AppTheme.of(context).text.inverse,
      ),
    ),
  ),
);
