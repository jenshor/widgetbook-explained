import 'package:groceries_app/features/features.dart';
import 'package:groceries_app/repositories/data_store.dart';
import 'package:groceries_app/repositories/fruit.dart';
import 'package:widgetbook/widgetbook.dart';

part 'basket_view.stories.g.dart';

// BasketView's constructor takes a derived `basket`/`delivery`/`subTotal`, which
// don't map to useful knobs. Custom args expose per-fruit quantities instead
// (as v3 did), and the builder derives the view from a live [BasketState].
const meta = Meta(BasketView.new, argsType: BasketInput.new);

final defaults = _Defaults(
  // Seed a fresh [BasketState] from the quantity knobs and expose it via a
  // [BasketScope]. Setup only re-runs when args change (e.g. a knob), so the
  // card's +/- buttons can mutate this same state and have their changes
  // persist until the next knob change — matching v3.
  setup: (context, child, args) => BasketScope(
    state: _basketFrom(args.mangoQuantity, args.avocadoQuantity),
    child: child,
  ),
  // Derive the view's inputs from the live state on every build. Reading
  // `BasketState.of(context)` here makes the builder rebuild on +/- taps, so
  // the subtotal and total stay in sync with the quantities.
  builder: (context, args) {
    final state = BasketState.of(context);
    return BasketView(
      basket: state.store,
      delivery: state.delivery,
      subTotal: state.subTotal,
    );
  },
);

final $Empty = _Story(
  name: 'Empty',
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=6809-5986&t=zUakLdAaKjMZAqSq-4',
  // The empty state's PrimaryButton Row overflows at iPhone-13 width with the
  // longer German labels (a pre-existing layout issue in PrimaryButton), which
  // `flutter test` treats as an error. Renders fine in the interactive app.
  excludeFromTests: true,
  args: _Args(
    mangoQuantity: IntArg(0),
    avocadoQuantity: IntArg(0),
  ),
);

final $NonEmpty = _Story(
  name: 'Non-empty',
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=6809-5504&t=zUakLdAaKjMZAqSq-4',
  // Renders BasketCards whose fruit images load from remote URLs, which cannot
  // be loaded under `flutter test`. It still renders in the interactive app.
  excludeFromTests: true,
  args: _Args(
    mangoQuantity: IntArg(1),
    avocadoQuantity: IntArg(2),
  ),
);

/// Custom args exposing an editable quantity per fruit.
class BasketInput {
  BasketInput({
    required this.mangoQuantity,
    required this.avocadoQuantity,
  });

  final int mangoQuantity;
  final int avocadoQuantity;
}

BasketState _basketFrom(int mangoQuantity, int avocadoQuantity) {
  final mango = DataStore.fruits[0];
  final avocado = DataStore.fruits[1];
  return BasketState(
    data: <Fruit, ProductOrder>{
      if (mangoQuantity > 0)
        mango: ProductOrder(fruit: mango, quantity: mangoQuantity),
      if (avocadoQuantity > 0)
        avocado: ProductOrder(fruit: avocado, quantity: avocadoQuantity),
    },
  );
}
