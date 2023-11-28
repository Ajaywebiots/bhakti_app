import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MonitoringProvider extends ChangeNotifier {
  int isSelected = 0;
  bool isSelect = false;

  List userToDo = ["Sleep", "Chanting", "Worship", "Prasadam", "Knowledge"];
  List sleepList = ["", "Sleep at", "Woke up at", "Duration"];
  List chantingList = ["", "Total", "Slot 1", "Slot 2", "Slot 3"];
  List worshipList = [
    "",
    "Mangala Aarti",
    "Tulsi Parikrama",
    "Offered Bhoga",
    "Sandhya Aarti"
  ];
  List prasadamList = ["", "Breakfast", "Lunch", "Dinner"];
  List knowledgeList = ["", "Preaching", "Audio Lectures", "KC Services"];

  List sleepDataList = [
    {
      "image": "assets/images/userSection.png",
      "Sleep at": "09:30 PM",
      "Woke up at": "05:30 AM",
      "Duration": "8h"
    },
    {
      "image": "assets/images/userSection.png",
      "Sleep at": "10:30 PM",
      "Woke up at": "04:30 AM",
      "Duration": "6h"
    },
    {
      "image": "assets/images/userSection.png",
      "Sleep at": "08:30 PM",
      "Woke up at": "03:00 AM",
      "Duration": "8h 30m"
    },
    {
      "image": "assets/images/userSection.png",
      "Sleep at": "09:30 PM",
      "Woke up at": "04:50 AM",
      "Duration": "7h 20m"
    },
    {
      "image": "assets/images/userSection.png",
      "Sleep at": "10:30 PM",
      "Woke up at": "07:30 AM",
      "Duration": "8h"
    }
  ];
  List chantingDataList = [
    {
      "image": "assets/images/userSection.png",
      "Total": "16+2",
      "Slot 1": "10",
      "Slot 2": "5",
      "Slot 3": "4"
    },
    {
      "image": "assets/images/userSection.png",
      "Total": "16",
      "Slot 1": "4",
      "Slot 2": "6",
      "Slot 3": "8"
    },
    {
      "image": "assets/images/userSection.png",
      "Total": "16+3",
      "Slot 1": "2",
      "Slot 2": "0",
      "Slot 3": "9"
    },
    {
      "image": "assets/images/userSection.png",
      "Total": "8",
      "Slot 1": "4",
      "Slot 2": "10",
      "Slot 3": "5"
    },
    {
      "image": "assets/images/userSection.png",
      "Total": "16",
      "Slot 1": "6",
      "Slot 2": "2",
      "Slot 3": "2"
    },
  ];
  List worshipDataList = [
    {
      "image": "assets/images/userSection.png",
      "Mangala Aarti": "07:00 AM",
      "Tulsi Parikrama": "assets/svg/wrong.svg",
      "Offered Bhoga": "assets/svg/right.svg",
      "Sandhya Aarti": "assets/svg/right.svg",
    },
    {
      "image": "assets/images/userSection.png",
      "Mangala Aarti": "07:30 AM",
      "Tulsi Parikrama": "assets/svg/right.svg",
      "Offered Bhoga": "assets/svg/wrong.svg",
      "Sandhya Aarti": "assets/svg/wrong.svg",
    },
    {
      "image": "assets/images/userSection.png",
      "Mangala Aarti": "06:30 AM",
      "Tulsi Parikrama": "assets/svg/wrong.svg",
      "Offered Bhoga": "assets/svg/right.svg",
      "Sandhya Aarti": "assets/svg/right.svg",
    },
    {
      "image": "assets/images/userSection.png",
      "Mangala Aarti": "08:00 AM",
      "Tulsi Parikrama": "assets/svg/right.svg",
      "Offered Bhoga": "assets/svg/wrong.svg",
      "Sandhya Aarti": "assets/svg/wrong.svg",
    },
    {
      "image": "assets/images/userSection.png",
      "Mangala Aarti": "07:30 AM",
      "Tulsi Parikrama": "assets/svg/wrong.svg",
      "Offered Bhoga": "assets/svg/right.svg",
      "Sandhya Aarti": "assets/svg/right.svg",
    },
  ];
  List prasadamDataList = [
    {
      "image": "assets/images/userSection.png",
      "Breakfast": "assets/svg/right.svg",
      "Lunch": "assets/svg/right.svg",
      "Dinner": "assets/svg/right.svg"
    },
    {
      "image": "assets/images/userSection.png",
      "Breakfast": "assets/svg/wrong.svg",
      "Lunch": "assets/svg/block.svg",
      "Dinner": "assets/svg/block.svg"
    },
    {
      "image": "assets/images/userSection.png",
      "Breakfast": "assets/svg/right.svg",
      "Lunch": "assets/svg/wrong.svg",
      "Dinner": "assets/svg/right.svg"
    },
    {
      "image": "assets/images/userSection.png",
      "Breakfast": "assets/svg/wrong.svg",
      "Lunch": "assets/svg/right.svg",
      "Dinner": "assets/svg/right.svg"
    },
    {
      "image": "assets/images/userSection.png",
      "Breakfast": "assets/svg/block.svg",
      "Lunch": "assets/svg/block.svg",
      "Dinner": "assets/svg/block.svg"
    },
  ];
  List knowledgeDataList = [
    {
      "image": "assets/images/userSection.png",
      "Preaching": "00:30",
      "Audio Lectures": "-",
      "KC Services": "01:30"
    },
    {
      "image": "assets/images/userSection.png",
      "Preaching": "01:30",
      "Audio Lectures": "00:30",
      "KC Services": "02:30"
    },
    {
      "image": "assets/images/userSection.png",
      "Preaching": "00:30",
      "Audio Lectures": "00:30",
      "KC Services": "01:30"
    },
    {
      "image": "assets/images/userSection.png",
      "Preaching": "01:30",
      "Audio Lectures": "01:30",
      "KC Services": "00:30"
    },
    {
      "image": "assets/images/userSection.png",
      "Preaching": "01:00",
      "Audio Lectures": "00:30",
      "KC Services": "00:30"
    },
  ];

  List<DataColumn> sleepDataColumn() {
    return sleepList.map((task) => DataColumn(label: Text(task))).toList();
  }

  List<DataRow> sleepDataRow() {
    return sleepDataList.map((data) {
      return DataRow(
          cells: sleepList.map((task) {
        if (task == '') {
          return DataCell(Image.asset(data['image'], width: 40));
        } else {
          return DataCell(Center(child: Text(data[task].toString())));
        }
      }).toList());
    }).toList();
  }

  List<DataColumn> chantingDataColumn() {
    return chantingList.map((task) => DataColumn(label: Text(task))).toList();
  }

  List<DataRow> chantingDataRow() {
    return chantingDataList.map((data) {
      return DataRow(
          cells: chantingList.map((task) {
        if (task == '') {
          return DataCell(Center(child: Image.asset(data['image'], width: 40)));
        } else {
          return DataCell(Center(child: Text(data[task].toString())));
        }
      }).toList());
    }).toList();
  }

  List<DataColumn> worshipDataColumn() {
    return worshipList.map((task) => DataColumn(label: Text(task))).toList();
  }

  List<DataRow> worshipDataRow() {
    return worshipDataList.map((data) {
      return DataRow(
          cells: worshipList.map((task) {
        if (task == '') {
          return DataCell(Center(child: Image.asset(data['image'], width: 40)));
        } else if (task == "Mangala Aarti") {
          return DataCell(Center(child: Text(data[task])));
        } else {
          return DataCell(
              Center(child: SvgPicture.asset(data[task].toString())));
        }
      }).toList());
    }).toList();
  }

  List<DataColumn> prasadamDataColumn() {
    return prasadamList.map((task) => DataColumn(label: Text(task))).toList();
  }

  List<DataRow> prasadamDataRow() {
    return prasadamDataList.map((data) {
      return DataRow(
          cells: prasadamList.map((task) {
        if (task == '') {
          return DataCell(Center(child: Image.asset(data['image'], width: 40)));
        } else {
          return DataCell(
              Center(child: SvgPicture.asset(data[task].toString())));
        }
      }).toList());
    }).toList();
  }

  List<DataColumn> knowledgeDataColumn() {
    return knowledgeList.map((task) => DataColumn(label: Text(task))).toList();
  }

  List<DataRow> knowledgeDataRow() {
    return knowledgeDataList.map((data) {
      return DataRow(
          cells: knowledgeList.map((task) {
        if (task == '') {
          return DataCell(Center(child: Image.asset(data['image'], width: 40)));
        } else {
          return DataCell(Center(child: Text(data[task].toString())));
        }
      }).toList());
    }).toList();
  }

  selectedCategory(index) {
    isSelected = index;
    notifyListeners();
  }
}
