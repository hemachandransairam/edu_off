// Topic-based structure for lessons with multiple levels
final Map<String, List<Map<String, dynamic>>> std1Topics = {
  // TAMIL TOPICS
  'Uyir Ezhuthukal': [
    {
      'level': 1,
      'title': 'Basic Vowels (அ-உ)',
      'subject': 'Tamil',
      'description': 'Listen to the sound and tap the correct vowel.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'அ', 'right': 'அம்மா', 'emoji': '👩'},
          {'left': 'ஆ', 'right': 'ஆடு', 'emoji': '🐐'},
          {'left': 'இ', 'right': 'இலை', 'emoji': '🍃'},
          {'left': 'ஈ', 'right': 'ஈட்டி', 'emoji': '🔱'},
          {'left': 'உ', 'right': 'உரல்', 'emoji': '🥣'},
        ],
      },
    },
    {
      'level': 2,
      'title': 'Advanced Vowels (ஊ-ஒ)',
      'subject': 'Tamil',
      'description': 'Match more vowels with words.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'ஊ', 'right': 'ஊதல்', 'emoji': '📢'},
          {'left': 'எ', 'right': 'எலி', 'emoji': '🐭'},
          {'left': 'ஏ', 'right': 'ஏணி', 'emoji': '🪜'},
          {'left': 'ஐ', 'right': 'ஐந்து', 'emoji': '5️⃣'},
          {'left': 'ஒ', 'right': 'ஒட்டகம்', 'emoji': '🐪'},
        ],
      },
    },
    {
      'level': 3,
      'title': 'Complete Vowels (ஓ-ஔ)',
      'subject': 'Tamil',
      'description': 'Master all Tamil vowels.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'ஓ', 'right': 'ஓடம்', 'emoji': '⛵'},
          {'left': 'ஔ', 'right': 'ஔவையார்', 'emoji': '👵'},
          {'left': 'அ', 'right': 'அம்மா', 'emoji': '👩'},
          {'left': 'இ', 'right': 'இலை', 'emoji': '🍃'},
          {'left': 'உ', 'right': 'உரல்', 'emoji': '🥣'},
        ],
      },
    },
    {
      'level': 4,
      'title': 'Vowel Quiz',
      'subject': 'Tamil',
      'description': 'Fill in the correct vowel.',
      'type': 'fill_blanks',
      'data': {
        'questions': [
          {
            'text': '__ம்மா (Mother)',
            'options': ['அ', 'ஆ', 'இ'],
            'ans': 'அ',
          },
          {
            'text': '__டு (Goat)',
            'options': ['அ', 'ஆ', 'இ'],
            'ans': 'ஆ',
          },
          {
            'text': '__லை (Leaf)',
            'options': ['அ', 'இ', 'உ'],
            'ans': 'இ',
          },
        ],
      },
    },
  ],

  'Mei Ezhuthukal': [
    {
      'level': 1,
      'title': 'Basic Consonants (க-ச)',
      'subject': 'Tamil',
      'description': 'Match consonants to words.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'க்', 'right': 'கொக்கு', 'emoji': '🦢'},
          {'left': 'ங்', 'right': 'சிங்கம்', 'emoji': '🦁'},
          {'left': 'ச்', 'right': 'சக்கரம்', 'emoji': '🎡'},
          {'left': 'ஞ்', 'right': 'மஞ்சள்', 'emoji': '🟡'},
        ],
      },
    },
    {
      'level': 2,
      'title': 'More Consonants (ட-ந)',
      'subject': 'Tamil',
      'description': 'Learn more consonants.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'ட்', 'right': 'பட்டம்', 'emoji': '🪁'},
          {'left': 'ண்', 'right': 'கண்', 'emoji': '👁️'},
          {'left': 'த்', 'right': 'தண்ணீர்', 'emoji': '💧'},
          {'left': 'ந்', 'right': 'நாய்', 'emoji': '🐕'},
        ],
      },
    },
    {
      'level': 3,
      'title': 'All Consonants',
      'subject': 'Tamil',
      'description': 'Master all consonants.',
      'type': 'drag_drop',
      'data': {
        'categories': ['க வரிசை', 'ச வரிசை', 'ட வரிசை'],
        'items': [
          {'name': 'க்', 'cat': 'க வரிசை'},
          {'name': 'ங்', 'cat': 'க வரிசை'},
          {'name': 'ச்', 'cat': 'ச வரிசை'},
          {'name': 'ஞ்', 'cat': 'ச வரிசை'},
          {'name': 'ட்', 'cat': 'ட வரிசை'},
          {'name': 'ண்', 'cat': 'ட வரிசை'},
        ],
      },
    },
  ],

  // ENGLISH TOPICS
  'Alphabets': [
    {
      'level': 1,
      'title': 'Letters A-E',
      'subject': 'English',
      'description': 'Match uppercase to lowercase.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'A', 'right': 'a', 'emoji': '🍎'},
          {'left': 'B', 'right': 'b', 'emoji': '⚽'},
          {'left': 'C', 'right': 'c', 'emoji': '🐱'},
          {'left': 'D', 'right': 'd', 'emoji': '🐕'},
          {'left': 'E', 'right': 'e', 'emoji': '🐘'},
        ],
      },
    },
    {
      'level': 2,
      'title': 'Letters F-J',
      'subject': 'English',
      'description': 'Continue learning alphabets.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'F', 'right': 'f', 'emoji': '🐸'},
          {'left': 'G', 'right': 'g', 'emoji': '🎮'},
          {'left': 'H', 'right': 'h', 'emoji': '🏠'},
          {'left': 'I', 'right': 'i', 'emoji': '🍦'},
          {'left': 'J', 'right': 'j', 'emoji': '🤹'},
        ],
      },
    },
    {
      'level': 3,
      'title': 'Letters K-O',
      'subject': 'English',
      'description': 'More alphabet practice.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'K', 'right': 'k', 'emoji': '🔑'},
          {'left': 'L', 'right': 'l', 'emoji': '🦁'},
          {'left': 'M', 'right': 'm', 'emoji': '🌙'},
          {'left': 'N', 'right': 'n', 'emoji': '🥜'},
          {'left': 'O', 'right': 'o', 'emoji': '🐙'},
        ],
      },
    },
    {
      'level': 4,
      'title': 'Letters P-T',
      'subject': 'English',
      'description': 'Almost there!',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'P', 'right': 'p', 'emoji': '🍕'},
          {'left': 'Q', 'right': 'q', 'emoji': '👸'},
          {'left': 'R', 'right': 'r', 'emoji': '🚀'},
          {'left': 'S', 'right': 's', 'emoji': '⭐'},
          {'left': 'T', 'right': 't', 'emoji': '🌳'},
        ],
      },
    },
    {
      'level': 5,
      'title': 'Letters U-Z',
      'subject': 'English',
      'description': 'Complete the alphabet!',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'U', 'right': 'u', 'emoji': '☂️'},
          {'left': 'V', 'right': 'v', 'emoji': '🎻'},
          {'left': 'W', 'right': 'w', 'emoji': '🌊'},
          {'left': 'X', 'right': 'x', 'emoji': '❌'},
          {'left': 'Y', 'right': 'y', 'emoji': '🧶'},
          {'left': 'Z', 'right': 'z', 'emoji': '🦓'},
        ],
      },
    },
  ],

  'CVC Words': [
    {
      'level': 1,
      'title': 'Short A Words',
      'subject': 'English',
      'description': 'Build words with A.',
      'type': 'fill_blanks',
      'data': {
        'questions': [
          {
            'text': 'C __ T',
            'options': ['A', 'E', 'I'],
            'ans': 'A',
          },
          {
            'text': 'B __ T',
            'options': ['A', 'E', 'I'],
            'ans': 'A',
          },
          {
            'text': 'H __ T',
            'options': ['A', 'O', 'I'],
            'ans': 'A',
          },
        ],
      },
    },
    {
      'level': 2,
      'title': 'Short O Words',
      'subject': 'English',
      'description': 'Build words with O.',
      'type': 'fill_blanks',
      'data': {
        'questions': [
          {
            'text': 'D __ G',
            'options': ['O', 'U', 'A'],
            'ans': 'O',
          },
          {
            'text': 'H __ T',
            'options': ['A', 'O', 'I'],
            'ans': 'O',
          },
          {
            'text': 'P __ T',
            'options': ['O', 'A', 'E'],
            'ans': 'O',
          },
        ],
      },
    },
    {
      'level': 3,
      'title': 'Mixed CVC Words',
      'subject': 'English',
      'description': 'Practice all CVC words.',
      'type': 'fill_blanks',
      'data': {
        'questions': [
          {
            'text': 'C __ T',
            'options': ['A', 'E', 'I'],
            'ans': 'A',
          },
          {
            'text': 'D __ G',
            'options': ['O', 'U', 'A'],
            'ans': 'O',
          },
          {
            'text': 'P __ N',
            'options': ['I', 'E', 'A'],
            'ans': 'I',
          },
          {
            'text': 'B __ G',
            'options': ['U', 'O', 'A'],
            'ans': 'U',
          },
        ],
      },
    },
  ],

  // MATHS TOPICS
  'Counting': [
    {
      'level': 1,
      'title': 'Numbers 1-5',
      'subject': 'Maths',
      'description': 'Learn to count 1 to 5.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': '1', 'right': 'One', 'emoji': '1️⃣'},
          {'left': '2', 'right': 'Two', 'emoji': '2️⃣'},
          {'left': '3', 'right': 'Three', 'emoji': '3️⃣'},
          {'left': '4', 'right': 'Four', 'emoji': '4️⃣'},
          {'left': '5', 'right': 'Five', 'emoji': '5️⃣'},
        ],
      },
    },
    {
      'level': 2,
      'title': 'Numbers 6-10',
      'subject': 'Maths',
      'description': 'Count up to 10.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': '6', 'right': 'Six', 'emoji': '6️⃣'},
          {'left': '7', 'right': 'Seven', 'emoji': '7️⃣'},
          {'left': '8', 'right': 'Eight', 'emoji': '8️⃣'},
          {'left': '9', 'right': 'Nine', 'emoji': '9️⃣'},
          {'left': '10', 'right': 'Ten', 'emoji': '🔟'},
        ],
      },
    },
    {
      'level': 3,
      'title': 'Numbers 11-20',
      'subject': 'Maths',
      'description': 'Count to 20!',
      'type': 'fill_blanks',
      'data': {
        'questions': [
          {
            'text': '10, 11, 12, ____',
            'options': ['13', '14', '15'],
            'ans': '13',
          },
          {
            'text': '15, 16, 17, ____',
            'options': ['18', '19', '20'],
            'ans': '18',
          },
          {
            'text': '18, 19, ____',
            'options': ['20', '21', '22'],
            'ans': '20',
          },
        ],
      },
    },
  ],

  'Shapes': [
    {
      'level': 1,
      'title': 'Basic Shapes',
      'subject': 'Maths',
      'description': 'Learn circle, square, triangle.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'Circle', 'right': 'Round', 'emoji': '⭕'},
          {'left': 'Square', 'right': '4 sides', 'emoji': '⬛'},
          {'left': 'Triangle', 'right': '3 sides', 'emoji': '🔺'},
        ],
      },
    },
    {
      'level': 2,
      'title': 'More Shapes',
      'subject': 'Maths',
      'description': 'Rectangle, oval, and more.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'Rectangle', 'right': 'Long box', 'emoji': '▭'},
          {'left': 'Oval', 'right': 'Egg shape', 'emoji': '🥚'},
          {'left': 'Star', 'right': 'Points', 'emoji': '⭐'},
        ],
      },
    },
    {
      'level': 3,
      'title': 'Shape Sorting',
      'subject': 'Maths',
      'description': 'Sort shapes by sides.',
      'type': 'drag_drop',
      'data': {
        'categories': ['3 sides', '4 sides', 'Round'],
        'items': [
          {'name': 'Triangle', 'cat': '3 sides'},
          {'name': 'Square', 'cat': '4 sides'},
          {'name': 'Circle', 'cat': 'Round'},
          {'name': 'Rectangle', 'cat': '4 sides'},
        ],
      },
    },
  ],
};

// Keep the original flat structure for backward compatibility
final List<Map<String, dynamic>> std1Content = [
  // TAMIL
  {
    'title': 'Uyir Ezhuthukal (Vowels) - Level 1',
    'subject': 'Tamil',
    'description': 'Listen to the sound and tap the correct vowel.',
    'type': 'match',
    'category': 'learning',
    'data': {
      'pairs': [
        {'left': 'அ', 'right': 'அம்மா', 'emoji': '👩'},
        {'left': 'ஆ', 'right': 'ஆடு', 'emoji': '🐐'},
        {'left': 'இ', 'right': 'இலை', 'emoji': '🍃'},
        {'left': 'ஈ', 'right': 'ஈட்டி', 'emoji': '🔱'},
        {'left': 'உ', 'right': 'உரல்', 'emoji': '🥣'},
      ],
    },
  },
  {
    'title': 'Uyir Ezhuthukal (Vowels) - Level 2',
    'subject': 'Tamil',
    'description': 'Advanced vowel matching.',
    'type': 'match',
    'category': 'learning',
    'data': {
      'pairs': [
        {'left': 'ஊ', 'right': 'ஊதல்', 'emoji': '📢'},
        {'left': 'எ', 'right': 'எலி', 'emoji': '🐭'},
        {'left': 'ஏ', 'right': 'ஏணி', 'emoji': '🪜'},
        {'left': 'ஐ', 'right': 'ஐந்து', 'emoji': '5️⃣'},
        {'left': 'ஒ', 'right': 'ஒட்டகம்', 'emoji': '🐪'},
      ],
    },
  },
  {
    'title': 'Mei Ezhuthukal (Consonants)',
    'subject': 'Tamil',
    'description': 'Match the consonant to the starting letter of the word.',
    'type': 'match',
    'category': 'gaming',
    'data': {
      'pairs': [
        {'left': 'க்', 'right': 'கொக்கு', 'emoji': '🦢'},
        {'left': 'ங்', 'right': 'சிங்கம்', 'emoji': '🦁'},
        {'left': 'ச்', 'right': 'சக்கரம்', 'emoji': '🎡'},
        {'left': 'ஞ்', 'right': 'மஞ்சள்', 'emoji': '🟡'},
        {'left': 'ட்', 'right': 'பட்டம்', 'emoji': '🪁'},
      ],
    },
  },
  {
    'title': 'Uyir-Mei Ezhuthu',
    'subject': 'Tamil',
    'description': 'Combine Uyir and Mei letters to form Uyir-Mei.',
    'type': 'drag_drop',
    'category': 'gaming',
    'data': {
      'categories': ['க', 'ங', 'ச'],
      'items': [
        {'name': 'க் + அ', 'cat': 'க'},
        {'name': 'ங் + அ', 'cat': 'ங'},
        {'name': 'ச் + அ', 'cat': 'ச'},
      ],
    },
  },
  {
    'title': 'Simple Tamil Words',
    'subject': 'Tamil',
    'description': 'Read the word and match it with the correct picture.',
    'type': 'match',
    'category': 'gaming',
    'data': {
      'pairs': [
        {'left': 'கண்', 'right': 'Eye', 'emoji': '👁️'},
        {'left': 'காது', 'right': 'Ear', 'emoji': '👂'},
        {'left': 'மூக்கு', 'right': 'Nose', 'emoji': '👃'},
        {'left': 'வாய்', 'right': 'Mouth', 'emoji': '👄'},
        {'left': 'கை', 'right': 'Hand', 'emoji': '✋'},
      ],
    },
  },
  {
    'title': 'Tamil Rhymes (Paadal)',
    'subject': 'Tamil',
    'description': 'Sing along with famous Tamil rhymes.',
    'type': 'fill_blanks',
    'category': 'learning',
    'data': {
      'questions': [
        {
          'text': 'கைவீசம்மா ____ வீசு',
          'options': ['கை', 'கால்', 'தலை'],
          'ans': 'கை',
        },
        {
          'text': 'கடைக்குப் போகலாம் ____ வீசு',
          'options': ['கை', 'கால்', 'பை'],
          'ans': 'கை',
        },
      ],
    },
  },
  {
    'title': 'Thirukkural (1-5)',
    'subject': 'Tamil',
    'description': 'Match the Kural start with its ending.',
    'type': 'match',
    'category': 'gaming',
    'data': {
      'pairs': [
        {'left': 'அகர முதல', 'right': 'எழுத்தெல்லாம்', 'emoji': '📜'},
        {'left': 'கற்றதனால்', 'right': 'ஆய பயனென்கொல்', 'emoji': '🧠'},
        {'left': 'மலர்மிசை', 'right': 'ஏகினான்', 'emoji': '🌸'},
        {'left': 'வேண்டுதல்', 'right': 'வேண்டாமை', 'emoji': '⚖️'},
        {'left': 'பொறிவாயில்', 'right': 'ஐந்தவித்தான்', 'emoji': '🚪'},
      ],
    },
  },

  // ENGLISH
  {
    'title': 'Alphabets (A-Z) - Level 1',
    'subject': 'English',
    'description': 'Uppercase to Lowercase Match.',
    'type': 'match',
    'category': 'gaming',
    'data': {
      'pairs': [
        {'left': 'A', 'right': 'a', 'emoji': '🍎'},
        {'left': 'B', 'right': 'b', 'emoji': '⚽'},
        {'left': 'C', 'right': 'c', 'emoji': '🐱'},
        {'left': 'D', 'right': 'd', 'emoji': '🐕'},
        {'left': 'E', 'right': 'e', 'emoji': '🐘'},
      ],
    },
  },
  {
    'title': 'Phonics Sounds',
    'subject': 'English',
    'description': 'Identify the starting sound.',
    'type': 'fill_blanks',
    'category': 'learning',
    'data': {
      'questions': [
        {
          'text': 'Letter A sounds like ____.',
          'options': ['/a/', '/b/', '/k/'],
          'ans': '/a/',
        },
        {
          'text': 'Letter B sounds like ____.',
          'options': ['/p/', '/b/', '/t/'],
          'ans': '/b/',
        },
      ],
    },
  },
  {
    'title': 'CVC Words - Level 1',
    'subject': 'English',
    'description': 'Build short words (CVC).',
    'type': 'fill_blanks',
    'category': 'gaming',
    'data': {
      'questions': [
        {
          'text': 'C __ T',
          'options': ['A', 'E', 'I'],
          'ans': 'A',
        },
        {
          'text': 'D __ G',
          'options': ['O', 'U', 'A'],
          'ans': 'O',
        },
        {
          'text': 'H __ T',
          'options': ['A', 'O', 'I'],
          'ans': 'A',
        },
      ],
    },
  },
  {
    'title': 'Sight Words - Level 1',
    'subject': 'English',
    'description': 'Identify frequently used words.',
    'type': 'fill_blanks',
    'category': 'learning',
    'data': {
      'questions': [
        {
          'text': '____ is a cat.',
          'options': ['The', 'This', 'That'],
          'ans': 'This',
        },
        {
          'text': 'I ____ to play.',
          'options': ['like', 'love', 'see'],
          'ans': 'like',
        },
      ],
    },
  },

  // MATHEMATICS
  {
    'title': 'Counting (1-20) - Level 1',
    'subject': 'Maths',
    'description': 'Identify the next number.',
    'type': 'fill_blanks',
    'category': 'gaming',
    'data': {
      'questions': [
        {
          'text': '1, 2, 3, ____',
          'options': ['4', '5', '6'],
          'ans': '4',
        },
        {
          'text': '10, 11, 12, ____',
          'options': ['13', '14', '15'],
          'ans': '13',
        },
      ],
    },
  },
  {
    'title': 'Number Names - Level 1',
    'subject': 'Maths',
    'description': 'Match numbers to words.',
    'type': 'match',
    'category': 'gaming',
    'data': {
      'pairs': [
        {'left': '1', 'right': 'One', 'emoji': '1️⃣'},
        {'left': '2', 'right': 'Two', 'emoji': '2️⃣'},
        {'left': '3', 'right': 'Three', 'emoji': '3️⃣'},
        {'left': '4', 'right': 'Four', 'emoji': '4️⃣'},
        {'left': '5', 'right': 'Five', 'emoji': '5️⃣'},
      ],
    },
  },
  {
    'title': 'Before/After/Between',
    'subject': 'Maths',
    'description': 'Sequence operations.',
    'type': 'fill_blanks',
    'category': 'gaming',
    'data': {
      'questions': [
        {
          'text': 'Before 10 is ____',
          'options': ['9', '11', '12'],
          'ans': '9',
        },
        {
          'text': 'After 19 is ____',
          'options': ['18', '20', '21'],
          'ans': '20',
        },
        {
          'text': 'Between 5 and 7 is ____',
          'options': ['6', '8', '4'],
          'ans': '6',
        },
      ],
    },
  },
  {
    'title': 'Comparison (>, <)',
    'subject': 'Maths',
    'description': 'Which is bigger?',
    'type': 'compare',
    'category': 'gaming',
    'data': {
      'questions': [
        {'q': 'Tap the bigger number', 'val1': 12, 'val2': 15, 'ans': 15},
        {'q': 'Tap the smaller number', 'val1': 8, 'val2': 2, 'ans': 2},
      ],
    },
  },
  {
    'title': 'Shapes - Level 1',
    'subject': 'Maths',
    'description': 'Identify basic shapes.',
    'type': 'match',
    'category': 'gaming',
    'data': {
      'pairs': [
        {'left': 'Circle', 'right': 'Round', 'emoji': '⭕'},
        {'left': 'Square', 'right': '4 sides', 'emoji': '⬛'},
        {'left': 'Triangle', 'right': '3 sides', 'emoji': '🔺'},
      ],
    },
  },
  {
    'title': 'Addition - Level 1',
    'subject': 'Maths',
    'description': 'Simple addition with objects.',
    'type': 'fill_blanks',
    'category': 'gaming',
    'data': {
      'questions': [
        {
          'text': '2 + 2 = ____',
          'options': ['3', '4', '5'],
          'ans': '4',
        },
        {
          'text': '5 + 1 = ____',
          'options': ['6', '5', '7'],
          'ans': '6',
        },
      ],
    },
  },

  // EVS
  {
    'title': 'My Family',
    'subject': 'EVS',
    'description': 'Identify family relations.',
    'type': 'match',
    'category': 'learning',
    'data': {
      'pairs': [
        {'left': 'Father', 'right': 'Dad', 'emoji': '👨'},
        {'left': 'Mother', 'right': 'Mom', 'emoji': '👩'},
        {'left': 'Grandpa', 'right': 'Grandfather', 'emoji': '👴'},
        {'left': 'Grandma', 'right': 'Grandmother', 'emoji': '👵'},
      ],
    },
  },
  {
    'title': 'My Body & Senses',
    'subject': 'EVS',
    'description': 'Senses and body parts.',
    'type': 'drag_drop',
    'category': 'gaming',
    'data': {
      'categories': ['Sight', 'Hear', 'Smell'],
      'items': [
        {'name': 'Watching TV', 'cat': 'Sight'},
        {'name': 'Listening Bell', 'cat': 'Hear'},
        {'name': 'Rose Scent', 'cat': 'Smell'},
      ],
    },
  },
  {
    'title': 'Healthy Food',
    'subject': 'EVS',
    'description': 'Sort Healthy vs Junk.',
    'type': 'drag_drop',
    'category': 'gaming',
    'data': {
      'categories': ['Healthy', 'Junk'],
      'items': [
        {'name': 'Apple', 'cat': 'Healthy'},
        {'name': 'Burger', 'cat': 'Junk'},
        {'name': 'Milk', 'cat': 'Healthy'},
        {'name': 'Soda', 'cat': 'Junk'},
      ],
    },
  },
  {
    'title': 'Animals & Birds',
    'subject': 'EVS',
    'description': 'Categorize correctly.',
    'type': 'drag_drop',
    'category': 'gaming',
    'data': {
      'categories': ['Animal', 'Bird'],
      'items': [
        {'name': 'Lion', 'cat': 'Animal'},
        {'name': 'Pigeon', 'cat': 'Bird'},
        {'name': 'Elephant', 'cat': 'Animal'},
        {'name': 'Eagle', 'cat': 'Bird'},
      ],
    },
  },
  {
    'title': 'Transport Types',
    'subject': 'EVS',
    'description': 'Where do they move?',
    'type': 'drag_drop',
    'category': 'gaming',
    'data': {
      'categories': ['Land', 'Air', 'Water'],
      'items': [
        {'name': 'Car', 'cat': 'Land'},
        {'name': 'Plane', 'cat': 'Air'},
        {'name': 'Boat', 'cat': 'Water'},
        {'name': 'Truck', 'cat': 'Land'},
      ],
    },
  },

  // ART & CRAFT
  {
    'title': 'Colour Fill - Level 1',
    'subject': 'Art & Craft',
    'description': 'Match colors to objects.',
    'type': 'match',
    'category': 'learning',
    'data': {
      'pairs': [
        {'left': 'Red', 'right': 'Strawberry', 'emoji': '🍓'},
        {'left': 'Blue', 'right': 'Sky', 'emoji': '☁️'},
        {'left': 'Green', 'right': 'Grass', 'emoji': '🌲'},
      ],
    },
  },
  {
    'title': 'Drawing Shapes',
    'subject': 'Art & Craft',
    'description': 'Free drawing and tracing.',
    'type': 'match',
    'category': 'gaming',
    'data': {
      'pairs': [
        {'left': 'Circle', 'right': 'Ball', 'emoji': '🏀'},
        {'left': 'Square', 'right': 'Box', 'emoji': '📦'},
      ],
    },
  },

  // MUSIC
  {
    'title': 'Rhythm Match',
    'subject': 'Music',
    'description': 'Identify instrument sounds.',
    'type': 'match',
    'category': 'gaming',
    'data': {
      'pairs': [
        {'left': 'Drum', 'right': 'Boing', 'emoji': '🥁'},
        {'left': 'Bell', 'right': 'Ting', 'emoji': '🔔'},
        {'left': 'Whistle', 'right': 'Tweet', 'emoji': '😗'},
      ],
    },
  },

  // PE
  {
    'title': 'Yoga Basics',
    'subject': 'PE',
    'description': 'Identify yoga poses.',
    'type': 'fill_blanks',
    'category': 'learning',
    'data': {
      'questions': [
        {
          'text': 'Pose like a TREE: ____',
          'options': ['Vrikshasana', 'Asana', 'Relax'],
          'ans': 'Vrikshasana',
        },
      ],
    },
  },
];
