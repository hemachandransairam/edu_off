// Topic-based structure for Class 2
final Map<String, List<Map<String, dynamic>>> std2Topics = {
  // TAMIL TOPICS
  'Uyir & Mei Revision': [
    {
      'level': 1,
      'title': 'Letter Sound Match',
      'subject': 'Tamil',
      'description': 'Match letters to their sounds.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'அ', 'right': 'A', 'emoji': '🍎'},
          {'left': 'ஆ', 'right': 'AA', 'emoji': '🐄'},
          {'left': 'இ', 'right': 'I', 'emoji': '🍃'},
          {'left': 'ஈ', 'right': 'EE', 'emoji': '🏹'},
          {'left': 'க்', 'right': 'IK', 'emoji': '🦢'},
        ],
      },
    },
  ],
  'Uyir-Mei Words': [
    {
      'level': 1,
      'title': 'Word Builder',
      'subject': 'Tamil',
      'description': 'Build words using Uyir-Mei letters.',
      'type': 'drag_drop',
      'data': {
        'categories': ['க வரிசை', 'ச வரிசை'],
        'items': [
          {'name': 'கடல்', 'cat': 'க வரிசை'},
          {'name': 'கண்', 'cat': 'க வரிசை'},
          {'name': 'சக்கரம்', 'cat': 'ச வரிசை'},
          {'name': 'சட்டை', 'cat': 'ச வரிசை'},
        ],
      },
    },
  ],
  'Simple Sentences': [
    {
      'level': 1,
      'title': 'Sentence Arrange',
      'subject': 'Tamil',
      'description': 'Arrange words to form a simple sentence.',
      'type': 'fill_blanks',
      'data': {
        'questions': [
          {
            'text': 'பாப்பா ____ விளையாடு (Baby play ball)',
            'options': ['பந்து', 'பையன்', 'பள்ளி'],
            'ans': 'பந்து',
          },
        ],
      },
    },
  ],
  'Tamil Rhymes': [
    {
      'level': 1,
      'title': 'Sing & Tap',
      'subject': 'Tamil',
      'description': 'Tap the rhythm of the rhyme.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'கைவீசு', 'right': 'அம்மா', 'emoji': '👋'},
          {'left': 'நிலா நிலா', 'right': 'ஓடிவா', 'emoji': '🌙'},
        ],
      },
    },
  ],
  'Tamil Stories': [
    {
      'level': 1,
      'title': 'Picture Order',
      'subject': 'Tamil',
      'description': 'Order the pictures to complete the story.',
      'type': 'drag_drop',
      'data': {
        'categories': ['Beginning', 'Middle', 'End'],
        'items': [
          {'name': 'Lion sleeping', 'cat': 'Beginning'},
          {'name': 'Mouse wakes lion', 'cat': 'Middle'},
          {'name': 'Lion lets mouse go', 'cat': 'End'},
        ],
      },
    },
  ],
  'Thirukkural': [
    {
      'level': 1,
      'title': 'Meaning Match',
      'subject': 'Tamil',
      'description': 'Match the Kural to its meaning.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'அகர முதல', 'right': 'ஆதி பகவன்', 'emoji': '📖'},
          {'left': 'கற்க கசடற', 'right': 'கல்வி', 'emoji': '🎓'},
        ],
      },
    },
  ],

  // ENGLISH TOPICS
  'English Phonics': [
    {
      'level': 1,
      'title': 'Sound Identity',
      'subject': 'English',
      'description': 'Identify the sound of the letter.',
      'type': 'compare',
      'data': {
        'questions': [
          {
            'q': 'Which letter makes the /b/ sound?',
            'val1': 'B',
            'val2': 'D',
            'ans': 'B',
          },
          {
            'q': 'Which letter makes the /s/ sound?',
            'val1': 'C',
            'val2': 'S',
            'ans': 'S',
          },
        ],
      },
    },
  ],
  'English Vocabulary': [
    {
      'level': 1,
      'title': 'New Words & Spelling',
      'subject': 'English',
      'description': 'Drag and drop letters to complete words.',
      'type': 'drag_drop',
      'data': {
        'categories': ['Animals', 'Fruits'],
        'items': [
          {'name': 'Lion', 'cat': 'Animals'},
          {'name': 'Tiger', 'cat': 'Animals'},
          {'name': 'Apple', 'cat': 'Fruits'},
          {'name': 'Mango', 'cat': 'Fruits'},
        ],
      },
    },
  ],
  'English Sentences': [
    {
      'level': 1,
      'title': 'Fill the Blank',
      'subject': 'English',
      'description': 'Complete short sentences.',
      'type': 'fill_blanks',
      'data': {
        'questions': [
          {
            'text': 'The cat is ____ the mat.',
            'options': ['on', 'under', 'at'],
            'ans': 'on',
          },
        ],
      },
    },
  ],
  'English Rhymes': [
    {
      'level': 1,
      'title': 'Action Rhyme',
      'subject': 'English',
      'description': 'Match actions to rhyme words.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'Twinkle', 'right': 'Star', 'emoji': '⭐'},
          {'left': 'Clap', 'right': 'Hands', 'emoji': '👏'},
        ],
      },
    },
  ],
  'English Stories': [
    {
      'level': 1,
      'title': 'Character Match',
      'subject': 'English',
      'description': 'Match characters to their stories.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'Thirsty Crow', 'right': 'Pebbles', 'emoji': '🐦'},
          {'left': 'Red Riding Hood', 'right': 'Wolf', 'emoji': '🐺'},
        ],
      },
    },
  ],

  // MATHEMATICS TOPICS
  'Numbers (1-1000)': [
    {
      'level': 1,
      'title': 'Counting Game',
      'subject': 'Maths',
      'description': 'Count the objects and select the correct number.',
      'type': 'compare',
      'data': {
        'questions': [
          {
            'q': 'Identify the larger number',
            'val1': 450,
            'val2': 540,
            'ans': 540,
          },
          {
            'q': 'Identify the smaller number',
            'val1': 1000,
            'val2': 999,
            'ans': 999,
          },
        ],
      },
    },
    {
      'level': 2,
      'title': 'Number Names',
      'subject': 'Maths',
      'description': 'Match numbers to their names.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': '100', 'right': 'One Hundred', 'emoji': '💯'},
          {'left': '500', 'right': 'Five Hundred', 'emoji': '🖐️'},
        ],
      },
    },
  ],
  'Addition & Subtraction': [
    {
      'level': 1,
      'title': 'Object Math (2-digit)',
      'subject': 'Maths',
      'description': 'Add two-digit numbers using objects.',
      'type': 'fill_blanks',
      'data': {
        'questions': [
          {
            'text': '25 + 15 = ____',
            'options': ['30', '40', '50'],
            'ans': '40',
          },
        ],
      },
    },
  ],
  'Multiplication Intro': [
    {
      'level': 1,
      'title': 'Grouping Game',
      'subject': 'Maths',
      'description': 'Group objects to learn multiplication.',
      'type': 'compare',
      'data': {
        'questions': [
          {'q': '2 groups of 3 is?', 'val1': 5, 'val2': 6, 'ans': 6},
        ],
      },
    },
  ],
  'Math Shapes': [
    {
      'level': 1,
      'title': 'Identify & Match',
      'subject': 'Maths',
      'description': 'Identify 2D and 3D shapes.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'Sphere', 'right': 'Ball', 'emoji': '🏀'},
          {'left': 'Cube', 'right': 'Dice', 'emoji': '🎲'},
        ],
      },
    },
  ],
  'Math Patterns': [
    {
      'level': 1,
      'title': 'Continue Pattern',
      'subject': 'Maths',
      'description': 'Identify the next object in the pattern.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': '🔴 🔵 🔴', 'right': '🔵', 'emoji': '🎨'},
          {'left': '⬆️ ⬇️ ⬆️', 'right': '⬇️', 'emoji': '↕️'},
        ],
      },
    },
  ],
  'Measurement': [
    {
      'level': 1,
      'title': 'Compare Objects',
      'subject': 'Maths',
      'description': 'Compare length and weight.',
      'type': 'compare',
      'data': {
        'questions': [
          {'q': 'Which is heavier?', 'val1': 10, 'val2': 50, 'ans': 50},
        ],
      },
    },
  ],
  'Time Basics': [
    {
      'level': 1,
      'title': 'Set the Clock',
      'subject': 'Maths',
      'description': 'Learn basics of clock time.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'Morning', 'right': 'Sunrise', 'emoji': '🌅'},
          {'left': 'Night', 'right': 'Moon', 'emoji': '🌙'},
        ],
      },
    },
  ],
  'Money (₹)': [
    {
      'level': 1,
      'title': 'Shop & Buy',
      'subject': 'Maths',
      'description': 'Learn about Indian Rupees.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': '₹10', 'right': 'Chocolate', 'emoji': '🍫'},
          {'left': '₹50', 'right': 'Toy Car', 'emoji': '🚗'},
        ],
      },
    },
  ],

  // EVS TOPICS
  'Myself & Family': [
    {
      'level': 1,
      'title': 'Avatar Game',
      'subject': 'EVS',
      'description': 'Learn about family members.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'Father', 'right': 'Parent', 'emoji': '👨'},
          {'left': 'Brother', 'right': 'Sibling', 'emoji': '👦'},
        ],
      },
    },
  ],
  'Food & Health': [
    {
      'level': 1,
      'title': 'Healthy vs Unhealthy Sort',
      'subject': 'EVS',
      'description': 'Classify food items.',
      'type': 'drag_drop',
      'data': {
        'categories': ['Healthy', 'Unhealthy'],
        'items': [
          {'name': 'Apple', 'cat': 'Healthy'},
          {'name': 'Spinach', 'cat': 'Healthy'},
          {'name': 'Pizza', 'cat': 'Unhealthy'},
          {'name': 'Burger', 'cat': 'Unhealthy'},
        ],
      },
    },
  ],
  'Nature Skills': [
    {
      'level': 1,
      'title': 'Classify Plants & Animals',
      'subject': 'EVS',
      'description': 'Identify plants and animals.',
      'type': 'drag_drop',
      'data': {
        'categories': ['Plants', 'Animals'],
        'items': [
          {'name': 'Rose', 'cat': 'Plants'},
          {'name': 'Elephant', 'cat': 'Animals'},
        ],
      },
    },
  ],
  'Housing & School': [
    {
      'level': 1,
      'title': 'Identify Place',
      'subject': 'EVS',
      'description': 'Identify rooms in house and school.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'Bedroom', 'right': 'Sleep', 'emoji': '🛏️'},
          {'left': 'Library', 'right': 'Books', 'emoji': '📚'},
        ],
      },
    },
  ],
  'Transport Mode': [
    {
      'level': 1,
      'title': 'Land/Air/Water Sort',
      'subject': 'EVS',
      'description': 'Classify modes of transport.',
      'type': 'drag_drop',
      'data': {
        'categories': ['Land', 'Air', 'Water'],
        'items': [
          {'name': 'Car', 'cat': 'Land'},
          {'name': 'Aeroplane', 'cat': 'Air'},
          {'name': 'Ship', 'cat': 'Water'},
        ],
      },
    },
  ],
  'Good Habits': [
    {
      'level': 1,
      'title': 'Right vs Wrong',
      'subject': 'EVS',
      'description': 'Identify good habits.',
      'type': 'drag_drop',
      'data': {
        'categories': ['Right', 'Wrong'],
        'items': [
          {'name': 'Brushing teeth', 'cat': 'Right'},
          {'name': 'Littering', 'cat': 'Wrong'},
        ],
      },
    },
  ],
  'Seasons & Dress': [
    {
      'level': 1,
      'title': 'Dress for Season',
      'subject': 'EVS',
      'description': 'Match clothes to seasons.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'Rainy', 'right': 'Raincoat', 'emoji': '🧥'},
          {'left': 'Winter', 'right': 'Sweater', 'emoji': '🧶'},
        ],
      },
    },
  ],

  // ART & CRAFT
  'Art Skills': [
    {
      'level': 1,
      'title': 'Drawing & Colouring',
      'subject': 'Art & Craft',
      'description': 'Free draw mode.',
      'type': 'drawing',
      'data': {},
    },
  ],
  'Craft Skills': [
    {
      'level': 1,
      'title': 'Paper Craft',
      'subject': 'Art & Craft',
      'description': 'Follow steps to make paper craft.',
      'type': 'match',
      'data': {
        'pairs': [
          {'left': 'Boat', 'right': 'Paper', 'emoji': '⛵'},
          {'left': 'Plane', 'right': 'Paper', 'emoji': '✈️'},
        ],
      },
    },
  ],
};

final List<Map<String, dynamic>> std2Content = [
  {
    'title': 'மெய் எழுத்துகள்',
    'subject': 'Tamil',
    'description': 'Identify consonants.',
    'category': 'learning',
    'type': 'fill_blanks',
    'data': {
      'questions': [
        {
          'text': 'சக்____ரம்',
          'options': ['க்', 'ச்', 'ட்'],
          'ans': 'க்',
        },
      ],
    },
  },
  {
    'title': 'Sentence Builder',
    'subject': 'English',
    'description': 'Fill in the correct nouns/pronouns.',
    'category': 'learning',
    'type': 'fill_blanks',
    'data': {
      'questions': [
        {
          'text': '____ am a student.',
          'options': ['I', 'He', 'She'],
          'ans': 'I',
        },
      ],
    },
  },
  {
    'title': 'Bigger or Smaller',
    'subject': 'Maths',
    'description': 'Compare numbers.',
    'category': 'gaming',
    'type': 'compare',
    'data': {
      'questions': [
        {'q': 'Identify the larger number', 'val1': 25, 'val2': 52, 'ans': 52},
      ],
    },
  },
];
