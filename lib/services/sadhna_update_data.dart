class SadhanaGetApi {
  SadhanaGetApiData? data;
  int? statusCode;
  String? statusText;

  SadhanaGetApi({
    this.data,
    this.statusCode,
    this.statusText,
  });

}

class SadhanaGetApiData {
  DateTime? fromDate;
  DateTime? toDate;
  List<Sadhana>? sadhana;

  SadhanaGetApiData({
    this.fromDate,
    this.toDate,
    this.sadhana,
  });

}

class Sadhana {
  String? uid;
  DateTime? date;
  SadhanaData? data;

  Sadhana({
    this.uid,
    this.date,
    this.data,
  });

}

class SadhanaData {
  Sleep? sleep;
  MangalaArti? mangalaArti;
  SandhyaArti? sandhyaArti;
  Chanting? chanting;
  Regulations? regulations;
  List<BookReading>? bookReading;
  Association? association;
  BookDistribution? bookDistribution;
  String? notes;

  SadhanaData({
    this.sleep,
    this.mangalaArti,
    this.sandhyaArti,
    this.chanting,
    this.regulations,
    this.bookReading,
    this.association,
    this.bookDistribution,
    this.notes,
  });

}

class Association {
  String? hearingSp;
  String? hearingGuru;
  String? hearingOthers;
  String? preaching;
  String? otherActivities;

  Association({
    this.hearingSp,
    this.hearingGuru,
    this.hearingOthers,
    this.preaching,
    this.otherActivities,
  });

}

class BookDistribution {
  dynamic smallBooks;
  dynamic mediumBooks;
  dynamic bigBooks;

  BookDistribution({
    this.smallBooks,
    this.mediumBooks,
    this.bigBooks,
  });

}

class BookReading {
  int? bookId;
  int? chapter;
  String? readingTime;

  BookReading({
    this.bookId,
    this.chapter,
    this.readingTime,
  });

}

class Chanting {
  Slot? slot1;
  Slot? slot2;
  Slot? slot3;
  Slot? slot4;

  Chanting({
    this.slot1,
    this.slot2,
    this.slot3,
    this.slot4,
  });

}

class Slot {
  int? rounds;
  int? quality;

  Slot({
    this.rounds,
    this.quality,
  });

}

class MangalaArti {
  String? time;
  bool? guruAstaka;
  bool? narasimhaArti;
  bool? tulasiArti;
  bool? guruArti;
  bool? bhogaOffering;

  MangalaArti({
    this.time,
    this.guruAstaka,
    this.narasimhaArti,
    this.tulasiArti,
    this.guruArti,
    this.bhogaOffering,
  });

}

class Regulations {
  bool? noMeatEating;
  bool? noIntoxication;
  bool? noIllicitSex;
  bool? noGambling;
  bool? onlyPrasadam;

  Regulations({
    this.noMeatEating,
    this.noIntoxication,
    this.noIllicitSex,
    this.noGambling,
    this.onlyPrasadam,
  });

}

class SandhyaArti {
  String? time;
  bool? sandhyaArti;
  bool? narasimhaArti;
  bool? bhogaOffering;

  SandhyaArti({
    this.time,
    this.sandhyaArti,
    this.narasimhaArti,
    this.bhogaOffering,
  });

}

class Sleep {
  String? sleptTime;
  String? wakeupTime;

  Sleep({
    this.sleptTime,
    this.wakeupTime,
  });

}
