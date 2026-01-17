import 'package:flutter/gestures.dart';
import 'package:intellyjent/src/core/core.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController signUpController = Get.put(SignUpController());
  @override
  void initState() {
    UserData.registrationStep = RegistrationStep.signUp;
    super.initState();
  }

  bool validateRoute() {
    if (UserData.registrationStep != null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: validateRoute(),
      onPopInvoked: (value) async {
        if (!value) {
          Get.off(()=> const Login());
          UserData.registrationStep = null;
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            ///blue background image
            const AuthBackgroundWidget(),
            /// body
            Stack(
              children: [
                Column(
                  children: [
                    ///space at the top abouve the lady image
                    const Spacer(),
                    ///sign in form n logo image
                    Expanded(
                        flex: 3,
                        child: Container(
                          width: double.maxFinite,
                          padding: screenWidth <800
                              ? const EdgeInsets.symmetric(horizontal: 20)
                              : const EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                              color: Get.theme.brightness == Brightness.light
                                  ? AppColor.white
                                  : AppColor.darkAppBg,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child:
                              LayoutBuilder(builder: (newContext, constraints) {
                            return SingleChildScrollView(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppSizing.h40,
                                    ///app logo
                                    SvgPicture.asset(
                                      Assets.assetsBlueLogo,
                                      width:
                                          (MediaQuery.of(context).size.width *
                                                  0.25)
                                              .clamp(50, 80),
                                    ),
                                    AppSizing.h12,
                                    //create ur account test
                                    Text("Create your account",
                                        style: AppTextStyle.h4Regular(context)
                                            .copyWith(
                                                fontWeight: FontWeight.normal)),
                                    AppSizing.h20,
                                    ///form list
                                    Obx(() => Form(
                                        key: _formKey,
                                        child: Column(
                                          // runSpacing: 20,
                                          children: [
                                            ///email address
                                            CustomInputField(
                                              controller: signUpController
                                                  .emailController,
                                              fieldName: "Email Address",
                                              inputType:
                                                  TextInputType.emailAddress,
                                              validator: (value) {
                                                if (value.toString().isEmpty) {
                                                  return "Email cannot be empty";
                                                }
                                                RegExp emailReg = RegExp(
                                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                                                if (!emailReg.hasMatch(value)) {
                                                  return "Enter a valid email address";
                                                }
                                                return null;
                                              },
                                              hintText:
                                                  "Type in your email address",
                                              prefixIcon: SvgPicture.asset(
                                                  Assets.assetsPersonal),
                                            ),
                                            AppSizing.h20,
                                            ///first and last name
                                            CustomInputField(
                                              controller: signUpController
                                                  .fullNameController,
                                              fieldName: "Full Name",
                                              hintText:
                                                  "First Name and Last Name",
                                            ),
                                            AppSizing.h20,
                                            ///gender dropdown
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: _buildGenderSelector(
                                                    signUpController
                                                        .genderGroupValue
                                                        .value)),
                                            AppSizing.h20,
                                            ///country dropdown
                                            CustomInputField(
                                              controller: signUpController
                                                  .countryController.value,
                                              readOnly: true,
                                              onTap: () {
                                                _showCountyModal(context);
                                              },
                                              fieldName: "Country",
                                              hintText: "Select your Country",
                                              prefixIcon: signUpController
                                                          .selectedCountry
                                                          .value ==
                                                      null
                                                  ? null
                                                  : _emojiText(signUpController
                                                      .selectedCountry.value!),
                                              suffixIcon: SvgPicture.asset(
                                                  Assets.assetsArrowDown,
                                                width: MediaQuery.of(context).size.width < 800 ? null : 100,),
                                            ),
                                            AppSizing.h20,
                                            ///phone number
                                            CustomInputField(
                                                controller: signUpController
                                                    .phoneNumberController,
                                                fieldName: "Phone number",
                                                inputType: TextInputType.phone,
                                                formatter: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                validator: (value) {
                                                  if (value.length > 13) {
                                                    return "Invalid phone number";
                                                  }
                                                  return null;
                                                },
                                                prefixMaxWidth: 90,
                                                hintText:
                                                    "Type in your phone number",
                                                prefixIcon: signUpController
                                                            .selectedCountry
                                                            .value ==
                                                        null
                                                    ? InkWell(
                                                        onTap: () =>
                                                            _showCountyModal(
                                                                context,
                                                                forPhone: true),
                                                        child: SvgPicture.asset(
                                                            Assets.assetsCall,
                                                          ))
                                                    : Text(
                                                        "+${signUpController.selectedCountry.value?.phoneCode ?? "--"}",
                                                        style: AppTextStyle
                                                                .bodySmallHeavy(
                                                                    context)
                                                            .copyWith(
                                                                fontSize: 16),
                                                      )),
                                            AppSizing.h20,
                                            ///dob
                                            CustomInputField(
                                              controller: signUpController
                                                  .dobController.value,
                                              readOnly: true,
                                              onTap: () async {
                                                final currentDate =
                                                    DateTime.now();
                                                final earliestDate = DateTime(
                                                    currentDate.year - 130,
                                                    currentDate.month,
                                                    currentDate.day);
                                                final latestDate = DateTime(
                                                    currentDate.year - 15,
                                                    currentDate.month,
                                                    currentDate.day);

                                                showDatePicker(
                                                        context: context,
                                                        firstDate: earliestDate,
                                                        initialDate: latestDate,
                                                        lastDate: latestDate)
                                                    .then((value) =>
                                                        signUpController
                                                            .updateDob(value));
                                              },
                                              fieldName: "Date of birth",
                                              hintText:
                                                  "Select your Date of birth",
                                              suffixIcon: SvgPicture.asset(
                                                  Assets.assetsCalender,
                                                width: MediaQuery.of(context).size.width < 800 ? null : 100,),
                                            ),
                                            AppSizing.h20,
                                            ///refferal code
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ///referral code field
                                                CustomInputField(
                                                    controller: signUpController
                                                        .referralCodeController,
                                                    fieldName: "Referral Code (Optional)",
                                                    validator: (value) {
                                                      return null;
                                                    },
                                                    hintText: "Enter code",
                                                    prefixIcon:
                                                        SvgPicture.asset(Assets
                                                            .assetsUserAdd,
                                                          width: MediaQuery.of(context).size.width < 800 ? null : 100,)),
                                                AppSizing.h07,
                                                ///referral code hint
                                                Text(
                                                  "Enter the code of the person who referred you (optional)",
                                                  style: AppTextStyle
                                                          .bodyVerySmall(
                                                              context)
                                                      .copyWith(
                                                          color: const Color(
                                                              0xff8A8A8A)),
                                                )
                                              ],
                                            ),
                                            AppSizing.h20,
                                            ///password
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomInputField(
                                                  controller: signUpController
                                                      .passwordController,
                                                  fieldName: "Password",
                                                  hintText:
                                                      "Enter your password",
                                                  isPassword: true,
                                                  formatter: [
                                                    LengthLimitingTextInputFormatter(
                                                        25)
                                                  ],
                                                ),
                                                AppSizing.h07,
                                                Text(
                                                  "Password must contain at least one uppercase, lower case, number or special character",
                                                  style: AppTextStyle
                                                          .bodyVerySmall(
                                                              context)
                                                      .copyWith(
                                                          color: const Color(
                                                              0xff8A8A8A)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ))),
                                    AppSizing.h56,
                                    ///signup button
                                    ButtonWidget(
                                        buttonText: 'Sign Up',
                                        fontSize: 17,
                                        shouldShowLoader: true,
                                        textColor: AppColor.white,
                                        borderSideColor: Colors.transparent,
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                AppColor.appColor),
                                        onPressed: () async {
                                          if (_formKey.currentState != null &&
                                              _formKey.currentState!
                                                  .validate()) {
                                            await signUpController
                                                .submit(context);
                                            // Get.to(const OtpScreen());

                                            return;
                                          }
                                        }),
                                    AppSizing.h07,
                                    RichText(
                                      text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text:
                                                    "By signing up you accept our standard ",
                                          style: AppTextStyle.h4Regular(
                                              context)
                                              .copyWith( fontSize: screenWidth < 800 ? 15 : 27)),
                                            TextSpan(
                                                text: "terms and condition",
                                                recognizer: TapGestureRecognizer()
                                                  ..onTap = () {
                                                    signUpController.launchTc();
                                                  },
                                                style: AppTextStyle.h4Regular(
                                                        context)
                                                    .copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: Get.theme
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? Colors.white
                                                            : AppColor.appBlack,
                                                        fontSize: screenWidth < 800 ? 15 : 27,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                            TextSpan(
                                              text: " and our ",
                                                style: AppTextStyle.h4Regular(
                                                context)
                                                .copyWith(
                                                decoration:
                                                TextDecoration
                                                    .none,
                                                color: Get.theme
                                                    .brightness ==
                                                    Brightness.dark
                                                    ? Colors.white
                                                    : AppColor.appBlack,
                                                fontSize: screenWidth < 800 ? 15 : 27,
                                                fontWeight:
                                                FontWeight.w400)
                                            ),
                                            TextSpan(
                                                text: "privacy policy",
                                                recognizer: TapGestureRecognizer()
                                                  ..onTap = () {
                                                    signUpController.launchPp();
                                                  },
                                                style: AppTextStyle.h4Regular(
                                                        context)
                                                    .copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: Get.theme
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? Colors.white
                                                            : AppColor.appBlack,
                                                        fontSize: screenWidth < 800 ? 15 : 27,
                                                        fontWeight:
                                                            FontWeight.w400))
                                          ],
                                          style: AppTextStyle.h4Regular(context)
                                              .copyWith(
                                                  fontSize: 13,
                                                  color:
                                                      const Color(0xff8A8A8A),
                                                  fontWeight: FontWeight.w400)),
                                      textAlign: TextAlign.center,
                                    ),
                                    AppSizing.h56,
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .padding
                                                  .bottom +
                                              15),
                                      child: InkWell(
                                        onTap: () {
                                          if (UserData.registrationStep ==
                                              RegistrationStep.signUp) {
                                            Get.off(const Login());
                                            UserData.registrationStep = null;
                                            return;
                                          }
                                          Get.back();
                                        },
                                        child: RichText(
                                            text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                  text:
                                                      "Already have an account? ", style: AppTextStyle.h4Regular(
                                                  context)
                                                  .copyWith(
                                                  decoration:
                                                  TextDecoration
                                                      .none,
                                                  color: Get.theme
                                                      .brightness ==
                                                      Brightness.dark
                                                      ? Colors.white
                                                      : AppColor.appBlack,
                                                  fontSize: screenWidth < 800 ? 15 : 27,
                                                  fontWeight:
                                                  FontWeight.w400)),
                                              TextSpan(
                                                  text: " Sign in",
                                                  style: AppTextStyle.h4Regular(
                                                          context)
                                                      .copyWith(
                                                          color:
                                                              AppColor.appColor,
                                                          fontSize: screenWidth < 800 ? 15 : 27,
                                                          fontWeight:
                                                              FontWeight.w400))
                                            ],
                                                style: AppTextStyle.h4Regular(
                                                        context)
                                                    .copyWith(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400))),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        )),
                  ],
                ),
                ///lady image
                Column(
                  children: [
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Transform.translate(
                                offset: const Offset(0, 20),
                                child: SvgPicture.asset("login-signup".lsvg)))),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGenderSelector(String groupValue) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
            style: AppTextStyle.h4Regular(context).copyWith(
                fontSize: 14,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.appBlack
                    : AppColor.white),
          ),
          AppSizing.h04,
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: const Color(0xffE6E6E6))),
            child: Wrap(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomRadioButton(
                      onChange: (value) {
                        signUpController.updateGenderValue(value);
                      },
                      value: "male",
                      groupValue: groupValue,
                      decoration: const CustomButtonDecoration(radius: 6),
                    ),
                    AppSizing.w08,
                    Text(
                      "Male",
                      style: AppTextStyle.h4Regular(context)
                          .copyWith(fontSize: 15),
                    ),
                  ],
                ),
                AppSizing.w24,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomRadioButton(
                      onChange: (value) {
                        signUpController.updateGenderValue(value);
                      },
                      value: "female",
                      groupValue: groupValue,
                      decoration: const CustomButtonDecoration(radius: 6),
                    ),
                    AppSizing.w08,
                    Text(
                      "Female",
                      style: AppTextStyle.h4Regular(context)
                          .copyWith(fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );
}

_showCountyModal(BuildContext context, {bool forPhone = false}) {
  showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      context: context,
      builder: ((context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: CountryModal(
                forPhone: forPhone,
              ),
            ),
          )));
}

Widget _emojiText(Country country) => Text(
      country.iswWorldWide
          ? '\uD83C\uDF0D'
          : CountryFlagBuilder.countryCodeToEmoji(country.countryCode),
      style: const TextStyle(
        fontSize: 24,
      ),
    );
