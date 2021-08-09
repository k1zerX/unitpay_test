part of '../this.dart';

@freezed
class CatalogState with _$CatalogState, EquatableMixin {
  const CatalogState._();
  
  const factory CatalogState({
    required List<CatalogItem> items,
  }) = _CatalogState;

  @override
  List<Object?> get props => [items];
}