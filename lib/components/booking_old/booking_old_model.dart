import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'booking_old_widget.dart' show BookingOldWidget;

class BookingOldModel extends FlutterFlowModel<BookingOldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for personsName widget.
  FocusNode? personsNameFocusNode;
  TextEditingController? personsNameController;
  String? Function(BuildContext, String?)? personsNameControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    emailFocusNode?.dispose();
    emailController?.dispose();

    personsNameFocusNode?.dispose();
    personsNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
