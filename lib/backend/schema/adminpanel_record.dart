import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminpanelRecord extends FirestoreRecord {
  AdminpanelRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "DateBlock" field.
  DateTime? _dateBlock;
  DateTime? get dateBlock => _dateBlock;
  bool hasDateBlock() => _dateBlock != null;

  // "remarks" field.
  String? _remarks;
  String get remarks => _remarks ?? '';
  bool hasRemarks() => _remarks != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _bio = snapshotData['bio'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _dateBlock = snapshotData['DateBlock'] as DateTime?;
    _remarks = snapshotData['remarks'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('adminpanel');

  static Stream<AdminpanelRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminpanelRecord.fromSnapshot(s));

  static Future<AdminpanelRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminpanelRecord.fromSnapshot(s));

  static AdminpanelRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminpanelRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminpanelRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminpanelRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminpanelRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminpanelRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminpanelRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? editedTime,
  String? bio,
  String? userName,
  DateTime? dateBlock,
  String? remarks,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'edited_time': editedTime,
      'bio': bio,
      'user_name': userName,
      'DateBlock': dateBlock,
      'remarks': remarks,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminpanelRecordDocumentEquality implements Equality<AdminpanelRecord> {
  const AdminpanelRecordDocumentEquality();

  @override
  bool equals(AdminpanelRecord? e1, AdminpanelRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.editedTime == e2?.editedTime &&
        e1?.bio == e2?.bio &&
        e1?.userName == e2?.userName &&
        e1?.dateBlock == e2?.dateBlock &&
        e1?.remarks == e2?.remarks;
  }

  @override
  int hash(AdminpanelRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.editedTime,
        e?.bio,
        e?.userName,
        e?.dateBlock,
        e?.remarks
      ]);

  @override
  bool isValidKey(Object? o) => o is AdminpanelRecord;
}
