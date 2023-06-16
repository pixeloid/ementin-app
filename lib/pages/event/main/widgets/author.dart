import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventapp/app_define/app_assets.dart';
import 'package:eventapp/models/author_model.dart';
import 'package:flutter/material.dart';

class Author extends StatelessWidget {
  final bool? hideDescription;

  const Author({
    Key? key,
    required this.author,
    required this.hideDescription,
  }) : super(key: key);

  final AuthorModel author;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0x22554577),
                image: (author.image != null)
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            'https://home.ementin.hu${author.image}'), // Provide your custom image
                      )
                    : DecorationImage(
                        image: AssetImage(AppAssets.origin().icUser),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  author.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Color(0xFF554577),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 1.2,
                  ),
                ),
                Row(
                  children: author.presentationDays
                      .map((day) => Chip(
                            label: Text(day.toString()),
                            padding: const EdgeInsets.all(0),
                          ))
                      .toList(),
                ),
                if (author.workplace != null)
                  Text(
                    author.workplace ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                if (author.description != null && !hideDescription!)
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      author.description ?? '',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
