import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:tathastu/ui/views/user_registration/user_registration_viewmodel.dart';

class UserRegistrationView extends StatelessWidget {
  final TextEditingController _birthDateController = TextEditingController();
  final birthdateFocusNode = new FocusNode(debugLabel: 'birthdate');
  final genderFocusNode = new FocusNode(debugLabel: 'gender');

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserRegistrationViewModel>.reactive(
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 64.0,
                          width: 64.0,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                          ),
                          padding: EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/logo.svg',
                          ),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          'Tathastu',
                          style: GoogleFonts.lato(
                            textStyle:
                                Theme.of(context).textTheme.display1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 64.0,
                  ),
                  Container(
                    child: Text(
                      'User Registration',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.title.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextField(
                            style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.subhead.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: (model.errorMessage != null)
                                            ? Colors.red
                                            : Theme.of(context).primaryColor,
                                      ),
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(32.0),
                                  ),
                              hintText: 'Display name',
                              labelText: 'Display name',
                              errorText: model.displayNameError,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 20.0,
                              ),
                            ),
                            // maxLength: 10,
                            onChanged: (String value) {
                              model.setDisplayName(value);
                              model.validateDisplayName();
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          child: TextField(
                            style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.subhead.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: (model.errorMessage != null)
                                            ? Colors.red
                                            : Theme.of(context).primaryColor,
                                      ),
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(32.0),
                                  ),
                              hintText: 'Email',
                              labelText: 'Email',
                              errorText: model.emailError,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 20.0,
                              ),
                            ),
                            // maxLength: 10,
                            onChanged: (String value) {
                              model.setEmail(value);
                              model.validateEmail();
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        InkWell(
                          onTap: () async {
                            print('birthdate Clicked');
                            final DateTime picked = await showDatePicker(
                              context: context,
                              initialDate: (model.birthdate != null)
                                  ? model.birthdate
                                  : DateTime.now(),
                              firstDate: DateTime(2015, 8),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null && picked != model.birthdate)
                              model.setBirthdate(picked.toString());
                            _birthDateController.text = DateFormat('dd/MM/yyyy')
                                .format(model.birthdate);
                            model.validateBirthdate();
                            birthdateFocusNode.requestFocus();
                          },
                          child: IgnorePointer(
                            child: TextField(
                              focusNode: birthdateFocusNode,
                              style: GoogleFonts.lato(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: (model.errorMessage != null)
                                          ? Colors.red
                                          : Theme.of(context).primaryColor,
                                    ),
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(32.0),
                                    ),
                                hintText: 'Birthdate',
                                labelText: 'Birthdate',
                                errorText: model.birthdateError,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 20.0,
                                ),
                              ),
                              // maxLength: 10,
                              controller: _birthDateController,
                              onChanged: (String value) {
                                model.setBirthdate(value);
                                model.validateBirthdate();
                              },
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(12, 08, 12, 08),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Gender',
                                style: GoogleFonts.lato(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .subhead
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade600),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Radio(
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                        value: 0,
                                        groupValue: model.selectedGenderIndex,
                                        onChanged: (int value) {
                                          model.setGender(value);
                                          model.validateGender();
                                        },
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      Text(
                                        'Male',
                                        style: GoogleFonts.lato(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .subtitle
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Radio(
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                        value: 1,
                                        groupValue: model.selectedGenderIndex,
                                        onChanged: (int value) {
                                          model.setGender(value);
                                          model.validateGender();
                                        },
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      Text(
                                        'Female',
                                        style: GoogleFonts.lato(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .subtitle
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Radio(
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                        value: 2,
                                        groupValue: model.selectedGenderIndex,
                                        onChanged: (int value) {
                                          model.setGender(value);
                                          model.validateGender();
                                        },
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      Text(
                                        'Others',
                                        style: GoogleFonts.lato(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .subtitle
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: (model.formValid)
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              // padding: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: (model.isBusy)
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        strokeWidth: 2.0,
                      ),
                    )
                  : Icon(Icons.keyboard_arrow_right),
              onPressed: (model.formValid)
                  ? () async {
                      // model.navigateToHome();
                      model.createUserProfile();
                    }
                  : null,
            ),
          ),
        );
      },
      viewModelBuilder: () => UserRegistrationViewModel(),
    );
  }
}
