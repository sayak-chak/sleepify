import 'package:flutter/material.dart';
import 'package:sleep/alarm/ALARM-BLOC/alarm_bloc.dart';
import 'package:sleep/alarm/ALARM-BLOC/alarm_events.dart';
import 'package:sleep/alarm/ALARM-LIST-BLOC/alarm_list_bloc.dart';
import 'package:sleep/constants.dart';

class AlarmListItem extends StatelessWidget {
  final int hh, mm;
  final AlarmListBloc alarmListBloc;
  final AlarmBloc alarmBloc;
  final bool sunday, monday, tuesday, wednesday, thursday, friday, saturday;

  AlarmListItem(
      {@required this.hh,
      @required this.mm,
      @required this.alarmBloc,
      @required this.alarmListBloc,
      @required this.sunday,
      @required this.monday,
      @required this.tuesday,
      @required this.wednesday,
      @required this.thursday,
      @required this.friday,
      @required this.saturday});
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Constants.DEFAULT_BUTTON_COLOR_NON_SOLID,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              hh.toString() + " : " + mm.toString(),
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            subtitle: Text((this.sunday ? " Sunday," : "") +
                (this.monday ? " Monday," : "") +
                (this.tuesday ? " Tuesday," : "") +
                (this.wednesday ? " Wednesday," : "") +
                (this.thursday ? " Thursday," : "") +
                (this.friday ? " Friday," : "") +
                (this.saturday ? " Saturday," : "")),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () async {
                  await alarmListBloc.cancelAlarm(id: hh * 60 + mm);
                  alarmBloc.eventSink.add(UpdateAlarmPageScreen(
                      screenIndex: Constants.ALARM_PAGE_ALARM_LIST_INDEX));
                },
              ),
              const SizedBox(width: 8),
              // TODO : uncomment and implement
              // TextButton(
              //   child: const Text('Edit'),
              //   onPressed: () {/* ... */},
              // ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}

class DayButton extends StatelessWidget {
  final String day;
  final bool hasAlarm;
  DayButton({@required this.day, @required this.hasAlarm});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(5),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 45, height: 45),
          child: ElevatedButton(
            child: Text(
              day,
              style: TextStyle(fontSize: 15),
            ),
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(
                  side: BorderSide(
                width: 0,
              )),
            ),
          ),
        ),
      ),
    ]);
  }
}