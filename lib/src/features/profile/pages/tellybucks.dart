import 'package:intellyjent/src/core/core.dart';

class TellyBucks extends StatefulWidget {
  const TellyBucks({super.key});

  @override
  State<TellyBucks> createState() => _TellyBucksState();
}

class _TellyBucksState extends State<TellyBucks> {
  final Uri _urlDashboard =
      Uri.parse('https://tellybucks.intellyjent.com/login');

  Future<void> _launchDashboard() async {
    if (!await launchUrl(_urlDashboard)) {
      throw Exception('Could not launch $_urlDashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    var bio =
        "Tellybucks is a referral program aimed at empowering you financially. When your friends sign up with your referral code, you earn 2% of their spending on the App - every time they spend, you get paid. You can transfer your earnings to your bank account anytime. It’s that easy!";
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        toolbarHeight: screenHeight < 670 ? 60 : 90,
        automaticallyImplyLeading: false,
        title: const HeaderWidget(title: 'Tellybucks'),
      ),
      body: Padding(
        padding: MediaQuery.of(context).size.width < 800
            ? const EdgeInsets.symmetric(horizontal: 20)
            : const EdgeInsets.symmetric(horizontal: 40),
        child: LayoutBuilder(
            builder: ((context, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              SvgPicture.asset(
                                  Get.theme.brightness == Brightness.light
                                      ? Assets.assetsTellyBucks
                                      : Assets.assetsTellyBucksDark),
                              AppSizing.h18,
                              Text(
                                bio,
                                style: AppTextStyle.bodyMedium(context),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: screenHeight < 670
                                    ? EdgeInsets.zero
                                    : const EdgeInsets.symmetric(vertical: 20),
                                child: ButtonWidget(
                                  buttonText: '',
                                  fontSize: 17,
                                  textColor: AppColor.white,
                                  borderSideColor: Colors.transparent,
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          AppColor.appColor),
                                  onPressed: () => Get.to(
                                      () => const TellyBucksDashboardPage(),
                                      transition: Transition.upToDown),
                                  // onPressed: () => _launchDashboard(),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "View Dashboard",
                                        style: AppTextStyle.h4Regular(context)
                                            .copyWith(
                                                fontSize: 16,
                                                color: AppColor.white),
                                      ),
                                      AppSizing.w12,
                                      SvgPicture.asset(Assets.assetsMenu)
                                    ],
                                  ),
                                ),
                              ),
                              _buildShare(
                                  label: "Community",
                                  context: context,
                                  icon:
                                      SvgPicture.asset(Assets.assetsTelegram)),
                            ],
                          )),
                          screenHeight < 670
                              ? AppSizing.h04
                              : SizedBox(
                                  height: MediaQuery.of(context).size.height <
                                              705 ||
                                          MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom >
                                              0
                                      ? 40
                                      : 0),
                          screenHeight < 670 ? AppSizing.h04 : AppSizing.h28,
                          Column(
                            children: [
                              Text(
                                "Referral code",
                                style: AppTextStyle.bodyMedium(context),
                              ),
                              AppSizing.h12,
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    border: Border.all(
                                        width: 2, color: AppColor.appColor)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        AppSizing.w12,
                                        SelectableText(
                                            UserData.referralCode.toString(),
                                            style:
                                                AppTextStyle.bodyMedium(context)
                                                    .copyWith(fontSize: 17)),
                                      ],
                                    ),
                                    ConstrainedBox(
                                      constraints:
                                          const BoxConstraints(maxWidth: 120),
                                      child: ButtonWidget(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        buttonText: 'Copy',
                                        fontSize: 16,
                                        textColor: AppColor.white,
                                        borderSideColor: Colors.transparent,
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                AppColor.appColor),
                                        onPressed: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text: UserData.referralCode
                                                  .toString()));
                                          Fluttertoast.showToast(
                                            msg: 'Referral Code Copied!',
                                            textColor: AppColor.white,
                                            backgroundColor: AppColor.appColor,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).padding.bottom + 20,
                              )
                            ],
                          ),
                          AppSizing.h32,
                        ],
                      ),
                    ),
                  ),
                ))),
      ),
    );
  }
}

Widget _buildShare(
        {required BuildContext context,
        required String label,
        required Widget icon}) =>
    InkWell(
      onTap: () => _launchTelegram(),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1, color: AppColor.lightBlue),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: AppTextStyle.h4Regular(context).copyWith(
                fontSize: 18,
              ),
            ),
            AppSizing.w08,
            icon
          ],
        ),
      ),
    );

Future<void> _launchTelegram() async {
  final Uri urlTelegram = Uri.parse('https://t.me/jvectap');
  if (!await launchUrl(urlTelegram)) {
    throw Exception('Could not launch $urlTelegram');
  }
}
