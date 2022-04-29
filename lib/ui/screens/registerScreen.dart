import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rea/domain/entities/user_entity.dart';
import 'package:rea/domain/models/user_model.dart';
import 'package:rea/ui/cubit/auth_cubit.dart';
import 'package:rea/ui/screens/homeScreen.dart';
import 'package:rea/ui/widgets/loading.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _fomKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        secondNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final emailEditingField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
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
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final passwordEditingField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      keyboardType: TextInputType.name,
      obscureText: true,
      validator: (value) {
        RegExp regExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
        if (value!.isEmpty) {
          return 'Se requiere contraseña para registrarse';
        }
        /*if (!regExp.hasMatch(value)) {
          return 'La contraseña debe contener al menos 8 caracteres, una letra mayúscula y un número';
        }*/
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final confirmPasswordEditingField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordEditingController.text.length > 6 &&
            confirmPasswordEditingController.text !=
                passwordEditingController.text) {
          return 'Las contraseñas no coinciden';
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp();
        },
        child: const Text("SingUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(listener: ((context, state) {
        if (state is RegisterOk) {
          HomeScreen();
        }
        if (state is RegisterOff) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Registro fallido'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }), builder: (context, state) {
        if (state is RegisterLoad) {
          return LoadingWidget(context: context);
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
                      const Text("Rea",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent)),
                      const SizedBox(
                        height: 45,
                      ),
                      firstNameField,
                      const SizedBox(
                        height: 25,
                      ),
                      secondNameField,
                      const SizedBox(
                        height: 25,
                      ),
                      emailEditingField,
                      const SizedBox(
                        height: 25,
                      ),
                      passwordEditingField,
                      const SizedBox(
                        height: 25,
                      ),
                      confirmPasswordEditingField,
                      const SizedBox(
                        height: 25,
                      ),
                      signUpButton,
                    ]),
              ),
            ),
          ),
        );
      }),
    );
  }

  void signUp() async {
    if (_fomKey.currentState!.validate()) {
      //firstNameController
      //secondNameController
      final name = firstNameController.text + secondNameController.text;
      UserEntity user = UserEntity(
          name: name,
          email: emailEditingController.text,
          password: passwordEditingController.text);
      await BlocProvider.of<AuthCubit>(context).registerNewUser(user);
    }
  }
}
