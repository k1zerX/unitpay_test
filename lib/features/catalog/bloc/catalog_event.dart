part of '../this.dart';

@freezed
class CatalogEvent with _$CatalogEvent {
  const factory CatalogEvent.addItem() = _CatalogAddItemEvent;
  const factory CatalogEvent.deleteItem({
    required CatalogItem item,
  }) = _CatalogDeleteItemEvent;
}