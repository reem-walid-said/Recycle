import 'package:flutter/material.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/nav_bar/nav_bar.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/homeprovider.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../services/local/notifications.dart' show NotificationService;

class Home_U extends StatefulWidget {
  const Home_U({super.key});

  @override
  State<Home_U> createState() => _Home_UState();
}

class _Home_UState extends State<Home_U> {
  late final NotificationService _notificationService;
  late String _userId;
  bool _notificationsInitialized = false;

  @override
  void initState() {
    super.initState();
    _notificationService = NotificationService();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    // Get user ID from provider
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    _userId = userProvider.state.myUser.globalID;

    // Initialize notification services
    await _notificationService.initNotifications();
    await _notificationService.requestNotificationPermissions(context);

    // Start listening for notifications
    _notificationService.listenForNotifications(_userId);
    _notificationsInitialized = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newUserId = Provider.of<UserProvider>(context, listen: false).state.myUser.globalID;

    // Reinitialize if user ID changed
    if (newUserId != _userId && _notificationsInitialized) {
      _userId = newUserId;
      _notificationService.cancelNotificationListener();
      _notificationService.listenForNotifications(_userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<HomeProvider_U>().chosenPage(),
        bottomNavigationBar: const BottomNavBar_U());
  }
}
