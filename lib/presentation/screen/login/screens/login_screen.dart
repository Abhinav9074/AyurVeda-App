import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test1/application/login_bloc/login_bloc.dart';
import 'package:machine_test1/application/login_bloc/login_event.dart';
import 'package:machine_test1/application/login_bloc/login_state.dart';
import 'package:machine_test1/presentation/core/theme.dart';
import 'package:machine_test1/presentation/widgets/button.dart';
import 'package:machine_test1/presentation/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCont = TextEditingController();
    TextEditingController passCont = TextEditingController();
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccessState){
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Banner section
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.27,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/bg2.png'),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),

                //Heading section
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        'Login Or Register To Book \nYour Appoinment',
                        style: MyTextStyle.largeText,
                      ),
                    ],
                  ),
                ),

                //Credentials section

                //EMAIL
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: CustomTextField(
                    text: 'Email',
                    hint: 'Enter Your Email',
                    textCont: emailCont,
                    obscure: false,
                  ),
                ),

                //PASSWORD
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomTextField(
                    text: 'Password',
                    hint: 'Enter Password',
                    textCont: passCont,
                    obscure: true,
                  ),
                ),

                //Login Button

                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const CircularProgressIndicator();
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: CommonButton(
                          text: 'Login',
                          onPressed: () {
                            if (emailCont.text.isNotEmpty &&
                                passCont.text.isNotEmpty) {
                              BlocProvider.of<LoginBloc>(context).add(
                                  LoggedInEvent(
                                      email: emailCont.text,
                                      password: passCont.text));
                            }
                          },
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
