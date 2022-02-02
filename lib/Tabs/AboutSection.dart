import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:pro_resume/main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constants/StringConstants.dart';
import '../Constants/assetsConstant.dart';
import '../Constants/profilesConstant.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: (MyApp.of(context)?.isDarkMode ?? false)
                    ? Image.asset(Assets.avatar).image
                    : Image.asset(Assets.avatarLight).image,
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  myName,
                  textScaleFactor: 4,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                aboutSectionHobbies,
                style: Theme.of(context).textTheme.caption,
                textScaleFactor: 2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.github)),
                    label: const Text('Github'),
                    onPressed: () =>
                        html.window.open(Constants.PROFILE_GITHUB, userName),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.twitter)),
                    label: const Text('Twitter'),
                    onPressed: () =>
                        html.window.open(Constants.PROFILE_TWITTER, userName),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.linkedin)),
                    label: const Text('Linkedin'),
                    onPressed: () =>
                        html.window.open(Constants.PROFILE_LINKEDIN, userName),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.instagram)),
                    label: const Text('Instagram'),
                    onPressed: () =>
                        html.window.open(Constants.PROFILE_INSTAGRAM, userName),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.facebook)),
                    label: const Text('Facebook'),
                    onPressed: () =>
                        html.window.open(Constants.PROFILE_FACEBOOK, userName),
                  ),
                  FlatButton.icon(
                      icon: SizedBox(
                          width: 20,
                          height: 20,
                          child: Image.asset(Assets.mail)),
                      label: const Text('Contact Me'),
                      onPressed: () async {
                        final mailtoLink = Mailto(
                          to: ['deepeshac280@gmail.com'],
                          // subject: '',
                        );
                        // Convert the Mailto instance into a string.
                        // Use either Dart's string interpolation
                        // or the toString() method.
                        await launch('$mailtoLink');
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
