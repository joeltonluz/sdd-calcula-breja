import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    const pixKey =
        "00020101021126580014br.gov.bcb.pix0136d5c8a37d-77c7-49e0-8925-694adcd79cf3";
    const whatsappUrl = "https://chat.whatsapp.com/HzgGW1xdWByHnbGkHHKRDn";
    const linkedinUrl = "https://www.linkedin.com/in/joeltonluz";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Thank you for considering a donation!'),
            const SizedBox(height: 20),
            const Icon(Icons.qr_code, size: 100),
            const SizedBox(height: 20),
            const Text('PIX Key:'),
            const Text(pixKey),
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(const ClipboardData(text: pixKey));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('PIX Key copied to clipboard')),
                );
              },
              child: const Text('Copy PIX Key'),
            ),
            ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse(whatsappUrl));
              },
              child: const Text('WhatsApp Community'),
            ),
            ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse(linkedinUrl));
              },
              child: const Text('LinkedIn'),
            ),
          ],
        ),
      ),
    );
  }
}
