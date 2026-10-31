import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const green = Color(0xFF2E6B57);
const gold = Color(0xFF8B6914);
const cream = Color(0xFFF8F4EA);

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

class Lesson {
  final String title;
  final String videoId;

  const Lesson(this.title, this.videoId);
}

// قائمة الدروس: (عنوان الدرس، رقم الفيديو على يوتيوب)
// لتغيير عنوان أي درس عدّل النص الأول فقط.
const List<Lesson> lessons = [
  Lesson('الدرس 1', '_vQZSASHs-4'),
  Lesson('الدرس 2', 'g8Rh2Bo99IA'),
  Lesson('الدرس 3', '3BLZXe9mB0c'),
  Lesson('الدرس 4', 'Z9l1HuUAZWE'),
  Lesson('الدرس 5', '2lB-GWnC4_A'),
  Lesson('الدرس 6', 'gx4qFC-b9tA'),
  Lesson('الدرس 7', 'KDlKJmZLAjQ'),
  Lesson('الدرس 8', 'ar1gnMjCVLs'),
  Lesson('الدرس 9', '56kr_jme3lQ'),
  Lesson('الدرس 10', 'tdRbIzHTLbc'),
  Lesson('الدرس 11', '9REIf2p-MfA'),
  Lesson('الدرس 12', 'IeGwC5EsG00'),
  Lesson('الدرس 13', 'tivA7CK9rXU'),
  Lesson('الدرس 14', '9iZqMZHLm3o'),
  Lesson('الدرس 15', 'gkKBh-xJXNY'),
  Lesson('الدرس 16', 'pb0w0aWOMPU'),
  Lesson('الدرس 17', '0R-qU2O950Y'),
  Lesson('الدرس 18', 'x1QCRzLsi9A'),
];

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
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            final lesson = lessons[index];

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
                  lesson.title,
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
                      builder: (_) => VideoPage(lesson: lesson),
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
  final Lesson lesson;

  const VideoPage({super.key, required this.lesson});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late final YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController.fromVideoId(
      videoId: widget.lesson.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        strictRelatedVideos: true,
        playsInline: true,
      ),
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
              widget.lesson.title,
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
