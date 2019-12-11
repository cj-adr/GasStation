
/// 获取 yyyy-MM-dd HH:mm:ss
String getYmdHms(num time){
  var date = DateTime.fromMillisecondsSinceEpoch(time);
  String timestamp =
      "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.millisecond.toString().padLeft(2, '0')}";

  return timestamp;
}