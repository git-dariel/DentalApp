import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'chatpage_model.dart';

export 'chatpage_model.dart';

class ChatpageWidget extends StatefulWidget {
  const ChatpageWidget({
    Key? key,
    this.chatUser,
    this.chatRef,
  }) : super(key: key);

  final UsersRecord? chatUser;
  final DocumentReference? chatRef;

  @override
  _ChatpageWidgetState createState() => _ChatpageWidgetState();
}

class _ChatpageWidgetState extends State<ChatpageWidget> {
  late ChatpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  FFChatInfo? _chatInfo;
  bool isGroupChat() {
    if (widget.chatUser == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatpageModel());

    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUser,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24.0,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: StreamBuilder<FFChatInfo>(
          stream: FFChatManager.instance.getChatInfo(
            otherUserRecord: widget.chatUser,
            chatReference: widget.chatRef,
          ),
          builder: (context, snapshot) => snapshot.hasData
              ? FFChatPage(
                  chatInfo: snapshot.data!,
                  allowImages: true,
                  backgroundColor: Color(0xFFF2F4F8),
                  timeDisplaySetting: TimeDisplaySetting.visibleOnTap,
                  currentUserBoxDecoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  otherUsersBoxDecoration: BoxDecoration(
                    color: Color(0xFF4B39EF),
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  currentUserTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Color(0xFF1E2429),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    fontStyle: FontStyle.normal,
                  ),
                  otherUsersTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                  inputHintTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Color(0xFF95A1AC),
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                  inputTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                  emptyChatWidget: Image.asset(
                    'assets/images/messagesEmpty@2x.png',
                    width: MediaQuery.sizeOf(context).width * 0.76,
                  ),
                )
              : Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: SpinKitRing(
                      color: FlutterFlowTheme.of(context).tertiary,
                      size: 40.0,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
