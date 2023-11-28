import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'complete_profile_widget.dart' show CompleteProfileWidget;

class CompleteProfileModel extends FlutterFlowModel<CompleteProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  String? _yourNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  String? _lastNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for yourAge widget.
  FocusNode? yourAgeFocusNode;
  TextEditingController? yourAgeController;
  String? Function(BuildContext, String?)? yourAgeControllerValidator;
  String? _yourAgeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for phonenumber23 widget.
  FocusNode? phonenumber23FocusNode;
  TextEditingController? phonenumber23Controller;
  String? Function(BuildContext, String?)? phonenumber23ControllerValidator;
  String? _phonenumber23ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationController;
  String? Function(BuildContext, String?)? locationControllerValidator;
  String? _locationControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    yourNameControllerValidator = _yourNameControllerValidator;
    lastNameControllerValidator = _lastNameControllerValidator;
    yourAgeControllerValidator = _yourAgeControllerValidator;
    phonenumber23ControllerValidator = _phonenumber23ControllerValidator;
    locationControllerValidator = _locationControllerValidator;
  }

  void dispose() {
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
