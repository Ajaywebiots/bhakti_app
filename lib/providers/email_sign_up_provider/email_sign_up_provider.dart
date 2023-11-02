import 'package:bhakti_app/config.dart';

class EmailSignUpProvider extends ChangeNotifier{
  TextEditingController emailId = TextEditingController();
  TextEditingController password = TextEditingController();
  bool value = false;
  String? passwordValid,emailValid;
  final formKey = GlobalKey<FormState>();
}