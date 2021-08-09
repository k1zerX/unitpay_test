part of '../this.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc({
    CatalogState initialState = const CatalogState(items: const []),
  }) : super(initialState);

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    switch (event.runtimeType) {
      case _CatalogAddItemEvent:
        yield state;
        break;
      case _CatalogDeleteItemEvent:
        yield state;
        break;
    }
  }
}