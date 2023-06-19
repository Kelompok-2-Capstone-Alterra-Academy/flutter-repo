import 'dart:io';
import 'package:flutter/material.dart';
import 'package:staredu/views/screen/auth/forgot_password/forgot_password_view_model.dart';
import 'package:staredu/views/screen/auth/forgot_password/main/forgot_password_screen.dart';
import 'package:staredu/views/screen/auth/forgot_password/otp_verification/otp_verification_screen.dart';
import 'package:staredu/views/screen/auth/forgot_password/reset_password/reset_password.dart';
import 'package:staredu/views/screen/auth/login/login_screen.dart';
import 'package:staredu/views/screen/auth/login/login_view_model.dart';
import 'package:staredu/views/screen/auth/register/register_screen_view_model.dart';
import 'package:staredu/views/screen/course/course_taken_list_screen.dart';
import 'package:staredu/views/screen/course/module/detail/module_detail_video_screen.dart';
import 'package:staredu/views/screen/course/module/module_ask_mentor_screen.dart';
import 'package:staredu/views/screen/course/module/detail/module_detail_task_screen.dart';
import 'package:staredu/views/screen/course/module/module_list_screen.dart';
import 'package:staredu/views/screen/course/module/module_live_session_screen.dart';
import 'package:staredu/views/screen/course/module/module_list_quiz_screen.dart';
import 'package:staredu/views/screen/auth/register/account_verification/account_verification.dart';
import 'package:staredu/views/screen/auth/register/main/register_screen.dart';
import 'package:staredu/views/screen/edit_profile/edit_profile_screen.dart';
import 'package:staredu/views/screen/edit_profile/edit_profile_view_model.dart';
import 'package:staredu/views/screen/history/history_transaction_screen.dart';
import 'package:staredu/views/screen/history/history_transaction_view_model.dart';
import 'package:staredu/views/screen/home/home_screen.dart';
import 'package:staredu/views/screen/home/home_view_model.dart';
import 'package:staredu/views/screen/live_session/schedule_view_model.dart';
import 'package:staredu/views/screen/news/news_view_model.dart';
import 'package:staredu/views/screen/notification/notification_screen.dart';
import 'package:staredu/views/screen/notification/notification_view_model.dart';
import 'package:staredu/views/screen/profile/profile_screen.dart';
import 'package:staredu/views/screen/course/module/detail/module_quiz_detail_screen.dart';
import 'package:staredu/views/screen/course/module/module_send_task_screen.dart';
import 'package:staredu/views/screen/course/module/module_task_list_screen.dart';
import 'package:staredu/views/screen/mentor/chat_mentor_screen.dart';
import 'package:staredu/views/screen/mentor/mentor_screen.dart';
import 'package:staredu/views/screen/mentor/search_chat_screen.dart';
import 'package:staredu/views/screen/profile/profile_view_model.dart';
import 'package:staredu/views/screen/sell_course/course_payment_screen.dart';
import 'package:staredu/views/screen/sell_course/course_voucher_screen.dart';
import 'package:staredu/views/screen/sell_course/sell_course_screen.dart';
import 'package:staredu/views/screen/post_feed/post_feed_screen.dart';
import 'package:staredu/views/screen/live_session/schedule_course_screen.dart';
import 'package:staredu/views/screen/course/module/detail/module_detail_ppt_screen.dart';
import 'package:staredu/views/screen/news/news_screen.dart';
import 'package:staredu/views/screen/splash_welcome/splash_welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:staredu/views/screen/wishlist/wishlist_screen.dart';
import 'package:staredu/views/view_model/mentor/mentor_view_model.dart';
import 'package:staredu/views/view_model/sell_course/course_payment_view_model.dart';
import 'package:staredu/views/view_model/sell_course/sell_course_view_model.dart';
import 'package:staredu/views/view_model/sell_course/voucher_view_model.dart';
import 'package:staredu/widgets/bottom_navigation_bar/bottom_navigation_bar_view_model.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = PostHttpOverrides();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ChangeNotifierProvider(create: (_) => NotificationViewModel()),
      ChangeNotifierProvider(
          create: (_) => BottomNavigationBarComponentViewModel()),
      ChangeNotifierProvider(create: (_) => RegisterViewModel()),
      ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ChangeNotifierProvider(create: (_) => ForgotPasswordViewModel()),
      ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ChangeNotifierProvider(create: (_) => EditProfileViewModel()),
      ChangeNotifierProvider(create: (_) => HistoryTransactionViewModel()),
      ChangeNotifierProvider(create: (_) => MentorViewModel()),
      ChangeNotifierProvider(create: (_) => SellCourseViewModel()),
      ChangeNotifierProvider(create: (_) => VoucherViewModel()),
      ChangeNotifierProvider(create: (_) => CoursePaymentViewModel()),
      ChangeNotifierProvider(create: (_) => ScheduleViewModel()),
      ChangeNotifierProvider(create: (_) => NewsViewModel()),
    ],
    child: const StarEdu(),
  ));
}

class StarEdu extends StatelessWidget {
  const StarEdu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StarEdu',
      // add primary color
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: SplashWelcomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SplashWelcomeScreen.routeName: (context) => const SplashWelcomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        PostFeedScreen.routeName: (context) => const PostFeedScreen(),
        ScheduleCourseScreen.routeName: (context) =>
            const ScheduleCourseScreen(),
        CourseTakenListScreen.routeName: (context) =>
            const CourseTakenListScreen(),
        ModuleListScreen.routeName: (context) => const ModuleListScreen(),
        AskMentorScreen.routeName: (context) => const AskMentorScreen(),
        LiveSessionScreen.routeName: (context) => const LiveSessionScreen(),
        ModuleListQuizScreen.routeName: (context) =>
            const ModuleListQuizScreen(),
        ModuleVideoScreen.routeName: (context) => const ModuleVideoScreen(),
        ModulDetailPPTScreen.routeName: (context) =>
            const ModulDetailPPTScreen(),
        ForgotPasswordScreen.routeName: (context) =>
            const ForgotPasswordScreen(),
        OtpVerificationScreen.routeName: (context) =>
            const OtpVerificationScreen(),
        ResetPasswordScreen.routeName: (context) => const ResetPasswordScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        AccountVerification.routeName: (context) => const AccountVerification(),
        Profile.routeName: (context) => const Profile(),
        EditProfile.routeName: (context) => const EditProfile(),
        NotificationScreen.routeName: (context) => const NotificationScreen(),
        ModuleQuizDetailScreen.routeName: (context) =>
            const ModuleQuizDetailScreen(),
        ModuleSendTaskScreen.routeName: (context) =>
            const ModuleSendTaskScreen(),
        NewsScreen.routeName: (context) => const NewsScreen(),
        SellCourseScreen.routeName: (context) => const SellCourseScreen(),
        CourseVoucherScreen.routeName: (context) => const CourseVoucherScreen(),
        MentorScreen.routeName: (context) => const MentorScreen(),
        ChatMentorScreen.routeName: (context) => const ChatMentorScreen(),
        SearchChatScreen.routeName: (context) => const SearchChatScreen(),
        TaskListScreen.routeName: (context) => const TaskListScreen(),
        ModuleDetailTask.routeName: (context) => const ModuleDetailTask(),
        WishlistScreen.routeName: (context) => const WishlistScreen(),
        HistoryTransactionScreen.routeName: (context) =>
            const HistoryTransactionScreen(),
      },
    );
  }
}
