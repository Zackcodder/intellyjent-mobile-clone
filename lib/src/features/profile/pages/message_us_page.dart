import '../../../core/core.dart';

class MessageUsPage extends StatelessWidget {
  const MessageUsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final cont = Get.put(MessageUsController());

    return Scaffold(
      backgroundColor: Get.theme.brightness == Brightness.light
          ? AppColor.white
          : AppColor.darkAppNavBar,
      appBar: AppBar(
        title:
        const HeaderWidget(title: 'Help & Support'),
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppNavBar,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          padding: MediaQuery.of(context).size.width <800
              ? const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
              : const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Stack(
            children: [
              Obx(
                ()=> Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('We are here to help and assist you. Please send us a mail.',
                        style: AppTextStyle.h4Regular(context).copyWith(fontWeight: FontWeight.w400),),
                    AppSizing.h40,
                    TextField(
                      controller: cont.messageController,
                      maxLines: 5,
                      onChanged: (value) {
                        cont.displayErrorMessage.value = false;
                      },
                      style: TextStyle(color: Get.theme.brightness == Brightness.light
                          ? AppColor.appBlack
                          : AppColor.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.grey
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.grey
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.grey
                            )
                        ),
        
                      ),
                    ),
                    AppSizing.h04,
                    if(cont.displayErrorMessage.value)
                      Row(
                        children: [
                          Text('Message cannot be empty', style: AppTextStyle.bodySmallHeavy(context).copyWith(
                          color: AppColor.red
                                          ),),
                        ],
                      ),
                    AppSizing.h100,
                  ],
                ),
              ),
        
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).size.width <800
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 40)
            : const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: ButtonWidget(buttonText: 'Send a message',
            fontSize: 18,
            shouldShowLoader: true,
            backgroundColor: const MaterialStatePropertyAll(AppColor.appColor),
            borderSideColor: Colors.transparent,
            textColor: AppColor.white,
            onPressed:() async{
              if(cont.messageController.value.text.isEmpty){
                cont.displayErrorMessage.value = true;
              }else{
                cont.displayErrorMessage.value = false;
                await cont.postMessage(context);
              }

            }
        ),
      ),
    );
  }
}
