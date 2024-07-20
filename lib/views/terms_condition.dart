import 'package:flutter/material.dart';
import 'package:quiz_app/themes/color.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({super.key});

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeColor.lighterPrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: height,
        width: width,
        color: ThemeColor.lighterPrimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.15,
              decoration: const BoxDecoration(
                color: ThemeColor.lighterPrimary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      color: ThemeColor.white,
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: width * 0.2,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/logo.png",
                      width: width * 0.1,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to Our App!',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'These Terms and Conditions outline the rules and regulations for the use of our app.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '1. Acceptance of Terms',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'By accessing this app, you are agreeing to be bound by these Terms and Conditions, '
                        'all applicable laws, and regulations, and agree that you are responsible for compliance '
                        'with any applicable local laws.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '2. Use License',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Permission is granted to temporarily download one copy of the materials (information or software) '
                        'on our app for personal, non-commercial transitory viewing only. This is the grant of a license, '
                        'not a transfer of title, and under this license, you may not:',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      Text(
                        '- modify or copy the materials;',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      Text(
                        '- use the materials for any commercial purpose, or for any public display (commercial or non-commercial);',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      // Add more points as needed
                      const SizedBox(height: 20),
                      Text(
                        '3. Disclaimer',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'The materials on our app are provided on an \'as is\' basis. We make no warranties, '
                        'express or implied, and hereby disclaim and negate all other warranties including, '
                        'without limitation, implied warranties or conditions of merchantability, fitness '
                        'for a particular purpose, or non-infringement of intellectual property or other '
                        'violation of rights.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '4. Limitations',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'In no event shall we or our suppliers be liable for any damages (including, '
                        'without limitation, damages for loss of data or profit, or due to business '
                        'interruption) arising out of the use or inability to use the materials on our app, '
                        'even if we or our authorized representative has been notified orally or in writing '
                        'of the possibility of such damage.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '5. Revisions and Errata',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'The materials appearing on our app could include technical, typographical, or '
                        'photographic errors. We do not warrant that any of the materials on our app are '
                        'accurate, complete, or current.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '6. Governing Law',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Any claim relating to our app shall be governed by the laws of the State '
                        'of Your State without regard to its conflict of law provisions.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '7. Contact Us',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'If you have any questions about these Terms and Conditions, please contact us.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
