import 'package:flutter/material.dart';
import 'package:stardent/auth/firebase_auth/auth_util.dart';
import 'package:stardent/backend/schema/appointments_record.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'notification_booking_widget.dart' show NotificationBookingWidget;

class NotificationBookingModel
    extends FlutterFlowModel<NotificationBookingWidget> {
  ///  State fields for stateful widgets in this page.

  Future<void> deleteAppointment(AppointmentsRecord appointment) async {
    // ignore: avoid_print
    print('Trying to delete appointment with uid: ${appointment.uid}');
    if (appointment.uid.isEmpty) {
      // ignore: avoid_print
      print('Cannot delete appointment: Invalid id');
      return;
    }

    await FirebaseFirestore.instance
        .collection('appointments')
        .doc(appointment.uid)
        .delete();
  }

  Future<int> getAppointmentCount() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('appointments')
        .where('appointmentPerson', isEqualTo: currentUserReference)
        .get();

    return querySnapshot.docs.length;
  }

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
