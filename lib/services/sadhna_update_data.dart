class SadhanaUpdate {
  SadhanaUpdate({
    required this.date,
    required this.data,
  });
  late final String date;
  late final Data data;

  SadhanaUpdate.fromJson(Map json){
    date = json['date'];
    data = Data.fromJson(json['data']);
  }

  Map toJson() {
    final _data = {};
    _data['date'] = date;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.sleep,
    required this.mangalaArti,
    required this.sandhyaArti,
    required this.chanting,
    required this.regulations,
    required this.bookReading,
    required this.association,
    required this.bookDistribution,
    required this.notes,
  });
  late final Sleep sleep;
  late final MangalaArti mangalaArti;
  late final SandhyaArti sandhyaArti;
  late final Chanting chanting;
  late final Regulations regulations;
  late final List<BookReading> bookReading;
  late final Association association;
  late final BookDistribution bookDistribution;
  late final String notes;

  Data.fromJson( json){
    sleep = Sleep.fromJson(json['sleep']);
    mangalaArti = MangalaArti.fromJson(json['mangala_arti']);
    sandhyaArti = SandhyaArti.fromJson(json['sandhya_arti']);
    chanting = Chanting.fromJson(json['chanting']);
    regulations = Regulations.fromJson(json['regulations']);
    bookReading = List.from(json['book_reading']).map((e)=>BookReading.fromJson(e)).toList();
    association = Association.fromJson(json['association']);
    bookDistribution = BookDistribution.fromJson(json['book_distribution']);
    notes = json['notes'];
  }

  Map toJson() {
    final _data = {};
    _data['sleep'] = sleep.toJson();
    _data['mangala_arti'] = mangalaArti.toJson();
    _data['sandhya_arti'] = sandhyaArti.toJson();
    _data['chanting'] = chanting.toJson();
    _data['regulations'] = regulations.toJson();
    _data['book_reading'] = bookReading.map((e)=>e.toJson()).toList();
    _data['association'] = association.toJson();
    _data['book_distribution'] = bookDistribution.toJson();
    _data['notes'] = notes;
    return _data;
  }
}

class Sleep {
  Sleep({
    required this.sleptTime,
    required this.wakeupTime,
  });
  late final String sleptTime;
  late final String wakeupTime;

  Sleep.fromJson(Map json){
    sleptTime = json['slept_time'];
    wakeupTime = json['wakeup_time'];
  }

  Map toJson() {
    final _data = {};
    _data['slept_time'] = sleptTime;
    _data['wakeup_time'] = wakeupTime;
    return _data;
  }
}

class MangalaArti {
  MangalaArti({
    required this.time,
    required this.guruAstaka,
    required this.narasimhaArti,
    required this.tulasiArti,
    required this.guruArti,
    required this.bhogaOffering,
  });
  late final String time;
  late final bool guruAstaka;
  late final bool narasimhaArti;
  late final bool tulasiArti;
  late final bool guruArti;
  late final bool bhogaOffering;

  MangalaArti.fromJson(Map json){
    time = json['time'];
    guruAstaka = json['guru_astaka'];
    narasimhaArti = json['narasimha_arti'];
    tulasiArti = json['tulasi_arti'];
    guruArti = json['guru_arti'];
    bhogaOffering = json['bhoga_offering'];
  }

  Map toJson() {
    final _data = {};
    _data['time'] = time;
    _data['guru_astaka'] = guruAstaka;
    _data['narasimha_arti'] = narasimhaArti;
    _data['tulasi_arti'] = tulasiArti;
    _data['guru_arti'] = guruArti;
    _data['bhoga_offering'] = bhogaOffering;
    return _data;
  }
}

class SandhyaArti {
  SandhyaArti({
    required this.time,
    required this.sandhyaArti,
    required this.narasimhaArti,
    required this.bhogaOffering,
  });
  late final String time;
  late final bool sandhyaArti;
  late final bool narasimhaArti;
  late final bool bhogaOffering;

  SandhyaArti.fromJson(Map json){
    time = json['time'];
    sandhyaArti = json['sandhya_arti'];
    narasimhaArti = json['narasimha_arti'];
    bhogaOffering = json['bhoga_offering'];
  }

  Map toJson() {
    final _data = {};
    _data['time'] = time;
    _data['sandhya_arti'] = sandhyaArti;
    _data['narasimha_arti'] = narasimhaArti;
    _data['bhoga_offering'] = bhogaOffering;
    return _data;
  }
}

class Chanting {
  Chanting({
    required this.slot_1,
    required this.slot_2,
    required this.slot_3,
    required this.slot_4,
  });
  late final Slot_1 slot_1;
  late final Slot_2 slot_2;
  late final Slot_3 slot_3;
  late final Slot_4 slot_4;

  Chanting.fromJson(Map json){
    slot_1 = Slot_1.fromJson(json['slot_1']);
    slot_2 = Slot_2.fromJson(json['slot_2']);
    slot_3 = Slot_3.fromJson(json['slot_3']);
    slot_4 = Slot_4.fromJson(json['slot_4']);
  }

  Map toJson() {
    final _data = {};
    _data['slot_1'] = slot_1.toJson();
    _data['slot_2'] = slot_2.toJson();
    _data['slot_3'] = slot_3.toJson();
    _data['slot_4'] = slot_4.toJson();
    return _data;
  }
}

class Slot_1 {
  Slot_1({
    required this.rounds,
    this.quality,
  });
  late final int rounds;
  late final Null quality;

  Slot_1.fromJson(Map json){
    rounds = json['rounds'];
    quality = null;
  }

  Map toJson() {
    final _data = {};
    _data['rounds'] = rounds;
    _data['quality'] = quality;
    return _data;
  }
}

class Slot_2 {
  Slot_2({
    required this.rounds,
    required this.quality,
  });
  late final int rounds;
  late final int quality;

  Slot_2.fromJson(Map json){
    rounds = json['rounds'];
    quality = json['quality'];
  }

  Map toJson() {
    final _data = {};
    _data['rounds'] = rounds;
    _data['quality'] = quality;
    return _data;
  }
}

class Slot_3 {
  Slot_3({
    required this.rounds,
    required this.quality,
  });
  late final int rounds;
  late final int quality;

  Slot_3.fromJson(Map json){
    rounds = json['rounds'];
    quality = json['quality'];
  }

  Map toJson() {
    final _data = {};
    _data['rounds'] = rounds;
    _data['quality'] = quality;
    return _data;
  }
}

class Slot_4 {
  Slot_4({
    required this.rounds,
    required this.quality,
  });
  late final int rounds;
  late final int quality;

  Slot_4.fromJson(Map json){
    rounds = json['rounds'];
    quality = json['quality'];
  }

  Map toJson() {
    final _data = {};
    _data['rounds'] = rounds;
    _data['quality'] = quality;
    return _data;
  }
}

class Regulations {
  Regulations({
    required this.noMeatEating,
    required this.noIntoxication,
    required this.noIllicitSex,
    required this.noGambling,
    required this.onlyPrasadam,
  });
  late final bool noMeatEating;
  late final bool noIntoxication;
  late final bool noIllicitSex;
  late final bool noGambling;
  late final bool onlyPrasadam;

  Regulations.fromJson(Map json){
    noMeatEating = json['no_meat_eating'];
    noIntoxication = json['no_intoxication'];
    noIllicitSex = json['no_illicit_sex'];
    noGambling = json['no_gambling'];
    onlyPrasadam = json['only_prasadam'];
  }

  Map toJson() {
    final _data = {};
    _data['no_meat_eating'] = noMeatEating;
    _data['no_intoxication'] = noIntoxication;
    _data['no_illicit_sex'] = noIllicitSex;
    _data['no_gambling'] = noGambling;
    _data['only_prasadam'] = onlyPrasadam;
    return _data;
  }
}

class BookReading {
  BookReading({
    required this.bookId,
    required this.chapter,
    required this.readingTime,
  });
  late final int bookId;
  late final int chapter;
  late final String readingTime;

  BookReading.fromJson(Map json){
    bookId = json['book_id'];
    chapter = json['chapter'];
    readingTime = json['reading_time'];
  }

  Map toJson() {
    final _data = {};
    _data['book_id'] = bookId;
    _data['chapter'] = chapter;
    _data['reading_time'] = readingTime;
    return _data;
  }
}

class Association {
  Association({
    required this.hearingSp,
    required this.hearingGuru,
    required this.hearingOthers,
    required this.preaching,
    required this.otherActivities,
  });
  late final String hearingSp;
  late final String hearingGuru;
  late final String hearingOthers;
  late final String preaching;
  late final String otherActivities;

  Association.fromJson(Map json){
    hearingSp = json['hearing_sp'];
    hearingGuru = json['hearing_guru'];
    hearingOthers = json['hearing_others'];
    preaching = json['preaching'];
    otherActivities = json['other_activities'];
  }

  Map toJson() {
    final _data = {};
    _data['hearing_sp'] = hearingSp;
    _data['hearing_guru'] = hearingGuru;
    _data['hearing_others'] = hearingOthers;
    _data['preaching'] = preaching;
    _data['other_activities'] = otherActivities;
    return _data;
  }
}

class BookDistribution {
  BookDistribution({
    required this.smallBooks,
    required this.mediumBooks,
    required this.bigBooks,
  });
  late final int smallBooks;
  late final int mediumBooks;
  late final int bigBooks;

  BookDistribution.fromJson(Map json){
    smallBooks = json['small_books'];
    mediumBooks = json['medium_books'];
    bigBooks = json['big_books'];
  }

  Map toJson() {
    final _data = {};
    _data['small_books'] = smallBooks;
    _data['medium_books'] = mediumBooks;
    _data['big_books'] = bigBooks;
    return _data;
  }
}