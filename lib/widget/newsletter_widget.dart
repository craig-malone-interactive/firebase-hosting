import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const double outerSpace = 40;
final borderRadiusOuter = BorderRadius.circular(12);
final borderRadiusInner = BorderRadius.circular(10);

class NewsletterSignupWidget extends StatefulWidget {
  @override
  _NewsletterSignupWidgetState createState() => _NewsletterSignupWidgetState();
}

class _NewsletterSignupWidgetState extends State<NewsletterSignupWidget> {
  final form = GlobalKey<FormState>();
  bool isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    const double sizeAvatar = 50;
    const double yAvatar = 10;
    const double topSpace = sizeAvatar - yAvatar;
    const top = -sizeAvatar - yAvatar;

    return Container(
      margin: const EdgeInsets.only(top: 10 + sizeAvatar),
      constraints: const BoxConstraints(maxWidth: 580),
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
//        overflow: Overflow.visible,
        children: [
          ClipRRect(
            borderRadius: borderRadiusOuter,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(31, 40, 51, 1).withOpacity(0.5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildTop(topSpace: topSpace),
                  buildBottom(),
                ],
              ),
            ),
          ),
          Positioned(
            top: top,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: sizeAvatar,
              child: ClipOval(
                child: Image.asset(
                  'assets/user.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTop({
    required double topSpace,
  }) =>
      Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor.withOpacity(0.7),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
          children: [
            SizedBox(height: topSpace),
            const Text(
              'Sign Up for Flutter Newsletter',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'By Johannes Milke',
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(text: 'You will receive information about '),
                  TextSpan(
                    text: 'Flutter & Firebase ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: 'and '),
                  TextSpan(
                    text: 'Personal News.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildBottom() => LayoutBuilder(
        builder: (context, constraints) {
          final double horizontal = constraints.maxWidth < 480 ? 16 : 36;

          return Container(
            padding: EdgeInsets.fromLTRB(horizontal, outerSpace, horizontal, 0),
            child: isSubscribed ? buildCompleted() : buildForm(context),
          );
        },
      );

  Widget buildCompleted() {
    const textColor = Color(0xFF0da865);
    const backgroundColor = Color(0xFF9fefcf);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadiusInner,
        border: Border.all(color: textColor, width: 3),
      ),
      child: const Row(
        children: [
          Icon(Icons.done, color: textColor, size: 32),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'Success! Now check your email to confirm your subscription.',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildForm(BuildContext context) => Form(
        key: form,
        child: Column(
          children: [
            const TextFieldWidget(title: 'Your First Name'),
            const SizedBox(height: 20),
            const TextFieldWidget(title: 'Your Email Address'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(200, 80)),
                onPressed: () => Fluttertoast.showToast(
                  msg: 'Pressed Elevated Button',
                  fontSize: 18,
                ),
                child: const Text('Subscribe toast'),
              ),
            ),

            /*          SizedBox(
              width: double.infinity,
              child: RaisedButton.icon(
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                icon: const Icon(Icons.mail_outline, color: Colors.white),
                label: const Text(
                  'SUBSCRIBE',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  setState(() => isSubscribed = true);
                },
              ),
            ),
            */
            const SizedBox(
              height: outerSpace,
              child: Center(
                child: Text(
                  'I respect your privacy. Unsubscribe at any time.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      );
}

class TextFieldWidget extends StatelessWidget {
  final String title;

  const TextFieldWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;

    return TextFormField(
      style: const TextStyle(color: color),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: const TextStyle(color: color),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: color, width: 2),
          borderRadius: borderRadiusInner,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2),
          borderRadius: borderRadiusInner,
        ),
      ),
    );
  }
}
