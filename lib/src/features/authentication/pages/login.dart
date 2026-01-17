import 'package:intellyjent/src/core/core.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());
  @override
  void initState() {
    super.initState();
    UserData.hasOpenedApp = true;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          const AuthBackgroundWidget(),
          Stack(
            children: [
              Column(
                children: [
                  const Spacer(),
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
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight),
                              child: IntrinsicHeight(
                                child: Column(
                                  children: [
                                    AppSizing.h56,
                                    ///logi image
                                    SvgPicture.asset(
                                      Assets.assetsBlueLogo,
                                      width:
                                          (MediaQuery.of(context).size.width *
                                                  0.25)
                                              .clamp(50, 80),
                                    ),
                                    AppSizing.h12,
                                    ///welcome back text
                                    Text("Welcome Back!",
                                        style: AppTextStyle.h4Regular(context)
                                            .copyWith(
                                                fontWeight: FontWeight.normal)),
                                    AppSizing.h24,
                                    Form(
                                        key: _formKey,
                                        child: Column(
                                          // runSpacing: 20,
                                          children: [
                                            ///email text field
                                            CustomInputField(
                                              controller: loginController
                                                  .usernameController,
                                              fieldName:
                                                  "Username or Email Address",
                                              hintText:
                                                  "Type in your username or email",
                                              prefixIcon: SvgPicture.asset(
                                                  Assets.assetsPersonal,

                                              ),
                                              validator: (value){
                                                if(value.toString().isEmpty){
                                                  return "Username and emails are case-sensitive";
                                                }
                                                return null;
                                              },
                                            ),
                                            ///password text field
                                            AppSizing.h20,
                                            CustomInputField(
                                              controller: loginController
                                                  .passwordController,
                                              fieldName: "Password",
                                              hintText: "Enter your password",
                                              isPassword: true,
                                            ),
                                          ],
                                        )),
                                    AppSizing.h12,
                                    ///forgot password text button
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                            onTap: () =>
                                                Get.to(const ForgetPassword(), transition: Transition.upToDown),
                                            child: Text(
                                              "Forgot Password?",
                                              style: AppTextStyle.h4Regular(
                                                      context)
                                                  .copyWith(
                                                      color: AppColor.appColor,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ))),
                                    const Spacer(),
                                    ///login button
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: MediaQuery.of(context)
                                                          .size
                                                          .height <
                                                      705 ||
                                                  MediaQuery.of(context)
                                                          .viewInsets
                                                          .bottom >
                                                      0
                                              ? 40
                                              : 0),
                                      child: ButtonWidget(
                                          buttonText: 'Login',
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
                                              await loginController
                                                  .submit(context);
                                            }
                                          }),
                                    ),
                                    const Spacer(),
                                    ///dnt have an account text and text button
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .padding
                                                  .bottom +
                                              15),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(()=> const SignUp(), transition: Transition.upToDown);
                                        },
                                        child: RichText(
                                            text: TextSpan(
                                                children: [TextSpan(
                                                  text:
                                                      "Don’t have an account? ",
                                                  style: AppTextStyle.h4Regular(
                                                      context)
                                                      .copyWith( fontSize: screenWidth < 800 ? 15 : 27

                                              )),
                                              TextSpan(
                                                  text: " Sign up",
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
                            ),
                          );
                        }),
                      )),
                ],
              ),
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
    );
  }
}
