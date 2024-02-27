import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test1/application/registration_bloc/registration_bloc.dart';
import 'package:machine_test1/application/registration_bloc/registration_event.dart';
import 'package:machine_test1/application/registration_bloc/registration_state.dart';
import 'package:machine_test1/presentation/core/theme.dart';
import 'package:machine_test1/presentation/widgets/drop_down.dart';
import 'package:machine_test1/presentation/widgets/location_drop_down.dart';
import 'package:machine_test1/presentation/widgets/text_field.dart';

class RegisterPatient extends StatelessWidget {
  RegisterPatient({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameCont = TextEditingController();
    TextEditingController numberCont = TextEditingController();
    TextEditingController addressCont = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          if(state is RegistrationLoadingState){
            BlocProvider.of<RegistrationBloc>(context).add(RegistrationLoadEvent());
            return const Center(child: CircularProgressIndicator(),);

          }else if(state is RegistrationLoadedState){
            return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Heading
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Register',
                    style: MyTextStyle.commonHeadingText,
                  ),
                ),

                //Divider
                const Divider(),

                CustomTextField(
                    hint: 'Enter Your Full Name',
                    textCont: nameCont,
                    obscure: false,
                    text: 'Name'),
                CustomTextField(
                    hint: 'Enter Your Whatsapp Number',
                    textCont: numberCont,
                    obscure: false,
                    text: 'Name'),
                CustomTextField(
                    hint: 'Enter Your Full Address',
                    textCont: addressCont,
                    obscure: false,
                    text: 'Name'),
                LocationDropDown(
                  text: 'Location',
                  list: locationList,
                  hint: 'Choose Your Location',
                ),
                BranchDropDown(
                  text: 'Branch',
                  list: state.branchList.value.map((e){
                    return DropdownMenuItem(value: e,child: Text(e.name!),);
                  }).toList(),
                  hint: 'Choose Your Branch',
                ),
                CustomTextField(
                    hint: '',
                    textCont: nameCont,
                    obscure: false,
                    text: 'Total Amount'),
                CustomTextField(
                    hint: '',
                    textCont: nameCont,
                    obscure: false,
                    text: 'Discount Amount'),
                CustomTextField(
                    hint: '',
                    textCont: nameCont,
                    obscure: false,
                    text: 'Advance Amount'),
                CustomTextField(
                    hint: '',
                    textCont: nameCont,
                    obscure: false,
                    text: 'Balance Amount'),
                CustomTextField(
                    hint: '',
                    textCont: nameCont,
                    obscure: false,
                    text: 'Treatment Date'),
              ],
            ),
          );
          }else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  List<DropdownMenuItem> locationList = [
    const DropdownMenuItem(
      value: 1,
      child: Text('Kasargod'),
    ),
    const DropdownMenuItem(value: 'Kannur', child: Text('Kannur')),
    const DropdownMenuItem(value: 'Wayanad', child: Text('Wayanad')),
    const DropdownMenuItem(value: 'Kozhikode', child: Text('Kozhikode')),
    const DropdownMenuItem(value: 'Malappuram', child: Text('Malappuram')),
    const DropdownMenuItem(value: 'Thrissur', child: Text('Thrissur')),
    const DropdownMenuItem(value: 'Kottayam', child: Text('Kottayam')),
    const DropdownMenuItem(value: 'Eranakulam', child: Text('Eranakulam')),
    const DropdownMenuItem(value: 'Palakkad', child: Text('Palakkad')),
    const DropdownMenuItem(value: 'Alapuzha', child: Text('Alapuzha')),
    const DropdownMenuItem(value: 'Pathanamthitta', child: Text('Pathanamthitta')),
    const DropdownMenuItem(value: 'Kollam', child: Text('Kollam')),
    const DropdownMenuItem(value: 'Idukki', child: Text('Idukki')),
    const DropdownMenuItem(value: 'Thiruvananthupuram', child: Text('Thiruvananthupuram')),
  ];
}
