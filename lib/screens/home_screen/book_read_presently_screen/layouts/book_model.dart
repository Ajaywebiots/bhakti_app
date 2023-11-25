// import 'dart:convert';
// import 'dart:developer';
//
// import '../../layouts/list_model.dart';
//
// class MapDataToWidget {
//   List serverWidgets = [];
//
//   mapWidgets(serverUI) {
//     for (var element in jsonDecode(serverUI)) {
//       String book = element['books'];
//       log(book);
//       serverWidgets.add(BookModel());
//     }
//     return serverWidgets;
//   }
// }
//
// class BookModel {
//   String? bookId;
//   String? bookName;
//   String? imageName;
//   String? link;
//   String? imageSrc;
//
//   BookModel(
//       {this.bookId, this.bookName, this.imageName, this.link, this.imageSrc});
//
//   BookModel.fromJson(Map<String, dynamic> json) {
//     bookId = json['book_id'];
//     bookName = json['book_name'];
//     imageName = json['image_name'];
//     link = json['link'];
//     imageSrc = json['image_src'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['book_id'] = this.bookId;
//     data['book_name'] = this.bookName;
//     data['image_name'] = this.imageName;
//     data['link'] = this.link;
//     data['image_src'] = this.imageSrc;
//     return data;
//   }
// }
