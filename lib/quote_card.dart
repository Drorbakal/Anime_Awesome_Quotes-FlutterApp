import 'package:flutter/material.dart';
import 'quote.dart';




class QuoteCard extends StatelessWidget {

  final Quote? quote;
  final void Function() delete;
  QuoteCard({this.quote,required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              quote?.text ?? 'Default Text',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              quote?.name ?? 'Default Name',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0),
            TextButton.icon(
              onPressed: delete,
              icon: Icon(
                Icons.delete_forever, // Replace with the icon you want to use
                color: Colors.black, // Optionally, specify the icon color
              ),
              label: Text(
                  'Delete',
                style: TextStyle(
                  color: Colors.black,
                ),
              ), // Optionally, provide a label
            ),
          ],
        ),
      ),
    );
  }
}


