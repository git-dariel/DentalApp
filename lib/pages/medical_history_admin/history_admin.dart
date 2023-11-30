import 'package:flutter/material.dart';
import 'package:stardent/backend/backend.dart';
import 'package:intl/intl.dart';

String formatDateTimeTo12Hour(DateTime? dateTime) {
  if (dateTime == null) {
    return 'N/A';
  }
  return DateFormat('MM/dd/yyyy hh:mm a').format(dateTime);
}

class MedicalHistoryAdmin extends StatefulWidget {
  const MedicalHistoryAdmin({Key? key}) : super(key: key);

  @override
  State<MedicalHistoryAdmin> createState() => _MedicalHistoryAdminState();
}

class _MedicalHistoryAdminState extends State<MedicalHistoryAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Medical History"),
      ),
      body: StreamBuilder<List<AppointmentsRecord>>(
        stream: queryAppointmentsRecord(),
        builder: (BuildContext context,
            AsyncSnapshot<List<AppointmentsRecord>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          } else {
            List<AppointmentsRecord> records = snapshot.data!;
            return ListView.builder(
              itemCount: records.length,
              itemBuilder: (context, index) {
                AppointmentsRecord record = records[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Appointment Name'),
                        subtitle: Text(record.appointmentName),
                      ),
                      ListTile(
                        title: Text('Appointment Date/Time'),
                        subtitle: Text(
                            formatDateTimeTo12Hour(record.appointmentTime) ??
                                'N/A'),
                      ),
                      ListTile(
                        title: Text('Appointment Type'),
                        subtitle: Text(record.appointmentType),
                      ),
                      ListTile(
                        title: Text('Appointment Email'),
                        subtitle: Text(record.appointmentEmail),
                      ),
                      ListTile(
                        title: Text('Created Time'),
                        subtitle: Text(record.appointmentSlot),
                      ),
                      ListTile(
                        title: Text('Upcoming'),
                        subtitle: Text(record.upcoming.toString()),
                      ),
                      ListTile(
                        title: Text('Complete'),
                        subtitle: Text(record.complete.toString()),
                      ),
                    ],
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
