import 'package:flutter/material.dart';
class progressor extends StatelessWidget {
  const progressor({Key? key, required this.c, required this.length}) : super(key: key);
  final int c;
  final int length;

  @override
  Widget build(BuildContext context) {
     double per=c/length*100;
     per=per-per%1;
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey),
      borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(child: Text('Today\'s Progress',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey[700]),)),
                SizedBox(child: Text('$per%',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500, ))),
              ],
            ),
            const SizedBox(height: 8,),
            LinearProgressIndicator(backgroundColor: Colors.grey,
            value: c/length,),
            const SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network('https://cdn-icons-png.flaticon.com/512/753/753318.png', height: 35,),
                    const SizedBox(width: 10,),
                    Text.rich(
                        TextSpan(
                            text: 'Completed',
                            children: [
                              TextSpan(text:'\n${c} Sessions', style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            ]
                        )
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.network('https://cdn-icons-png.flaticon.com/512/2879/2879593.png', height: 35,),
                    const SizedBox(width: 10,),
                    Text.rich(
                      TextSpan(
                        text: 'Pending',
                        children: [
                          TextSpan(text:'\n${length-c} Sessions', style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        ]
                      )
                    )

                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
