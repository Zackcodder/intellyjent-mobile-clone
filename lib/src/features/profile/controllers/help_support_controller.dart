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

  final Uri launchpadUrl = Uri.parse('https://www.intellyjent.com/launchpad');

  Future<void> openLaunchpad() async {
    if (!await launchUrl(launchpadUrl, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $launchpadUrl');
    }
  }

  final List<String> questions = [
    'What is the next stage for the top 50 candidates?',
    'What are the requirements for admission into the launchpad program',
    'Is the Quiz platform free?',
    'Do top-up plans expire?',
    'How secure is the payment system for Top-ups?',
    'Do I get charged when I withdraw my commission?',
    'I am not in Nigeria, how can I withdraw my commission?',
    'The “Let’s do this” button is not responding, what should I do?',
    'What is the minimum withdrawal commission?'
  ];

  final List<String> answers = [
    'The top 50 candidates under Sapphire, Emerald, and Ruby participate in a comprehensive online computer-based test on General Knowledge. Winners are selected based on the outcome of the test. If you’re among the top 50, you will receive an email from hello@intellyjent.com, providing you with relevant information.',
    'To get all information, visit https://www.intellyjent.com/launchpad',
    'No. To gain access to the Quiz platform, you’ll need to top up your wallet to get Sillver. Sillver gives you access to play the quiz. New sign-ups are credited with 10 free Sillver.',
    'No, there is no fixed expiry period.',
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
