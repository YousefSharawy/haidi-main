part of 'ContactImports.dart';

class ContactUsWithForm extends StatefulWidget {
  const ContactUsWithForm({Key? key}) : super(key: key);

  @override
  State<ContactUsWithForm> createState() => _ContactUsWithFormState();
}

class _ContactUsWithFormState extends State<ContactUsWithForm> {
  @override
  void initState() {

    super.initState();
  }
  final contactData = ContactData();
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: tr(context, "contactUsWithForm"),
      back: true,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children: [
          BuildContactFormInputs(contactData: contactData),
          BuildContactButton(contactData: contactData),
        ],
      ),
    );
  }
}
