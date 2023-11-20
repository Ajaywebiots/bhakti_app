// class SadhanaData {
//   String? date;
//   Data? data;
//
//   SadhanaData({this.date, this.data});
//
//   SadhanaData.fromJson(Map<String, dynamic> json) {
//     date = json['date'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['date'] = this.date;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   Sleep? sleep;
//   MangalaArti? mangalaArti;
//   SandhyaArti? sandhyaArti;
//   Chanting? chanting;
//   Regulations? regulations;
//   List<BookReading>? bookReading;
//   List<Hearing>? hearing;
//   Preaching? preaching;
//   BookDistribution? bookDistribution;
//   String? notes;
//
//   Data(
//       {this.sleep,
//       this.mangalaArti,
//       this.sandhyaArti,
//       this.chanting,
//       this.regulations,
//       this.bookReading,
//       this.hearing,
//       this.preaching,
//       this.bookDistribution,
//       this.notes});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     sleep = json['sleep'] != null ? Sleep.fromJson(json['sleep']) : null;
//     mangalaArti = json['mangala_arti'] != null
//         ? MangalaArti.fromJson(json['mangala_arti'])
//         : null;
//     sandhyaArti = json['sandhya_arti'] != null
//         ? SandhyaArti.fromJson(json['sandhya_arti'])
//         : null;
//     chanting = json['chanting'] != null
//         ? Chanting.fromJson(json['chanting'])
//         : null;
//     regulations = json['regulations'] != null
//         ? Regulations.fromJson(json['regulations'])
//         : null;
//     if (json['book_reading'] != null) {
//       bookReading = <BookReading>[];
//       json['book_reading'].forEach((v) {
//         bookReading!.add(BookReading.fromJson(v));
//       });
//     }
//     if (json['hearing'] != null) {
//       hearing = <Hearing>[];
//       json['hearing'].forEach((v) {
//         hearing!.add(Hearing.fromJson(v));
//       });
//     }
//     preaching = json['preaching'] != null
//         ? Preaching.fromJson(json['preaching'])
//         : null;
//     bookDistribution = json['book_distribution'] != null
//         ? BookDistribution.fromJson(json['book_distribution'])
//         : null;
//     notes = json['notes'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     if (this.sleep != null) {
//       data['sleep'] = this.sleep!.toJson();
//     }
//     if (this.mangalaArti != null) {
//       data['mangala_arti'] = this.mangalaArti!.toJson();
//     }
//     if (this.sandhyaArti != null) {
//       data['sandhya_arti'] = this.sandhyaArti!.toJson();
//     }
//     if (this.chanting != null) {
//       data['chanting'] = this.chanting!.toJson();
//     }
//     if (this.regulations != null) {
//       data['regulations'] = this.regulations!.toJson();
//     }
//     if (this.bookReading != null) {
//       data['book_reading'] = this.bookReading!.map((v) => v.toJson()).toList();
//     }
//     if (this.hearing != null) {
//       data['hearing'] = this.hearing!.map((v) => v.toJson()).toList();
//     }
//     if (this.preaching != null) {
//       data['preaching'] = this.preaching!.toJson();
//     }
//     if (this.bookDistribution != null) {
//       data['book_distribution'] = this.bookDistribution!.toJson();
//     }
//     data['notes'] = this.notes;
//     return data;
//   }
// }
//
// class Sleep {
//   String? sleptTime;
//   String? wakeupTime;
//
//   Sleep({this.sleptTime, this.wakeupTime});
//
//   Sleep.fromJson(Map<String, dynamic> json) {
//     sleptTime = json['slept_time'];
//     wakeupTime = json['wakeup_time'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['slept_time'] = this.sleptTime;
//     data['wakeup_time'] = this.wakeupTime;
//     return data;
//   }
// }
//
// class MangalaArti {
//   String? time;
//   bool? guruAstaka;
//   bool? narasimhaArti;
//   bool? tulasiArti;
//   bool? guruArti;
//   bool? bhogaOffering;
//
//   MangalaArti(
//       {this.time,
//       this.guruAstaka,
//       this.narasimhaArti,
//       this.tulasiArti,
//       this.guruArti,
//       this.bhogaOffering});
//
//   MangalaArti.fromJson(Map<String, dynamic> json) {
//     time = json['time'];
//     guruAstaka = json['guru_astaka'];
//     narasimhaArti = json['narasimha_arti'];
//     tulasiArti = json['tulasi_arti'];
//     guruArti = json['guru_arti'];
//     bhogaOffering = json['bhoga_offering'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['time'] = this.time;
//     data['guru_astaka'] = this.guruAstaka;
//     data['narasimha_arti'] = this.narasimhaArti;
//     data['tulasi_arti'] = this.tulasiArti;
//     data['guru_arti'] = this.guruArti;
//     data['bhoga_offering'] = this.bhogaOffering;
//     return data;
//   }
// }
//
// class SandhyaArti {
//   String? time;
//   bool? sandhyaArti;
//   bool? narasimhaArti;
//   bool? bhogaOffering;
//
//   SandhyaArti(
//       {this.time, this.sandhyaArti, this.narasimhaArti, this.bhogaOffering});
//
//   SandhyaArti.fromJson(Map<String, dynamic> json) {
//     time = json['time'];
//     sandhyaArti = json['sandhya_arti'];
//     narasimhaArti = json['narasimha_arti'];
//     bhogaOffering = json['bhoga_offering'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['time'] = this.time;
//     data['sandhya_arti'] = this.sandhyaArti;
//     data['narasimha_arti'] = this.narasimhaArti;
//     data['bhoga_offering'] = this.bhogaOffering;
//     return data;
//   }
// }
//
// class Chanting {
//   Slot1? slot1;
//   Slot2? slot2;
//   Slot2? slot3;
//   Slot2? slot4;
//
//   Chanting({this.slot1, this.slot2, this.slot3, this.slot4});
//
//   Chanting.fromJson(Map<String, dynamic> json) {
//     slot1 = json['slot_1'] != null ? Slot1.fromJson(json['slot_1']) : null;
//     slot2 = json['slot_2'] != null ? Slot2.fromJson(json['slot_2']) : null;
//     slot3 = json['slot_3'] != null ? Slot2.fromJson(json['slot_3']) : null;
//     slot4 = json['slot_4'] != null ? Slot2.fromJson(json['slot_4']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     if (this.slot1 != null) {
//       data['slot_1'] = this.slot1!.toJson();
//     }
//     if (this.slot2 != null) {
//       data['slot_2'] = this.slot2!.toJson();
//     }
//     if (this.slot3 != null) {
//       data['slot_3'] = this.slot3!.toJson();
//     }
//     if (this.slot4 != null) {
//       data['slot_4'] = this.slot4!.toJson();
//     }
//     return data;
//   }
// }
//
// class Slot1 {
//   int? rounds;
//   Null? quality;
//
//   Slot1({this.rounds, this.quality});
//
//   Slot1.fromJson(Map<String, dynamic> json) {
//     rounds = json['rounds'];
//     quality = json['quality'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['rounds'] = this.rounds;
//     data['quality'] = this.quality;
//     return data;
//   }
// }
//
// class Slot2 {
//   int? rounds;
//   int? quality;
//
//   Slot2({this.rounds, this.quality});
//
//   Slot2.fromJson(Map<String, dynamic> json) {
//     rounds = json['rounds'];
//     quality = json['quality'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['rounds'] = this.rounds;
//     data['quality'] = this.quality;
//     return data;
//   }
// }
//
// class Regulations {
//   bool? noMeatEating;
//   bool? noIntoxication;
//   bool? noIllicitSex;
//   bool? noGambling;
//   bool? onlyPrasadam;
//
//   Regulations(
//       {this.noMeatEating,
//       this.noIntoxication,
//       this.noIllicitSex,
//       this.noGambling,
//       this.onlyPrasadam});
//
//   Regulations.fromJson(Map<String, dynamic> json) {
//     noMeatEating = json['no_meat_eating'];
//     noIntoxication = json['no_intoxication'];
//     noIllicitSex = json['no_illicit_sex'];
//     noGambling = json['no_gambling'];
//     onlyPrasadam = json['only_prasadam'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['no_meat_eating'] = this.noMeatEating;
//     data['no_intoxication'] = this.noIntoxication;
//     data['no_illicit_sex'] = this.noIllicitSex;
//     data['no_gambling'] = this.noGambling;
//     data['only_prasadam'] = this.onlyPrasadam;
//     return data;
//   }
// }
//
// class BookReading {
//   String? bookTitle;
//   String? chapter;
//   String? readingTime;
//
//   BookReading({this.bookTitle, this.chapter, this.readingTime});
//
//   BookReading.fromJson(Map<String, dynamic> json) {
//     bookTitle = json['book_title'];
//     chapter = json['chapter'];
//     readingTime = json['reading_time'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['book_title'] = this.bookTitle;
//     data['chapter'] = this.chapter;
//     data['reading_time'] = this.readingTime;
//     return data;
//   }
// }
//
// class Hearing {
//   String? speaker;
//   String? hearingTime;
//
//   Hearing({this.speaker, this.hearingTime});
//
//   Hearing.fromJson(Map<String, dynamic> json) {
//     speaker = json['speaker'];
//     hearingTime = json['hearing_time'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['speaker'] = this.speaker;
//     data['hearing_time'] = this.hearingTime;
//     return data;
//   }
// }
//
// class Preaching {
//   String? preachingTime;
//   String? preachingSubject;
//
//   Preaching({this.preachingTime, this.preachingSubject});
//
//   Preaching.fromJson(Map<String, dynamic> json) {
//     preachingTime = json['preaching_time'];
//     preachingSubject = json['preaching_subject'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['preaching_time'] = this.preachingTime;
//     data['preaching_subject'] = this.preachingSubject;
//     return data;
//   }
// }
//
// class BookDistribution {
//   int? smallBooks;
//   int? mediumBooks;
//   int? bigBooks;
//
//   BookDistribution({this.smallBooks, this.mediumBooks, this.bigBooks});
//
//   BookDistribution.fromJson(Map<String, dynamic> json) {
//     smallBooks = json['small_books'];
//     mediumBooks = json['medium_books'];
//     bigBooks = json['big_books'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['small_books'] = this.smallBooks;
//     data['medium_books'] = this.mediumBooks;
//     data['big_books'] = this.bigBooks;
//     return data;
//   }
// }
