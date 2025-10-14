import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';
import '../models/social_model.dart';
import '../services/social_data_service.dart';
import 'comments_screen.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  late PageController _pageController;
  List<Reel> _reels = [];
  int _currentIndex = 0;
  final Map<int, VideoPlayerController> _videoControllers = {};
  final Map<int, bool> _isInitialized = {};

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _loadData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // Dispose all video controllers
    for (var controller in _videoControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _loadData() {
    setState(() {
      _reels = SocialDataService.getReels();
    });
    // Initialize first video
    _initializeVideo(0);
  }

  Future<void> _initializeVideo(int index) async {
    if (_videoControllers.containsKey(index)) {
      return;
    }

    print('Initializing video at index $index: ${_reels[index].videoUrl}');

    final controller = VideoPlayerController.networkUrl(
      Uri.parse(_reels[index].videoUrl),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _videoControllers[index] = controller;

    try {
      await controller.initialize();
      print('Video initialized successfully at index $index');
      setState(() {
        _isInitialized[index] = true;
      });
      
      if (index == _currentIndex) {
        controller.play();
        controller.setLooping(true);
        print('Playing video at index $index');
      }

      // Preload next video
      if (index + 1 < _reels.length) {
        _initializeVideo(index + 1);
      }
    } catch (e) {
      print('Error initializing video at index $index: $e');
      setState(() {
        _isInitialized[index] = false;
      });
    }
  }

  void _toggleLike(int index) {
    setState(() {
      final reel = _reels[index];
      _reels[index] = reel.copyWith(
        isLiked: !reel.isLiked,
        likes: reel.isLiked ? reel.likes - 1 : reel.likes + 1,
      );
    });
  }

  void _togglePlayPause() {
    final controller = _videoControllers[_currentIndex];
    if (controller != null && _isInitialized[_currentIndex] == true) {
      setState(() {
        if (controller.value.isPlaying) {
          controller.pause();
        } else {
          controller.play();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: _reels.length,
        onPageChanged: (index) {
          // Pause current video
          final currentController = _videoControllers[_currentIndex];
          if (currentController != null && _isInitialized[_currentIndex] == true) {
            currentController.pause();
          }

          setState(() {
            _currentIndex = index;
          });

          // Initialize and play new video
          _initializeVideo(index).then((_) {
            final newController = _videoControllers[index];
            if (newController != null && _isInitialized[index] == true) {
              newController.play();
            }
          });
        },
        itemBuilder: (context, index) {
          return _buildReelItem(_reels[index], index);
        },
      ),
    );
  }

  Widget _buildReelItem(Reel reel, int index) {
    final controller = _videoControllers[index];
    final isInitialized = _isInitialized[index] ?? false;

    return GestureDetector(
      onTap: _togglePlayPause,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Video player or thumbnail
          if (isInitialized && controller != null)
            FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: controller.value.size.width,
                height: controller.value.size.height,
                child: VideoPlayer(controller),
              ),
            )
          else
            Container(
              color: Colors.black,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(color: Colors.white),
                    const SizedBox(height: 16),
                    Text(
                      isInitialized ? 'Video ready' : 'Loading video...',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          
          // Loading indicator
          if (!isInitialized && controller != null)
            Container(
              color: Colors.black.withOpacity(0.7),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(color: Colors.white),
                    SizedBox(height: 16),
                    Text(
                      'Loading video...',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

          // Dark gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
                stops: const [0.6, 1.0],
              ),
            ),
          ),

          // Play/Pause indicator
          if (isInitialized && controller != null && !controller.value.isPlaying)
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),

          // Progress bar at bottom
          if (isInitialized && controller != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: VideoProgressIndicator(
                controller,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  playedColor: Colors.white,
                  bufferedColor: Colors.white38,
                  backgroundColor: Colors.white24,
                ),
                padding: const EdgeInsets.all(0),
              ),
            ),

          // Content overlay
          SafeArea(
            child: Column(
              children: [
                // Top bar
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Reels',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.white),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Camera - Coming soon')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Bottom content
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Left side - user info and caption
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: Text(
                                    reel.userAvatar,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  reel.username,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                OutlinedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Followed!')),
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    side: const BorderSide(color: Colors.white),
                                    minimumSize: const Size(60, 30),
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                  ),
                                  child: const Text('Follow'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              reel.caption,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Right side - actions
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildActionButton(
                            icon: reel.isLiked ? Icons.favorite : Icons.favorite_border,
                            label: _formatCount(reel.likes),
                            onTap: () => _toggleLike(index),
                            color: reel.isLiked ? Colors.red : Colors.white,
                          ),
                          const SizedBox(height: 24),
                          _buildActionButton(
                            icon: Icons.mode_comment_outlined,
                            label: _formatCount(reel.comments),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CommentsScreen(
                                    post: Post(
                                      id: reel.id,
                                      username: reel.username,
                                      userAvatar: reel.userAvatar,
                                      imageUrl: reel.thumbnailUrl,
                                      caption: reel.caption,
                                      likes: reel.likes,
                                      comments: reel.comments,
                                      timestamp: DateTime.now(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                          _buildActionButton(
                            icon: Icons.send,
                            label: 'Share',
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Share - Coming soon')),
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                          _buildActionButton(
                            icon: Icons.more_vert,
                            label: '',
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('More - Coming soon')),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color color = Colors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          if (label.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }
}
