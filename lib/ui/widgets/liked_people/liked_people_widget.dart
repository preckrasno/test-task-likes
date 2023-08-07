import 'package:dreambit/data/models/person.dart';
import 'package:flutter/material.dart';

class LikedPeopleWidget extends StatelessWidget {
  const LikedPeopleWidget({
    required this.people,
    required this.onPersonDelete,
    required this.isLoading,
    super.key,
  });

  final List<Person> people;
  final bool isLoading;
  final void Function(Person) onPersonDelete;

  ListTile _buildPersonTile(Person person) {
    return ListTile(
      title: Text(person.name),
      subtitle: Row(
        children: [
          Text('Age: ${person.age}'),
          const SizedBox(width: 10),
          Text('City: ${person.city}'),
        ],
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(person.photo),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          onPersonDelete(person);
        },
      ),
    );
  }

  Widget _buildEmptyList() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (people.isEmpty) {
      return const Center(
        child: Text(
          'No liked people yet',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          return _buildPersonTile(people[index]);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked people'),
      ),
      body: SafeArea(
        child: _buildEmptyList(),
      ),
    );
  }
}
