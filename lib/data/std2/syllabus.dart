final List<Map<String, dynamic>> std2Content = [
  {
    'title': 'மெய் எழுத்துகள்',
    'subject': 'Tamil',
    'description': 'Identify consonants.',
    'type': 'fill_blanks',
    'data': {
      'questions': [
        {
          'text': 'சக்____ரம்',
          'options': ['க்', 'ச்', 'ட்'],
          'ans': 'க்',
        },
        {
          'text': 'ப____சம்',
          'options': ['க்', 'ச்', 'ஞ்'],
          'ans': 'ஞ்',
        },
        {
          'text': 'ப____டம்',
          'options': ['ட்', 'த்', 'ப்'],
          'ans': 'ட்',
        },
        {
          'text': 'க____தி',
          'options': ['த்', 'ந்', 'ம்'],
          'ans': 'த்',
        },
        {
          'text': 'ப____து',
          'options': ['ந்', 'ய்', 'ர்'],
          'ans': 'ந்',
        },
        {
          'text': 'க____ப்பம்',
          'options': ['ப்', 'ல்', 'வ்'],
          'ans': 'ப்',
        },
        {
          'text': 'அ____மா',
          'options': ['ம்', 'ழ்', 'ள்'],
          'ans': 'ம்',
        },
        {
          'text': 'நா____',
          'options': ['ய்', 'ற்', 'ன்'],
          'ans': 'ய்',
        },
        {
          'text': 'தே____',
          'options': ['ர்', 'ல்', 'வ்'],
          'ans': 'ர்',
        },
        {
          'text': 'கா____',
          'options': ['ல்', 'ழ்', 'ள்'],
          'ans': 'ல்',
        },
      ],
    },
  },
  {
    'title': 'Sentence Builder',
    'subject': 'English',
    'description': 'Fill in the correct nouns/pronouns.',
    'type': 'fill_blanks',
    'data': {
      'questions': [
        {
          'text': '____ am a student.',
          'options': ['I', 'He', 'She'],
          'ans': 'I',
        },
        {
          'text': '____ is my sister.',
          'options': ['He', 'She', 'It'],
          'ans': 'She',
        },
        {
          'text': '____ are playing.',
          'options': ['We', 'I', 'Is'],
          'ans': 'We',
        },
        {
          'text': 'The sun is ____.',
          'options': ['Hot', 'Cold', 'Wet'],
          'ans': 'Hot',
        },
        {
          'text': 'A ____ barks.',
          'options': ['Cat', 'Dog', 'Cow'],
          'ans': 'Dog',
        },
        {
          'text': 'An ____ lives in water.',
          'options': ['Ant', 'Fish', 'Elephant'],
          'ans': 'Fish',
        },
        {
          'text': 'Rose is a ____.',
          'options': ['Fruit', 'Flower', 'Vegetable'],
          'ans': 'Flower',
        },
        {
          'text': 'Sky is ____.',
          'options': ['Green', 'Blue', 'Red'],
          'ans': 'Blue',
        },
        {
          'text': 'Apple is ____.',
          'options': ['Sweet', 'Salty', 'Spicy'],
          'ans': 'Sweet',
        },
        {
          'text': 'We see with our ____.',
          'options': ['Ears', 'Eyes', 'Nose'],
          'ans': 'Eyes',
        },
      ],
    },
  },
  {
    'title': 'Bigger or Smaller',
    'subject': 'Maths',
    'description': 'Compare numbers.',
    'type': 'compare',
    'data': {
      'questions': [
        {'q': 'Identify the larger number', 'val1': 25, 'val2': 52, 'ans': 52},
        {'q': 'Identify the smaller number', 'val1': 14, 'val2': 41, 'ans': 14},
        {'q': 'Which is more?', 'val1': 88, 'val2': 89, 'ans': 89},
        {'q': 'Which is less?', 'val1': 100, 'val2': 99, 'ans': 99},
        {'q': 'Bigger one?', 'val1': 45, 'val2': 54, 'ans': 54},
        {'q': 'Smaller one?', 'val1': 7, 'val2': 17, 'ans': 7},
        {'q': 'Greater value?', 'val1': 63, 'val2': 36, 'ans': 63},
        {'q': 'Lesser value?', 'val1': 12, 'val2': 21, 'ans': 12},
        {'q': 'Pick 95 or 59?', 'val1': 95, 'val2': 59, 'ans': 95},
        {'q': 'Pick 20 or 30?', 'val1': 20, 'val2': 30, 'ans': 30},
      ],
    },
  },
  {
    'title': 'Living & Non-Living',
    'subject': 'Science',
    'description': 'Sort the items.',
    'type': 'drag_drop',
    'data': {
      'categories': ['Living', 'Non-Living'],
      'items': [
        {'name': 'Dog', 'cat': 'Living'},
        {'name': 'Tree', 'cat': 'Living'},
        {'name': 'Stone', 'cat': 'Non-Living'},
        {'name': 'Table', 'cat': 'Non-Living'},
        {'name': 'Fish', 'cat': 'Living'},
        {'name': 'Pencil', 'cat': 'Non-Living'},
        {'name': 'Cat', 'cat': 'Living'},
        {'name': 'Fan', 'cat': 'Non-Living'},
        {'name': 'Bird', 'cat': 'Living'},
        {'name': 'Car', 'cat': 'Non-Living'},
      ],
    },
  },
  {
    'title': 'Our Neighborhood',
    'subject': 'Social',
    'description': 'Helpers match.',
    'type': 'match',
    'data': {
      'pairs': [
        {'left': 'Doctor', 'right': 'Hospital', 'emoji': '👨‍⚕️'},
        {'left': 'Teacher', 'right': 'School', 'emoji': '👩‍🏫'},
        {'left': 'Farmer', 'right': 'Field', 'emoji': '👨‍🌾'},
        {'left': 'Policeman', 'right': 'Station', 'emoji': '👮'},
        {'left': 'Pilot', 'right': 'Airport', 'emoji': '👨‍✈️'},
        {'left': 'Postman', 'right': 'Letters', 'emoji': '📬'},
        {'left': 'Barber', 'right': 'Salon', 'emoji': '💇'},
        {'left': 'Chef', 'right': 'Kitchen', 'emoji': '👨‍🍳'},
        {'left': 'Driver', 'right': 'Bus', 'emoji': '👨‍✈️'},
        {'left': 'Mason', 'right': 'Building', 'emoji': '🧱'},
      ],
    },
  },
];
