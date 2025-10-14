import 'package:flutter/material.dart';
import '../models/social_model.dart';
import '../services/social_data_service.dart';
import 'story_viewer_screen.dart';
import 'comments_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Story> _stories = [];
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _stories = SocialDataService.getStories();
      _posts = SocialDataService.getPosts();
    });
  }

  void _toggleLike(int index) {
    setState(() {
      final post = _posts[index];
      _posts[index] = post.copyWith(
        isLiked: !post.isLiked,
        likes: post.isLiked ? post.likes - 1 : post.likes + 1,
      );
    });
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Able Social',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications - Coming soon')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Direct messages - Coming soon')),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          _loadData();
        },
        child: ListView.builder(
          itemCount: _posts.length + 1, // +1 for stories section
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildStoriesSection();
            }
            return _buildPostCard(_posts[index - 1], index - 1);
          },
        ),
      ),
    );
  }

  Widget _buildStoriesSection() {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _stories.length,
        itemBuilder: (context, index) {
          final story = _stories[index];
          return _buildStoryItem(story, index);
        },
      ),
    );
  }

  Widget _buildStoryItem(Story story, int index) {
    final isYourStory = index == 0;
    return GestureDetector(
      onTap: () {
        if (isYourStory) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add story - Coming soon')),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StoryViewerScreen(
                stories: _stories.where((s) => s.id != '1').toList(),
                initialIndex: index - 1,
              ),
            ),
          );
        }
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: story.isViewed
                        ? null
                        : const LinearGradient(
                            colors: [Colors.purple, Colors.orange],
                          ),
                    border: story.isViewed
                        ? Border.all(color: Colors.grey[300]!, width: 2)
                        : null,
                  ),
                  padding: const EdgeInsets.all(3),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      story.userAvatar,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                if (isYourStory)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              story.username,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostCard(Post post, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post header
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  post.userAvatar,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.username,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _formatTimestamp(post.timestamp),
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('More options - Coming soon')),
                  );
                },
              ),
            ],
          ),
        ),
        // Post image
        Image.network(
          post.imageUrl,
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: double.infinity,
              height: 400,
              color: Colors.grey[300],
              child: const Icon(Icons.image, size: 100, color: Colors.grey),
            );
          },
        ),
        // Post actions
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  post.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: post.isLiked ? Colors.red : Colors.black,
                ),
                onPressed: () => _toggleLike(index),
              ),
              IconButton(
                icon: const Icon(Icons.mode_comment_outlined),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CommentsScreen(post: post),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.send_outlined),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Share - Coming soon')),
                  );
                },
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.bookmark_border),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Saved!')),
                  );
                },
              ),
            ],
          ),
        ),
        // Likes count
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '${post.likes} likes',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: post.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' '),
                TextSpan(text: post.caption),
              ],
            ),
          ),
        ),
        // View comments
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CommentsScreen(post: post),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              'View all ${post.comments} comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
