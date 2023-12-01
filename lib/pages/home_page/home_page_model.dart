import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stardent/auth/firebase_auth/auth_util.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  Future<int> getAppointmentCount() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('appointments')
        .where('appointmentPerson', isEqualTo: currentUserReference)
        .get();

    return querySnapshot.docs.length;
  }

  int carouselCurrentIndex = 1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
