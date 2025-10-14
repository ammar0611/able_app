# 🌟 Able Mates - Complete Social Platform

A comprehensive social media platform for NDIS participants, support workers, and service providers built with Flutter.

## 📱 Application Overview

**Able Mates** is a full-featured social networking application designed to connect, engage, and socialize with others. It combines multiple social media features into one powerful app.

## ✨ Main Features

### 🏠 Dashboard (6 Main Features)
1. **Social/Insta** 📸 - Full Instagram clone
2. **Messaging** 💬 - Real-time chat with typing animation
3. **Able Events** 📅 - Community events
4. **Games** 🎮 - Gaming section
5. **Able Pages** 📄 - Directory of services
6. **Job Search** 💼 - Job opportunities

---

## 🎯 Feature Breakdown

### 1️⃣ Social/Instagram Feature

#### **Feed Screen**
- ✅ Horizontal scrolling stories (5+ stories)
- ✅ Vertical scrolling posts (real images from Unsplash)
- ✅ Like/unlike posts with heart animation
- ✅ Comment on posts
- ✅ Share posts
- ✅ Bookmark posts
- ✅ Pull-to-refresh
- ✅ Timestamp display (2h ago, 5h ago, etc.)

#### **Explore Screen**
- ✅ 3-column grid layout
- ✅ 9+ posts from different users
- ✅ Search bar
- ✅ Tap to view post details
- ✅ Popular post indicators

#### **Reels Screen** 🎥
- ✅ **Real video playback** from internet
- ✅ Full-screen vertical scrolling
- ✅ Swipe up/down navigation
- ✅ **Working video player** with controls
- ✅ **Progress bar** shows actual playback
- ✅ Tap to pause/play
- ✅ Like, comment, share buttons
- ✅ Follow button
- ✅ 8 HD sample videos
- ✅ Auto-play and auto-loop
- ✅ Preloading for smooth experience

#### **Stories Viewer**
- ✅ Full-screen story display
- ✅ Auto-advance (3 seconds)
- ✅ Progress bars at top
- ✅ Tap left/right to navigate
- ✅ Long-press to pause

#### **Comments**
- ✅ Add new comments
- ✅ View all comments
- ✅ Like comments
- ✅ Reply to comments
- ✅ Timestamp display

#### **Profile**
- ✅ User avatar and info
- ✅ Stats (Posts, Followers, Following)
- ✅ Edit profile
- ✅ Posts grid

### 2️⃣ Messaging Feature

- ✅ Instagram-style chat interface
- ✅ Conversations list with online status
- ✅ Unread message badges
- ✅ **Auto-reply with typing animation**
- ✅ Character-by-character text reveal (50ms delay)
- ✅ Bouncing typing dots indicator
- ✅ Auto-scroll to new messages
- ✅ Message bubbles (blue for sent, gray for received)
- ✅ Timestamps for messages
- ✅ 4 test conversations included

### 3️⃣ Authentication System

- ✅ Beautiful login screen
- ✅ Signup screen with user type selection
- ✅ Test credentials for different user types:
  - `participant@test.com / password123` (NDIS Participant)
  - `worker@test.com / password123` (Support Worker)
  - `provider@test.com / password123` (Service Provider)
- ✅ Form validation
- ✅ Password visibility toggle
- ✅ User types: NDIS Participant, Support Worker, Service Provider, LAC/Support Coordinator

### 4️⃣ Dashboard

- ✅ Welcome card with user info
- ✅ 6 feature cards in grid layout (2x3)
- ✅ Numbered circular badges
- ✅ Gradient backgrounds
- ✅ Recent activity section
- ✅ Bottom navigation (Home, Events, Directory, Profile)
- ✅ Drawer menu with logout

### 5️⃣ Events & Directory

- ✅ Upcoming events list
- ✅ Event details (time, description, icon)
- ✅ Service directory
- ✅ Multiple service categories

---

## 🎥 Video Support

### Real Videos from Internet!
- **8 HD sample videos** playing in reels
- Videos from Google's test video library
- Formats: MP4, HLS, M3U8, DASH
- Features:
  - Auto-play and auto-loop
  - Pause/play on tap
  - Progress bar with seek
  - Preloading for smooth scrolling
  - Hardware-accelerated playback
  - Loading indicators
  - Error handling

---

## 🎨 Design Features

- **Material Design 3** styling
- **Instagram-like** UI/UX
- **Smooth animations** throughout
- **Gradient effects** on cards
- **Professional color scheme**
- **Responsive layouts**
- **Loading states** with placeholders
- **Error handling** with fallbacks

---

## 📦 Packages Used

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  video_player: ^2.8.2    # For video playback
  chewie: ^1.7.5          # Video player UI
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Device or Emulator

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/ammar0611/able_app.git
cd able_app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

### Test Credentials

Login with any of these:

| User Type | Email | Password |
|-----------|-------|----------|
| NDIS Participant | participant@test.com | password123 |
| Support Worker | worker@test.com | password123 |
| Service Provider | provider@test.com | password123 |
| LAC Coordinator | coordinator@test.com | password123 |

---

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point
├── models/
│   ├── user_model.dart               # User data model
│   ├── message_model.dart            # Chat messages
│   └── social_model.dart             # Posts, Stories, Reels
├── services/
│   ├── auth_service.dart             # Authentication logic
│   └── social_data_service.dart      # Social media data
├── screens/
│   ├── login_screen.dart             # Login page
│   ├── signup_screen.dart            # Signup page
│   ├── dashboard_screen.dart         # Main dashboard
│   ├── messaging_screen.dart         # Chat list
│   ├── chat_screen.dart              # Individual chat
│   ├── social_instagram_screen.dart  # Instagram main
│   ├── feed_screen.dart              # Instagram feed
│   ├── explore_screen.dart           # Explore grid
│   ├── reels_screen.dart             # Video reels
│   ├── story_viewer_screen.dart      # Story viewer
│   └── comments_screen.dart          # Comments interface
```

---

## 🎮 How to Use

### 1. Login
- Open app
- Use test credentials
- Click "Login"

### 2. Dashboard
- See 6 feature cards
- Click any card to explore

### 3. Social/Insta
- **Feed**: Scroll posts, tap stories
- **Explore**: Browse grid, tap posts
- **Reels**: Swipe videos, tap to pause
- **Profile**: View your profile

### 4. Messaging
- See conversations list
- Click any chat
- Send message
- Watch auto-reply with typing animation

### 5. Reels (Videos)
- Swipe up/down for videos
- Tap to pause/play
- Like and comment
- Videos play automatically!

---

## 🎯 Key Interactions

### Feed Screen:
- **Tap story** → Opens full-screen viewer
- **Tap heart** → Like/unlike post
- **Tap comment** → Open comments
- **Pull down** → Refresh feed

### Reels Screen:
- **Swipe up** → Next video
- **Swipe down** → Previous video
- **Tap screen** → Pause/play
- **Tap heart** → Like reel
- **Tap comment** → Comments
- **Drag progress bar** → Seek video

### Messaging:
- **Tap chat** → Open conversation
- **Type message** → Send
- **Watch** → Auto-reply with animation

---

## 📊 Sample Data Included

### Stories: 5
- Your Story (add button)
- John, Sarah, Mike, Emma

### Feed Posts: 5
- Mountain views, Coffee, Sunset, Event, Food

### Explore Posts: 9
- Nature, Food, Fitness, Art, Beach, City, Pets, Cars, Flowers

### Reels: 8 HD Videos
- Adventure, Dance, Cooking, Fitness, Travel, Nature, Tech, Sports

### Chats: 4
- John (Online), Sarah (Online), Mike (Offline), ABC Provider (Offline)

---

## 🌐 Data Sources

### Images:
- All images from **Unsplash** (free HD photos)
- `https://images.unsplash.com/photo-...`

### Videos:
- All videos from **Google Test Videos**
- `https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/`

---

## 🔧 Technical Highlights

### Video Player:
- Native video playback
- Hardware acceleration
- Preloading optimization
- Memory management
- Error handling

### Messaging:
- Real-time typing simulation
- Character-by-character animation
- Auto-scroll functionality
- Smooth transitions

### Performance:
- Lazy loading images
- Video preloading
- Efficient state management
- Smooth animations (60 FPS)

---

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web (limited video support)

---

## 🐛 Known Issues

- Videos may take 2-3 seconds to load initially
- Requires internet connection for images/videos
- Some test videos have minimal audio

---

## 🔮 Future Enhancements

### Phase 1 (Coming Soon):
- [ ] Upload posts, stories, reels
- [ ] Real backend integration
- [ ] Push notifications
- [ ] User authentication (Firebase)
- [ ] Database integration

### Phase 2:
- [ ] Video filters and effects
- [ ] Live streaming
- [ ] Group chats
- [ ] Video calls
- [ ] Story highlights
- [ ] Shopping integration

### Phase 3:
- [ ] AI recommendations
- [ ] Analytics dashboard
- [ ] Payment integration
- [ ] Advanced search
- [ ] Content moderation

---

## 👥 User Types Supported

1. **NDIS Participants** - Main users
2. **Support Workers** - Care providers
3. **Service Providers** - Businesses
4. **LAC / Support Coordinators** - Coordinators

---

## 📄 License

This project is for educational and demonstration purposes.

---

## 👨‍💻 Developer

**Ammar0611**
- GitHub: [@ammar0611](https://github.com/ammar0611)
- Project: Able Mates Social Platform

---

## 🎉 Features Summary

✅ Complete Instagram clone (Feed, Explore, Reels, Stories)
✅ Real video playback from internet
✅ Instagram-style messaging with animations
✅ Beautiful authentication system
✅ 6-feature dashboard
✅ Test data and credentials included
✅ Professional UI/UX design
✅ Smooth animations throughout
✅ Ready to run and test!

---

## 📞 Support

For issues or questions:
1. Check documentation files in project root
2. Review code comments
3. Test with provided credentials
4. Ensure internet connection for media

---

**Built with ❤️ using Flutter**

---

*Last Updated: October 15, 2025*
