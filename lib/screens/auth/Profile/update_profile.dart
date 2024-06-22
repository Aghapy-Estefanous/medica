import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica/models/ProfileModel.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'cubit/update_profile_cubit.dart';

class UpdateProfileScreen extends StatelessWidget {
  final ProfileModel? userProfile;

  const UpdateProfileScreen({Key? key, this.userProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(tr('editProfile')),
        ),
        body: Container(
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: UpdateProfileForm(userProfile: userProfile),
          ),
        ),
      ),
    );
  }
}

class UpdateProfileForm extends StatefulWidget {
  final ProfileModel? userProfile;

  const UpdateProfileForm({Key? key, this.userProfile}) : super(key: key);

  @override
  _UpdateProfileFormState createState() => _UpdateProfileFormState();
}

class _UpdateProfileFormState extends State<UpdateProfileForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _nidController;
  late TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _firstNameController =
        TextEditingController(text: widget.userProfile?.firstName ?? '');
    _lastNameController =
        TextEditingController(text: widget.userProfile?.lastName ?? '');
    _emailController =
        TextEditingController(text: widget.userProfile?.email ?? '');
    _phoneController =
        TextEditingController(text: widget.userProfile?.phoneNumber ?? '');
    _nidController = TextEditingController(text: widget.userProfile?.nid ?? '');
    _ageController =
        TextEditingController(text: widget.userProfile?.age?.toString() ?? '');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _nidController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccessState) {
          Navigator.pop(context);
        } else if (state is UpdateProfileErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          ));
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  controller: _firstNameController,
                  label: tr('firstName'),
                  icon: Icons.person,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _lastNameController,
                  label: tr('lastName'),
                  icon: Icons.person,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _emailController,
                  label: tr('email'),
                  icon: Icons.email,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _phoneController,
                  label: tr('phoneNumber'),
                  icon: Icons.phone,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _nidController,
                  label: tr('nid'),
                  icon: Icons.credit_card,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _ageController,
                  label: tr('age'),
                  icon: Icons.cake,
                ),
                const SizedBox(height: 20),
                state is UpdateProfileLoadingState
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<UpdateProfileCubit>().updateProfile(
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                  email: _emailController.text,
                                  phoneNumber: _phoneController.text,
                                  // nid: _nidController.text,
                                  // age: int.tryParse(_ageController.text) ?? 0,
                                );
                          }
                        },
                        child: Text(tr('saveChanges')),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return tr('fieldRequired');
        }
        return null;
      },
    );
  }
}
