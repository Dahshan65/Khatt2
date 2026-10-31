import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const green = Color(0xFF2E6B57);
const gold = Color(0xFF8B6914);
const cream = Color(0xFFF8F4EA);

// ===== إعدادات الدورة =====
// رقم قائمة التشغيل على يوتيوب
const String playlistId = 'PLKhU4fSVw_-I';

// عدد الفيديوهات في القائمة
const int lessonCount = 18;

// عناوين الدروس بالترتيب (اختياري).
// إذا تركتها فارغة يظهر "الدرس 1، الدرس 2 ...".
const List<String> lessonTitles = [];

String lessonTitle(int index) {
  if (index < lessonTitles.length) return lessonTitles[index];
  return 'الدرس ${index + 1}';
}
// ==========================

void main() {
  runApp(const RewaqApp());
}

class RewaqApp extends StatelessWidget {
  const RewaqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'رِواق الخط العربي',
      theme: ThemeData(
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(seedColor: green),
        appBarTheme: const AppBarTheme(
          backgroundColor: green,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const HomePage(),
    );
  }
}

Future<void> openExternal(String address) async {
  final uri = Uri.parse(address);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget mainButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 25),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 17),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'رِواق الخط العربي',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: gold, width: 3),
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 55,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  'رِواق الخط العربي',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'بإشراف وائل دهشان',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: gold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'ارتقِ بخطك وتعلّم جمال خط النسخ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 35),
                mainButton(
                  label: 'الدخول إلى الدورة',
                  icon: Icons.menu_book,
                  color: green,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CoursePage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                mainButton(
                  label: 'حسن خطك',
                  icon: Icons.auto_fix_high,
                  color: const Color(0xFFB98D1B),
                  onPressed: () => openExternal(
                    'https://wa.me/962779221235?text=${Uri.encodeComponent('أريد تحسين خطي')}',
                  ),
                ),
                const SizedBox(height: 16),
                mainButton(
                  label: 'تواصل عبر WhatsApp',
                  icon: Icons.chat,
                  color: const Color(0xFF278B52),
                  onPressed: () => openExternal(
                    'https://wa.me/962779221235',
                  ),
                ),
                const SizedBox(height: 16),
                mainButton(
                  label: 'تابعنا على Instagram',
                  icon: Icons.camera_alt,
                  color: gold,
                  onPressed: () => openExternal(
                    'https://www.instagram.com/wael_dahshan/',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('دورة حروف خط النسخ بالقلم العادي'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: lessonCount,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: const BorderSide(color: Color(0x338B6914)),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 7,
                ),
                leading: CircleAvatar(
                  backgroundColor: green,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  lessonTitle(index),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(
                  Icons.play_circle_fill,
                  color: gold,
                  size: 32,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => VideoPage(index: index),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class VideoPage extends StatefulWidget {
  final int index;

  const VideoPage({super.key, required this.index});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late final YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        strictRelatedVideos: true,
        playsInline: true,
      ),
    );

    controller.cuePlaylist(
      list: const [playlistId],
      listType: ListType.playlist,
      index: widget.index,
    );
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('مشاهدة الدرس'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              lessonTitle(widget.index),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: green,
              ),
            ),
            const SizedBox(height: 18),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: YoutubePlayer(
                controller: controller,
                aspectRatio: 16 / 9,
              ),
            ),
            const SizedBox(height: 10),
            // سطر تشخيص مؤقت: يعرض حالة المشغّل ونوع الخطأ
            YoutubeValueBuilder(
              controller: controller,
              builder: (context, value) {
                return Text(
                  'حالة المشغّل: ${value.playerState.name} | الخطأ: ${value.error.name}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                );
              },
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => openExternal(
                  'https://www.youtube.com/watch?list=$playlistId&index=${widget.index + 1}',
                ),
                icon: const Icon(Icons.open_in_new),
                label: const Text(
                  'فتح الدرس في يوتيوب',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: gold,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'رِواق الخط العربي',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: gold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
