class Sadhana {
  String fromDate;
  String toDate;
  List<Map<String, dynamic>> sadhanaData;

  Sadhana(
      {required this.fromDate,
        required this.toDate,
        required this.sadhanaData});

  factory Sadhana.fromJson(Map<String, dynamic> json) {
    return Sadhana(
      fromDate: json['from_date'],
      toDate: json['to_date'],
      sadhanaData: List<Map<String, dynamic>>.from(json['sadhana']),
    );
  }
}

// class Temperatures {
//   TemperaturesData? data;
//   int? statusCode;
//   String? statusText;
//
//   Temperatures({
//     this.data,
//     this.statusCode,
//     this.statusText,
//   });
//
// }
//
// class TemperaturesData {
//   DateTime? fromDate;
//   DateTime? toDate;
//   List<Sadhana>? sadhana;
//
//   TemperaturesData({
//     this.fromDate,
//     this.toDate,
//     this.sadhana,
//   });
//
// }
//
// class Sadhana {
//   String? uid;
//   DateTime? date;
//   SadhanaData? data;
//
//   Sadhana({
//     this.uid,
//     this.date,
//     this.data,
//   });
//
// }
//
// class SadhanaData {
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
//   SadhanaData({
//     this.sleep,
//     this.mangalaArti,
//     this.sandhyaArti,
//     this.chanting,
//     this.regulations,
//     this.bookReading,
//     this.hearing,
//     this.preaching,
//     this.bookDistribution,
//     this.notes,
//   });
//
// }
//
// class BookDistribution {
//   int? smallBooks;
//   int? mediumBooks;
//   int? bigBooks;
//
//   BookDistribution({
//     this.smallBooks,
//     this.mediumBooks,
//     this.bigBooks,
//   });
//
// }
//
// class BookReading {
//   String? bookTitle;
//   String? chapter;
//   String? readingTime;
//
//   BookReading({
//     this.bookTitle,
//     this.chapter,
//     this.readingTime,
//   });
//
// }
//
// class Chanting {
//   Slot? slot1;
//   Slot? slot2;
//   Slot? slot3;
//   Slot? slot4;
//
//   Chanting({
//     this.slot1,
//     this.slot2,
//     this.slot3,
//     this.slot4,
//   });
//
// }
//
// class Slot {
//   int? rounds;
//   int? quality;
//
//   Slot({
//     this.rounds,
//     this.quality,
//   });
//
// }
//
// class Hearing {
//   String? speaker;
//   String? hearingTime;
//
//   Hearing({
//     this.speaker,
//     this.hearingTime,
//   });
//
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
//   MangalaArti({
//     this.time,
//     this.guruAstaka,
//     this.narasimhaArti,
//     this.tulasiArti,
//     this.guruArti,
//     this.bhogaOffering,
//   });
//
// }
//
// class Preaching {
//   String? preachingTime;
//   String? preachingSubject;
//
//   Preaching({
//     this.preachingTime,
//     this.preachingSubject,
//   });
//
// }
//
// class Regulations {
//   bool? noMeatEating;
//   bool? noIntoxication;
//   bool? noIllicitSex;
//   bool? noGambling;
//   bool? onlyPrasadam;
//
//   Regulations({
//     this.noMeatEating,
//     this.noIntoxication,
//     this.noIllicitSex,
//     this.noGambling,
//     this.onlyPrasadam,
//   });
//
// }
//
// class SandhyaArti {
//   String? time;
//   bool? sandhyaArti;
//   bool? narasimhaArti;
//   bool? bhogaOffering;
//
//   SandhyaArti({
//     this.time,
//     this.sandhyaArti,
//     this.narasimhaArti,
//     this.bhogaOffering,
//   });
//
// }
//
// class Sleep {
//   String? sleptTime;
//   String? wakeupTime;
//
//   Sleep({
//     this.sleptTime,
//     this.wakeupTime,
//   });
//
// }
