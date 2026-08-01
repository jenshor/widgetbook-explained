import 'package:flutter/widgets.dart';
import 'package:groceries_app/features/features.dart';
import 'package:groceries_app/repositories/data_store.dart';
import 'package:groceries_app/repositories/fruit.dart';
import 'package:widgetbook/widgetbook.dart';

part 'basket_card.stories.g.dart';

const meta = Meta(BasketCard.new);

final $Default = _Story(
  name: 'Default',
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=8808-4859&t=zUakLdAaKjMZAqSq-4',
  // BasketCard renders the fruit image from a remote URL, which cannot be
  // loaded under `flutter test`. It still renders in the interactive app.
  excludeFromTests: true,
  setup: (context, child, args) => Padding(
    padding: const EdgeInsets.all(8),
    child: child,
  ),
  args: _Args(
    fruit: SingleArg(
      DataStore.fruits.first,
      values: DataStore.fruits,
      labelBuilder: (fruit) => fruit.name,
    ),
    count: IntArg(0),
    onFruitAdded: Arg.fixed(() {}),
    onFruitRemoved: Arg.fixed(() {}),
  ),
);
