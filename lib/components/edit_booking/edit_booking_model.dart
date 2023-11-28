import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_booking_widget.dart' show EditBookingWidget;

class EditBookingModel extends FlutterFlowModel<EditBookingWidget> {
  ///  State fields for stateful widgets in this component.

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
    personsNameFocusNode?.dispose();
    personsNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
