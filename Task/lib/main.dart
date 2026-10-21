import 'package:flutter/material.dart';

void main() => runApp(const WhatsAppDemo());

// ============================================================
//  Data Models — no hardcoded values in widgets
// ============================================================
class Contact {
  final String name;
  final String lastMessage;
  final String time;
  final Color avatarColor;
  final int unreadCount;
  final bool isOnline;

  const Contact({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarColor,
    this.unreadCount = 0,
    this.isOnline = false,
  });

  String get initial => name[0].toUpperCase();
}

class Message {
  final String text;
  final bool isMe;
  final String time;

  const Message({
    required this.text,
    required this.isMe,
    required this.time,
  });
}

class CallInfo {
  final String name;
  final String time;
  final Color avatarColor;
  final bool isIncoming;
  final bool isMissed;

  const CallInfo({
    required this.name,
    required this.time,
    required this.avatarColor,
    this.isIncoming = true,
    this.isMissed = false,
  });

  String get initial => name[0].toUpperCase();
}

class StatusInfo {
  final String name;
  final String time;
  final Color avatarColor;

  const StatusInfo({
    required this.name,
    required this.time,
    required this.avatarColor,
  });

  String get initial => name[0].toUpperCase();
}

// ============================================================
//  Sample Data — Boys' names (Ali, Usman, Tabassum, Hamza, Bilal, Zain, Tariq)
//  Change these lists to update the whole app easily
// ============================================================
final List<Contact> contactList = [
  const Contact(
      name: 'Ali',
      lastMessage: 'Hello brother! How are you?',
      time: '10:30 AM',
      avatarColor: Colors.indigo,
      unreadCount: 0,
      isOnline: true),
  const Contact(
      name: 'Usman',
      lastMessage: 'See you at the university 👋',
      time: '9:15 AM',
      avatarColor: Colors.teal,
      unreadCount: 0,
      isOnline: true),
  const Contact(
      name: 'Tabassum',
      lastMessage: 'Assignment done ✓',
      time: 'Yesterday',
      avatarColor: Colors.deepPurple,
      unreadCount: 0,
      isOnline: false),
  const Contact(
      name: 'Hamza',
      lastMessage: 'Thanks for helping with the task!',
      time: 'Yesterday',
      avatarColor: Colors.deepOrange,
      unreadCount: 0,
      isOnline: true),
  const Contact(
      name: 'Bilal',
      lastMessage: 'Meeting at 3 PM for presentation',
      time: 'Monday',
      avatarColor: Colors.blueAccent,
      unreadCount: 0,
      isOnline: false),
  const Contact(
      name: 'Zain',
      lastMessage: 'Can you share the lecture notes?',
      time: 'Monday',
      avatarColor: Colors.brown,
      unreadCount: 0,
      isOnline: false),
  const Contact(
      name: 'Tariq',
      lastMessage: 'Viva preparation going good!',
      time: 'Sunday',
      avatarColor: Colors.blueGrey,
      unreadCount: 0,
      isOnline: false),
];

final List<CallInfo> callList = [
  const CallInfo(
      name: 'Ali',
      time: 'Today, 10:30 AM',
      avatarColor: Colors.indigo),
  const CallInfo(
      name: 'Usman',
      time: 'Yesterday, 5:00 PM',
      avatarColor: Colors.teal,
      isMissed: true),
  const CallInfo(
      name: 'Tabassum',
      time: 'Monday, 2:00 PM',
      avatarColor: Colors.deepPurple),
  const CallInfo(
      name: 'Hamza',
      time: 'Sunday, 11:00 AM',
      avatarColor: Colors.deepOrange,
      isMissed: true),
  const CallInfo(
      name: 'Bilal',
      time: 'Saturday, 8:45 PM',
      avatarColor: Colors.blueAccent),
];

final List<StatusInfo> statusList = [
  const StatusInfo(
      name: 'Ali', time: 'Today, 10:30 AM', avatarColor: Colors.indigo),
  const StatusInfo(
      name: 'Usman', time: 'Today, 9:00 AM', avatarColor: Colors.teal),
  const StatusInfo(
      name: 'Tabassum', time: 'Yesterday', avatarColor: Colors.deepPurple),
  const StatusInfo(
      name: 'Hamza', time: 'Yesterday', avatarColor: Colors.deepOrange),
  const StatusInfo(
      name: 'Bilal', time: 'Yesterday', avatarColor: Colors.blueAccent),
];

// starter messages shown when opening a chat (empty by default)
List<Message> getStarterMessages(String contactName) => [];

// ============================================================
//  App Theme — change colors here to update everywhere
// ============================================================
const Color whatsAppGreen = Color(0xFF075E54);
const Color whatsAppTealDark = Color(0xFF054D44);
const Color whatsAppLightGreen = Color(0xFF25D366);
const Color chatBgColor = Color(0xFFECE5DD);
const Color myBubbleColor = Color(0xFFDCF8C6);
const Color appBarBottomColor = Color(0xFF128C7E);

// ============================================================
//  Upgraded WhatsApp Emblem Icon Widget
//  Realistic authentic WhatsApp badge: bright green circle with
//  drop shadow, crisp white speech bubble, and angled phone handset.
// ============================================================
class WhatsAppIcon extends StatelessWidget {
  final double size;
  const WhatsAppIcon({super.key, this.size = 32});

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: whatsAppLightGreen,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 4,
              offset: const Offset(0, 1.5),
            ),
          ],
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.chat_bubble,
                size: size * 0.72,
                color: Colors.white,
              ),
              Transform.rotate(
                angle: -0.28,
                child: Padding(
                  padding: EdgeInsets.only(bottom: size * 0.04),
                  child: Icon(
                    Icons.call,
                    size: size * 0.40,
                    color: whatsAppLightGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

// ============================================================
// Concept 2: Named Routes — defined in MaterialApp's routes map
// ============================================================
class WhatsAppDemo extends StatelessWidget {
  const WhatsAppDemo({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: whatsAppGreen,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: whatsAppLightGreen,
            foregroundColor: Colors.white,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/settings': (context) => const SimplePage(title: 'Settings'),
          '/profile': (context) => const SimplePage(title: 'Profile'),
          '/help': (context) => const SimplePage(title: 'Help'),
        },
      );
}

// ============================================================
// Home Screen — Concepts 4, 5, 7, and Bonus
// ============================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    ChatsTab(),
    StatusTab(),
    CallsTab(),
  ];

  // WhatsApp icon + text shown only on the Chats tab
  Widget _buildTitle() {
    if (_currentIndex == 0) {
      return const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          WhatsAppIcon(size: 32),
          SizedBox(width: 10),
          Text('WhatsApp',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5)),
        ],
      );
    }
    final titles = ['WhatsApp', 'Status', 'Calls'];
    return Text(titles[_currentIndex],
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: _buildTitle(),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'Settings') {
                  Navigator.pushNamed(context, '/settings');
                } else if (value == 'Profile') {
                  Navigator.pushNamed(context, '/profile');
                }
              },
              itemBuilder: (context) => const [
                PopupMenuItem(value: 'Settings', child: Text('Settings')),
                PopupMenuItem(value: 'Profile', child: Text('Profile')),
              ],
            ),
          ],
        ),

        // Concept 7: Drawer with ListView
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Drawer header with user info
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [whatsAppGreen, appBarBottomColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 36, color: whatsAppGreen),
                    ),
                    const SizedBox(height: 12),
                    const Text('Shoaib',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 2),
                    Text('shoaib@example.com',
                        style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.85),
                            fontSize: 14)),
                  ],
                ),
              ),
              _drawerItem(Icons.home, 'Home', () => Navigator.pop(context)),
              _drawerItem(Icons.person, 'Profile', () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              }),
              _drawerItem(Icons.settings, 'Settings', () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              }),
              const Divider(),
              _drawerItem(Icons.help_outline, 'Help', () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/help');
              }),
            ],
          ),
        ),

        body: _pages[_currentIndex],

        // Concept 4: BottomNavigationBar
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedItemColor: whatsAppGreen,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 13,
            unselectedFontSize: 12,
            onTap: (index) => setState(() => _currentIndex = index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.circle_outlined), label: 'Status'),
              BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
            ],
          ),
        ),

        // Concept 5: FloatingActionButton + Bonus: return data
        floatingActionButton: FloatingActionButton(
          elevation: 4,
          onPressed: () async {
            final String? result = await Navigator.push<String>(
              context,
              MaterialPageRoute(builder: (context) => const NewChatPage()),
            );
            if (result != null && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Starting chat with $result'),
                  backgroundColor: whatsAppGreen,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              );
            }
          },
          child: const Icon(Icons.message),
        ),
      );

  // helper to build a drawer ListTile
  ListTile _drawerItem(IconData icon, String title, VoidCallback onTap) =>
      ListTile(
        leading: Icon(icon, color: whatsAppGreen),
        title: Text(title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );
}

// ============================================================
// Chats Tab — Concepts 1 & 3
// ============================================================
class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: contactList.length,
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 76),
          child: Divider(height: 1, color: Colors.grey.withValues(alpha: 0.2)),
        ),
        itemBuilder: (context, index) {
          final contact = contactList[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailPage(contact: contact),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // Concept 3: Hero wraps the avatar
                  Hero(
                    tag: 'avatar-${contact.name}',
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: contact.avatarColor,
                          child: Text(contact.initial,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        // online indicator dot
                        if (contact.isOnline)
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: Container(
                              width: 13,
                              height: 13,
                              decoration: BoxDecoration(
                                color: whatsAppLightGreen,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),
                  // name + last message
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(contact.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.5)),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            if (contact.unreadCount == 0)
                              const Icon(Icons.done_all,
                                  size: 16, color: Colors.blue),
                            if (contact.unreadCount == 0)
                              const SizedBox(width: 4),
                            Expanded(
                              child: Text(contact.lastMessage,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 14)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // time + badge
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(contact.time,
                          style: TextStyle(
                              fontSize: 12,
                              color: contact.unreadCount > 0
                                  ? whatsAppLightGreen
                                  : Colors.grey)),
                      const SizedBox(height: 6),
                      if (contact.unreadCount > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          decoration: BoxDecoration(
                            color: whatsAppLightGreen,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text('${contact.unreadCount}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
}

// ============================================================
// Status Tab — Concept 6: TabBar + TabBarView
// ============================================================
class StatusTab extends StatelessWidget {
  const StatusTab({super.key});
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              labelColor: whatsAppGreen,
              indicatorColor: whatsAppGreen,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'My Status'),
                Tab(text: 'Recent Updates'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // My Status
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: whatsAppLightGreen.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.add_a_photo,
                              size: 50, color: whatsAppGreen),
                        ),
                        const SizedBox(height: 16),
                        const Text('Tap to add status update',
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                      ],
                    ),
                  ),
                  // Recent Updates — built from statusList
                  ListView.builder(
                    itemCount: statusList.length,
                    itemBuilder: (context, index) {
                      final status = statusList[index];
                      return ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: whatsAppLightGreen, width: 2),
                          ),
                          child: CircleAvatar(
                            backgroundColor: status.avatarColor,
                            child: Text(status.initial,
                                style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                        title: Text(status.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(status.time),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

// ============================================================
// Calls Tab — built from callList
// ============================================================
class CallsTab extends StatelessWidget {
  const CallsTab({super.key});
  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: callList.length,
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 76),
          child: Divider(height: 1, color: Colors.grey.withValues(alpha: 0.2)),
        ),
        itemBuilder: (context, index) {
          final call = callList[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: call.avatarColor,
                  child: Text(call.initial,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(call.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: call.isMissed
                                  ? Colors.red
                                  : Colors.black87)),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Icon(
                            call.isMissed
                                ? Icons.call_missed
                                : Icons.call_received,
                            size: 16,
                            color: call.isMissed ? Colors.red : Colors.green,
                          ),
                          const SizedBox(width: 6),
                          Text(call.time,
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey[600])),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: whatsAppLightGreen.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.call,
                      color: whatsAppGreen, size: 22),
                ),
              ],
            ),
          );
        },
      );
}

// ============================================================
// Chat Detail Page — Concepts 1, 3, 5 with working chat
// ============================================================
class ChatDetailPage extends StatefulWidget {
  final Contact contact;
  const ChatDetailPage({super.key, required this.contact});
  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late final List<Message> _messages;

  @override
  void initState() {
    super.initState();
    _messages = getStarterMessages(widget.contact.name);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final now = TimeOfDay.now();
    final timeStr =
        '${now.hourOfPeriod}:${now.minute.toString().padLeft(2, '0')} '
        '${now.period == DayPeriod.am ? 'AM' : 'PM'}';

    setState(() {
      _messages.add(Message(text: text, isMe: true, time: timeStr));
    });
    _controller.clear();

    // scroll to the latest message
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leadingWidth: 30,
          title: Row(
            children: [
              // Concept 3: Hero animation — avatar arrives here
              Hero(
                tag: 'avatar-${widget.contact.name}',
                child: CircleAvatar(
                  radius: 19,
                  backgroundColor: widget.contact.avatarColor,
                  child: Text(widget.contact.initial,
                      style: const TextStyle(color: Colors.white, fontSize: 14)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.contact.name,
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 1),
                    Text(
                      widget.contact.isOnline ? 'online' : 'last seen today',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.white.withValues(alpha: 0.8)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),

        // chat background
        backgroundColor: chatBgColor,

        body: Column(
          children: [
            // message list or encryption notice when empty
            Expanded(
              child: _messages.isEmpty
                  ? Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3CD),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.lock, size: 14, color: Colors.brown),
                            SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                'Messages are end-to-end encrypted. No one outside can read them.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.brown),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final msg = _messages[index];
                        return _ChatBubble(message: msg);
                      },
                    ),
            ),

            // Concept 5: BottomAppBar-style input area
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                color: chatBgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // input field
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.emoji_emotions_outlined,
                                  color: Colors.grey)),
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration: const InputDecoration(
                                hintText: 'Type a message',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              onSubmitted: (_) => _sendMessage(),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.attach_file,
                                  color: Colors.grey)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.camera_alt,
                                  color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  // send button
                  Material(
                    elevation: 2,
                    shape: const CircleBorder(),
                    color: whatsAppGreen,
                    child: InkWell(
                      onTap: _sendMessage,
                      customBorder: const CircleBorder(),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.send, color: Colors.white, size: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

// ── Chat Bubble Widget ──
class _ChatBubble extends StatelessWidget {
  final Message message;
  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) => Align(
        alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 3),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
          decoration: BoxDecoration(
            color: message.isMe ? myBubbleColor : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(14),
              topRight: const Radius.circular(14),
              bottomLeft: Radius.circular(message.isMe ? 14 : 2),
              bottomRight: Radius.circular(message.isMe ? 2 : 14),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(message.text,
                  style: const TextStyle(fontSize: 15, height: 1.3)),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(message.time,
                      style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                  if (message.isMe) ...[
                    const SizedBox(width: 3),
                    const Icon(Icons.done_all, size: 14, color: Colors.blue),
                  ],
                ],
              ),
            ],
          ),
        ),
      );
}

// ============================================================
// New Chat Page — Bonus: returns selected contact name
// ============================================================
class NewChatPage extends StatelessWidget {
  const NewChatPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Select contact',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Text('${contactList.length} contacts',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.white.withValues(alpha: 0.8))),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body: ListView.separated(
          itemCount: contactList.length,
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 72),
            child: Divider(height: 1, color: Colors.grey.withValues(alpha: 0.2)),
          ),
          itemBuilder: (context, index) {
            final contact = contactList[index];
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: contact.avatarColor,
                child: Text(contact.initial,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              title: Text(contact.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16)),
              subtitle: Text(
                  contact.isOnline ? 'Online' : 'Last seen recently',
                  style: TextStyle(fontSize: 13, color: Colors.grey[600])),
              // Bonus: Navigator.pop returns the name
              onTap: () => Navigator.pop(context, contact.name),
            );
          },
        ),
      );
}

// ============================================================
// Simple Page — reused by named routes (Concept 2)
// ============================================================
class SimplePage extends StatelessWidget {
  final String title;
  const SimplePage({super.key, required this.title});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: whatsAppLightGreen.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  title == 'Settings'
                      ? Icons.settings
                      : title == 'Profile'
                          ? Icons.person
                          : Icons.help_outline,
                  size: 56,
                  color: whatsAppGreen,
                ),
              ),
              const SizedBox(height: 20),
              Text('$title Page',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Text('Tap back to return',
                  style: TextStyle(fontSize: 14, color: Colors.grey[500])),
            ],
          ),
        ),
      );
}
