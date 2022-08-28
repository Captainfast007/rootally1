import 'package:flutter/material.dart';

class RehabCard extends StatelessWidget {
  const RehabCard({Key? key,required this.date,required this.time,required this.c}) : super(key: key);
 final int c;
 final String time;
 final String date;
 final List url=const['https://cdn-icons-png.flaticon.com/512/3048/3048398.png',
   'https://cdn-icons-png.flaticon.com/512/3043/3043233.png'
  ];
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(height: 50,
          width: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: Colors.grey[200],),
            child: Image.network(url[c],scale: 10,),
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(height: 12.0,),
                  Icon(Icons.watch_later_outlined,size: 16,),
                  SizedBox(height: 3,),
                  Icon(Icons.calendar_today_outlined,size: 16,),
                ],
              ),
              SizedBox(width: 5,),
              SizedBox(child:
              Text(time+'\n'+date,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w500,fontSize: 13),),
              ),
            ],
          ),

          Text('View Results',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey[800]),)
        ],
      ),
    );
  }
}
