part of '../this.dart';

class _ItemInfo {
  const _ItemInfo({
    required this.title,
    required this.imgUrl,
  });

  final String title;
  final String imgUrl;
}

const _ItemInfos = [
  const _ItemInfo(
    title: 'Coca-Cola',
    imgUrl: 'https://georgian.com.ua/wp-content/uploads/2019/09/coca.png.pagespeed.ce.thHbDMhw0f.png',
  ),
  const _ItemInfo(
    title: 'Fanta',
    imgUrl: 'https://georgian.com.ua/wp-content/uploads/2019/09/fanta-g.png',
  ),
  const _ItemInfo(
    title: 'Sprite',
    imgUrl: 'https://georgian.com.ua/wp-content/uploads/2019/09/sprite-glass.png',
  ),
];

Iterable<CatalogItem> _catalogItemGenerator([int? seed]) sync* {
  final rng = RandomIntegerGenerator();
  int id = 0;

  while (true) {
    final _itemInfo = _ItemInfos[rng.next(
      max: _ItemInfos.length
    )];
    yield CatalogItem(
      id: id++,
      title: _itemInfo.title,
      imgUrl: _itemInfo.imgUrl,
    );
  }
}

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc({
    required CatalogState initialState,
    required this.iterator,
  }) : super(initialState);

  final Iterator<CatalogItem> iterator;

  factory CatalogBloc.empty() => CatalogBloc(
    iterator: _catalogItemGenerator(DateTime.now().microsecondsSinceEpoch).iterator,
    initialState: const CatalogState(items: const []),
  );

  factory CatalogBloc.generate({
    required int count,
  }) {
    final iterator = _catalogItemGenerator(DateTime.now().microsecondsSinceEpoch).iterator;
    return CatalogBloc(
      iterator: iterator,
      initialState: CatalogState(items: List.generate(count, (_) {
        iterator.moveNext();
        return iterator.current;
      }),
    ));
  }

  factory CatalogBloc.random({
    int min = 10000,
    int max = 100000,
  }) {
    final rng = RandomIntegerGenerator();

    return CatalogBloc.generate(count: rng.next(
      min: min,
      max: max,
    ));
  }

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    yield* event.map<Stream<CatalogState>>(
      addItem: (event) async* {
        iterator.moveNext();
        yield state.copyWith(
          items: [iterator.current, ...state.items],
        );
      },
      deleteItem: (event) async* {
        yield state.copyWith(
          items: [...state.items]..remove(event.item),
        );
      },
    );
  }
}