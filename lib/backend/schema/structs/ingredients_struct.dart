// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IngredientsStruct extends FFFirebaseStruct {
  IngredientsStruct({
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static IngredientsStruct fromMap(Map<String, dynamic> data) =>
      IngredientsStruct(
        name: data['name'] as String?,
      );

  static IngredientsStruct? maybeFromMap(dynamic data) => data is Map
      ? IngredientsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static IngredientsStruct fromSerializableMap(Map<String, dynamic> data) =>
      IngredientsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'IngredientsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IngredientsStruct && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

IngredientsStruct createIngredientsStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IngredientsStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IngredientsStruct? updateIngredientsStruct(
  IngredientsStruct? ingredients, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ingredients
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIngredientsStructData(
  Map<String, dynamic> firestoreData,
  IngredientsStruct? ingredients,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ingredients == null) {
    return;
  }
  if (ingredients.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ingredients.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ingredientsData =
      getIngredientsFirestoreData(ingredients, forFieldValue);
  final nestedData =
      ingredientsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ingredients.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIngredientsFirestoreData(
  IngredientsStruct? ingredients, [
  bool forFieldValue = false,
]) {
  if (ingredients == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ingredients.toMap());

  // Add any Firestore field values
  ingredients.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIngredientsListFirestoreData(
  List<IngredientsStruct>? ingredientss,
) =>
    ingredientss?.map((e) => getIngredientsFirestoreData(e, true)).toList() ??
    [];
