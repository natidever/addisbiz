// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

// class Welcome {
//     Business business;
//     List<dynamic> goldcompanies;
//     List<Silvercompany> silvercompanies;

//     Welcome({
//         required this.business,
//         required this.goldcompanies,
//         required this.silvercompanies,
//     });

//     factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         business: Business.fromJson(json["business"]),
//         goldcompanies: List<dynamic>.from(json["goldcompanies"].map((x) => x)),
//         silvercompanies: List<Silvercompany>.from(json["silvercompanies"].map((x) => Silvercompany.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "business": business.toJson(),
//         "goldcompanies": List<dynamic>.from(goldcompanies.map((x) => x)),
//         "silvercompanies": List<dynamic>.from(silvercompanies.map((x) => x.toJson())),
//     };
// }

// class Business {
//     int businessId;
//     String businessName;
//     String ?mobile;
//     String ?office;
//     String ?fax;
//     String ?website;
//     String ?email;
//     String ?address;
//     String ?city;
//     String ?shortDescription;
//     String ?mainDescription;
//     dynamic logo;
//     String ?package;
//     dynamic packageExpiryDate;
//     DateTime ?timeNow;

//     Business({
//         required this.businessId,
//         required this.businessName,
//          this.mobile,
//          this.office,
//          this.fax,
//          this.website,
//          this.email,
//          this.address,
//          this.city,
//          this.shortDescription,
//          this.mainDescription,
//          this.logo,
//          this.package,
//          this.packageExpiryDate,
//          this.timeNow,
//     });

//     factory Business.fromJson(Map<String, dynamic> json) => Business(
//         businessId: json["BusinessID"],
//         businessName: json["BusinessName"],
//         mobile: json["Mobile"]??"we will add phone number soon..",
//         office: json["Office"]??'',
//         fax: json["Fax"]??'',
//         website: json["Website"]??'',
//         email: json["Email"]??'',
//         address: json["Address"]??'',
//         city: json["City"]??'',
//         shortDescription: json["ShortDescription"]??'',
//         mainDescription: json["MainDescription"]??'',
//         logo: json["Logo"]??'',
//         package: json["Package"],
//         packageExpiryDate: json["PackageExpiryDate"]??'',
//         timeNow: DateTime.parse(json["TimeNow"])
//     );

//     Map<String, dynamic> toJson() => {
//         "BusinessID": businessId,
//         "BusinessName": businessName,
//         "Mobile": mobile,
//         "Office": office,
//         "Fax": fax,
//         "Website": website,
//         "Email": email,
//         "Address": address,
//         "City": city,
//         "ShortDescription": shortDescription,
//         "MainDescription": mainDescription,
//         "Logo": logo,
//         "Package": package,
//         "PackageExpiryDate": packageExpiryDate,
//         "TimeNow": timeNow.toString(),
//     };
// }

// class Silvercompany {
//     String businessName;
//     String city;
//     String package;
//     int businessId;
//     String mobile;
//     String office;
//     String? logo;
//     String fax;
//     String email;
//     String website;
//     String address;
//     double myRandom;

//     Silvercompany({
//         required this.businessName,
//         required this.city,
//         required this.package,
//         required this.businessId,
//         required this.mobile,
//         required this.office,
//         required this.logo,
//         required this.fax,
//         required this.email,
//         required this.website,
//         required this.address,
//         required this.myRandom,
//     });

//     factory Silvercompany.fromJson(Map<String, dynamic> json) => Silvercompany(
//         businessName: json["BusinessName"],
//         city: json["City"],
//         package: json["Package"],
//         businessId: json["BusinessID"],
//         mobile: json["Mobile"],
//         office: json["Office"],
//         logo: json["Logo"],
//         fax: json["Fax"],
//         email: json["Email"],
//         website: json["Website"],
//         address: json["Address"],
//         myRandom: json["MyRandom"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "BusinessName": businessName,
//         "City": city,
//         "Package": package,
//         "BusinessID": businessId,
//         "Mobile": mobile,
//         "Office": office,
//         "Logo": logo,
//         "Fax": fax,
//         "Email": email,
//         "Website": website,
//         "Address": address,
//         "MyRandom": myRandom,
//     };
// }



