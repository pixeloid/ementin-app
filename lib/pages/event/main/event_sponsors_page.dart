import 'package:auto_route/auto_route.dart';
import 'package:ementin_flutter/models/sponsor_category.dart';
import 'package:ementin_flutter/pages/event/main/event_sponsor_materials_page.dart';
import 'package:ementin_flutter/providers/event_provider.dart';
import 'package:ementin_flutter/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ementin_flutter/l10n/app_localizations.dart';

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
              height: 8, // Reduced spacing
            ),
            GridView(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable GridView scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    level > 3 ? 3 : level, // Clamp level to a maximum of 3
                crossAxisSpacing: 8.0, // Reduced horizontal spacing
                mainAxisSpacing: 8.0, // Reduced vertical spacing
              ),
              children: category.sponsors!
                  .toList()
                  .map<Widget>(
                    (sponsor) => GestureDetector(
                      onTap: sponsor.materialUrls!.isNotEmpty
                          ? () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                    body: SponsorMaterialsPage(
                                      sponsor: sponsor,
                                    ),
                                  ),
                                ),
                              )
                          : null,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromRGBO(
                              255, 255, 255, 1), // Always white background
                          border: Border.all(
                            color: sponsor.materialUrls!.isNotEmpty
                                ? const Color.fromRGBO(
                                    0, 123, 255, 1) // Highlighted border
                                : const Color.fromRGBO(243, 244, 246, 1),
                            width: 1,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: AspectRatio(
                                aspectRatio: 1, // 1:1 aspect ratio for a square
                                child: Container(
                                  color: Colors.white, // White background
                                  child: Center(
                                    // Center the image in all directions
                                    child: Image.network(
                                      'https://home.ementin.hu/${sponsor.logoUrl}', // Replace with your image URL
                                      fit: BoxFit
                                          .contain, // Adjust the fit as needed
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (sponsor.materialUrls!.isNotEmpty)
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_ios, // Arrow icon
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
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
