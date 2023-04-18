import 'package:flutter/material.dart';

class ContactSearchDelegate extends SearchDelegate<String> {
  final List<String> items;

  ContactSearchDelegate(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    // Add search bar clear button
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Add back button
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show search results based on query
    final results = items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(results[index]),
        onTap: () {
          // Return the selected item to previous screen
          close(context, results[index]);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show suggestions while user is typing
    final suggestions = items
        .where((item) => item.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestions[index]),
        onTap: () {
          // Show search results based on selected suggestion
          query = suggestions[index];
          showResults(context);
        },
      ),
    );
  }
}
