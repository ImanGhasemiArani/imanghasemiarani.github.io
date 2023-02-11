import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../layouts/adaptive.dart';
import '../widgets/title_widget.dart';
import 'animated_cursor_position.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    late final Widget contactInfoWidget;
    late final Widget contactFormWidget;
    if (isDisplayDesktop(context)) {
      contactInfoWidget = const _DesktopContactsInfo();
      contactFormWidget = const _ContactsForm();
    } else {
      contactInfoWidget = const _MobileContactsInfo();
      contactFormWidget = const _ContactsForm();
    }
    return DancingArrowConfig(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TitleWidget('Contacts'),
            contactInfoWidget,
            contactFormWidget,
          ],
        ),
      ),
    );
  }
}

class _ContactsForm extends StatelessWidget {
  const _ContactsForm();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: isDisplayDesktop(context) ? 900 : double.infinity),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                isDisplayDesktop(context)
                    ? Row(
                        children: const [
                          Expanded(
                            flex: 2,
                            child: VerticalDivider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: VerticalDivider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    : const Align(
                        alignment: Alignment.center,
                        child: VerticalDivider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      'Contacts Form',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize! +
                                5,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const _MessageForm(),
          const SizedBox(
            height: 100,
            child: VerticalDivider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageForm extends StatelessWidget {
  const _MessageForm();

  @override
  Widget build(BuildContext context) {
    return AnimatedCursorMouseRegion(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Message',
                border: UnderlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.primary)),
                child: const Text('Send Message'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DesktopContactsInfo extends StatelessWidget {
  const _DesktopContactsInfo();

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    final temp = <Widget>[];
    for (var i = 0; i < itemDelegates.length; i++) {
      temp.add(Expanded(
          flex: 2,
          child: _ContactItem(
              itemDelegates[i]['icon'] as IconData,
              itemDelegates[i]['title'] as String,
              itemDelegates[i]['desc'] as String)));
    }
    const divider =
        Expanded(flex: 1, child: Divider(thickness: 1, color: Colors.grey));
    const vDivider = Expanded(
        flex: 2, child: VerticalDivider(thickness: 1, color: Colors.grey));

    children.addAll([
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Contacts info',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize:
                      Theme.of(context).textTheme.titleLarge!.fontSize! + 5))),
      const SizedBox(height: 40),
      Row(children: [temp[0], divider, temp[1]]),
      SizedBox(
          height: 100,
          child: Row(children: const [
            vDivider,
            Expanded(flex: 1, child: SizedBox()),
            vDivider
          ])),
      Row(children: [temp[2], divider, temp[3]]),
    ]);

    return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Column(children: children));
  }
}

class _MobileContactsInfo extends StatelessWidget {
  const _MobileContactsInfo();

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    children.addAll([
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Contacts info',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: Theme.of(context).textTheme.titleLarge!.fontSize! + 5,
              ),
        ),
      ),
      const SizedBox(height: 40),
    ]);
    for (var itemDelegate in itemDelegates) {
      children.addAll([
        _ContactItem(
          itemDelegate['icon'] as IconData,
          itemDelegate['title'] as String,
          itemDelegate['desc'] as String,
        ),
        const SizedBox(
          height: 40,
          child: VerticalDivider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ]);
    }
    children.removeLast();
    return Column(children: children);
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem(this.icon, this.title, this.desc);

  final IconData icon;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return AnimatedCursorMouseRegion(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              desc,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

const itemDelegates = [
  {
    'icon': Ionicons.call,
    'title': 'Phone',
    'desc': '+98 920 741 0787',
  },
  {
    'icon': Ionicons.at,
    'title': 'Email',
    'desc': 'iman.ghasemi.arani@gmail.com',
  },
  {
    'icon': Ionicons.trail_sign,
    'title': 'Address',
    'desc': 'Tehran, Iran',
  },
  {
    'icon': Ionicons.person,
    'title': 'Freelance Available',
    'desc': 'I am available for Freelance hire',
  },
];
