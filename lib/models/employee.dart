class Employee{
  String id;
  String username;
  String email;
  String phone;
  String warehouseID;

  String? address;
  DateTime? departureTime;
  DateTime? attendanceTime;


  Employee({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.warehouseID,

    this.address,
    this.attendanceTime,
    this.departureTime,
});
}