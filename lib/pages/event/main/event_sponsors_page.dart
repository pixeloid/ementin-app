import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/gallery_provider.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SponsorsPage extends StatelessWidget {
  const SponsorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedEvent =
        Provider.of<EventProvider>(context, listen: false).selectedEvent;

    final sponsorCategories = selectedEvent?.sponsorCategories;
    return Column(
      children: [
        const WHeader(
          title: 'Támogatóink',
          isShowBackButton: false,
        ),
        Expanded(
          child: ScrollablePositionedList.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 8,
                );
              },
              padding: const EdgeInsets.only(top: 16),
              itemCount: sponsorCategories!.length,
              itemBuilder: (_, i) {
                var sponsorCategory = sponsorCategories[i];
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          color: const Color.fromRGBO(243, 244, 246, 1),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(children: [
                        Text(
                          sponsorCategory.name.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F2937),
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ...sponsorCategory.sponsors!.toList().map<Widget>(
                              (sponsor) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8),
                                child: Text(
                                  sponsor.company!.name
                                      .toString()
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF1F2937),
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ),
                      ]),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }

  Future getFeed(BuildContext context) async {
    final String? url = Provider.of<EventProvider>(context, listen: false)
        .selectedEvent
        ?.instaUrl;
    await Provider.of<GalleryProvider>(context, listen: false).getFeed(url);
  }
}
