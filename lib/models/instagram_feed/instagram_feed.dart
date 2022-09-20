import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class InstagramFeed {
  final String? id;
  final String? type;
  final String? shortCode;
  final String? caption;
  final List<String>? hashtags;
  final List<dynamic>? mentions;
  final String? url;
  final int? commentsCount;
  final String? firstComment;
  final List<dynamic>? latestComments;
  final int? dimensionsHeight;
  final int? dimensionsWidth;
  final String displayUrl;
  final List<dynamic>? images;
  final dynamic alt;
  final int? likesCount;
  final DateTime? timestamp;
  final List<dynamic>? childPosts;
  final String? ownerId;

  const InstagramFeed({
    this.id,
    this.type,
    this.shortCode,
    this.caption,
    this.hashtags,
    this.mentions,
    this.url,
    this.commentsCount,
    this.firstComment,
    this.latestComments,
    this.dimensionsHeight,
    this.dimensionsWidth,
    required this.displayUrl,
    this.images,
    this.alt,
    this.likesCount,
    this.timestamp,
    this.childPosts,
    this.ownerId,
  });

  @override
  String toString() {
    return 'InstagramFeed(id: $id, type: $type, shortCode: $shortCode, caption: $caption, hashtags: $hashtags, mentions: $mentions, url: $url, commentsCount: $commentsCount, firstComment: $firstComment, latestComments: $latestComments, dimensionsHeight: $dimensionsHeight, dimensionsWidth: $dimensionsWidth, displayUrl: $displayUrl, images: $images, alt: $alt, likesCount: $likesCount, timestamp: $timestamp, childPosts: $childPosts, ownerId: $ownerId)';
  }

  factory InstagramFeed.fromMap(Map<String, dynamic> data) => InstagramFeed(
        id: data['id'] as String?,
        type: data['type'] as String?,
        shortCode: data['shortCode'] as String?,
        caption: data['caption'] as String?,
        mentions: data['mentions'] as List<dynamic>?,
        url: data['url'] as String?,
        commentsCount: data['commentsCount'] as int?,
        firstComment: data['firstComment'] as String?,
        latestComments: data['latestComments'] as List<dynamic>?,
        dimensionsHeight: data['dimensionsHeight'] as int?,
        dimensionsWidth: data['dimensionsWidth'] as int?,
        displayUrl: data['displayUrl'] as String,
        images: data['images'] as List<dynamic>?,
        alt: data['alt'] as dynamic,
        likesCount: data['likesCount'] as int?,
        timestamp: data['timestamp'] == null
            ? null
            : DateTime.parse(data['timestamp'] as String),
        childPosts: data['childPosts'] as List<dynamic>?,
        ownerId: data['ownerId'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'type': type,
        'shortCode': shortCode,
        'caption': caption,
        'hashtags': hashtags,
        'mentions': mentions,
        'url': url,
        'commentsCount': commentsCount,
        'firstComment': firstComment,
        'latestComments': latestComments,
        'dimensionsHeight': dimensionsHeight,
        'dimensionsWidth': dimensionsWidth,
        'displayUrl': displayUrl,
        'images': images,
        'alt': alt,
        'likesCount': likesCount,
        'timestamp': timestamp?.toIso8601String(),
        'childPosts': childPosts,
        'ownerId': ownerId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [InstagramFeed].
  factory InstagramFeed.fromJson(String data) {
    return InstagramFeed.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [InstagramFeed] to a JSON string.
  String toJson() => json.encode(toMap());

  InstagramFeed copyWith({
    String? id,
    String? type,
    String? shortCode,
    String? caption,
    List<String>? hashtags,
    List<dynamic>? mentions,
    String? url,
    int? commentsCount,
    String? firstComment,
    List<dynamic>? latestComments,
    int? dimensionsHeight,
    int? dimensionsWidth,
    String? displayUrl,
    List<dynamic>? images,
    dynamic alt,
    int? likesCount,
    DateTime? timestamp,
    List<dynamic>? childPosts,
    String? ownerId,
  }) {
    return InstagramFeed(
      id: id ?? this.id,
      type: type ?? this.type,
      shortCode: shortCode ?? this.shortCode,
      caption: caption ?? this.caption,
      hashtags: hashtags ?? this.hashtags,
      mentions: mentions ?? this.mentions,
      url: url ?? this.url,
      commentsCount: commentsCount ?? this.commentsCount,
      firstComment: firstComment ?? this.firstComment,
      latestComments: latestComments ?? this.latestComments,
      dimensionsHeight: dimensionsHeight ?? this.dimensionsHeight,
      dimensionsWidth: dimensionsWidth ?? this.dimensionsWidth,
      displayUrl: displayUrl ?? this.displayUrl,
      images: images ?? this.images,
      alt: alt ?? this.alt,
      likesCount: likesCount ?? this.likesCount,
      timestamp: timestamp ?? this.timestamp,
      childPosts: childPosts ?? this.childPosts,
      ownerId: ownerId ?? this.ownerId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! InstagramFeed) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      shortCode.hashCode ^
      caption.hashCode ^
      hashtags.hashCode ^
      mentions.hashCode ^
      url.hashCode ^
      commentsCount.hashCode ^
      firstComment.hashCode ^
      latestComments.hashCode ^
      dimensionsHeight.hashCode ^
      dimensionsWidth.hashCode ^
      displayUrl.hashCode ^
      images.hashCode ^
      alt.hashCode ^
      likesCount.hashCode ^
      timestamp.hashCode ^
      childPosts.hashCode ^
      ownerId.hashCode;
}
