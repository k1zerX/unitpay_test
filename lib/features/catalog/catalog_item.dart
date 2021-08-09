part of 'this.dart';

@freezed
class CatalogItem with _$CatalogItem, EquatableMixin {
  const CatalogItem._();

  const factory CatalogItem({
    required int id,
    required String title,
    required String imgUrl,
  }) = _CatalogItem;

  @override
  List<Object?> get props => [id];
}