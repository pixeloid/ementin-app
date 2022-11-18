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
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (author.image != null)
            Row(
              children: [
                Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://home.ementin.hu${author.image}'), // Provide your custom image
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
          Expanded(
            child: Column(
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
          )
        ],
      ),
    );
  }
}