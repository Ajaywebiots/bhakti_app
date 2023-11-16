import 'dart:io';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfilePicture extends StatelessWidget {
  const UpdateProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(builder: (child, profilePvr, ss) {
      return Stack(children: [
        profilePvr.imagePath != ""
            ? CircleAvatar(
                backgroundImage: FileImage(File(profilePvr.imagePath)),
                maxRadius: 55)
            : profilePvr.downloadUrl != ""
                ? CircleAvatar(
                    backgroundImage: NetworkImage(profilePvr.downloadUrl),
                    maxRadius: 55)
                : CircleAvatar(
                    maxRadius: 55, child: Image.asset(eImageAssets.profile)),
        Positioned(
            right: 6,
            top: 80,
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: Insets.i1),
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xff83006E), Color(0xff0060AD)])),
                child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(children: [
                              ListTile(
                                  onTap: () async {
                                    Navigator.pop(context);
                                    XFile? photo = await profilePvr.picker
                                        .pickImage(source: ImageSource.camera);
                                    profilePvr.imagePath = photo!.path;
                                    profilePvr.imgStatus = true;
                                    profilePvr.notifyListeners();
                                  },
                                  title: Text(appFonts.camera),
                                  leading: const Icon(Icons.camera_alt)),
                              ListTile(
                                  onTap: () async {
                                    Navigator.pop(context);
                                    profilePvr.image = await profilePvr.picker
                                        .pickImage(source: ImageSource.gallery);
                                    profilePvr.imagePath =
                                        profilePvr.image!.path;
                                    profilePvr.imgStatus = true;
                                    profilePvr.notifyListeners();
                                  },
                                  title: Text(appFonts.gallery),
                                  leading: const Icon(Icons.image))
                            ]);
                          });
                    },
                    child: SvgPicture.asset(eSvgAssets.camera, height: 30))))
      ]).paddingSymmetric(vertical: 30);
    });
  }
}
