List<ContactSrc> teleponGroup = [
  ContactSrc(src: 'All call'),
  ContactSrc(src: 'Call missed'),
  ContactSrc(src: 'Outgoing call'),
  ContactSrc(src: 'Missed call'),
  ContactSrc(src: 'Call from unknown number'),
  ContactSrc(src: 'Call from SIM 1 card'),
  ContactSrc(src: 'Call from SIM 2 card'),
];

List<ContactSrc> contactGroup = [
  ContactSrc(
    src: 'all contact',
    address: '',
    amount: '49 people',
  ),
  ContactSrc(
    src: 'Telegram',
    address: '2683387',
    amount: '27 people',
  ),
  ContactSrc(
    src: 'WhatsApp',
    address: '0857880022',
    amount: '37 people',
  ),
  ContactSrc(
    src: 'Local',
    address: 'Only device, not sync',
    amount: '23 people',
  ),
  ContactSrc(
    src: 'Google',
    address: 'kuyhaa66@gmail.com',
    amount: '0 people',
  ),
  ContactSrc(
    src: 'Google',
    address: 'D2water@mail.com',
    amount: '26 people',
  ),
  ContactSrc(
    src: 'Google',
    address: 'naught99dog@mail.com',
    amount: '0 people',
  ),
];

class ContactSrc {
  final String? src, address, amount;

  ContactSrc({this.src, this.address, this.amount});
}
