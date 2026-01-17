import 'dart:convert';
import 'dart:io';

import 'package:intellyjent/src/core/core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class EditProfileController extends GetxController {
  List<String> avatars = [
    Assets.assetsAvatarsOne,
    Assets.assetsAvatarsTwo,
    Assets.assetsAvatarsThree,
    Assets.assetsAvatarsThreeT,
    Assets.assetsAvatarsFour,
    Assets.assetsAvatarsFive,
    Assets.assetsAvatarsSix,
    Assets.assetsAvatarsSeven,
    Assets.assetsAvatarsEight,
    Assets.assetsAvatarsNine,
    Assets.assetsAvatarsTen,
  ].obs;

  RxString selectedAvatar = "".obs;
  RxString imageUrl = "".obs;

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final oldController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();

  String? selectedImagePath;

  @override
  void onInit() async {
    ProfilePageController profileController = Get.find();

    emailController.text = profileController.userData.value?.email ?? "";
    fullNameController.text = profileController.userData.value?.fullName ?? "";
    usernameController.text = profileController.userData.value?.username ?? "";
    phoneNumberController.text =
        profileController.userData.value?.phoneNumber ?? "";
    passwordController.text = "***********";

    super.onInit();
  }

  selectAvatar(String value) {
    selectedAvatar(value);
    selectedImagePath = value;
  }

  updateList(String image) {
    if (image.startsWith("assets")) {
      selectAvatar(image);
    } else {
      avatars.add(image);
      selectAvatar(image);
    }
    selectedImagePath = image;
  }

  Future<void> updatePassword(BuildContext context) async {
    await HttpHelper.instance
        .postRequestStatusResponse("accounts/passwords/change/", body: {
      "new_password": confirmController.text,
      "current_password": oldController.text,
    }).then((value) {
      print(value);
      if (value is SuccessResponse && value.status) {
        
      print("Change password valie $value");
        showFeedbackToast(context, 'Password Updated', type: ToastType.success);

        Get.back();
        return;
      } else {
        ErrorResponse errors = (value as ErrorResponse);

        print(errors.errors.isEmpty
            ? errors.message
            : errors.errors.first.errorMessage.first);

        showFeedbackToast(context, errors.errors.isEmpty
            ? errors.message
            : errors.errors.first.errorMessage.first);
      }
    });
  }

  selectImageFromFile() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((image) {
      if (image != null) {
        updateList(image.path);
      }
    });
  }

  Future submitForm(BuildContext context) async {
    await HttpHelper.instance.patchRequest("accounts/${UserData.userId}",
        body: buildEditPayload(), converter: (json) {
      return User.fromJson(json);
    }).then((value) {
      if (value.status) {
        ProfilePageController profileController = Get.find();
        showFeedbackToast(context, "Profile Updated Successfully",
            type: ToastType.success);
        profileController.updateUser((value as SuccessResponse).result);
        return;
      }
      ErrorResponse errors = (value as ErrorResponse);

      showFeedbackToast(context, errors.errors.isEmpty
          ? errors.message
          : errors.errors.first.errorMessage.first);

      // showFeedbackToast(
      //   context,
      //   'Username, email or phone number already exists',
      // );
    });
  }

  Map<String, dynamic> buildEditPayload() {
    Map<String, dynamic> payload = {};
    ProfilePageController profileController = Get.find();

    if ((profileController.userData.value?.username ?? "") !=
        usernameController.text.trim()) {
      payload["username"] = usernameController.text.trim();
    }
    if ((profileController.userData.value?.email ?? "") !=
        emailController.text.trim()) {
      payload["email"] = emailController.text.trim();
    }
    if ((profileController.userData.value?.phoneNumber ?? "") !=
        emailController.text.trim()) {
      payload["phone_number"] = phoneNumberController.text.trim();
    }
    // if(selectedAvatar.value.isEmpty){

    // }

    return payload;
  }

  Future<void> uploadImage(context) async {
    if (selectedImagePath != null) {
      if (selectedImagePath!.startsWith("assets")) {
        // Load asset image using rootBundle
        ByteData data = await rootBundle.load(selectedImagePath!);
        List<int> bytes = data.buffer.asUint8List();

        // Save the asset image to a temporary file
        Directory tempDir = await getTemporaryDirectory();
        File tempFile = File('${tempDir.path}/temp_image.png');
        await tempFile.writeAsBytes(bytes);

        // Set the temporary file path as the selectedImagePath
        selectedImagePath = tempFile.path;
      }
      final url = Uri.parse('https://api.cloudinary.com/v1_1/bookchamp/upload');

      final request = http.MultipartRequest('POST', url)
        ..fields['upload_preset'] = 'bookchampUsers'
        ..files
            .add(await http.MultipartFile.fromPath('file', selectedImagePath!));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.toBytes();
        final responseString = String.fromCharCodes(responseData);
        final jsonMap = jsonDecode(responseString);
        final url = jsonMap['url'];
        print('new $url');
        imageUrl.value = url;

        await HttpHelper.instance
            .patchRequest("accounts/${UserData.userId}", body: {
          "image": imageUrl.value,
        }).then((value) {
          if (value.status) {
            showFeedbackToast(context, 'Image Updated Successfully', type: ToastType.success);

            Get.to(()=> const Root(), transition: Transition.upToDown);
            return;
          } else {
            showFeedbackToast(context, 'Could not update image, Try again');
            ErrorResponse errors = (value as ErrorResponse);

            print(errors.errors.isEmpty
                ? errors.message
                : errors.errors.first.errorMessage.first);
          }
        });
      }
    }
  }
}
