import 'package:get/get.dart';

class SubscriptionService extends GetxController {
  // Reactive variable to track premium status
  var isPremium = false.obs;

  // Method to unlock premium features
  void unlockPremium() {
    isPremium.value = true;
    update();
    refresh();
  }

  void resetToFreeTrial() {
    isPremium.value = false; // Reset premium state
  }
}

//
//
// GridView.builder(
// shrinkWrap: true, // Add this line
// physics: NeverScrollableScrollPhysics(),
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 4,
// crossAxisSpacing: 10,
// mainAxisSpacing: 10,
// childAspectRatio: 0.9,
// ),
//
// itemCount: gridItems.length + 2,
// // Adjusted item count
// itemBuilder: (context, index) {
// //   Empty container at index 8
// if (index == 8) {
// return Container(); // Empty container at index 8
// }
// // Empty container at the last index
// if (index == gridItems.length + 1) {
// return Container(); // Empty container at the end
// }
//
// // Adjust the index to account for the empty container at index 8
// final adjustedIndex = index > 8 ? index - 1 : index;
// final item = gridItems[adjustedIndex];
//
// // Check if the item is locked
// final isLocked = item['locked'] == true &&
// !subscriptionService.isPremium.value;
//
// return GestureDetector(
// onTap: () {
// if (isLocked) {
// Get.snackbar(
// 'Locked',
// 'Only accessible for premium members!',
// backgroundColor: primaryColor,
// colorText: secondaryColor,
// );
// } else {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// item['page'] ?? const SizedBox.shrink(),
// ),
// );
// }
// },
// child: Stack(
// children: [
// Container(
// width: 80.w,
// decoration: BoxDecoration(
// border: Border.all(
// color: Darkcontainer, width: 1.w),
// color: Color.fromRGBO(0, 26, 46, 1),
// borderRadius: BorderRadius.circular(5.r),
// ),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.asset(
// item['image'],
// height: 42.h,
// //    width: 43.w,
// ),
// // SizedBox(height: 5.h),
// CustomText(
// text: item['title'],
// textAlign: TextAlign.center,
// textColor: secondaryColor,
// fontsize: 12.sp,
// fontWeight: FontWeight.w600,
// ),
// ],
// ),
// ),
// if (isLocked)
// Positioned.fill(
// child: Container(
// color: Colors.black.withOpacity(0.5),
// child: Stack(
// children: [
// Positioned(
// top: 5,
// right: 5,
// // Position it to the top right corner
// child: Image.asset(
// 'assets/images/lock.png',
// height: 15
//     .h, // Adjust the height of the lock icon as per your design
// ),
// ),
// ],
// )),
// ),
// ],
// ),
// );
// },
// )
