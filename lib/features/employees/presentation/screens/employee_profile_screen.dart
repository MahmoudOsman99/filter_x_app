import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter_x/core/Strings/app_colors.dart';
import 'package:filter_x/config/extensions/app_extensions.dart';
import 'package:filter_x/core/Strings/app_strings.dart';
import 'package:filter_x/core/shared/images_path.dart';
import 'package:filter_x/core/shared/app_constants_value.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';
import 'package:filter_x/features/employees/domain/usecases/add_employee_usecase.dart';
import 'package:filter_x/features/employees/presentation/bloc/bloc.dart';
import 'package:filter_x/features/employees/presentation/bloc/employees_event.dart';
import 'package:filter_x/features/employees/employee_positions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/Strings/collections_names.dart';
import '../../../../core/error/exceptions.dart';
import '../../data/models/employee_model.dart';
import '../widgets/employee_info_card.dart';

class EmployeeProfileScreen extends StatelessWidget {
  const EmployeeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeessBloc, EmployeesState>(
      builder: (context, state) {
        if (state is EmployeesLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: AppColors.orangeColor,
              ),
            ),
          );
        } else if (state is AddUpdateDeletEmployeeErrorState) {
          return Center(
            child: Column(
              children: [
                Text(
                  'Something went wrong',
                  style: context.textList.displayLarge,
                ),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<EmployeessBloc>(context)
                          .add(GetAllEmployeesEvent());
                    },
                    icon: Icon(
                      Icons.add,
                      size: 50,
                    ))
              ],
            ),
          );
        } else if (state is EmployeesLoadedSuccessfullyState) {
          List<Employee> employees = state.employees;
          return Scaffold(
            body: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: context.height * 0.55,
                      // height: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(
                              AppConstantsValues.borderRadiusValue15 + 25),
                          bottomEnd: Radius.circular(
                              AppConstantsValues.borderRadiusValue15 + 25),
                        ),
                        // borderRadius: BorderRadius.circular(
                        //   AppConstantsValues.borderRadiusValue15,
                        // ),
                        child: Image.asset(
                          AppAssets.techImagePath,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const PositionedDirectional(
                      bottom: 10,
                      start: 10,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.yellowColor,
                            borderRadius: BorderRadiusDirectional.only(
                              bottomStart: Radius.circular(25),
                              topEnd: Radius.circular(
                                  AppConstantsValues.borderRadiusValue25),
                              topStart: Radius.circular(
                                  AppConstantsValues.borderRadiusValue25),
                              bottomEnd: Radius.circular(
                                  AppConstantsValues.borderRadiusValue25),
                            ),
                          ),
                          child: Icon(Icons.edit_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                employees[0].name,
                                style: context.textList.bodyLarge,
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.yellowColor,
                                  borderRadius: BorderRadius.circular(
                                    AppConstantsValues.borderRadiusValue15 + 15,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    start: 30,
                                    end: 30,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Text(
                                    getEmployeePositionName(
                                        employees[0].position),
                                    style: context.textList.bodyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Text(
                          //   '${AppStrings.phoneNumberTextArabic} 2: ${technicians[0].phone}',
                          //   style: context.textList.bodyMedium,
                          // ),
                          // Text(
                          //   '${AppStrings.phoneNumberTextArabic}: ${technicians[0].phone2}',
                          //   style: context.textList.bodyMedium,
                          // ),
                          SizedBox(
                            height: context.height * 0.02,
                          ),

                          // EmployeeInfoCard(text: technicians[0].phone),
                          sizedBox(context),
                          EmployeeInfoCard(
                            text: employees[0].phone,
                            icon: const Icon(
                              Icons.phone,
                            ),
                          ),
                          sizedBox(context),
                          EmployeeInfoCard(
                            text: employees[0].phone2,
                            icon: const Icon(
                              Icons.phone,
                            ),
                          ),
                          sizedBox(context),
                          EmployeeInfoCard(
                            text: employees[0].address,
                            icon: const Icon(
                              Icons.house_outlined,
                            ),
                          ),
                          sizedBox(context),
                          EmployeeInfoCard(
                            text: DateFormat('MMMM - yyyy')
                                .format(employees[0].dateOfHiring)
                                .toString(),
                            icon: const Icon(
                              Icons.calendar_month_outlined,
                            ),
                          ),
                          sizedBox(context),
                          EmployeeInfoCard(
                            text: employees[0].nationalID,
                            icon: const Icon(
                              Icons.perm_identity_outlined,
                            ),
                          ),
                          sizedBox(context),
                          employees[0].position != EmployeePositions.owner.index
                              ? EmployeeInfoCard(
                                  text: employees[0].isActive
                                      ? AppStrings.yesTextArabic
                                      : AppStrings.noTextArabic,
                                  icon: const Icon(
                                    Icons.published_with_changes_outlined,
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(
                            width: double.infinity,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
      listener: (context, state) {
        print(state.runtimeType);
      },
    );
  }
}

Widget sizedBox(BuildContext context) => SizedBox(
      height: context.height * 0.02,
    );
// Future<List<TechnicianModel>> allTechnicians() async {
//   final List<TechnicianModel> techniciansList = [];
//   final db = FirebaseFirestore.instance;
//   final technicians = await db
//       .collection(CollectionsNames.techniciansCollectionFirebaseNameText)
//       .get();

//   for (int i = 0; i < technicians.docs.length; i++) {
//     techniciansList.add(
//       TechnicianModel.fromJson(
//           // idFromCloudFireStore: technicians.docs[i].id,
//           tech: technicians.docs[i].data()),
//     );
//   }
//   // print(techniciansList);
//   return techniciansList;
// }
  // BlocProvider.of<TechniciansBloc>(context)
                //     .add(GetAllTechniciansEvent());
                // BlocProvider.of<TechniciansBloc>(context)
                //     .add(AddTechnicianEvent(TechnicianEntity(
                //   name: 'emp',
                //   address: 'Suez',
                //   dateOfHiring: DateTime(2021),
                //   isActive: true,
                //   nationalID: '29905260400497',
                //   phone: '01000249042',
                //   phone2: '0152359042',
                //   position: TechnicianPositions.admin.index,
                //   salary: 0,
                // )));