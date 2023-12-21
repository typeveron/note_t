import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_t/style/app_style.dart';
import 'package:intl/intl.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {

   String creationDate = doc["creation_date"] ?? "";
 

  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
            style: AppStyle.mainTitle,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            doc["note_content"],
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            creationDate,
            style: AppStyle.dateTitle,
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    ),
  );
}
