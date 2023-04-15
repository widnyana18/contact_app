final callLog = [
  CallLog(
    date: '12 Apr 13:29',
    phone: '+628329076521',
    status: 'Disconnected',
  ),
  CallLog(
    date: '4 Apr 16:55',
    phone: '+628329076521',
    status: 'Connected',
  ),
  CallLog(
    date: '31 Mar 11:25',
    phone: '+628329076521',
    status: 'Disconnected',
  ),
  CallLog(
    date: '18 Sep 09:23',
    phone: '+628329076521',
    status: 'Connected',
  ),
  CallLog(
    date: '02 Jun 14:29',
    phone: '+628329076521',
    status: 'Connected',
  ),
  CallLog(
    date: '26 Aug 22:12',
    phone: '+628329076521',
    status: 'Disconnected',
  ),
  CallLog(
    date: '30 Jul 18:11',
    phone: '+628329076521',
    status: 'Connected',
  ),
  CallLog(
    date: '15 Jan 15:12',
    phone: '+628329076521',
    status: 'Connected',
  ),
];

class CallLog {
  final String date, phone, status;
  const CallLog({
    required this.date,
    required this.phone,
    required this.status,
  });
}
