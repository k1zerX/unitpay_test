part of 'this.dart';

@freezed
class CatalogState with _$CatalogState {
  const factory CatalogState({
    required List<CatalogItem> items,
  }) = _CatalogState;
}