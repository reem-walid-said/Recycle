import 'package:project/models/employee.dart';
import 'package:project/models/warehouse.dart';
import 'package:project/services/local/notifications.dart';

import '../../../../models/user.dart';

class UserStates{

  // The current logged in user
  dynamic myUser;
  Warehouse? currentEmployeeBranch;
  // The Notifications Service
  // NotificationService notificationService = NotificationService();
}