import 'package:bio_medica/drawer%20items/saveitems/saveForLater.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SavedItemsController extends GetxController {
  // List to hold saved items
  var savedItems = <SavedItem>[].obs;

  // Method to add an item
  void saveItem(SavedItem item) {
    // Check if the item is already saved to avoid duplicates
    if (!savedItems.any((saved) => saved.deviceName == item.deviceName)) {
      savedItems.add(item);
    }
  }

  // Method to remove an item
  void removeItem(SavedItem item) {
    savedItems.remove(item);
  }
}
