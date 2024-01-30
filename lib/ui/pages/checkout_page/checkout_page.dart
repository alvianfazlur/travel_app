import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/success_checkout.dart';
import 'package:bwa_masteringflutter/ui/widgets/booking_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);
  static const routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 291,
              height: 65,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/plane_checkout.png'))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CGK",
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      "Tangerang",
                      style: greyTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "TLC",
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      "Ciliwung",
                      style: greyTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget checkoutTile() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          image: AssetImage('assets/images/bg_ciliwun.png'),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lake Ciliwung",
                        style: blackTextStyle.copyWith(
                            fontWeight: medium, fontSize: 18),
                      ),
                      Text(
                        "Tangerang",
                        style: greyTextStyle.copyWith(fontWeight: light),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/Star.png'))),
                    ),
                    Text(
                      "4.8",
                      style: blackTextStyle.copyWith(fontWeight: medium),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Booking Details",
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            BookingItem(
              title: "Traveler",
              text: "2 Person",
              valueColor: blackColor,
            ),
            BookingItem(
              title: "Seat",
              text: "A3 B3",
              valueColor: blackColor,
            ),
            BookingItem(
              title: "Insurance",
              text: "YES",
              valueColor: greenColor,
            ),
            BookingItem(
              title: "Refundable",
              text: "2 Person",
              valueColor: redColor,
            ),
            BookingItem(
              title: "VAT",
              text: "45%",
              valueColor: blackColor,
            ),
            BookingItem(
              title: "Price",
              text: "IDR 8.500.690",
              valueColor: blackColor,
            ),
            BookingItem(
              title: "Grand Total",
              text: "IDR 12.000.000",
              valueColor: primaryColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Details",
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 100,
                  height: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/plane_pay.png'))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/plane.png'))),
                      ),
                      Text(
                        "Pay",
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "IDR 80.400.000",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Current Balance",
                        style: greyTextStyle.copyWith(fontWeight: light),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget buttonPay(){
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        width: 327,
        height: 55,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17))),
          onPressed: () {
            Get.toNamed(SuccessCheckout.routeName);
          },
          child: Text(
            'Pay Now',
            style: whiteTextStyle.copyWith(
                fontWeight: medium, fontSize: 18),
          ),
        ),
      );
    }
    Widget terms(){
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: TextButton(
          onPressed: () {
            Get.dialog(
              AlertDialog(
                backgroundColor: Colors.white,
                title: const Text("Terms and Conditions"),
                content: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Your terms and conditions here..."),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Close'),
                  ),
                ],
              ),
            );
          },
          child: Text(
            'Terms and Conditions',
            style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [route(), checkoutTile(), paymentDetails(), buttonPay(),terms()],
      ),
    );
  }
}