import 'package:stacked/stacked_annotations.dart';
import 'package:townsquare/ui/views/auth/sign_in/sign_in.dart';

import '../../ui/views/auth/sign_up/sign_up.dart';
import '../../ui/views/home/home.dart';

const List<StackedRoute> routes = [
  MaterialRoute(page: Home, initial: true),
  MaterialRoute(page: SignIn),
  MaterialRoute(page: SignUp),

];
