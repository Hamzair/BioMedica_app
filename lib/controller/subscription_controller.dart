import 'package:get/get.dart';

class SubscriptionService extends GetxController {
  // Reactive variable to track premium status
  var isPremium = false.obs;

  // Method to unlock premium features
  void unlockPremium() {
    isPremium.value = true;
  }
}
