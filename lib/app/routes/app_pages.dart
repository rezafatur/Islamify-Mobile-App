import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profileStudent/bindings/profile_student_binding.dart';
import '../modules/profileStudent/views/profile_student_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/scheduleStudent/bindings/schedule_student_binding.dart';
import '../modules/scheduleStudent/views/schedule_student_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SCHEDULE_STUDENT,
      page: () => ScheduleStudentView(),
      binding: ScheduleStudentBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PROFILE_STUDENT,
      page: () => ProfileStudentView(),
      binding: ProfileStudentBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
