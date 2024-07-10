part of 'login_cubit.dart';

class LoginState {
  final Name name;
  final Phone phone;
  final Email email;
  final String? gender;
  final String country;
  final String state;
  final String city;
  const LoginState(
      {this.phone = const Phone.pure(),
      this.name = const Name.pure(),
      this.email = const Email.pure(),
      this.country = '',
      this.state = '',
      this.city = '',
      this.gender});
  List<Object?> get props => [name, phone, email, gender, country, state, city];

  LoginState copyWith(
          {Phone? phone,
          Name? name,
          Email? email,
          String? gender,
          String? country,
          String? state,
          String? city}) =>
      LoginState(
          phone: phone ?? this.phone,
          name: name ?? this.name,
          email: email ?? this.email,
          gender: gender ?? this.gender,
          country: country ?? this.country,
          city: city ?? this.city,
          state: state ?? this.state);
}
