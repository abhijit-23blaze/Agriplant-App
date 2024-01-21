import 'package:agriplant/core/utils/enums/order_status.dart';
import 'package:agriplant/core/utils/extensions/date.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/order.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    const steps = OrderStatus.values;
    final activeStep = OrderStatus.values.indexOf(order.status);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EasyStepper(
              activeStep:
                  activeStep == steps.length - 1 ? activeStep + 1 : activeStep,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              stepRadius: 12,
              internalPadding: 0,
              activeStepTextColor: Colors.black87,
              finishedStepTextColor: Theme.of(context).colorScheme.primary,
              lineStyle: LineStyle(
                defaultLineColor: Colors.grey.shade300,
                finishedLineColor: Theme.of(context).colorScheme.primary,
                lineLength:
                    MediaQuery.of(context).size.width * 0.7 / steps.length,
                lineType: LineType.normal,
                lineThickness: 2,
              ),
              steps: List.generate(steps.length, (index) {
                return EasyStep(
                  finishIcon: const Icon(Icons.done),
                  icon: const Icon(Icons.local_shipping),
                  // customStep: CircleAvatar(
                  //   radius: 8,
                  //   backgroundColor: activeStep > index
                  //       ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                  //       : Colors.grey.shade400,
                  //   child: CircleAvatar(
                  //     radius: 2.5,
                  //     backgroundColor: activeStep > index
                  //         ? Theme.of(context).colorScheme.primary
                  //         : Colors.grey.shade200,
                  //
                  //   ),
                  // ),
                  title: steps[index].name,
                  topTitle: true,
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: .2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Order: ${order.id}'),
                          const Spacer(),
                          Chip(
                            label: Text(steps[activeStep].name),
                            shape: const StadiumBorder(),
                            side: BorderSide.none,
                            avatar: const Icon(Icons.fire_truck ),
                            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.4),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text('Delivery Date   '),
                          Text(' ${order.date.deliveryDate}'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
