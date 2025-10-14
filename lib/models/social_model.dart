class Post {
  final String id;
  final String username;
  final String userAvatar;
  final String imageUrl;
  final String caption;
  final int likes;
  final int comments;
  final DateTime timestamp;
  final bool isLiked;

  Post({
    required this.id,
    required this.username,
    required this.userAvatar,
    required this.imageUrl,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.timestamp,
    this.isLiked = false,
  });

  Post copyWith({
    String? id,
    String? username,
    String? userAvatar,
    String? imageUrl,
    String? caption,
    int? likes,
    int? comments,
    DateTime? timestamp,
    bool? isLiked,
  }) {
    return Post(
      id: id ?? this.id,
      username: username ?? this.username,
      userAvatar: userAvatar ?? this.userAvatar,
      imageUrl: imageUrl ?? this.imageUrl,
      caption: caption ?? this.caption,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      timestamp: timestamp ?? this.timestamp,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}

class Story {
  final String id;
  final String username;
  final String userAvatar;
  final String imageUrl;
  final bool isViewed;

  Story({
    required this.id,
    required this.username,
    required this.userAvatar,
    required this.imageUrl,
    this.isViewed = false,
  });

  Story copyWith({
    String? id,
    String? username,
    String? userAvatar,
    String? imageUrl,
    bool? isViewed,
  }) {
    return Story(
      id: id ?? this.id,
      username: username ?? this.username,
      userAvatar: userAvatar ?? this.userAvatar,
      imageUrl: imageUrl ?? this.imageUrl,
      isViewed: isViewed ?? this.isViewed,
    );
  }
}

class Reel {
  final String id;
  final String username;
  final String userAvatar;
  final String videoUrl;
  final String thumbnailUrl;
  final String caption;
  final int likes;
  final int comments;
  final bool isLiked;

  Reel({
    required this.id,
    required this.username,
    required this.userAvatar,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.caption,
    required this.likes,
    required this.comments,
    this.isLiked = false,
  });

  Reel copyWith({
    String? id,
    String? username,
    String? userAvatar,
    String? videoUrl,
    String? thumbnailUrl,
    String? caption,
    int? likes,
    int? comments,
    bool? isLiked,
  }) {
    return Reel(
      id: id ?? this.id,
      username: username ?? this.username,
      userAvatar: userAvatar ?? this.userAvatar,
      videoUrl: videoUrl ?? this.videoUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      caption: caption ?? this.caption,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}

class Comment {
  final String id;
  final String username;
  final String userAvatar;
  final String text;
  final DateTime timestamp;

  Comment({
    required this.id,
    required this.username,
    required this.userAvatar,
    required this.text,
    required this.timestamp,
  });
}
