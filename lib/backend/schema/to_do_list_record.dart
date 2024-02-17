import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToDoListRecord extends FirestoreRecord {
  ToDoListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "toDoDate" field.
  DateTime? _toDoDate;
  DateTime? get toDoDate => _toDoDate;
  bool hasToDoDate() => _toDoDate != null;

  // "toDoName" field.
  String? _toDoName;
  String get toDoName => _toDoName ?? '';
  bool hasToDoName() => _toDoName != null;

  // "toDoDescription" field.
  String? _toDoDescription;
  String get toDoDescription => _toDoDescription ?? '';
  bool hasToDoDescription() => _toDoDescription != null;

  // "toDoState" field.
  bool? _toDoState;
  bool get toDoState => _toDoState ?? false;
  bool hasToDoState() => _toDoState != null;

  // "completedDate" field.
  DateTime? _completedDate;
  DateTime? get completedDate => _completedDate;
  bool hasCompletedDate() => _completedDate != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

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

  void _initializeFields() {
    _toDoDate = snapshotData['toDoDate'] as DateTime?;
    _toDoName = snapshotData['toDoName'] as String?;
    _toDoDescription = snapshotData['toDoDescription'] as String?;
    _toDoState = snapshotData['toDoState'] as bool?;
    _completedDate = snapshotData['completedDate'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ToDoList');

  static Stream<ToDoListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToDoListRecord.fromSnapshot(s));

  static Future<ToDoListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToDoListRecord.fromSnapshot(s));

  static ToDoListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ToDoListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToDoListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToDoListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToDoListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToDoListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToDoListRecordData({
  DateTime? toDoDate,
  String? toDoName,
  String? toDoDescription,
  bool? toDoState,
  DateTime? completedDate,
  DocumentReference? user,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'toDoDate': toDoDate,
      'toDoName': toDoName,
      'toDoDescription': toDoDescription,
      'toDoState': toDoState,
      'completedDate': completedDate,
      'user': user,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToDoListRecordDocumentEquality implements Equality<ToDoListRecord> {
  const ToDoListRecordDocumentEquality();

  @override
  bool equals(ToDoListRecord? e1, ToDoListRecord? e2) {
    return e1?.toDoDate == e2?.toDoDate &&
        e1?.toDoName == e2?.toDoName &&
        e1?.toDoDescription == e2?.toDoDescription &&
        e1?.toDoState == e2?.toDoState &&
        e1?.completedDate == e2?.completedDate &&
        e1?.user == e2?.user &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(ToDoListRecord? e) => const ListEquality().hash([
        e?.toDoDate,
        e?.toDoName,
        e?.toDoDescription,
        e?.toDoState,
        e?.completedDate,
        e?.user,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is ToDoListRecord;
}
