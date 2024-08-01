import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() =>
      _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {

  TextEditingController name = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController keyNumber = TextEditingController();
  TextEditingController bankCode = TextEditingController();
  TextEditingController branchCode = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController ibanNumber = TextEditingController();
  TextEditingController bicSwiftCode = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController emailAddress = TextEditingController();

  TextEditingController selectedCountryController = TextEditingController();
  String selectedCountryCode = "CI";

  GlobalKey<FormState> beneficiaryForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2c63a8),
        title: Text('Add Beneficiary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: beneficiaryForm,
          child: ListView(
            children: [
              Column(
                children: [
                  //Select a country
                  _CountryDropdownFormField(
                    selectedCountryController: selectedCountryController,
                    onCountryChanged: (newCountryName) {
                      setState(() {
                        selectedCountryController.text = newCountryName!;
                      });
                    },
                    onCountryCodeChanged: (newCountryCode) {
                      setState(() {
                        selectedCountryCode = newCountryCode!;
                      });
                    },
                  ),
                  /*Visibility(
                      visible: _shouldDisplayBankFields(selectedCountryCode),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: bankCode,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).bankCode,
                              //'Bank Code',
                            ),
                          ),
                          TextFormField(
                            controller: branchCode,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).branchCode,
                              //'Branch Code',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 210,
                                child: TextFormField(
                                  controller: accountNumber,
                                  decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context).beneficiaryBankAccount,
                                    //'Beneficiary Account Number',
                                  ),
                                  maxLength: 14,
                                ),
                              ),
                              Container(
                                width: 80,
                                child: TextFormField(
                                  controller: keyNumber,
                                  decoration: InputDecoration(
                                    labelText: 'Key',
                                  ),
                                  maxLength: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),*/

                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(100, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: Color(0xFF2c63a8),
                    ),
                    child: Text('ADD'),
                  ),
                  ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CountryDropdownFormField extends StatelessWidget {
  final TextEditingController selectedCountryController;
  final ValueChanged<String?> onCountryChanged;
  final ValueChanged<String?> onCountryCodeChanged;

  const _CountryDropdownFormField({
    required this.selectedCountryController,
    required this.onCountryChanged,
    required this.onCountryCodeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            readOnly: true,
            controller: selectedCountryController,
          ),
        ),
        SizedBox(width: 8),
        _buildCountryPicker(context),
      ],
    );
  }

  Widget _buildCountryPicker(BuildContext context) {
    return CountryListPick(
      appBar: AppBar(
        title: Text('Select a country'),
      ),
      theme: CountryTheme(
        isShowFlag: true,
        isShowTitle: false,// Hides the country name
        isShowCode: false ,// Hide the country phone code
      ),
      onChanged: (CountryCode? code) {
        selectedCountryController.text = code!.name!;
        onCountryChanged(code.name);
        onCountryCodeChanged(code.code);
      },
    );
  }
}
