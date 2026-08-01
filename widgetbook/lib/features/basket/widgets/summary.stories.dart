import 'package:flutter/widgets.dart';
import 'package:groceries_app/features/features.dart';
import 'package:widgetbook/widgetbook.dart';

part 'summary.stories.g.dart';

const meta = Meta(Summary.new);

final $Default = _Story(
  name: 'Default',
  setup: (context, child, args) => Padding(
    padding: const EdgeInsets.all(8),
    child: child,
  ),
  args: _Args(
    subTotal: DoubleArg(
      10,
      style: const SliderDoubleArgStyle(
        min: 0,
        max: 100,
        divisions: 100,
      ),
    ),
    delivery: DoubleArg(
      5,
      style: const SliderDoubleArgStyle(
        min: 0,
        max: 100,
        divisions: 100,
      ),
    ),
  ),
);
