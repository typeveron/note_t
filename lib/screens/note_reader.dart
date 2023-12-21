import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_t/style/app_style.dart';
import 'package:intl/intl.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];

    // Assuming "creation_date" is stored as a timestamp in Firestore
    Timestamp timestamp = widget.doc["creation_date"];

    // Convert Timestamp to DateTime
    DateTime creationDateTime = timestamp.toDate();

    // Format the date without time using intl package
    String formattedDate = DateFormat.yMMMMd().format(creationDateTime);

    debugPrint(formattedDate);

    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              'Created on: $formattedDate',
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 28.0,
            ),
            Text(
              widget.doc["note_content"],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
