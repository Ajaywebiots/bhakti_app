import 'package:bhakti_app/common/assets/index.dart';

List<Map<String, dynamic>> rulesList = [
  {'rule': 'No meat eating', 'isOn': false},
  {'rule': 'No intoxication', 'isOn': false},
  {'rule': 'No illicit sex', 'isOn': false},
  {'rule': 'No gambling', 'isOn': false},
  {'rule': 'Only prasadam', 'isOn': false}
];

List bookList = [
  {'book': eImageAssets.bhagvad, 'time': "1:00"},
  {'book': eImageAssets.srila, 'time': "1:30"},
  {'book': eImageAssets.selfRealization, 'time': "0:30"}
];

List<Map<String, dynamic>> manglaArtiTypeList = [
  {'artiType': 'Guru Astaka', 'isOn': false},
  {'artiType': 'Narasimha Arti', 'isOn': false},
  {'artiType': 'Tulasi Arti & Parikrama', 'isOn': false},
  {'artiType': 'Guru Arti', 'isOn': false},
  {'artiType': 'Bhoga Offering', 'isOn': false}
];

List<Map<String, dynamic>> sandhyaTypeList = [
  {'artiType': 'Sandhya Arti', 'isOn': false},
  {'artiType': 'Narasimha Arti', 'isOn': false},
  {'artiType': 'Bhoga Offering', 'isOn': false}
];

List chantingList = [
  {'time': "Before 6:30 am", 'chantingText': '8'},
  {'time': "Before 8:30 am", 'chantingText': '4'},
  {'time': "Before 10:10 am", 'chantingText': '8'},
  {'time': "Before 10:00 am", 'chantingText': '4'}
];

List drawerList = [
  {"icon": "assets/svg/home1.svg", "name": "Home"},
  {"icon": "assets/svg/user1.svg", "name": "Profile"},
  {"icon": "assets/svg/link.svg", "name": "Tutorials"},
  {
    "icon": "assets/svg/book.svg",
    "name": "Online Tests",
    "list": [
      {"icon": "assets/svg/book.svg", "name": "test 1"},
      {"icon": "assets/svg/book.svg", "name": "test 2"},
      {"icon": "assets/svg/book.svg", "name": "test 3"}
    ]
  },
  {"icon": "assets/svg/document.svg", "name": "My Documents"},
  {"icon": "assets/svg/information.svg", "name": "About Bhakti Steps"},
  {"icon": "assets/svg/autobrightness.svg", "name": "About CDM"},
  {"icon": "assets/svg/call-calling.svg", "name": "Contact Us"},
  // {"icon": "assets/svg/logOut.svg", "name": "Log Out"}
];

List bookReadingList = [
  {
    'book': eImageAssets.bhagvad,
    'bookName': "Srimad Bhagatam",
    'author': "By : Satsvarupa Dasa Goswami",
    'isAdded': false
  },
  {
    'book': eImageAssets.srila,
    'bookName': "Light of the Bhagawata",
    'author': "By : Madhudvisa Dasa",
    'isAdded': false
  },
  {
    'book': eImageAssets.selfRealization,
    'bookName': "Bhagavad Gita as it is",
    'author': "By : A. C. Bhaktivedanta Swami",
    'isAdded': true
  },
  {
    'book': eImageAssets.sriBrahma,
    'bookName': "Sri Brahma-samhita",
    'author': "By : Sarasvati Goswami",
    'isAdded': true
  },
];
