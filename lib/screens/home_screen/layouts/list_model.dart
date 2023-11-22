import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/screens/home_screen/book_read_presently_screen/book_read_presently_screen.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/homepage_section_priorities.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/setting_parameters.dart';
import '../setting_screen/layouts/notification.dart';
import '../setting_screen/layouts/share_my_sadhana.dart';
import '../setting_screen/layouts/share_with_me.dart';

List<Map<String, dynamic>> rulesList = [
  {'rule': 'No meat eating', 'isOn': false},
  {'rule': 'No intoxication', 'isOn': false},
  {'rule': 'No illicit sex', 'isOn': false},
  {'rule': 'No gambling', 'isOn': false},
  {'rule': 'Only prasadam', 'isOn': false}
];

List<Map<String, dynamic>> settingList = [
  {
    'image': "assets/svg/setting-5.svg",
    'rule': 'Parameters',
    'navigate': const SettingParameters()
  },
  {
    'image': "assets/svg/book1.svg",
    'rule': 'Books Reading Presently',
    'navigate': const BookReadPresentlyScreen()
  },
  {
    'image': "assets/svg/SharemySadhana.svg",
    'rule': 'Share my Sadhana',
    'navigate': const ShareMySadhana()
  },
  {
    'image': "assets/svg/profile-2user.svg",
    'rule': 'Sharing with me',
    'navigate': const SharingWithMe()
  },
  {
    'image': "assets/svg/key.svg",
    'rule': 'Bhakti Steps Access Key ',
    'navigate': ""
  },
  {
    'image': "assets/svg/notification.svg",
    'rule': 'Notification',
    'navigate': const NotificationLayouts()
  },
  {
    'image': "assets/svg/setting-2.svg",
    'rule': 'Home page Section Priorities',
    'navigate': const HomePageSection()
  },
];

List<Map<String, dynamic>> homePageSectionList = [
  {'svgImage': "assets/svg/dragIcon.svg", 'name': 'Sleep', 'isOn': false},
  {'svgImage': "assets/svg/dragIcon.svg", 'name': 'Worship', 'isOn': false},
  {'svgImage': "assets/svg/dragIcon.svg", 'name': 'Chanting', 'isOn': false},
  {'svgImage': "assets/svg/dragIcon.svg", 'name': 'Prasadam', 'isOn': false},
  {'svgImage': "assets/svg/dragIcon.svg", 'name': 'Accociation', 'isOn': false},
  {'svgImage': "assets/svg/dragIcon.svg", 'name': 'Books', 'isOn': false},
  {
    'svgImage': "assets/svg/dragIcon.svg",
    'name': 'Book distribution',
    'isOn': false
  },
  {'svgImage': "assets/svg/dragIcon.svg", 'name': 'Notes', 'isOn': false},
];

List<Map<String, dynamic>> shareMySadhanaList = [
  {
    'image': "assets/images/profile.png",
    'name': 'Shreliyan Khanna',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Jane Cooper',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Cody Fisher',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Wade Warren',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Eleanor Pena',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Guy Hawkins',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Cody Fisher',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Courtney Henry',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Brooklyn Simmons',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Cody Fisher',
  },
];
List<Map<String, dynamic>> sharingWithMeList = [
  {
    'image': "assets/images/profile.png",
    'name': 'Shreliyan Khanna',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Jane Cooper',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Cody Fisher',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Wade Warren',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Eleanor Pena',
  },
  {
    'image': "assets/images/profile.png",
    'name': 'Guy Hawkins',
  },
];

List bookList = [];
List<Map<String, dynamic>> notificationSettingList = [
  {'name': 'Mail Notifications', 'isOn': false},
  {'name': 'App Notifications', 'isOn': false},
  {'name': 'SMS Notifications', 'isOn': false},
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

var bottomNavyList = [
  {
    "icon": "assets/svg/unselecthome.svg",
    "title": 'Home',
    "icon2": "assets/svg/home.svg",
  },
  {
    "icon": "assets/svg/monitering.svg",
    "title": "Dashboard",
    "icon2": "assets/svg/selectmonitor.svg"
  },
  {
    "icon": "assets/svg/category.svg",
    "title": "Monitoring",
    "icon2": "assets/svg/selectcategory.svg"
  },
  {
    "icon": "assets/svg/setting.svg",
    "title": "Setting",
    "icon2": "assets/svg/selectsetting.svg"
  },
];
