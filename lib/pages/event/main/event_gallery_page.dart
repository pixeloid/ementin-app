import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/gallery_provider.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? url = Provider.of<EventProvider>(context, listen: false)
        .selectedEvent
        ?.instaUrl;
    final galleryProvider =
        Provider.of<GalleryProvider>(context, listen: false);
    galleryProvider.getFeed(url);
    return Column(
      children: [
        const WHeader(
          title: 'Fotók',
          isShowBackButton: false,
        ),
        Expanded(
          child: Consumer<GalleryProvider>(
            builder: (BuildContext context, galleryProvider, _) =>
                galleryProvider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : RefreshIndicator(
                        onRefresh: () => getFeed(context),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            crossAxisCount: 2,
                          ),
                          itemCount: galleryProvider.feed.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => RouteTwo(
                                //         image: _items[index].image, name: _items[index].name),
                                //   ),
                                // );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        galleryProvider.feed[index].displayUrl),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          ),
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
