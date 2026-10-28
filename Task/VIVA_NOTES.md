# 🎓 Complete Flutter WhatsApp Clone — Viva Preparation & Code Defense Guide

---

## 📌 Table of Contents
1. **Project Overview & Architectural Concepts**
2. **Every Widget: Where It Is Used & Why**
3. **Line-by-Line & Section-by-Section Code Breakdown**
4. **Top 20 Viva Questions & Exact Defensible Answers**
5. **Quick Cheat Sheet for Instant Answering**
6. **🛠️ How to Customize & Change Everything in Code (Colors, Widgets, Data)**

---

## 1. Project Overview & Architectural Concepts

This application is a **WhatsApp UI Clone** built in Flutter. It is designed to demonstrate key Flutter mobile development concepts clearly without messy hardcoded logic.

### 🌟 Key Concepts Implemented
1. **Concept 1: Explicit Navigation (`Navigator.push` & `Navigator.pop`)**
   - Opening chat details from the list.
   - Returning the selected contact from the `NewChatPage` back to `HomeScreen`.
2. **Concept 2: Named Routes (`MaterialApp.routes` & `Navigator.pushNamed`)**
   - Declarative routing defined centrally (`/settings`, `/profile`, `/help`).
3. **Concept 3: Hero Animation (`Hero`)**
   - Seamless shared-element transition of contact avatar from the list to the chat app bar.
4. **Concept 4: Bottom Navigation (`BottomNavigationBar`)**
   - Switching between Chats, Status, and Calls using `StatefulWidget` index state.
5. **Concept 5: Floating Action Button & Asynchronous Navigation Result**
   - Floating action button that pushes `NewChatPage`, awaits a selected contact name, and shows a `SnackBar`.
6. **Concept 6: Nested Tab Navigation (`DefaultTabController`, `TabBar`, `TabBarView`)**
   - Inside the Status page, switching between "My Status" and "Recent Updates".
7. **Concept 7: Navigation Drawer (`Drawer`, `ListView`, `DrawerHeader`)**
   - Side-drawer menu displaying student details and navigation shortcuts.
8. **Clean Data Modeling (OOP principles)**
   - All contacts, messages, calls, and statuses are typed classes (`Contact`, `Message`, `CallInfo`, `StatusInfo`), keeping the UI widgets purely presentational.

---

## 2. Every Widget: Where It Is Used & Why

| Widget Name | Where It Is Used | Why We Used It (Viva Answer) |
| :--- | :--- | :--- |
| **`MaterialApp`** | Root of the application (`WhatsAppDemo`) | Sets up Flutter app configuration: theme colors, title, and centralized named routing table (`routes`). |
| **`ThemeData`** | Inside `MaterialApp` | Defines global app colors (primary green, app bar styles, FAB color) so changing colors happens in one place. |
| **`Scaffold`** | In `HomeScreen`, `ChatDetailPage`, `NewChatPage`, `SimplePage` | Provides the standard Material Design visual page structure (AppBar, Drawer, Body, BottomNavigationBar, FloatingActionButton). |
| **`AppBar`** | Top of each screen | Holds screen title, branding (WhatsApp icon + text), search, camera, and menu action buttons. |
| **`Row` & `Column`** | Throughout every page and bubble | `Row` arranges widgets horizontally (e.g. avatar next to name, or text field next to send button). `Column` arranges vertically (e.g. name above last message). |
| **`Expanded`** | Inside Rows & Columns (e.g. Chat list title, Chat input textfield) | Forces a child to occupy all remaining available space, preventing yellow-and-black overflow errors (`RenderFlex overflowed`). |
| **`SizedBox`** | Between UI elements | Provides precise whitespace (width or height) between widgets without adding layout overhead. |
| **`ListView.separated`** | In `ChatsTab`, `CallsTab`, `NewChatPage` | Efficiently builds scrollable lists on-demand for performance (lazy loading) and automatically inserts custom divider lines between items. |
| **`CircleAvatar`** | Contact items, app bars, drawer | Displays circular user profile pictures or colored fallback initials. |
| **`Hero`** | Wrapping `CircleAvatar` in `ChatsTab` and `ChatDetailPage` | Creates a smooth transition animation where the avatar "flies" from the contact list into the chat header when opened. |
| **`Stack` & `Positioned`** | Contact avatar in `ChatsTab` and `WhatsAppIcon` | `Stack` layers widgets on top of each other (like z-index). `Positioned` anchors the green online dot to the bottom-right corner of the avatar. |
| **`Container`** | Input bar, unread badges, status circles | Used for styling: custom margins, padding, border radius, background colors, and box shadows. |
| **`InkWell`** | Wrapping list items and the send button | Adds Material touch ripple effect and captures `onTap` events cleanly. |
| **`BottomNavigationBar`** | At bottom of `HomeScreen` | Provides standard 3-tab navigation (Chats, Status, Calls) updated by changing `_currentIndex`. |
| **`FloatingActionButton`** | Bottom-right of `HomeScreen` | Prominent round action button to start a new chat, awaiting return data asynchronously. |
| **`SnackBar`** | Triggered after selecting a contact in `NewChatPage` | Displays a temporary floating confirmation message at the bottom of the screen. |
| **`Drawer` & `DrawerHeader`** | Side slide-out menu in `HomeScreen` | Provides secondary app navigation (Profile, Settings, Help) and user profile info. |
| **`DefaultTabController`** | Inside `StatusTab` | Coordinates state between the `TabBar` tabs and `TabBarView` pages without needing a manual `TabController`. |
| **`TabBar` & `TabBarView`** | Inside `StatusTab` | `TabBar` displays the horizontal tabs ("My Status", "Recent Updates"); `TabBarView` swipes between their respective content. |
| **`TextField`** | Bottom chat message bar in `ChatDetailPage` | Allows user to type interactive text input with `controller` and `onSubmitted` hooks. |
| **`TextEditingController`** | `_ChatDetailPageState` | Reads the entered message, clears the field upon sending, and manages text input state. |
| **`ScrollController`** | Inside `ChatDetailPage` ListView | Programmatically auto-scrolls the chat list to the bottom whenever a new message is sent. |
| **`PopupMenuButton`** | AppBar top-right (3 dots) | Shows an overflow popup menu with options like "Settings" and "Profile". |
| **`Align`** | Inside `_ChatBubble` | Positions outgoing messages to `Alignment.centerRight` and incoming messages to `Alignment.centerLeft`. |
| **`BoxDecoration`** | Containers across the app | Applies gradients, border radius, circular shapes, borders, and drop shadows (`BoxShadow`). |

---

## 3. Line-by-Line & Section-by-Section Code Breakdown

### Section 1: Entry Point & Data Models (Lines 1–71)
```dart
void main() => runApp(const WhatsAppDemo());
```
- **`main()`**: The starting point of execution for any Dart program.
- **`runApp()`**: Inflates the root widget (`WhatsAppDemo`) and attaches it to the screen.

#### Data Models (`Contact`, `Message`, `CallInfo`, `StatusInfo`)
- **Why?**: Instead of hardcoding text and colors directly into UI widgets, we use Object-Oriented classes.
- **`name`**, **`lastMessage`**, **`time`**, **`avatarColor`**, **`unreadCount`**, **`isOnline`**: Strongly typed properties.
- **`String get initial => name[0].toUpperCase();`**: A computed getter that extracts the first character of the name to display inside the `CircleAvatar` when there is no image.

---

### Section 2: Mock Datasets (Lines 72–162)
```dart
final List<Contact> contactList = [...];
final List<CallInfo> callList = [...];
final List<StatusInfo> statusList = [...];
List<Message> getStarterMessages(String contactName) => [...];
```
- **Why?**: Centralized mock data. If the teacher asks you to change a contact's name, message, or online status, you only change it in this list—the entire UI updates automatically without touching any widget layout code.

---

### Section 3: App Theme & Custom WhatsApp Icon (Lines 163–204)
```dart
const Color whatsAppGreen = Color(0xFF075E54);
const Color whatsAppTealDark = Color(0xFF054D44);
const Color whatsAppLightGreen = Color(0xFF25D366);
const Color chatBgColor = Color(0xFFECE5DD);
const Color myBubbleColor = Color(0xFFDCF8C6);
```
- Defines official WhatsApp hex color constants.
- **`WhatsAppIcon` Widget**:
  - Uses a `Stack` layering `Icon(Icons.chat)` as the bubble and a smaller `Icon(Icons.call)` inside it.
  - Gives an authentic WhatsApp icon natively without needing heavy third-party image assets.

---

### Section 4: MaterialApp & Named Routes (Lines 205–234)
```dart
class WhatsAppDemo extends StatelessWidget {
...
  initialRoute: '/',
  routes: {
    '/': (context) => const HomeScreen(),
    '/settings': (context) => const SimplePage(title: 'Settings'),
    '/profile': (context) => const SimplePage(title: 'Profile'),
    '/help': (context) => const SimplePage(title: 'Help'),
  },
```
- **`initialRoute: '/'`**: Sets the first screen that loads (`HomeScreen`).
- **`routes: { ... }`**: A map linking route string names to widget builder functions. Used for **Named Routing** via `Navigator.pushNamed(context, '/settings')`.

---

### Section 5: HomeScreen (Bottom Nav, Drawer, FAB) (Lines 235–416)
- **`StatefulWidget`**: Used because `_currentIndex` changes when the user taps on a bottom navigation item.
- **`_buildTitle()`**: Dynamically shows the WhatsApp logo icon next to the "WhatsApp" title on the Chats tab, and changes the title to "Status" or "Calls" on other tabs.
- **`drawer: Drawer(...)`**:
  - Contains a `DrawerHeader` with user details (Student info and avatar).
  - Uses `_drawerItem` helper method to build reusable `ListTile` navigation links.
  - Closes the drawer with `Navigator.pop(context)` before calling `Navigator.pushNamed(...)`.
- **`bottomNavigationBar: Container(...)`**:
  - Has a subtle top shadow for depth.
  - Updates `_currentIndex` using `setState(() => _currentIndex = index)`.
- **`floatingActionButton: FloatingActionButton(...)`**:
  ```dart
  final String? result = await Navigator.push<String>(
    context,
    MaterialPageRoute(builder: (context) => const NewChatPage()),
  );
  if (result != null && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(...);
  }
  ```
  - **Asynchronous Navigation**: Waits (`await`) for `NewChatPage` to pop.
  - If a contact name is returned, it presents a confirmation `SnackBar`.
  - `context.mounted` ensures the widget is still on screen before calling `ScaffoldMessenger` (prevents memory-leak warning).

---

### Section 6: ChatsTab (Lines 417–540)
- **`ListView.separated`**:
  - `itemCount: contactList.length`: Generates exact number of contacts.
  - `separatorBuilder`: Adds an indented divider (`padding: left: 76`) matching real WhatsApp UI.
- **`Hero(tag: 'avatar-${contact.name}', ...)`**:
  - Tags this avatar with a unique key. When the user taps, Flutter animates this avatar directly into the matching `Hero` widget in `ChatDetailPage`.
- **Online Indicator Dot**:
  - Uses `Stack` and `Positioned(bottom: 1, right: 1)` to overlay a green circle on the avatar if `contact.isOnline == true`.
- **Unread Badge & Ticks**:
  - Shows double blue ticks (`Icons.done_all`) if messages are read (`unreadCount == 0`).
  - Shows green badge if `unreadCount > 0`.

---

### Section 7: StatusTab (Nested Tabs) (Lines 541–616)
- **`DefaultTabController(length: 2, ...)`**:
  - Coordinates the tabs without needing a manual `TickerProviderStateMixin`.
- **`TabBar`**:
  - Shows the 2 tabs: "My Status" and "Recent Updates".
- **`TabBarView`**:
  - Child 1: "My Status" with a circular photo add icon (`Icons.add_a_photo`).
  - Child 2: "Recent Updates" displaying contacts from `statusList` with a green border ring around their avatar representing an active status story.

---

### Section 8: CallsTab (Lines 617–690)
- Displays call logs from `callList`.
- Shows red icon (`Icons.call_missed`) for missed calls and green icon (`Icons.call_received`) for answered calls.
- Trailing telephone icon to initiate a call.

---

### Section 9: ChatDetailPage (Interactive Chat & Input) (Lines 691–885)
- **`_messages = getStarterMessages(...)`**: Loads mock messages specific to that contact.
- **`_sendMessage()`**:
  1. Trims text from `_controller.text`. If empty, returns.
  2. Generates current 12-hour timestamp (e.g., `10:30 AM`).
  3. Calls `setState()` adding a new `Message(text: text, isMe: true, time: timeStr)`.
  4. Clears input with `_controller.clear()`.
  5. Smoothly scrolls to the bottom using `_scrollController.animateTo(...)`.
- **`_ChatBubble` (Lines 886–938)**:
  - Custom WhatsApp bubble style.
  - Aligns to right with light-green background (`#DCF8C6`) for sent messages (`isMe: true`).
  - Aligns to left with white background for received messages (`isMe: false`).
  - Contains text, timestamp, and blue double-check tick marks.

---

### Section 10: NewChatPage & Return Data (Lines 939–994)
- Shows contact list to choose from.
- **`onTap: () => Navigator.pop(context, contact.name)`**:
  - Passes the selected name back as the result to the caller in `HomeScreen`.

---

### Section 11: SimplePage (Lines 995–1035)
- Generic screen used for `/settings`, `/profile`, and `/help` named routes.
- Displays an appropriate icon and title dynamically based on the route argument passed to it.

---

## 4. Top 20 Viva Questions & Exact Defensible Answers

### Q1. What is the difference between `StatelessWidget` and `StatefulWidget`?
> **Answer:**
> - `StatelessWidget` is immutable; its UI depends entirely on configuration passed into it and never changes over time (e.g. `ChatsTab`, `SimplePage`).
> - `StatefulWidget` maintains mutable state via a companion `State` class. When `setState()` is called, Flutter rebuilds the widget with updated data (e.g. `HomeScreen` tab index, `ChatDetailPage` sending new messages).

### Q2. How does navigation work in this project?
> **Answer:** We implemented two types of navigation:
> 1. **Direct Navigation (`Navigator.push` with `MaterialPageRoute`):** Used when going to `ChatDetailPage` and `NewChatPage` because we pass specific runtime parameters (`contact`).
> 2. **Named Navigation (`Navigator.pushNamed`):** Configured in `MaterialApp.routes` map and used for static destinations like `/settings`, `/profile`, and `/help`.

### Q3. How did you pass data backward from a screen?
> **Answer:** In `NewChatPage`, when a user taps a contact, we call `Navigator.pop(context, contact.name)`. In `HomeScreen`, the FAB waits for this result using `await Navigator.push(...)` and displays the returned name in a `SnackBar`.

### Q4. What is a Hero widget and how does it work?
> **Answer:** `Hero` provides shared-element page transitions. By giving the `CircleAvatar` in `ChatsTab` and the one in `ChatDetailPage` the exact same unique `tag` (e.g. `'avatar-${contact.name}'`), Flutter automatically animates and flies the avatar smoothly between the two screens during transition.

### Q5. Why did you use `ListView.separated` instead of a standard `Column` or simple `ListView`?
> **Answer:**
> 1. A `Column` renders all children at once, causing memory issues with large lists, and does not scroll by default.
> 2. `ListView.separated` uses lazy loading (only creates items visible on screen) and provides a dedicated `separatorBuilder` to draw dividers between list items cleanly.

### Q6. What is the role of `Expanded` inside a `Row` or `Column`?
> **Answer:** `Row` and `Column` give their children unbounded width or height. If text is long, it will cause an overflow error. `Expanded` forces the child (like the chat message text or the input TextField) to take only the remaining available space and wrap or truncate cleanly.

### Q7. How does the WhatsApp icon work without downloading image assets?
> **Answer:** We created a reusable custom widget `WhatsAppIcon` that uses a `Stack` to place a phone icon (`Icons.call`) inside a chat bubble icon (`Icons.chat`). It renders crisply at any size and needs no external assets.

### Q8. What does `DefaultTabController` do in the Status tab?
> **Answer:** It provides an ambient controller that automatically synchronizes the active tab in the `TabBar` with the page shown in the `TabBarView` without having to manually manage lifecycle controllers or `TickerProviderStateMixin`.

### Q9. Why do we need `dispose()` in `_ChatDetailPageState`?
> **Answer:** Controllers (`TextEditingController` and `ScrollController`) allocate memory and listeners in the OS. Calling `.dispose()` inside the `State`'s `dispose()` lifecycle method frees these resources and prevents memory leaks.

### Q10. What is `initialRoute` in `MaterialApp`?
> **Answer:** It defines the route path that is automatically pushed when the application first starts up. In our app, it is set to `'/'`, which resolves to `HomeScreen`.

### Q11. What is the purpose of `Stack` and `Positioned`?
> **Answer:** `Stack` allows overlapping widgets on top of one another. We used it with `Positioned` to place the green online dot right on the bottom-right edge of the user's avatar.

### Q12. Why do your models have `String get initial => name[0].toUpperCase();`?
> **Answer:** It is a Dart getter method that takes the first letter of the contact's name and capitalizes it. This is used as the fallback letter inside the `CircleAvatar`.

### Q13. What does `context.mounted` check?
> **Answer:** In asynchronous methods (after an `await`), the user might have already navigated away from the screen. Checking `context.mounted` verifies that the widget is still in the widget tree before attempting to show a `SnackBar`, preventing crashes.

### Q14. What does `SafeArea` or `Scaffold` do for screen bounds?
> **Answer:** `Scaffold` provides the fundamental Material layout framework. It calculates app bar heights, notch padding, and system navigation bar spacing automatically.

### Q15. How does sending a message scroll the list to the bottom?
> **Answer:** Inside `_sendMessage()`, we call `_scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: ..., curve: ...)` after a 100ms microtask delay, ensuring the newly added widget is rendered before scrolling.

### Q16. Can you easily change the app's primary color?
> **Answer:** Yes! In the `App Theme` section, `whatsAppGreen` is defined as `const Color(0xFF075E54)`. Changing this one constant updates the AppBar, Drawer, and accents across the entire app.

### Q17. How is unread message count displayed?
> **Answer:** If `contact.unreadCount > 0`, a green circular `Container` with the number is rendered. If it is 0, we show double blue check marks (`Icons.done_all`, `color: Colors.blue`).

### Q18. How do you defend that your code is not hardcoded?
> **Answer:**
> - Data is separated into distinct Dart classes (`Contact`, `Message`, `CallInfo`, `StatusInfo`).
> - The UI loops through typed lists (`contactList`, `callList`, `statusList`).
> - Routes are defined in a centralized routing table.
> - Colors are defined as constants at the top level.

### Q19. What is `InkWell`?
> **Answer:** An `InkWell` is a rectangular area of a Material widget that responds to touch events by showing an animated splash ripple. We used it so list items feel interactive when tapped.

### Q20. What is `TimeOfDay.now()` used for?
> **Answer:** When sending a message in the chat screen, it captures the current system clock time and formats it into `hour:minute AM/PM` to dynamically timestamp the new chat bubble.

---

## 5. Quick Viva Defense Cheat Sheet (Speak Like a Pro)

If the teacher asks:
- **"Explain your project architecture:"**
  > *"Sir/Ma'am, the app follows a clean modular structure. We separated data into models (`Contact`, `Message`, etc.), separated screens into discrete widgets (`HomeScreen`, `ChatDetailPage`), and managed navigation through both direct Material routes and named routes. The UI includes full WhatsApp-style tabs, hero animations, interactive messaging, and drawer navigation."*

- **"Show me where you used animations:"**
  > *"In `ChatsTab` and `ChatDetailPage`. Both avatars are wrapped in a `Hero` widget sharing the unique tag `avatar-${contact.name}`. When tapped, Flutter automatically animates the transition between the two screens."*

- **"Show me where data is returned from a screen:"**
  > *"In `HomeScreen` inside the `FloatingActionButton`. We await the result of `NewChatPage`. In `NewChatPage`, tapping a contact calls `Navigator.pop(context, contact.name)`. The home screen then displays that returned contact name in a `SnackBar`."*

- **"How does the chat work?"**
  > *"The chat is a `StatefulWidget`. When the user types and hits send, `_sendMessage()` reads the `TextEditingController`, instantiates a new `Message` object with the current time, appends it to `_messages` via `setState()`, clears the input field, and scrolls down with `ScrollController`."*

---

## 6. 🛠️ How to Customize & Change Everything in Code

If your teacher or examiner says: *"Change this color"*, *"Add a contact"*, or *"Change this icon"*, here is the exact place in `lib/main.dart` to edit:

### 🎨 1. How to Change App Colors
Look at **Lines 166–171** in `lib/main.dart`:
```dart
const Color whatsAppGreen = Color(0xFF075E54);      // Main AppBar, Drawer Header, Send button
const Color whatsAppTealDark = Color(0xFF054D44);  // Darker shade
const Color whatsAppLightGreen = Color(0xFF25D366); // FAB button, unread count badge, online dot
const Color chatBgColor = Color(0xFFECE5DD);        // Chat page background color
const Color myBubbleColor = Color(0xFFDCF8C6);      // Outgoing message bubble color
const Color appBarBottomColor = Color(0xFF128C7E);  // Secondary gradient color
```
* **To change to Blue Theme (e.g. Telegram style):**
  Change `Color(0xFF075E54)` to `Colors.blue` or `Color(0xFF0088CC)`.
* **To change to Dark Mode / Black Theme:**
  Change `whatsAppGreen` to `Colors.black87` and `chatBgColor` to `Color(0xFF121B22)`.
* **To change your chat bubble color:**
  Change `myBubbleColor` from `Color(0xFFDCF8C6)` to `Colors.lightBlue[100]!` or `Colors.white`.

---

### 👤 2. How to Add or Change Contacts
Look at **Lines 75–115** in `lib/main.dart` (`contactList`):
```dart
final List<Contact> contactList = [
  const Contact(
      name: 'Ali',
      lastMessage: 'Hello brother! How are you?',
      time: '10:30 AM',
      avatarColor: Colors.indigo,
      unreadCount: 2,
      isOnline: true),
  const Contact(
      name: 'Usman',
      lastMessage: 'See you at the university 👋',
      time: '9:15 AM',
      avatarColor: Colors.teal,
      unreadCount: 1,
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
];
```
* **Change name:** Edit `name: 'YourName'`.
* **Change unread count:** `unreadCount: 0` removes the green badge and displays double blue ticks `✓✓`.
* **Toggle online status:** Set `isOnline: true` (shows green dot) or `false` (hides green dot).
* **Change avatar color:** Use any `Colors.<color>` (e.g., `Colors.purple`, `Colors.orange`, `Colors.teal`).

---

### 📞 3. How to Add or Change Call Logs
Look at **Lines 117–136** in `lib/main.dart` (`callList`):
```dart
final List<CallInfo> callList = [
  const CallInfo(
      name: 'Ali',
      time: 'Today, 10:30 AM',
      avatarColor: Colors.indigo,
      isMissed: false), // isMissed: true makes text and icon RED
];
```
* **Make call missed:** Set `isMissed: true` (turns name and arrow red).
* **Make call received:** Set `isMissed: false` (turns arrow green).

---

### 📸 4. How to Add or Change Status Updates
Look at **Lines 138–145** in `lib/main.dart` (`statusList`):
```dart
final List<StatusInfo> statusList = [
  const StatusInfo(
      name: 'Ali',
      time: 'Today, 10:30 AM',
      avatarColor: Colors.indigo),
];
```

---

### 💬 5. How to Control Messages in Chat & Remove/Add Them
Look at **Line 167** in `lib/main.dart` (`getStarterMessages`):
```dart
// To start with NO messages (empty clean chat):
List<Message> getStarterMessages(String contactName) => [];

// To show pre-filled messages:
List<Message> getStarterMessages(String contactName) => [
  Message(text: 'Salam $contactName!', isMe: true, time: '10:00 AM'),
  Message(text: 'Walaikum Assalam!', isMe: false, time: '10:01 AM'),
];
```
* **Empty Chat:** Returning `[]` starts the chat clean and displays the authentic WhatsApp end-to-end encryption message.
* **Remove the "2" unread message badge in Chats list:**
  In `contactList`, change `unreadCount: 2` to `unreadCount: 0`. Now all chats show read blue double ticks `✓✓` with no number badge!

---

### 🪪 6. How to Change Drawer User Info (Your Name & Email)
Look at **Lines 319–331** in `lib/main.dart` inside `DrawerHeader`:
```dart
const Text('Student', // <-- Change to your real name here
    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
const SizedBox(height: 2),
Text('student@example.com', // <-- Change to your university email here
    style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 14)),
```

---

### 🚀 7. How to Add a New Named Route (New Page)
1. **Define the route** in `routes: { ... }` in `WhatsAppDemo` (around **Line 227**):
   ```dart
   routes: {
     '/': (context) => const HomeScreen(),
     '/settings': (context) => const SimplePage(title: 'Settings'),
     '/profile': (context) => const SimplePage(title: 'Profile'),
     '/help': (context) => const SimplePage(title: 'Help'),
     '/about': (context) => const SimplePage(title: 'About App'), // <-- Added!
   },
   ```
2. **Add a button or drawer item** to open it:
   ```dart
   _drawerItem(Icons.info_outline, 'About App', () {
     Navigator.pop(context); // Close drawer
     Navigator.pushNamed(context, '/about'); // Navigate
   }),
   ```

---

### 🟢 8. How to Resize or Customize the Upgraded WhatsApp Icon
Look at **Lines 177–215** in `lib/main.dart` (`WhatsAppIcon`):
```dart
class WhatsAppIcon extends StatelessWidget {
  final double size;
  const WhatsAppIcon({super.key, this.size = 32});

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: whatsAppLightGreen, // #25D366
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
              Icon(Icons.chat_bubble, size: size * 0.72, color: Colors.white),
              Transform.rotate(
                angle: -0.28,
                child: Padding(
                  padding: EdgeInsets.only(bottom: size * 0.04),
                  child: Icon(Icons.call, size: size * 0.40, color: whatsAppLightGreen),
                ),
              ),
            ],
          ),
        ),
      );
}
```
* **Why this is upgraded:** It features a vibrant green circular badge with subtle drop shadow, a pure white speech bubble, and an angled phone handset matching the real WhatsApp brand icon.
* In `HomeScreen` (Line 300), change `WhatsAppIcon(size: 32)` to increase or decrease the logo size.

