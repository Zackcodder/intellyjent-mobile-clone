
import '../../../core/core.dart';

class HelpAndSupportController extends GetxController {
  final Uri _urlWeb = Uri.parse('https://intellyjent.com/');
  final Uri _urlTopUp = Uri.parse('https://forms.gle/qR1KyzyxZJLHETu26');
  final Uri _urlFeedback = Uri.parse('https://forms.gle/sX7TnfRuE294wCSeA');

  Future<void> launchWeb() async {
    if (!await launchUrl(_urlWeb)) {
      throw Exception('Could not launch $_urlWeb');
    }
  }

  Future<void> launchTopUp() async {
    if (!await launchUrl(_urlTopUp)) {
      throw Exception('Could not launch $_urlTopUp');
    }
  }

  Future<void> launchFeedback() async {
    if (!await launchUrl(_urlFeedback)) {
      throw Exception('Could not launch $_urlFeedback');
    }
  }

  final List<String> questions = [
    'Is Intellyjent free for download or it’s a paid App?',
    'Are there cash rewards for the Quiz?',
    'Is the Quiz platform free?',
    'Do top-up plans expire?',
    'When are winners selected?',
    'How are winners paid?',
    'How many Sillver do I need to play a Quiz?',
    'How secure is the payment system for Top-ups?',
    'Do I get charged when I withdraw my commission?',
    'I am not in Nigeria, how can I withdraw my commission?',
    'The “Let’s do this” button is not responding, what should I do?',
    'What is the minimum withdrawal commission?'
  ];

  final List<String> answers = [
    'Intellyjent is free and it’s available for download on the Google Play Store.',
    'Yes, we reward brilliance; you can find the cash prize on our website – www.intellyjent.com',
    'No. To gain access to the Quiz platform, you’ll need to top up your wallet to get Sillver. Sillver gives you access to play the quiz. New sign-ups are credited with 2 free Sillver.',
    'No, there is no fixed expiry period.',
    'Refer to the FAQs section of our website – www.intellyjent.com',
    'Winners are required to register their bank account details under Tellybucks to receive their cash prize.\n\nWinners outside Nigeria will receive a mail from support@intellyjent.com with details on how to receive their cash prize.',
    'Refer to the FAQs section of our website – www.intellyjent.com',
    'Your payment details are encrypted with cutting-edge technology.',
    'Yes. You’re charged ₦25; deducted from your balance.',
    'At the moment, you can only withdraw your commission to an active Nigerian bank account. We are currently working on enabling payments in other currencies.',
    'To fix this, do any or all of these in this order until the button responds. \n  - Close the App and reload it again.\n  - Log out and Log in again.\n  - Turn off your Internet and turn it on again.\n  - Clear the cache of the App under your phone settings.\n  - Uninstall the App and reinstall.',
    'Withdrawable is now between ₦151 and '
        '₦50,000 per transaction and ₦25 payment gateway charge'
  ];

  final List<bool> expandedList = List.generate(13, (index) => false);

  bool isExpanded(int index) {
    return expandedList[index];
  }

  void toggleFAQ(int index) {
    expandedList[index] = !expandedList[index];
    update();
  }
}
