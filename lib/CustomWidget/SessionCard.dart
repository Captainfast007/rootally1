import 'package:flutter/material.dart';

class Sessions extends StatefulWidget {
  const Sessions({required this.num, Key? key, required this.status})
      : super(key: key);

  final int num;
  final int status;

  @override
  State<Sessions> createState() => _SessionsState();
}

class _SessionsState extends State<Sessions> {
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    int hour = time.hour;
    int min = time.minute;
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            widget.status == 0 ? Colors.black : Colors.white),
                    borderRadius: BorderRadius.circular(15),
                    color: widget.status == 0
                        ? Colors.transparent
                        : const Color(0xFF285FC9),
                  ),
                  child: Icon(
                    Icons.check,
                    color: widget.status == 0 ? Colors.black : Colors.white,
                    size: 15,
                  )),
              CustomPaint(
                  size: const Size(1, 150),
                  painter: DashedLineVerticalPainter(widget.status == 0
                      ? Colors.grey
                      : const Color(0xFF285FC9)))
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
                color: widget.status == 0
                    ? Colors.white
                    : Colors.grey[500]?.withOpacity(0.2),
                border: Border.all(
                  color: widget.status == 0
                      ? Colors.grey
                      : Colors.black.withOpacity(0.2),
                ),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                    child: SizedBox(
                      height: 120,
                      width: 142,
                      child: Column(
                        children: [
                          Text(
                           'Session '+widget.num.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          widget.status == 0
                              ? const SizedBox(
                                  height: 15,
                                )
                              : const SizedBox(
                                  height: 8,
                                ),
                          widget.status == 0
                              ? Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(25)),
                                          color: Colors.blue),
                                      child: const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      height: 22,
                                      width: 60,
                                      child: const Center(
                                          child: Text(
                                        'Start',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[350],
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15.0))),
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(25)),
                                          color: Colors.blue[800]),
                                      child: const Center(
                                          child: const Text(
                                        'Completed',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Performed At',
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontWeight: FontWeight.w500),
                                    ),
                                    min < 10
                                        ? Text('$hour:0$min')
                                        : Text('$hour:$min'),
                                  ],
                                )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    child: Image.asset('assets/yoga.png'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  Color color;
  DashedLineVerticalPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
