import 'package:flutter/widgets.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../features/utility/placeholder.dart' as util;

part 'page_shell.stories.g.dart';

const meta = Meta(PageShell.new);

final $Default = _Story(
  name: 'Default',
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=6802-3379&t=N6qwmLP7MP59ClWB-4',
  args: _Args(
    header: NullableStringArg('Header'),
    child: Arg.fixed(const util.Placeholder()),
  ),
);
