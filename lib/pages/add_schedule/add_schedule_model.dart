import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_schedule_widget.dart' show AddScheduleWidget;

class AddScheduleModel extends FlutterFlowModel<AddScheduleWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for yourAge widget.
  FocusNode? yourAgeFocusNode;
  TextEditingController? yourAgeController;
  String? Function(BuildContext, String?)? yourAgeControllerValidator;
  DateTime? datePicked;
  // State field(s) for phonenumber23 widget.
  FocusNode? phonenumber23FocusNode;
  TextEditingController? phonenumber23Controller;
  String? Function(BuildContext, String?)? phonenumber23ControllerValidator;
  // State field(s) for Location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationController;
  String? Function(BuildContext, String?)? locationControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

    yourAgeFocusNode?.dispose();
    yourAgeController?.dispose();

    phonenumber23FocusNode?.dispose();
    phonenumber23Controller?.dispose();

    locationFocusNode?.dispose();
    locationController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
