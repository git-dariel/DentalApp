import 'package:flutter/material.dart';
import 'package:stardent/backend/backend.dart';
import 'package:intl/intl.dart';

String formatDateTimeTo12Hour(DateTime? dateTime) {
  if (dateTime == null) {
    return 'N/A';
  }
  return DateFormat('MM/dd/yyyy').format(dateTime);
}

class MedicalHistoryAdmin extends StatefulWidget {
  const MedicalHistoryAdmin({super.key});

  @override
  State<MedicalHistoryAdmin> createState() => _MedicalHistoryAdminState();
}

class _MedicalHistoryAdminState extends State<MedicalHistoryAdmin> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AppointmentsRecord>>(
      stream: queryAppointmentsRecord(),
      builder: (BuildContext context,
          AsyncSnapshot<List<AppointmentsRecord>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return const Scaffold(
              body: Center(child: Text('Error loading data')));
        } else {
          List<AppointmentsRecord> records = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back)),
              title: const Text("Medical History"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: DataSearch(records: records),
                    );
                  },
                ),
              ],
            ),
            body: ListView.builder(
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
                        title: Text('Appointment Date'),
                        subtitle: Text(
                            formatDateTimeTo12Hour(record.appointmentTime)),
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
            ),
          );
        }
      },
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final List<AppointmentsRecord> records;

  DataSearch({required this.records});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = records
        .where((record) =>
            record.appointmentName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        AppointmentsRecord record = suggestionList[index];
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            children: [
              ListTile(
                title: Text('Appointment Name'),
                subtitle: Text(record.appointmentName),
              ),
              ListTile(
                title: Text('Appointment Date/Time'),
                subtitle: Text(formatDateTimeTo12Hour(record.appointmentTime)),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = records
        .where((record) =>
            record.appointmentName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].appointmentName),
          onTap: () {
            query = suggestionList[index].appointmentName;
          },
        );
      },
    );
  }
}
