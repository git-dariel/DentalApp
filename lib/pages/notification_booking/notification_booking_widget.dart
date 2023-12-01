import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../flutter_flow/chat/index.dart';
import 'notification_booking_model.dart';

export 'notification_booking_model.dart';

class NotificationBookingWidget extends StatefulWidget {
  const NotificationBookingWidget({
    Key? key,
    this.pushnotification,
    required this.message,
    required this.name,
    required this.slot,
    required this.time,
  }) : super(key: key);

  final DocumentReference? pushnotification;
  final String message;
  final String name;
  final String slot;
  final DateTime time;

  @override
  // ignore: library_private_types_in_public_api
  _NotificationBookingWidgetState createState() =>
      _NotificationBookingWidgetState();
}

class _NotificationBookingWidgetState extends State<NotificationBookingWidget> {
  late NotificationBookingModel _model;

  late final Stream<List<AppointmentsRecord>> _appointmentsStream =
      queryAppointmentsRecord(
    queryBuilder: (appointmentsRecord) => appointmentsRecord
        .where('appointmentPerson', isEqualTo: currentUserReference)
        .orderBy('appointmentTime', descending: true),
  );

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationBookingModel());
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
        title: const Text(
          'Notifications',
        ),
      ),
      body: StreamBuilder<List<AppointmentsRecord>>(
        stream: _appointmentsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Show loading spinner
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text(
                    'No appointments found')); // Show message when there are no appointments
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final appointment = snapshot.data![index];

                return Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3))
                      ],
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Your appointment has been created successfully.',
                          style: TextStyle(
                            color: Colors
                                .green, // Change this to your preferred color
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ListTile(
                          title: Text('Name: ${appointment.appointmentName}'),
                          subtitle: Text(
                              'Slot: ${appointment.appointmentType}\nReserved Time: ${appointment.appointmentSlot}'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Confirm'),
                                    content: const Text(
                                        'If you delete this, your appointment will also be deleted. Are you sure you want to delete it?'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Dismiss the dialog
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Delete'),
                                        onPressed: () {
                                          _model.deleteAppointment(appointment);
                                          Navigator.of(context).pop();
                                          // Show a SnackBar
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text('Appointment deleted!'),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                          // Dismiss the dialog
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
