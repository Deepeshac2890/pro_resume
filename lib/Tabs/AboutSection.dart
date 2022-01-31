import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../Resources/StringConstants.dart';
import '../Resources/assetsConstant.dart';
import '../Resources/profilesConstant.dart';

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
                backgroundImage: Image.asset(Assets.avatar).image,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                myName,
                textScaleFactor: 4,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Android. Flutter. Gaming. Music.\nLikes Traveling.',
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
                    onPressed: () => html.window
                        .open(Constants.PROFILE_GITHUB, userName),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.twitter)),
                    label: const Text('Twitter'),
                    onPressed: () => html.window
                        .open(Constants.PROFILE_TWITTER, userName),
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
                    onPressed: () => html.window
                        .open(Constants.PROFILE_INSTAGRAM, userName),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.facebook)),
                    label: const Text('Facebook'),
                    onPressed: () => html.window
                        .open(Constants.PROFILE_FACEBOOK, userName),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.linkedin)),
                    label: const Text('Linkedin'),
                    onPressed: () => html.window
                        .open(Constants.PROFILE_LINKEDIN, userName),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}