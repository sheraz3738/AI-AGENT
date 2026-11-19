import 'package:flutter/material.dart';

void main() => runApp(const AiAgentApp());

class AiAgentApp extends StatelessWidget {
  const AiAgentApp({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF16834A);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Agent',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: green),
        scaffoldBackgroundColor: const Color(0xFFF4F8F5),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF173B2A),
          centerTitle: false,
        ),
      ),
      home: const AgentHomePage(),
    );
  }
}

class AgentHomePage extends StatelessWidget {
  const AgentHomePage({super.key});

  static const green = Color(0xFF16834A);
  static const dark = Color(0xFF173B2A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Agent',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: Icon(Icons.support_agent, color: green, size: 28),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF16834A), Color(0xFF0D6337)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.headset_mic, color: Colors.white, size: 29),
                ),
                SizedBox(height: 16),
                Text('Aap ki AI Receptionist',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 7),
                Text(
                  'Dono businesses ke customers ki rehnumai ke liye ek assistant.',
                  style: TextStyle(color: Colors.white, fontSize: 14, height: 1.45),
                ),
                SizedBox(height: 14),
                _StatusPill(
                  text: 'Setup in progress',
                  icon: Icons.hourglass_top,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Aap ke businesses'),
          const SizedBox(height: 10),
          const _BusinessCard(
            icon: Icons.storefront,
            title: "FNS TRADER'S",
            subtitle: 'Customer calls aur maloomat',
          ),
          const SizedBox(height: 10),
          const _BusinessCard(
            icon: Icons.local_pharmacy,
            title: 'Sheraz Medical & General Store',
            subtitle: 'Customer calls aur maloomat',
          ),
          const SizedBox(height: 24),
          const _SectionTitle('AI ki settings'),
          const SizedBox(height: 10),
          const _SettingCard(
            icon: Icons.record_voice_over,
            title: 'Female voice',
            subtitle: 'Warm aur professional awaaz',
          ),
          const SizedBox(height: 9),
          const _SettingCard(
            icon: Icons.translate,
            title: 'Urdu • Roman Urdu • English',
            subtitle: 'Customer ki zubaan ke mutabiq guftagu',
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Connection status'),
          const SizedBox(height: 10),
          const _ConnectionCard(
            icon: Icons.phone_in_talk,
            title: 'Phone call service',
            detail: 'Abhi connect nahi hai',
          ),
          const SizedBox(height: 9),
          const _ConnectionCard(
            icon: Icons.chat,
            title: 'WhatsApp service',
            detail: 'Abhi connect nahi hai — Normal WhatsApp ko nahi chhera gaya',
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF3ED),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Owner contact',
                    style: TextStyle(
                        color: dark, fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.phone, color: green, size: 19),
                    SizedBox(width: 9),
                    Text('0334-3738405',
                        style: TextStyle(
                            color: dark,
                            fontWeight: FontWeight.w700,
                            fontSize: 17)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Note: Yeh app abhi setup stage mein hai. Live calls tab receive hongi jab Pakistan ke liye phone provider, AI voice service aur secure backend connect karke test kar liye jayen. WhatsApp integration aapki marzi ke baad hi hogi.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54, height: 1.45, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
            color: AgentHomePage.dark,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      );
}

class _BusinessCard extends StatelessWidget {
  const _BusinessCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          leading: CircleAvatar(
            backgroundColor: const Color(0xFFE7F4EC),
            child: Icon(icon, color: AgentHomePage.green),
          ),
          title: Text(title,
              style: const TextStyle(
                  color: AgentHomePage.dark, fontWeight: FontWeight.w700)),
          subtitle: Text(subtitle),
        ),
      );
}

class _SettingCard extends StatelessWidget {
  const _SettingCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: ListTile(
          leading: Icon(icon, color: AgentHomePage.green, size: 27),
          title: Text(title,
              style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(subtitle),
        ),
      );
}

class _ConnectionCard extends StatelessWidget {
  const _ConnectionCard({
    required this.icon,
    required this.title,
    required this.detail,
  });
  final IconData icon;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFFFFF2DD),
            child: Icon(icon, color: const Color(0xFF9A6500)),
          ),
          title: Text(title,
              style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(detail),
          trailing: const Icon(Icons.pending_outlined,
              color: Color(0xFF9A6500)),
        ),
      );
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 15),
            const SizedBox(width: 7),
            Text(text,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600)),
          ],
        ),
      );
}
