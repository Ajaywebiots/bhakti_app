import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/book_read_presently_screen/book_read_presently_screen.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/homepage_section_priorities.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/setting_parameters.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/notification.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/share_my_sadhana.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/share_with_me.dart';

class AppArray {
  List<Map<String, dynamic>> rulesList = [
    {'rule': appFonts.noMeat, 'isOn': false},
    {'rule': appFonts.noIntox, 'isOn': false},
    {'rule': appFonts.noIllicit, 'isOn': false},
    {'rule': appFonts.noGambling, 'isOn': false},
    {'rule': appFonts.onlyPrasadam, 'isOn': false}
  ];

  List worshipUserList = [
    {
      'svgImage': eSvgAssets.didMangla,
      'title': appFonts.didMangalaArti,
      'data': appFonts.time2
    },
    {
      'svgImage': eSvgAssets.tulsiImg,
      'title': appFonts.tulasiParikrama,
      'data': appFonts.no
    },
    {
      'svgImage': eSvgAssets.bhog,
      'title': appFonts.offeredBhoga,
      'data': appFonts.no
    },
    {
      'svgImage': eSvgAssets.sandhyaImg,
      'title': appFonts.sandhyaAarti,
      'data': appFonts.no
    }
  ];

  List<Map<String, dynamic>> settingList = [
    {
      'image': eSvgAssets.setting5,
      'rule': appFonts.parameters,
      'navigate': const SettingParameters()
    },
    {
      'image': eSvgAssets.book1,
      'rule': appFonts.booksReadingPresently,
      'navigate': const BookReadPresentlyScreen()
    },
    {
      'image': eSvgAssets.shareMySadhana,
      'rule': appFonts.shareMyShadhana,
      'navigate': const ShareMySadhana()
    },
    {
      'image': eSvgAssets.profileUser,
      'rule': appFonts.shareWithMe,
      'navigate': const SharingWithMe()
    },
    {
      'image': eSvgAssets.key,
      'rule': 'Bhakti Steps Access Key ',
      'navigate': ""
    },
    {
      'image': eSvgAssets.notification,
      'rule': 'Notification',
      'navigate': const NotificationLayouts()
    },
    {
      'image': eSvgAssets.setting2,
      'rule': 'Home page Section Priorities',
      'navigate': const HomePageSection()
    }
  ];

  List<Map<String, dynamic>> homePageSectionList = [
    {'svgImage': eSvgAssets.dragIcon, 'name': appFonts.sleep, 'isOn': false},
    {'svgImage': eSvgAssets.dragIcon, 'name': appFonts.worship, 'isOn': false},
    {'svgImage': eSvgAssets.dragIcon, 'name': appFonts.chanting, 'isOn': false},
    {'svgImage': eSvgAssets.dragIcon, 'name': appFonts.prasadam, 'isOn': false},
    {
      'svgImage': eSvgAssets.dragIcon,
      'name': appFonts.association,
      'isOn': false
    },
    {'svgImage': eSvgAssets.dragIcon, 'name': appFonts.books, 'isOn': false},
    {
      'svgImage': eSvgAssets.dragIcon,
      'name': appFonts.bookDistribution,
      'isOn': false
    },
    {'svgImage': eSvgAssets.dragIcon, 'name': 'Notes', 'isOn': false}
  ];

  List bookList = [];
  List<Map<String, dynamic>> shareMySadhanaList = [
    {'image': eImageAssets.profile, 'name': appFonts.shreliyanKhanna},
    {'image': eImageAssets.profile, 'name': appFonts.janeCooper},
    {'image': eImageAssets.profile, 'name': appFonts.codyFisher},
    {'image': eImageAssets.profile, 'name': appFonts.wadeWarren},
    {'image': eImageAssets.profile, 'name': appFonts.eleanorPena},
    {'image': eImageAssets.profile, 'name': appFonts.guyHawkins},
    {'image': eImageAssets.profile, 'name': appFonts.courtneyHenry},
    {'image': eImageAssets.profile, 'name': appFonts.brooklynSimmons},
    {'image': eImageAssets.profile, 'name': appFonts.codyFisher},
    {'image': eImageAssets.profile, 'name': appFonts.codyFisher},
  ];
  List<Map<String, dynamic>> sharingWithMeList = [
    {'image': eImageAssets.profile, 'name': appFonts.shreliyanKhanna},
    {'image': eImageAssets.profile, 'name': appFonts.janeCooper},
    {'image': eImageAssets.profile, 'name': appFonts.codyFisher},
    {'image': eImageAssets.profile, 'name': appFonts.wadeWarren},
    {'image': eImageAssets.profile, 'name': appFonts.eleanorPena},
    {'image': eImageAssets.profile, 'name': appFonts.guyHawkins},
  ];

  List<Map<String, dynamic>> searchList = [
    {'image': eImageAssets.profile, 'name': appFonts.shreliyanKhanna},
    {'image': eImageAssets.profile, 'name': appFonts.janeCooper},
    {'image': eImageAssets.profile, 'name': appFonts.codyFisher},
    {'image': eImageAssets.profile, 'name': appFonts.wadeWarren}
  ];

  List serverWidgets = [];
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
    {'artiType': 'Bhoga Offering ', 'isOn': false}
  ];

  List<Map<String, dynamic>> sandhyaTypeList = [
    {'artiType': 'Sandhya Arti', 'isOn': false},
    {'artiType': 'Narasimha Arti', 'isOn': false},
    {'artiType': 'Bhoga Offering', 'isOn': false}
  ];

  List chantingList = ['0', '0', '0', '0'];

  List drawerList = [
    {"icon": eSvgAssets.home1, "name": "Home"},
    {"icon": eSvgAssets.user1, "name": "Profile"},
    {"icon": eSvgAssets.link, "name": "Tutorials"},
    {
      "icon": eSvgAssets.book,
      "name": "Online Tests",
      "list": [
        {"icon": eSvgAssets.book, "name": "test 1"},
        {"icon": eSvgAssets.book, "name": "test 2"},
        {"icon": eSvgAssets.book, "name": "test 3"}
      ]
    },
    {"icon": eSvgAssets.document, "name": "My Documents"},
    {"icon": eSvgAssets.information, "name": "About Bhakti Steps"},
    {"icon": eSvgAssets.autoBrightness, "name": "About CDM"},
    {"icon": eSvgAssets.callCalling, "name": "Contact Us"}
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
    }
  ];

  var bottomNavyList = [
    {
      "icon": eSvgAssets.unSelectHome,
      "title": 'Home',
      "icon2": eSvgAssets.home,
    },
    {
      "icon": eSvgAssets.monitoring,
      "title": "Dashboard",
      "icon2": eSvgAssets.selectMonitor
    },
    {
      "icon": eSvgAssets.category,
      "title": "Monitoring",
      "icon2": eSvgAssets.selectCategory
    },
    {
      "icon": eSvgAssets.setting,
      "title": "Setting",
      "icon2": eSvgAssets.selectSetting
    }
  ];
}
