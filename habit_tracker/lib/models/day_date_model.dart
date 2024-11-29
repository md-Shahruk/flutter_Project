class DayDateModel {
  String title;
  String date;

  DayDateModel({required this.title, required this.date});

 static final List<DayDateModel> getDayDateList=
     [
      DayDateModel(title: 'Tue', date: '06'),
      DayDateModel(title: 'Wed', date: '07'),
      DayDateModel(title: 'Thu', date: '08'),
      DayDateModel(title: 'Fri', date: '09'),
      DayDateModel(title: 'Sat', date: '10'),
      DayDateModel(title: 'Sun', date: '11'),
      DayDateModel(title: 'Mon', date: '12'),
    ];


}
