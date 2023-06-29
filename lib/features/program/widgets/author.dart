import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventapp/app_define/app_theme.dart';
import 'package:flutter/material.dart';

import '../../program/domain/author_model.dart';

class Author extends StatelessWidget {
  final bool? hideDescription;

  const Author({
    Key? key,
    required this.author,
    required this.hideDescription,
  }) : super(key: key);

  final AuthorModel author;

  String getInitials(name) {
    List<String> names = name.split(" ");
    String initials = "";
    int numWords = 2;

    for (var i = 0; i < numWords; i++) {
      initials += names[i][0];
    }
    return initials;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade800,
              backgroundImage: (author.image != null)
                  ? CachedNetworkImageProvider(
                      'https://home.ementin.hu${author.image}') // Provide your custom image

                  : null,
              child: (author.image == null)
                  ? Text(
                      getInitials(author.name),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        height: 1.2,
                      ),
                    )
                  : null,
            ),
            const SizedBox(
              width: 6,
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
                      .map((day) => Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: context.theme().greyWeak),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 1),
                              child: Text(
                                day.toString(),
                                style: const TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  // color: context.theme().accentTxt,
                                ),
                              ),
                            ),
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
