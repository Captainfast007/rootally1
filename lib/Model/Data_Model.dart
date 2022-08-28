class Session {
  final String name;
  final String time;

  Session(this.name, this.time);

  factory Session.fromData(String time, String name) {
    return Session(name, time);
  }
}

class Slot {
  final List<Session> sessions;
  final String Date;

  Slot(this.sessions, this.Date);

  factory Slot.fromData(String key, Map<String, dynamic> mp) {
    List<Session> ss = [];
    mp.forEach((key, value) {
      ss.add(Session.fromData(key, value));
    });
    return Slot(ss, key);
  }
}
