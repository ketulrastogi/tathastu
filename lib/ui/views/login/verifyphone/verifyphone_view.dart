import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:tathastu/ui/views/login/verifyphone/verifyphone_viewmodel.dart';

class VerifyPhoneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyPhoneViewModel>.reactive(
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
                      'Tell us your phone number',
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
                              hintText: 'Phone number',
                              labelText: 'Phone number',
                              errorText: model.errorMessage,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 20.0,
                              ),
                            ),
                            maxLength: 10,
                            onChanged: (String value) {
                              model.setPhoneNumber(value);
                              model.validatePhoneNumber();
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Container(
                          child: Text(
                            'A 6 digit sms code will be sent via sms to verify your phone number.',
                            style: Theme.of(context).textTheme.caption,
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
                      model.verifyNumber();
                    }
                  : null,
            ),
          ),
        );
      },
      viewModelBuilder: () => VerifyPhoneViewModel(),
    );
  }
}
