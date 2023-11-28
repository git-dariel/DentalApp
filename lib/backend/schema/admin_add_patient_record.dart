import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminAddPatientRecord extends FirestoreRecord {
  AdminAddPatientRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "FirstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "LastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "genderSex" field.
  String? _genderSex;
  String get genderSex => _genderSex ?? '';
  bool hasGenderSex() => _genderSex != null;

  // "ContactNumber" field.
  int? _contactNumber;
  int get contactNumber => _contactNumber ?? 0;
  bool hasContactNumber() => _contactNumber != null;

  // "Appointment_date" field.
  DateTime? _appointmentDate;
  DateTime? get appointmentDate => _appointmentDate;
  bool hasAppointmentDate() => _appointmentDate != null;

  // "Start_Time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "End_Time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "DoctorType" field.
  String? _doctorType;
  String get doctorType => _doctorType ?? '';
  bool hasDoctorType() => _doctorType != null;

  // "Remarks" field.
  String? _remarks;
  String get remarks => _remarks ?? '';
  bool hasRemarks() => _remarks != null;

  void _initializeFields() {
    _firstName = snapshotData['FirstName'] as String?;
    _lastName = snapshotData['LastName'] as String?;
    _genderSex = snapshotData['genderSex'] as String?;
    _contactNumber = castToType<int>(snapshotData['ContactNumber']);
    _appointmentDate = snapshotData['Appointment_date'] as DateTime?;
    _startTime = snapshotData['Start_Time'] as DateTime?;
    _endTime = snapshotData['End_Time'] as DateTime?;
    _doctorType = snapshotData['DoctorType'] as String?;
    _remarks = snapshotData['Remarks'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Admin_add_patient');

  static Stream<AdminAddPatientRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminAddPatientRecord.fromSnapshot(s));

  static Future<AdminAddPatientRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminAddPatientRecord.fromSnapshot(s));

  static AdminAddPatientRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminAddPatientRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminAddPatientRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminAddPatientRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminAddPatientRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminAddPatientRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminAddPatientRecordData({
  String? firstName,
  String? lastName,
  String? genderSex,
  int? contactNumber,
  DateTime? appointmentDate,
  DateTime? startTime,
  DateTime? endTime,
  String? doctorType,
  String? remarks,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FirstName': firstName,
      'LastName': lastName,
      'genderSex': genderSex,
      'ContactNumber': contactNumber,
      'Appointment_date': appointmentDate,
      'Start_Time': startTime,
      'End_Time': endTime,
      'DoctorType': doctorType,
      'Remarks': remarks,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminAddPatientRecordDocumentEquality
    implements Equality<AdminAddPatientRecord> {
  const AdminAddPatientRecordDocumentEquality();

  @override
  bool equals(AdminAddPatientRecord? e1, AdminAddPatientRecord? e2) {
    return e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.genderSex == e2?.genderSex &&
        e1?.contactNumber == e2?.contactNumber &&
        e1?.appointmentDate == e2?.appointmentDate &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.doctorType == e2?.doctorType &&
        e1?.remarks == e2?.remarks;
  }

  @override
  int hash(AdminAddPatientRecord? e) => const ListEquality().hash([
        e?.firstName,
        e?.lastName,
        e?.genderSex,
        e?.contactNumber,
        e?.appointmentDate,
        e?.startTime,
        e?.endTime,
        e?.doctorType,
        e?.remarks
      ]);

  @override
  bool isValidKey(Object? o) => o is AdminAddPatientRecord;
}
