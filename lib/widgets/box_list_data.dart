class DataModel {
  final String imagePath;
  final String date;
  final String time;

  DataModel({required this.imagePath, required this.date, required this.time});
}

List<DataModel> dataList = [
  DataModel(
    imagePath: 'assets/images/tikus158.jpg',
    date: '2023-10-31',
    time: '14:30',
  ),
  DataModel(
    imagePath: 'assets/images/tikus158.jpg',
    date: '2023-10-30',
    time: '09:15',
  ),
];