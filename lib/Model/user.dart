class UserModel{
 final String name;
 final String num;
 final String email;
 final String password;
 final String id;

//<editor-fold desc="Data Methods">
  const UserModel({
    required this.name,
    required this.num,
    required this.email,
    required this.password,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          num == other.num &&
          email == other.email &&
          password == other.password &&
          id == other.id);

  @override
  int get hashCode =>
      name.hashCode ^
      num.hashCode ^
      email.hashCode ^
      password.hashCode ^
      id.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' name: $name,' +
        ' num: $num,' +
        ' email: $email,' +
        ' password: $password,' +
        ' id: $id,' +
        '}';
  }

  UserModel copyWith({
    String? name,
    String? num,
    String? email,
    String? password,
    String? id,
  }) {
    return UserModel(
      name: name ?? this.name,
      num: num ?? this.num,
      email: email ?? this.email,
      password: password ?? this.password,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'num': this.num,
      'email': this.email,
      'password': this.password,
      'id': this.id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      num: map['num'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      id: map['id'] as String,
    );
  }

//</editor-fold>
}