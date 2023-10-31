import 'package:auto_route/auto_route.dart';
import 'package:eventapp/models/sponsor_category.dart';
import 'package:eventapp/pages/event/main/event_sponsor_materials_page.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class SponsorsPage extends StatelessWidget {
  const SponsorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedEvent =
        Provider.of<EventProvider>(context, listen: false).selectedEvent;

    final sponsorCategories = selectedEvent!.sponsorCategories;
    return sponsorCategories != null
        ? Column(
            children: [
              WHeader(
                title: AppLocalizations.of(context)!.page_title_sponsors,
                isShowBackButton: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: sponsorCategories
                        .asMap()
                        .map((i, sponsorCategory) => MapEntry(
                            i, SponsorCategoryBlock(i + 1, sponsorCategory)))
                        .values
                        .toList(),
                  ),
                ),
              ),
            ],
          )
        : const Center(
            child: Text('Nincsenek szponzorok'),
          );
  }
}

class SponsorCategoryBlock extends StatelessWidget {
  final SponsorCategory category;
  final int level;
  const SponsorCategoryBlock(this.level, this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(children: [
            Text(
              category.name.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
                height: 1.2,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            GridView(
              shrinkWrap: true,

              physics:
                  const NeverScrollableScrollPhysics(), // Disable GridView scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: level,
                crossAxisSpacing: 10.0, // Horizontal spacing
                mainAxisSpacing: 10.0, // Vertical spacing
              ),
              children: category.sponsors!
                  .toList()
                  .map<Widget>(
                    (sponsor) => Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
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
                          child: Column(
                            children: [
                              Center(
                                child: AspectRatio(
                                  aspectRatio:
                                      1.4, // 1:1 aspect ratio for a square image
                                  child: Image.network(
                                    'https://home.ementin.hu/${sponsor.logoUrl}', // Replace with your image URL
                                    fit: BoxFit
                                        .contain, // Adjust the fit as needed
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //   SizedBox(
                        //     height: 10,
                        //   ),
                        //   Text(
                        //     sponsor.company.name,
                        //     textAlign: TextAlign.center,
                        //     style: const TextStyle(
                        //       fontSize: 11,
                        //       fontWeight: FontWeight.w600,
                        //       color: Color(0xFF1F2937),
                        //       height: 1.2,
                        //     ),
                        //   ),
                        (sponsor.materialUrls!.isNotEmpty)
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 0),
                                child: TextButton(
                                  style: const ButtonStyle(),
                                  onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Scaffold(
                                        body: SponsorMaterialsPage(
                                          sponsor: sponsor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'További információk',
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 2,
                              )
                      ],
                    ),
                  )
                  .toList(),
            ),
          ]),
        ),
      ],
    );
  }
}
