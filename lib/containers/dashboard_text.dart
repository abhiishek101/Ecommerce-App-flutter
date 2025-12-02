import 'package:flutter/material.dart';

class DashboardText extends StatefulWidget {
  final String keyword, value;//by adding this we expect these parameteres when the funtoion is called.
  const DashboardText({super.key, required this.keyword, required this.value});

  @override
  State<DashboardText> createState() => _DashboardTextState();
}

class _DashboardTextState extends State<DashboardText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${widget.keyword} : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),////why do we have to pass widget over here, why can't \$keyword work? 
        Text("${widget.value} : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
      ],
    );
  }
}