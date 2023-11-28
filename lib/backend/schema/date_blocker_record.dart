import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DateBlockerRecord extends FirestoreRecord {
  DateBlockerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "is_done" field.
  bool? _isDone;
  bool get isDone => _isDone ?? false;
  bool hasIsDone() => _isDone != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _isDone = snapshotData['is_done'] as bool?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DateBlocker');

  static Stream<DateBlockerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DateBlockerRecord.fromSnapshot(s));

  static Future<DateBlockerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DateBlockerRecord.fromSnapshot(s));

  static DateBlockerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DateBlockerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DateBlockerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DateBlockerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DateBlockerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DateBlockerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDateBlockerRecordData({
  String? title,
  String? description,
  DateTime? timestamp,
  bool? isDone,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'timestamp': timestamp,
      'is_done': isDone,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class DateBlockerRecordDocumentEquality implements Equality<DateBlockerRecord> {
  const DateBlockerRecordDocumentEquality();

  @override
  bool equals(DateBlockerRecord? e1, DateBlockerRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.timestamp == e2?.timestamp &&
        e1?.isDone == e2?.isDone &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(DateBlockerRecord? e) => const ListEquality()
      .hash([e?.title, e?.description, e?.timestamp, e?.isDone, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is DateBlockerRecord;
}
