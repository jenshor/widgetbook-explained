import 'package:flutter/widgets.dart';
import 'package:groceries_app/features/features.dart';
import 'package:widgetbook/widgetbook.dart';

part 'cost_item_row.stories.g.dart';

const meta = Meta(CostItemRow.new);

final $Default = _Story(
  name: 'Default',
  setup: (context, child, args) => Padding(
    padding: const EdgeInsets.all(8),
    child: child,
  ),
  args: _Args(
    label: StringArg('Delivery'),
    cost: DoubleArg(
      5,
      style: const SliderDoubleArgStyle(
        min: 0,
        max: 10000,
        divisions: 100,
      ),
    ),
  ),
);
