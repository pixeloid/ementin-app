import 'package:ementin_flutter/models/author/author.dart';
import 'package:ementin_flutter/models/schedule_model.dart';
import 'package:flutter/material.dart';

class AuthorWidget extends StatelessWidget {
  final bool? hideDescription;
  final StructuredAuthors? structuredAuthors;

  const AuthorWidget({
    Key? key,
    required this.author,
    required this.hideDescription,
    this.structuredAuthors,
  }) : super(key: key);

  final Author author;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          author.name,
          style: const TextStyle(
            color: Color(0xFF554577),
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 1.2,
          ),
        ),
        // Display first institution from structuredAuthors if available
        if (structuredAuthors != null &&
            structuredAuthors!.institutions.isNotEmpty)
          () {
            final firstInstitution = structuredAuthors!.institutions
                .where((inst) => inst.name != null && inst.name!.isNotEmpty)
                .firstOrNull;

            if (firstInstitution != null) {
              return Text(
                firstInstitution.name!,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  color: Color(0xFF6B7280),
                ),
              );
            }
            return const SizedBox.shrink();
          }()
        else if (author.workplaces != null && author.workplaces!.isNotEmpty)
          // Fallback to first workplace if structuredAuthors not available
          Text(
            author.workplaces!.first.name ?? '',
            softWrap: true,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.2,
              color: Color(0xFF6B7280),
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
    );
  }
}
