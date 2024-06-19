class UserModel {
  Address address;
  int id;
  String email;
  String username;
  String password;
  Name name;
  String phone;

  UserModel({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      address: Address.fromJson(json['address']),
      email: json['email'],
      id: json['id'],
      name: Name.fromJson(json['name']),
      username: json['username'],
      phone: json['phone'],
      password: json['password'],
    );
  }
}

class Address {
  Geolocation geolocation;
  String city;
  String street;
  int number;
  String zipcode;

  Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        geolocation: Geolocation.fromJson(json['geolocation']),
        city: json['city'],
        number: json['number'],
        street: json['street'],
        zipcode: json['zipcode']);
  }
}

class Geolocation {
  String lat;
  String long;

  Geolocation({
    required this.lat,
    required this.long,
  });

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      lat: json['lat'],
      long: json['long'],
    );
  }
}

class Name {
  String firstname;
  String lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      firstname: json['firstname'],
      lastname: json['lastname'],
    );
  }
}
