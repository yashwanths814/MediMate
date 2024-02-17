import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  String? chat = ' ';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for phrase widget.
  FocusNode? phraseFocusNode;
  TextEditingController? phraseController;
  String? Function(BuildContext, String?)? phraseControllerValidator;
  // Stores action output result for [Custom Action - chatGPT] action in Button widget.
  String? chatGptResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    phraseFocusNode?.dispose();
    phraseController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
