import 'package:flutter/material.dart';

class Custom3DListTile extends StatelessWidget {
  final bool edit;
  final String name;
  final String phone;
  final VoidCallback onTap;
  final VoidCallback ondeletepress;
  final VoidCallback onlongpress;
  const Custom3DListTile({
    Key? key,
    required this.name,
    required this.phone,
    required this.onTap,
    required this.edit,
    required this.ondeletepress,
    required this.onlongpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (edit)
        ? Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade100, // Light green background
              borderRadius: BorderRadius.circular(16), // Rounded edges
              boxShadow: [
                BoxShadow(
                  color: Colors.green.shade600, // Dark green for depth effect
                  offset: const Offset(2, 2), // Subtle shadow position
                  blurRadius: 4, // Reduced blur for shadow
                ),
                const BoxShadow(
                  color: Colors.white, // Highlight effect
                  offset: Offset(-2, -2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(
                name,
                style: TextStyle(
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                phone,
                style: TextStyle(
                  color: Colors.green.shade700,
                ),
              ),
              trailing: Icon(
                Icons.delete,
                color: Colors.green.shade900,
              ),
              onTap: ondeletepress,
            ),
          )
        : Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade100, // Light green background
              borderRadius: BorderRadius.circular(16), // Rounded edges
              boxShadow: [
                BoxShadow(
                  color: Colors.green.shade600, // Dark green for depth effect
                  offset: const Offset(2, 2), // Subtle shadow position
                  blurRadius: 4, // Reduced blur for shadow
                ),
                const BoxShadow(
                  color: Colors.white, // Highlight effect
                  offset: Offset(-2, -2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: ListTile(
              onLongPress: onlongpress,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(
                name,
                style: TextStyle(
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                phone,
                style: TextStyle(
                  color: Colors.green.shade700,
                ),
              ),
              onTap: onTap,
            ),
          );
  }
}
