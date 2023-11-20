// class SadhanaData {
//   SadhanaData({
//     required this.data,
//     required this.StatusCode,
//     required this.StatusText,
//   });
//   late final Data data;
//   late final int StatusCode;
//   late final String StatusText;
//
//   SadhanaData.fromJson(Map<String, dynamic> json){
//     data = Data.fromJson(json['data']);
//     StatusCode = json['StatusCode'];
//     StatusText = json['StatusText'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['data'] = data.toJson();
//     _data['StatusCode'] = StatusCode;
//     _data['StatusText'] = StatusText;
//     return _data;
//   }
// }
//
// class Data {
//   Data({
//     required this.fromDate,
//     required this.toDate,
//     required this.sadhana,
//   });
//   late final String fromDate;
//   late final String toDate;
//   late final List<Sadhana> sadhana;
//
//   Data.fromJson(Map<String, dynamic> json){
//     fromDate = json['from_date'];
//     toDate = json['to_date'];
//     sadhana = List.from(json['sadhana']).map((e)=>Sadhana.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['from_date'] = fromDate;
//     _data['to_date'] = toDate;
//     _data['sadhana'] = sadhana.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Sadhana {
//   Sadhana({
//     required this.uid,
//     required this.date,
//     required this.data,
//   });
//   late final String uid;
//   late final String date;
//   late final Data data;
//
//   Sadhana.fromJson(Map<String, dynamic> json){
//     uid = json['uid'];
//     date = json['date'];
//     data = Data.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['uid'] = uid;
//     _data['date'] = date;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }