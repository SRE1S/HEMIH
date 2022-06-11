import 'package:flutter/material.dart';
import 'cliente.dart';
import 'package:table_calendar/table_calendar.dart';

class ti_cliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                _abreOutraTela(context, cliente());
              },
              icon: Icon(
                  Icons.exit_to_app),
            ),
            IconButton(
              onPressed: () {
                _abreOutraTela(context, cliente());
              },
              icon: Icon(
                  Icons.person),
            ),
          ],
          automaticallyImplyLeading: false,
          title: const Text(
            "HEMIH",
            style: TextStyle(
              color: Colors.black, fontSize: 20,
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),

      body: Container(
        padding: EdgeInsets.only(top: 8, bottom: 6),
        //color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Container(
                //padding: ServiceExtensionResponse.result("100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Seja bem vindo.",
                      style: TextStyle(
                        color: Colors.black, fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),


            Expanded(
              flex: 1,
              child: Container(
                //margin: EdgeInsets.only(left: 1, right: 1, bottom: 1, top: 1),
                child: TableBasicsExample(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExempleState createState() => _TableBasicsExempleState();
}
class _TableBasicsExempleState extends State<TableBasicsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime(2030, 3, 14),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectDay, selectedDay)){
            setState((){
              _selectDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },

        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState((){
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },

      ),
    );

  }
}

_abreOutraTela(BuildContext ctx,page) {
  Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}
