

class BranchModel {
  final int? id;
  final String? name;
  final String? location;
  final String? phone;
  final String? email;
  final String? address;
  final String? gst;

  
  BranchModel({required this.id, required this.name, required this.location, required this.phone, required this.email, required this.address, required this.gst});


 factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
        id: json['id'],
        name: json['name'],
        location: json['location'],
        phone: json['phone'],
        email: json['mail'],
        address: json['address'],
        gst: json['gst'],
        );
  }

 
}
