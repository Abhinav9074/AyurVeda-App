

class PatientDetails {
  final int? id;
  final String? name;
  final String? user;
  final String? createDate;
  final List<dynamic>? treatmentDetails;

  PatientDetails({required this.id, required this.name, required this.user, required this.createDate, required this.treatmentDetails});


 factory PatientDetails.fromJson(Map<String, dynamic> json) {
    return PatientDetails(
        id: json['id'],
        name: json['name'],
        user: json['user'],
        createDate: json['created_at'],
        treatmentDetails: json['patientdetails_set'],);
  }
 
}
