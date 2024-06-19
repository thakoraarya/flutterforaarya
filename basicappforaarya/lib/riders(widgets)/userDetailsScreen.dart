import 'package:basicappforaarya/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchUserData(2);
    });
    super.initState();
  }

  fetchUserData(id) {
    Provider.of<UserProvider>(context, listen: false).fetchUserDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (BuildContext context, UserProvider value, Widget? child) {
          if (value.isLoading) {
            print(
                '{{{{{{{{{{{{{{{{{{{{{{{{_________________________}}}}}}}}}}}}}}}}}}}}}}}}');
            print('loading');
            return Center(child: CircularProgressIndicator());
          } else if (value.userDetails == null) {
            print('_________________________');
            print(value.userDetails);
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(
                    ' ¯\\_(ツ)_/¯',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Theme.of(context).colorScheme.error),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'No data available!',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                ]));
          } else {
            return SingleChildScrollView(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primaryContainer,
                            Theme.of(context).colorScheme.tertiaryContainer,
                            Theme.of(context).colorScheme.secondaryContainer,
                            Theme.of(context).colorScheme.errorContainer
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -50,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              'https://creatorspace.imgix.net/users/cllwgy7s001a1mx01och5v45b/7S7CmnNv3a8w8Uk8-PXL_20230915_045338512.PORTRAIT.jpg?w=300&h=300',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
                  child: Column(
                    children: [
                      Text(
                        ' ${value.userDetails!.name.firstname.toString()} ${value.userDetails!.name.lastname.toString()}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '@${value.userDetails!.username.toString()}',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          // Badge(
                          //   backgroundColor:
                          //       Theme.of(context).colorScheme.primary,
                          // ),
                          // SizedBox(
                          //   width: 8,
                          // ),
                          Icon(
                            Icons.explore,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                              '${value.userDetails!.address.geolocation.lat}, ${value.userDetails!.address.geolocation.long}'),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                border: Border.all(strokeAlign: 1)),
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.location_on,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                )),
                          ),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: Text(
                                  '${value.userDetails!.address.number}, '
                                  '${value.userDetails!.address.street}, '
                                  '${value.userDetails!.address.city}, '
                                  '${value.userDetails!.address.zipcode}',
                                  overflow: TextOverflow.fade,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                border: Border.all(strokeAlign: 1)),
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.phone,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                )),
                          ),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: Text(
                                  value.userDetails!.phone.toString(),
                                  overflow: TextOverflow.fade,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {},
                          child: Text('Follow'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
          }
        },
      ),
    );
  }
}
