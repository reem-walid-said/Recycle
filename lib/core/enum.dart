enum ScreenStates { init, loading, done, error, empty, notFound, success }

enum ParentsChosenNavigationItem {
  home,
  map,
  recycling_process,
  categories,
  profile
}

enum TeacherChosenNavigationItem { home, messages, notification, qr, profile }

enum SelectedDayForSchedule { sun, mon, tue, wed, thu, fri, sat }

enum SelectedDayForScheduleparent { sun1, mon1, tue1, wed1, thu1, fri1, sat1 }

// ignore: constant_identifier_names
enum SelectedJobAppliedSection { Active, Rejected }

enum LoadingState { initial, loading, error, done }

enum FilePicking { choosing, error, done, initial }

enum VerificationMethod { sms, authenticator }
