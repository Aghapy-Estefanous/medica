import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/models/clinicModel.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/screens/details_screen/details_clinics.dart';
import 'package:medica/shared/cubit/Cubit.dart'; // Import your cubit file

class departmentClinicsScreen extends StatefulWidget {
  final int? DepertmentId;
  final String? DepertmentName;
  departmentClinicsScreen({super.key, this.DepertmentId, this.DepertmentName, required AppCubit cubit});

  @override
  State<departmentClinicsScreen> createState() =>
      _departmentClinicsScreenState();
}

class _departmentClinicsScreenState extends State<departmentClinicsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppCubit>(context)
        .GetAllClinicOfDepartments(widget.DepertmentId);
        
  }

  Widget build(BuildContext context) {
      
           List<DataClinic>? cliniclist=[];
    return BlocConsumer<AppCubit, AppState>(listener: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        cliniclist=cubit.allClinicsOfDepartmentslist;
      if (state is GetAllClinicsDepartmentSuccessState ) {
            cliniclist=cubit.allClinicsOfDepartmentslist;
            print("sucess pass here ");
      }
    }, builder: (context, state) {
       print("depart id ${widget.DepertmentId} ");
       
      return State is GetAllDepartmentLoadingState
          ? Center(child: CircularProgressIndicator())
          :Scaffold(
        appBar: MyAppBarWidget(context, "All Clinics in ${widget.DepertmentName}"),  
        body: Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemCount:cliniclist?.length??0,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemBuilder: (context, index) {
                  return Container(
                    //color: AppColor.primaryColor,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color.fromARGB(219, 2, 78, 154)),
                    child: ListTile(
                        leading: Icon(
                          Icons.medical_services_rounded,
                          color: Color.fromARGB(255, 230, 226, 226),
                          size: 30,
                        ),
                        title: Text(cliniclist?[index].name??"",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColor.whiteColor,
                                    )),
                        trailing: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColor.orangcolor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12.0), // Adjust the value as needed
                                ),
                              ),
                            ),
                            onPressed: () {
                           navigateToScreen(context, DetailsScreen(cliniclist?[index]));
                            },
                            child: Text(
                              "Details",
                              style: TextStyle(color: Colors.white),
                            ))),
                  );
                }),
          )
        ],
      )
        )
        );}
        );
        }}
