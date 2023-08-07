enum Country {
  australia(name: 'Australia', code: 'AU'),
  brazil(name: 'Brazil', code: 'BR'),
  canada(name: 'Canada', code: 'CA'),
  china(name: 'China', code: 'CH'),
  germany(name: 'Germany', code: 'DE'),
  denmark(name: 'Denmark', code: 'DK'),
  spain(name: 'Spain', code: 'ES'),
  finland(name: 'Finland', code: 'FI'),
  france(name: 'France', code: 'FR'),
  greatBritain(name: 'Great Britain', code: 'GB'),
  ireland(name: 'Ireland', code: 'IE'),
  india(name: 'India', code: 'IN'),
  iran(name: 'Iran', code: 'IR'),
  mexico(name: 'Mexico', code: 'MX'),
  netherlands(name: 'Netherlands', code: 'NL'),
  norway(name: 'Norway', code: 'NO'),
  newZealand(name: 'New Zealand', code: 'NZ'),
  serbia(name: 'Serbia', code: 'RS'),
  turkey(name: 'Turkey', code: 'TR'),
  ukraine(name: 'Ukraine', code: 'UA'),
  unitedStates(name: 'United States', code: 'US');

  final String name;
  final String code;

  const Country({required this.name, required this.code});
}
