import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test1/application/home_bloc/home_bloc.dart';
import 'package:machine_test1/application/home_bloc/home_event.dart';
import 'package:machine_test1/application/home_bloc/home_state.dart';
import 'package:machine_test1/domain/models/patient_model.dart';
import 'package:machine_test1/presentation/screen/home/widgets/patient_tab.dart';
import 'package:machine_test1/presentation/widgets/button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: () {
        BlocProvider.of<HomeBloc>(context).add(HomeRefreshEvent());
        _refreshController.refreshCompleted();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              BlocProvider.of<HomeBloc>(context).add(HomeRefreshEvent());
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeRefreshLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoadedState) {
              return Column(
                children: [
                  Expanded(
                    child: ValueListenableBuilder(
                        valueListenable: state.patientList,
                        builder: (BuildContext context,
                            List<PatientDetails> list, Widget? _) {
                          return ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                final data = list[index];
                                return PatientTab(
                                  name: data.name!,
                                  index: '${index + 1}',
                                  date: data.createDate!,
                                  treatement: data.treatmentDetails![0]
                                      ['treatment_name'],
                                );
                              });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommonButton(
                      text: 'Register Now',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/register',
                        );
                      },
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          },
        ),
      ),
    );
  }
}
