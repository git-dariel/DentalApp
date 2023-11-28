import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'block_widget.dart' show BlockWidget;

class BlockModel extends FlutterFlowModel<BlockWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;
  // State field(s) for remarks widget.
  FocusNode? remarksFocusNode;
  TextEditingController? remarksController;
  String? Function(BuildContext, String?)? remarksControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    remarksFocusNode?.dispose();
    remarksController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
