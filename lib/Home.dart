import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'CustomWidget/ProgressIndicator.dart';
import 'CustomWidget/SessionCard.dart';
import 'Services/DataController.dart';
import 'main.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DataController dataController = Get.put(DataController());

  int c=box.get('operation');
  @override
  GetX<DataController> build(BuildContext context)  {

    return GetX<DataController>(
      builder:(dataController)=> Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: dataController.datalist.isEmpty?

        const Center(child: CircularProgressIndicator(),):

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Good Morning\nJane',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              progressor(c: c, length: dataController.datalist.length,),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                  child:  ListView.builder(
                        itemCount: dataController.datalist.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (dataController.datalist.isEmpty) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          return Column(
                            children: [
                              Sessions(
                                  num: index+1,
                                  status: index<c?1:0),
                               if(index==dataController.datalist.length-1)const SizedBox(height: 50,)
                            ],
                          );
                        },
                      ))
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(12),
          child: MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              color: Colors.blue[700],
              onPressed: () async {
                if(c!=0) {
                  c=await box.get('operation');
                }
                if(c<dataController.datalist.length)
                setState((){});
                if(c<dataController.datalist.length)
                c++;
                await box.put('operation', c);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    "Start Session",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
