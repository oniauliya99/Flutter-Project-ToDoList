import 'package:flutter/material.dart';
import 'package:uas_final/pages/input_page.dart';
import 'package:uas_final/themes.dart';

class TodoCard extends StatelessWidget {
  const TodoCard(this.title, this.desc, this.id, {this.onDelete});

  final String title, desc, id;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        onTap: () {},
        title: Text((title == '') ? 'No title' : title,
            style: poppinsBold.copyWith(fontSize: 18, color: black)),
        subtitle: Text(
          (desc == '') ? 'No text' : desc,
          style: poppinsLight.copyWith(fontSize: 14, color: grey),
        ),

        // Delete
        leading: TextButton(
          onPressed: onDelete,
          child: Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
        ),

        // Edit
        trailing: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return InputPage(id: id, title: title, desc: desc);
            }));
          },
          child: Image.asset(
            'assets/images/edit.png',
            width: 20,
            height: 20,
          ),
          style: TextButton.styleFrom(
            primary: green,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
