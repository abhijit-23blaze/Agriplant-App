import 'package:flutter/material.dart';
import '../../../../../../core/utils/assets_data.dart';

class ConsultationCard extends StatelessWidget {
  const ConsultationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Card(
          color: Colors.green.shade50,
          shadowColor: Colors.green.shade50,
          elevation: 0.1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Free Consultation',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text('Get free support from our customer Service'),
                      FilledButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 0),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                        onPressed: () {},
                        child: const Text('Call Now ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(AssetsData.contactUs ,width: 140,)
            ],
          ),
        ),
      ),
    );
  }
}
