class Project {
  final String name;
  final String description;
  final String image;
  final String androidUrl;
  final String iosUrl;
  final List<String> skills;

  Project({this.name, this.description, this.image, this.androidUrl, this.iosUrl, this.skills});
}

// ignore: non_constant_identifier_names
List<Project> PROJECTS = [
  // CHOSEN AYA
  Project(
    name: 'آية مختارة',
    description:
        'An app that shows a random verse of the Holy Quran as a notification, including tafsir, the user has control over showing the notifications and how often they show up, the user also can navigate through the whole Quran verse by verse, and export each verse as a sharable image.',
    image: 'images/projects/chosen-aya.png',
    androidUrl: 'https://play.google.com/store/apps/details?id=com.devyahia.randomayah',
    iosUrl: 'https://apps.apple.com/us/app/id1547251866',
    skills: [
      'Dart',
      'SQL',
      'Flutter',
    ],
  ),
  // MENTAL MATH
  Project(
    name: 'Mental Math',
    description:
        'An educational game built for Android & iOS, localized to multiple languages including (Arabic, English, German, Russian). The game has recently been featured by Apple in New Games We Love section in 25+ countries.',
    image: 'images/projects/mental-math.png',
    androidUrl: 'https://play.google.com/store/apps/details?id=com.devyahia.android.mentalmaths',
    iosUrl: 'https://apps.apple.com/us/app/id1547325124',
    skills: [
      'Dart',
      'Flutter',
      'SQL',
      'Firebase',
    ],
  ),
  // GPA CALC
  Project(
    name: 'GPA Calculator - JU',
    description:
        'An app that keeps track of the students’ GPA, providing GPA for each semester and the cumulative GPA. For JU students only.',
    image: 'images/projects/gpa-calc.png',
    androidUrl: 'https://play.google.com/store/apps/details?id=com.devyahia.gpacalc',
    iosUrl: 'https://apps.apple.com/us/app/id1551541456',
    skills: [
      'Dart',
      'Flutter',
      'SQL',
      'Firebase',
    ],
  ),
  // UNI SCHEDULE
  Project(
    name: 'Uni Schedule',
    description:
        'Students in the faculty of medicine always complained of their lecture’s changing time suddenly without prior notice, and sometimes the students missed some of their classes due to that problem, Uni schedule comes to solve this problem by providing real time access to a database that is constantly updated with the latest changes to their schedule.',
    image: 'images/projects/uni-sched.jpg',
    androidUrl: 'https://play.google.com/store/apps/details?id=com.devyahia.android.myschedule',
    skills: [
      'Java',
      'Firebase',
      'Google Sheets',
    ],
  ),
  // FANNEH
  Project(
    name: 'Coin Toss',
    description:
        'The idea of the application is very simple, and it is clear from its name, it is yes, coin tossing, but in the currencies of the Hashemite Kingdom of Jordan.',
    image: 'images/projects/fanneh.png',
    androidUrl: 'https://play.google.com/store/apps/details?id=com.devyahia.fanneh',
    skills: [
      'Java',
      'Firebase',
      'Google Sheets',
    ],
  ),
];
