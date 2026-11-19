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
        scaffoldBackgroundColor: const Color(0xFFF7FAF8),
        useMaterial3: true,
      ),
      home: const AgentHomePage(),
    );
  }
}

class AgentHomePage extends StatelessWidget {
  const AgentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Agent'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF173B2A),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFFE7F4EC),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.support_agent, size: 42, color: Color(0xFF16834A)),
                SizedBox(height: 14),
                Text('Your AI receptionist',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(
                  'A separate assistant for your two businesses. '
                  'Live call and WhatsApp connections are not configured yet.',
                  style: TextStyle(fontSize: 15, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Text('Businesses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const _InfoTile(Icons.storefront, "FNS TRADER'S", 'Customer enquiries'),
          const SizedBox(height: 10),
          const _InfoTile(Icons.local_pharmacy,
              'Sheraz Medical & General Store', 'Customer enquiries'),
          const SizedBox(height: 22),
          const Text('Agent preferences',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const _InfoTile(Icons.record_voice_over, 'Female voice',
              'Planned voice preference'),
          const _InfoTile(Icons.translate, 'Urdu • Roman Urdu • English',
              'Planned conversation languages'),
          const SizedBox(height: 18),
          const _InfoTile(Icons.phone, '0334-3738405', 'Shared contact number'),
          const SizedBox(height: 12),
          const Text(
            'Setup still required: a supported phone-call provider and an approved WhatsApp Business Platform connection. This app does not yet answer calls or send WhatsApp replies.',
            style: TextStyle(color: Colors.black54, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile(this.icon, this.title, this.subtitle);
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 0,
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFFE7F4EC),
            child: Icon(icon, color: const Color(0xFF16834A)),
          ),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(subtitle),
        ),
      );
}
