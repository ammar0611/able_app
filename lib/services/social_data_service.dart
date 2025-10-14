import '../models/social_model.dart';

class SocialDataService {
  // Sample stories data
  static List<Story> getStories() {
    return [
      Story(
        id: '1',
        username: 'Your Story',
        userAvatar: 'Y',
        imageUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
        isViewed: false,
      ),
      Story(
        id: '2',
        username: 'John',
        userAvatar: 'J',
        imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
        isViewed: false,
      ),
      Story(
        id: '3',
        username: 'Sarah',
        userAvatar: 'S',
        imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400',
        isViewed: true,
      ),
      Story(
        id: '4',
        username: 'Mike',
        userAvatar: 'M',
        imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400',
        isViewed: false,
      ),
      Story(
        id: '5',
        username: 'Emma',
        userAvatar: 'E',
        imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400',
        isViewed: true,
      ),
    ];
  }

  // Sample posts data
  static List<Post> getPosts() {
    return [
      Post(
        id: '1',
        username: 'john_participant',
        userAvatar: 'J',
        imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
        caption: 'Beautiful mountain views! 🏔️ #nature #adventure',
        likes: 245,
        comments: 18,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Post(
        id: '2',
        username: 'sarah_worker',
        userAvatar: 'S',
        imageUrl: 'https://images.unsplash.com/photo-1511467687858-23d96c32e4ae?w=800',
        caption: 'Coffee time ☕ Perfect start to the day!',
        likes: 189,
        comments: 12,
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      Post(
        id: '3',
        username: 'mike_coordinator',
        userAvatar: 'M',
        imageUrl: 'https://images.unsplash.com/photo-1682687220742-aba13b6e50ba?w=800',
        caption: 'Sunset vibes 🌅 #sunset #peaceful',
        likes: 567,
        comments: 34,
        timestamp: DateTime.now().subtract(const Duration(hours: 8)),
      ),
      Post(
        id: '4',
        username: 'emma_support',
        userAvatar: 'E',
        imageUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800',
        caption: 'Great event today! Thanks everyone 🎉',
        likes: 423,
        comments: 28,
        timestamp: DateTime.now().subtract(const Duration(hours: 12)),
      ),
      Post(
        id: '5',
        username: 'alex_provider',
        userAvatar: 'A',
        imageUrl: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800',
        caption: 'Healthy eating is important! 🥗 #health #wellness',
        likes: 312,
        comments: 21,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  // Sample explore posts (grid view)
  static List<Post> getExplorePosts() {
    return [
      Post(
        id: 'e1',
        username: 'travel_lover',
        userAvatar: 'T',
        imageUrl: 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=400',
        caption: 'Nature is beautiful',
        likes: 1234,
        comments: 56,
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      Post(
        id: 'e2',
        username: 'foodie_blog',
        userAvatar: 'F',
        imageUrl: 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=400',
        caption: 'Delicious food',
        likes: 892,
        comments: 43,
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      ),
      Post(
        id: 'e3',
        username: 'fitness_guru',
        userAvatar: 'F',
        imageUrl: 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=400',
        caption: 'Stay fit!',
        likes: 756,
        comments: 34,
        timestamp: DateTime.now().subtract(const Duration(hours: 4)),
      ),
      Post(
        id: 'e4',
        username: 'art_gallery',
        userAvatar: 'A',
        imageUrl: 'https://images.unsplash.com/photo-1499781350541-7783f6c6a0c8?w=400',
        caption: 'Modern art',
        likes: 645,
        comments: 28,
        timestamp: DateTime.now().subtract(const Duration(hours: 6)),
      ),
      Post(
        id: 'e5',
        username: 'beach_life',
        userAvatar: 'B',
        imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400',
        caption: 'Beach vibes',
        likes: 1456,
        comments: 67,
        timestamp: DateTime.now().subtract(const Duration(hours: 7)),
      ),
      Post(
        id: 'e6',
        username: 'city_lights',
        userAvatar: 'C',
        imageUrl: 'https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b?w=400',
        caption: 'Urban life',
        likes: 923,
        comments: 45,
        timestamp: DateTime.now().subtract(const Duration(hours: 9)),
      ),
      Post(
        id: 'e7',
        username: 'pet_world',
        userAvatar: 'P',
        imageUrl: 'https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=400',
        caption: 'Cute puppy',
        likes: 2341,
        comments: 89,
        timestamp: DateTime.now().subtract(const Duration(hours: 10)),
      ),
      Post(
        id: 'e8',
        username: 'car_enthusiast',
        userAvatar: 'C',
        imageUrl: 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=400',
        caption: 'Dream car',
        likes: 1789,
        comments: 76,
        timestamp: DateTime.now().subtract(const Duration(hours: 11)),
      ),
      Post(
        id: 'e9',
        username: 'flower_power',
        userAvatar: 'F',
        imageUrl: 'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=400',
        caption: 'Spring flowers',
        likes: 678,
        comments: 32,
        timestamp: DateTime.now().subtract(const Duration(hours: 13)),
      ),
    ];
  }

  // Sample reels data
  static List<Reel> getReels() {
    return [
      Reel(
        id: 'r1',
        username: 'adventure_seeker',
        userAvatar: 'A',
        videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        thumbnailUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
        caption: 'Amazing mountain adventure! 🏔️ #adventure #nature',
        likes: 3456,
        comments: 234,
      ),
      Reel(
        id: 'r2',
        username: 'dance_moves',
        userAvatar: 'D',
        videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
        thumbnailUrl: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400',
        caption: 'Quick dance tutorial! 💃 #dance #tutorial',
        likes: 5678,
        comments: 456,
      ),
      Reel(
        id: 'r3',
        username: 'cooking_master',
        userAvatar: 'C',
        videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
        thumbnailUrl: 'https://images.unsplash.com/photo-1495521821757-a1efb6729352?w=400',
        caption: '30-second recipe! 🍳 #cooking #food',
        likes: 4523,
        comments: 312,
      ),
      Reel(
        id: 'r4',
        username: 'fitness_coach',
        userAvatar: 'F',
        videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
        thumbnailUrl: 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=400',
        caption: 'Quick workout routine! 💪 #fitness #workout',
        likes: 6789,
        comments: 543,
      ),
      Reel(
        id: 'r5',
        username: 'travel_diaries',
        userAvatar: 'T',
        videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
        thumbnailUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400',
        caption: 'Beach paradise! 🏖️ #travel #beach',
        likes: 8901,
        comments: 678,
      ),
      Reel(
        id: 'r6',
        username: 'nature_lover',
        userAvatar: 'N',
        videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
        thumbnailUrl: 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=400',
        caption: 'Nature at its best! 🌿 #nature #wildlife',
        likes: 7234,
        comments: 521,
      ),
      Reel(
        id: 'r7',
        username: 'tech_reviews',
        userAvatar: 'T',
        videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
        thumbnailUrl: 'https://images.unsplash.com/photo-1526666923127-b2970f64b422?w=400',
        caption: 'Latest tech gadgets! 📱 #tech #gadgets',
        likes: 5432,
        comments: 389,
      ),
      Reel(
        id: 'r8',
        username: 'sports_highlights',
        userAvatar: 'S',
        videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
        thumbnailUrl: 'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=400',
        caption: 'Amazing sports moment! ⚽ #sports #soccer',
        likes: 9876,
        comments: 765,
      ),
    ];
  }

  // Sample comments
  static List<Comment> getComments(String postId) {
    return [
      Comment(
        id: '1',
        username: 'user_one',
        userAvatar: 'U',
        text: 'Amazing! Love this! 😍',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      Comment(
        id: '2',
        username: 'user_two',
        userAvatar: 'U',
        text: 'Great post! Keep it up 👍',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Comment(
        id: '3',
        username: 'user_three',
        userAvatar: 'U',
        text: 'This is so cool! 🔥',
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      ),
    ];
  }
}
