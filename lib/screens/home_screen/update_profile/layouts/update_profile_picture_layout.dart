import 'dart:io';
import 'package:bhakti_app/config.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfilePicture extends StatelessWidget {
  const UpdateProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(
        builder: (child, updateProfilePvr, ss) {
      return Stack(children: [
        updateProfilePvr.imagePath != "" && updateProfilePvr.image != null
            ? CircleAvatar(
                backgroundImage: FileImage(File(updateProfilePvr.imagePath)),
                maxRadius: 55)
            : updateProfilePvr.downloadUrl != ""
                ? CircleAvatar(
                    backgroundImage: NetworkImage(updateProfilePvr.downloadUrl),
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
                    onTap: () => updateProfilePvr.profilePicUpdate(context),
                    child: SvgPicture.asset(eSvgAssets.camera, height: 30))))
      ]).paddingSymmetric(vertical: 30);
    });
  }
}
