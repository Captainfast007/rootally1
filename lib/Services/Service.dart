import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:rootally/main.dart';
import '../Model/Data_Model.dart';

class service {
  late DatabaseReference dref;

  Future<List<Session>> read() async {
    DateTime datetime = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final date = formatter.format(datetime);
    dref = FirebaseDatabase.instance.ref();
    var data;
    data = await dref.child('"$date"').get();
    final Map<String, dynamic>? datajson = jsonDecode(data.value.toString());
    List<Session> ss = [];
    datajson?.forEach((key, value) {
      Session s = Session.fromData(key, value);
      ss.add(s);
    });
    await box2.put('operation2',date);
    return ss;
  }
}

class Service2 {
  late DatabaseReference dref;

  Future<List<Slot>> read() async {
    dref = FirebaseDatabase.instance.ref();
    final data = await dref.child('').get();
    final Map<String, dynamic>? datajson = jsonDecode(data.value.toString());
    List<Slot> ss = [];
    datajson?.forEach((key, value) {
      Slot s = Slot.fromData(key, value);
      ss.add(s);
    });
    mergeSort(ss, compare: (Slot a, Slot b){return a.Date.compareTo(b.Date);});
    return ss;
  }
}

