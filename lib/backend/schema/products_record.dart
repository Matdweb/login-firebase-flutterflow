import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "category" field.
  DocumentReference? _category;
  DocumentReference? get category => _category;
  bool hasCategory() => _category != null;

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  bool hasStock() => _stock != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "sku" field.
  String? _sku;
  String get sku => _sku ?? '';
  bool hasSku() => _sku != null;

  // "ingredient" field.
  IngredientsStruct? _ingredient;
  IngredientsStruct get ingredient => _ingredient ?? IngredientsStruct();
  bool hasIngredient() => _ingredient != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _category = snapshotData['category'] as DocumentReference?;
    _stock = castToType<int>(snapshotData['stock']);
    _price = castToType<double>(snapshotData['price']);
    _sku = snapshotData['sku'] as String?;
    _ingredient = snapshotData['ingredient'] is IngredientsStruct
        ? snapshotData['ingredient']
        : IngredientsStruct.maybeFromMap(snapshotData['ingredient']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? name,
  DocumentReference? category,
  int? stock,
  double? price,
  String? sku,
  IngredientsStruct? ingredient,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'category': category,
      'stock': stock,
      'price': price,
      'sku': sku,
      'ingredient': IngredientsStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "ingredient" field.
  addIngredientsStructData(firestoreData, ingredient, 'ingredient');

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.category == e2?.category &&
        e1?.stock == e2?.stock &&
        e1?.price == e2?.price &&
        e1?.sku == e2?.sku &&
        e1?.ingredient == e2?.ingredient;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality()
      .hash([e?.name, e?.category, e?.stock, e?.price, e?.sku, e?.ingredient]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
