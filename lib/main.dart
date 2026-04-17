import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'timeago_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timeago Advanced App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedTime = DateTime.now();
  String result = "";

  @override
  void initState() {
    super.initState();

    timeago.setLocaleMessages('id', timeago.IdMessages());
    updateAll();
  }

  void updateAll() {
    setState(() {
      result = """
Format: ${TimeagoService.formatTime(selectedTime)}
Format EN: ${TimeagoService.formatWithLocale(selectedTime, 'en')}

Is Past: ${TimeagoService.isPast(selectedTime)}
Is Future: ${TimeagoService.isFuture(selectedTime)}

Detik: ${TimeagoService.differenceInSeconds(selectedTime)}
Menit: ${TimeagoService.differenceInMinutes(selectedTime)}
Jam: ${TimeagoService.differenceInHours(selectedTime)}
""";
    });
  }

  void setMinutesAgo() {
    selectedTime = TimeagoService.subtractMinutes(10);
    updateAll();
  }

  void setHoursAgo() {
    selectedTime = TimeagoService.subtractHours(2);
    updateAll();
  }

  void setDaysAgo() {
    selectedTime = TimeagoService.subtractDays(1);
    updateAll();
  }

  void setNow() {
    selectedTime = TimeagoService.getNow();
    updateAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timeago 10 API App"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Selected Time:"),
            Text(selectedTime.toString()),

            SizedBox(height: 20),

            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: setMinutesAgo,
                  child: Text("10 Menit Lalu"),
                ),
                ElevatedButton(
                  onPressed: setHoursAgo,
                  child: Text("2 Jam Lalu"),
                ),
                ElevatedButton(
                  onPressed: setDaysAgo,
                  child: Text("1 Hari Lalu"),
                ),
                ElevatedButton(
                  onPressed: setNow,
                  child: Text("Sekarang"),
                ),
              ],
            ),

            SizedBox(height: 30),

            Text(
              "Hasil:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Expanded(
              child: SingleChildScrollView(
                child: Text(result),
              ),
            )
          ],
        ),
      ),
    );
  }
}