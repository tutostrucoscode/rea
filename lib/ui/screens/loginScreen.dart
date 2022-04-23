import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rea/ui/cubit/auth_cubit.dart';
import 'package:rea/ui/screens/homeScreen.dart';
import 'package:rea/ui/screens/registerScreen.dart';
import 'package:rea/ui/widgets/loading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _fomKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, introduzca un texto';
        }
        if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
            .hasMatch(value)) {
          return 'Por favor introduzca una dirección de correo electrónico válida';
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
        if (value!.isEmpty) {
          return 'Se requiere contraseña para iniciar sesión';
        }
        // if (!regExp.hasMatch(value)) {
        //   return 'La contraseña debe contener al menos 8 caracteres, una letra mayúscula y un número';
        // }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signIn(emailController.text, passwordController.text);
        },
        child: const Text('Login',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LogginOff) {
            Scaffold.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Usuario no registrado'),
                    Icon(Icons.error_outline),
                  ],
                ),
              ),
            ));
          }
        },
        builder: (context, state) {
          if (state is LogginLoad) {
            return LoadingWidget(context: context);
          }
          if (state is LogginOk) {
            return HomeScreen();
          }
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _fomKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text('Rea',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                        const SizedBox(
                          height: 45,
                        ),
                        emailField,
                        const SizedBox(
                          height: 25,
                        ),
                        passwordField,
                        const SizedBox(
                          height: 35,
                        ),
                        loginButton,
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("No tienes una cuenta?"),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegistrationScreen()));
                              },
                              child: const Text("Registrate",
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            )
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_fomKey.currentState!.validate()) {
      await BlocProvider.of<AuthCubit>(context).loggedIn(email, password);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Porfavor llene todos los campos para ingresar')));
    }
  }
}
