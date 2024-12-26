import 'package:contacts_service/contacts_service.dart';
import 'package:finsight/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';



class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  // static const phonebook = MethodChannel('payment/phone');
  List contact=[];

  @override
  void initState() {
    getAllContact();
    // TODO: implement initState
    super.initState();
  }

  getAllContact() async{
    // Get all contacts without thumbnail (faster)
    List<Contact> _contacts = await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      contact = _contacts;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.navigate_before,
              color: AppColor.black,
            )),
        title: const Text(
          "Contacts",
          style: TextStyle(color: AppColor.black, fontSize: 21),
        ),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: contact.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              Contact contactx = contact[index];
              return ListTile(
                title: Text(contactx.displayName!),
                subtitle: Text(contactx.phones!.elementAt(0).value!),
                leading: CircleAvatar(child: Text(contactx.initials()),),
              );
            })
        ],
      ),
    );
  }

  // getContact() async {
  //   final contx = await phonebook.invokeMethod('getPhoneBook');

  //   setState(() {
  //    print(contx);
  //   });
  // }
}