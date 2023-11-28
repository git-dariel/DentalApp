import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_patient_infobyadmin_widget.dart' show EditPatientInfobyadminWidget;

class EditPatientInfobyadminModel
    extends FlutterFlowModel<EditPatientInfobyadminWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for editname widget.
  FocusNode? editnameFocusNode;
  TextEditingController? editnameController;
  String? Function(BuildContext, String?)? editnameControllerValidator;
  // State field(s) for lastnameEdits widget.
  FocusNode? lastnameEditsFocusNode;
  TextEditingController? lastnameEditsController;
  String? Function(BuildContext, String?)? lastnameEditsControllerValidator;
  // State field(s) for editage widget.
  FocusNode? editageFocusNode;
  TextEditingController? editageController;
  String? Function(BuildContext, String?)? editageControllerValidator;
  DateTime? datePicked;
  // State field(s) for editphone widget.
  FocusNode? editphoneFocusNode;
  TextEditingController? editphoneController;
  String? Function(BuildContext, String?)? editphoneControllerValidator;
  // State field(s) for Locationedit widget.
  FocusNode? locationeditFocusNode;
  TextEditingController? locationeditController;
  String? Function(BuildContext, String?)? locationeditControllerValidator;
  // State field(s) for RadioButtonedit widget.
  FormFieldController<String>? radioButtoneditValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    editnameFocusNode?.dispose();
    editnameController?.dispose();

    lastnameEditsFocusNode?.dispose();
    lastnameEditsController?.dispose();

    editageFocusNode?.dispose();
    editageController?.dispose();

    editphoneFocusNode?.dispose();
    editphoneController?.dispose();

    locationeditFocusNode?.dispose();
    locationeditController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtoneditValue => radioButtoneditValueController?.value;
}
