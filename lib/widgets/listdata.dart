class AttackData {
  final int attackCount;
  final String time;
  final String hour;

  AttackData({
    required this.attackCount,
    required this.time,
    required this.hour,
  });
}

List<AttackData> attackDataList = [
  AttackData(attackCount: 3, time: "Selasa 19 Oktober", hour: "21:13"),
  AttackData(attackCount: 5, time: "Selasa 23 Oktober", hour: "22:27"),
  AttackData(attackCount: 1, time: "Selasa 25 Oktober", hour: "23:00"),
  AttackData(attackCount: 3, time: "Selasa 19 Oktober", hour: "21:13"),
  AttackData(attackCount: 5, time: "Selasa 23 Oktober", hour: "22:27"),
  AttackData(attackCount: 1, time: "Selasa 25 Oktober", hour: "23:00"),
  AttackData(attackCount: 3, time: "Selasa 19 Oktober", hour: "21:13"),
  AttackData(attackCount: 5, time: "Selasa 23 Oktober", hour: "22:27"),
  AttackData(attackCount: 1, time: "Selasa 25 Oktober", hour: "23:00"),
  // Tambahkan lebih banyak data sesuai kebutuhan Anda
];
