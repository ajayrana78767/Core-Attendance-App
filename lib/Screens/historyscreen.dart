import 'package:flutter/material.dart';
import 'package:new_project/Utils/colors_utils.dart';
import 'package:table_calendar/table_calendar.dart';

class Historyscreen extends StatefulWidget {
  const Historyscreen({super.key});

  @override
  State<Historyscreen> createState() => _HistoryscreenState();
}

class _HistoryscreenState extends State<Historyscreen> {
  ColorsUtils colorUtils = ColorsUtils();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("History", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        foregroundColor: Colors.white,
        flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorUtils.primaryColor, colorUtils.secondaryColor, colorUtils.tertiaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          elevation: 0,
      ),
      body: Column(
        children: [
          
          TableCalendar(focusedDay: DateTime.now(), firstDay: DateTime.utc(2010, 10, 16), lastDay: DateTime.utc(2030, 10, 16),
          
          ),
        ],
      ),
    );
  }
}