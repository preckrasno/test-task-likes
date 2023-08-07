import 'package:dreambit/data/models/person.dart';
import 'package:flutter/material.dart';

class PeopleViewWidget extends StatelessWidget {
  const PeopleViewWidget({
    required this.onNavigateToLikedPeople,
    required this.onLikePerson,
    required this.onDislikePerson,
    required this.isLoading,
    required this.person,
    super.key,
  });

  final void Function() onNavigateToLikedPeople;
  final void Function(Person person) onLikePerson;
  final void Function() onDislikePerson;
  final bool isLoading;
  final Person? person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            person!.photo,
                            fit: BoxFit.cover,
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            height: MediaQuery.sizeOf(context).width * 0.6,
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${person!.name}, ${person!.age}',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'City: ${person!.city}',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 48.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => onLikePerson(person!),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(75.0),
                                  ),
                                  backgroundColor: Colors.white,
                                  fixedSize: Size(75, 75),
                                ),
                                child: const Icon(
                                  Icons.favorite,
                                  size: 50,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(width: 56.0),
                              ElevatedButton(
                                onPressed: onDislikePerson,
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(75.0),
                                  ),
                                  backgroundColor: Colors.white,
                                  fixedSize: Size(75, 75),
                                ),
                                child: const Icon(
                                  Icons.close,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
            IconButton(
              onPressed: onNavigateToLikedPeople,
              icon: const Icon(
                Icons.menu,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
