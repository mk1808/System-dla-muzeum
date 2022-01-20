class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

class Exhibit {
  final int id;
  final String name;
  final String number;
  final String description;
  final Room? room;
  final String photo;
  final bool? connected;

  Exhibit(this.id, this.name, this.number, this.description, this.room,
      this.photo, this.connected);

  Exhibit.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        number = json['number'],
        description = json['description'],
        room = json['room'] != null ? Room.fromJson(json['room']) : null,
        photo = json['photo'],
        connected = json['connected'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'number': number,
        'description': description,
        'room': room?.toJson(),
        'photo': photo,
        'connected': connected
      };
}

class Room {
  final int id;
  final String name;

  Room(this.id, this.name);

  Room.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class Point {
  final int? id;
  final Exhibit? exhibit;
  final double x;
  final double y;
  final double z;

  Point(this.id, this.exhibit, this.x, this.y, this.z);

  Point.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        exhibit =
            json['exhibit'] != null ? Exhibit.fromJson(json['exhibit']) : null,
        x = json['x'],
        y = json['y'],
        z = json['z'];

  Map<String, dynamic> toJson() => {
        'id': id != null ? id : "",
        'exhibit': exhibit?.toJson(),
        'x': x,
        'y': y,
        'z': z,
      };
}
