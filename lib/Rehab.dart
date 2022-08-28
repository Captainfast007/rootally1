import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rootally/CustomWidget/RehabCard.dart';

import 'Services/DataController.dart';

class Rehab extends StatelessWidget {
  Rehab({Key? key}) : super(key: key);

  final DataController2 dataController2 = Get.put(DataController2());
  int count=0;
  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final date = formatter.format(datetime);
    return GetX<DataController2>(
      builder:(dataController2)=>
       Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              Text('Rehab Programme',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
              SizedBox(height: 10,),
              Image.asset('assets/RehabImg.png'),
              SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('History',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                Icon(Icons.filter_alt_sharp,size: 28,),
              ],
            ),
              SizedBox(height: 10,),
              Container(height: 70,
              decoration: BoxDecoration(color: Colors.grey[200] ,borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Total Sessions',style: TextStyle(fontSize:13)),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Container(
                                  height:20,
                                  width: 20,
                                  child: Image.network('https://cdn-icons-png.flaticon.com/512/563/563777.png',scale: 10)),
                              SizedBox(width: 5,),
                              Text('30',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                              SizedBox(width: 10,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0,bottom: 20.0),
                      child: Container(width:1,color: Colors.grey[400],),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Total Time',style: TextStyle(fontSize:13),),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                child: Image.asset('assets/hourglass.png',scale: 10,),),
                              SizedBox(width: 5,),
                              Text('30',style: TextStyle(
                                fontSize: 22,fontWeight: FontWeight.w500
                              ),
                              ),
                              SizedBox(width: 5,),
                            ],
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                  child:  SingleChildScrollView(
                    child:dataController2.datalist.isEmpty?
                       Center(child: CircularProgressIndicator()):
                    Column(
                        children: [
                          for (var i in dataController2.datalist)
                            for (var j in i.sessions)
                              i.Date!=date?
                          Column(
                            children: [
                              RehabCard(time: j.time,date: i.Date,c:(count++)%2),
                              SizedBox(height: 10,)
                            ],
                          ):
                                  Container(),

                        ],
                      )
                    ,
                  ))
          ]
           ),
        ),
    );
  }
}
