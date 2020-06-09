import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:tathastu/ui/views/login/verifysmscode/verifysmscode_viewmodel.dart';

class VerifySmsCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifySmsCodeViewModel>.reactive(
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
                      'Enter verification code',
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
                            maxLength: 6,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(32.0),
                                  ),
                              hintText: 'Sms code',
                              labelText: 'Sms code',
                              errorText: model.errorMessage,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 20.0,
                              ),
                            ),
                            onChanged: (String value) {
                              model.setSmsCode(value);
                              model.validateSmsCode();
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Container(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Enter sms code you received to ',
                                style: GoogleFonts.lato(
                                    textStyle:
                                        Theme.of(context).textTheme.caption
                                    // .copyWith(color: Colors.grey.shade800),
                                    ),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                '+91-9408393331',
                                style: GoogleFonts.lato(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
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
              disabledElevation: 0,
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
                  ? () {
                      model.verifySMSCode();
                    }
                  : null,
            ),
          ),
        );
      },
      viewModelBuilder: () => VerifySmsCodeViewModel(),
    );
  }
}
