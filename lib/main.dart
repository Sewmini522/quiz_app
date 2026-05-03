import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'University Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// ==================== HOME PAGE ====================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'University Quiz Master',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple.shade700, Colors.blue.shade700],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.shade300,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.school,
                    size: 80,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'University Quiz Master',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Test your knowledge from Year 1 to Year 4',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const YearSelectionPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 60),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Start Quiz',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== YEAR SELECTION PAGE (NO SCROLL) ====================
class YearSelectionPage extends StatelessWidget {
  const YearSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> years = [
      {
        'year': 'Year 1',
        'icon': Icons.looks_one,
        'color': Colors.green,
      },
      {
        'year': 'Year 2',
        'icon': Icons.looks_two,
        'color': Colors.orange,
      },
      {
        'year': 'Year 3',
        'icon': Icons.looks_3,
        'color': Colors.red,
      },
      {
        'year': 'Year 4',
        'icon': Icons.looks_4,
        'color': Colors.purple,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Year'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple.shade50, Colors.blue.shade50],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Row 1 - Year 1 and Year 2
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseSelectionPage(
                                year: years[0]['year'] as String,
                                yearColor: years[0]['color'] as Color,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                (years[0]['color'] as Color).withOpacity(0.8),
                                (years[0]['color'] as Color).withOpacity(0.5),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: (years[0]['color'] as Color).withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                years[0]['icon'] as IconData,
                                size: 60,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                years[0]['year'] as String,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '4 Courses',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseSelectionPage(
                                year: years[1]['year'] as String,
                                yearColor: years[1]['color'] as Color,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                (years[1]['color'] as Color).withOpacity(0.8),
                                (years[1]['color'] as Color).withOpacity(0.5),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: (years[1]['color'] as Color).withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                years[1]['icon'] as IconData,
                                size: 60,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                years[1]['year'] as String,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '4 Courses',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Row 2 - Year 3 and Year 4
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseSelectionPage(
                                year: years[2]['year'] as String,
                                yearColor: years[2]['color'] as Color,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                (years[2]['color'] as Color).withOpacity(0.8),
                                (years[2]['color'] as Color).withOpacity(0.5),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: (years[2]['color'] as Color).withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                years[2]['icon'] as IconData,
                                size: 60,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                years[2]['year'] as String,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '4 Courses',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseSelectionPage(
                                year: years[3]['year'] as String,
                                yearColor: years[3]['color'] as Color,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                (years[3]['color'] as Color).withOpacity(0.8),
                                (years[3]['color'] as Color).withOpacity(0.5),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: (years[3]['color'] as Color).withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                years[3]['icon'] as IconData,
                                size: 60,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                years[3]['year'] as String,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '4 Courses',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== COURSE SELECTION PAGE ====================
class CourseSelectionPage extends StatelessWidget {
  final String year;
  final Color yearColor;

  const CourseSelectionPage({
    super.key,
    required this.year,
    required this.yearColor,
  });

  List<Map<String, dynamic>> getCoursesForYear(String year) {
    switch (year) {
      case 'Year 1':
        return [
          {'name': 'ICT and PC Application', 'icon': Icons.computer},
          {'name': 'Logic Design', 'icon': Icons.settings_input_component}, // Fixed: Changed from Icons.circuits
          {'name': 'Multimedia and Graphic Designs', 'icon': Icons.brush},
          {'name': 'C Programming', 'icon': Icons.code},
        ];
      case 'Year 2':
        return [
          {'name': 'Data Structures and Algorithms', 'icon': Icons.account_tree},
          {'name': 'Microcontroller System Programming', 'icon': Icons.memory},
          {'name': 'E-commerce strategies and Architecture', 'icon': Icons.shopping_cart},
          {'name': 'Network Switching and Routing', 'icon': Icons.router},
        ];
      case 'Year 3':
        return [
          {'name': 'Software Engineering', 'icon': Icons.engineering},
          {'name': 'Artificial Intelligence', 'icon': Icons.psychology},
          {'name': 'Wireless Network', 'icon': Icons.wifi},
          {'name': 'Enterprise Architecture', 'icon': Icons.business_center},
        ];
      case 'Year 4':
        return [
          {'name': 'Final Year Project', 'icon': Icons.assignment},
          {'name': 'Research Methodology', 'icon': Icons.science},
          {'name': 'Cybersecurity', 'icon': Icons.security},
          {'name': 'Cloud Computing', 'icon': Icons.cloud},
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final courses = getCoursesForYear(year);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('$year - Select Course'),
        backgroundColor: yearColor,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [yearColor.withOpacity(0.1), Colors.white],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(
                      courseName: course['name'] as String,
                      year: year,
                      yearColor: yearColor,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: yearColor.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  border: Border.all(
                    color: yearColor.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: yearColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        course['icon'] as IconData,
                        size: 30,
                        color: yearColor,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course['name'] as String,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '5 Questions • Quiz Available',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: yearColor,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ==================== QUIZ PAGE ====================
class QuizPage extends StatefulWidget {
  final String courseName;
  final String year;
  final Color yearColor;

  const QuizPage({
    super.key,
    required this.courseName,
    required this.year,
    required this.yearColor,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  int selectedAnswerIndex = -1;
  bool isAnswered = false;
  Timer? timer;
  int timeLeft = 30;
  bool quizCompleted = false;
  late List<Map<String, dynamic>> questions;

  @override
  void initState() {
    super.initState();
    questions = getQuestionsForCourse(widget.courseName);
    startTimer();
  }

  List<Map<String, dynamic>> getQuestionsForCourse(String courseName) {
    switch (courseName) {
      // Year 1 Courses
      case 'ICT and PC Application':
        return [
          {'question': 'What does ICT stand for?', 'options': ['Information and Communication Technology', 'Internet and Computer Technology', 'Integrated Computer Technology', 'International Communication Technology'], 'correctIndex': 0},
          {'question': 'Which of the following is an input device?', 'options': ['Monitor', 'Printer', 'Keyboard', 'Speaker'], 'correctIndex': 2},
          {'question': 'What is the brain of the computer?', 'options': ['RAM', 'CPU', 'Hard Drive', 'Motherboard'], 'correctIndex': 1},
          {'question': 'Which software is used for word processing?', 'options': ['Excel', 'PowerPoint', 'Word', 'Access'], 'correctIndex': 2},
          {'question': 'What does RAM stand for?', 'options': ['Readily Accessed Memory', 'Random Access Memory', 'Rapid Access Memory', 'Read Access Memory'], 'correctIndex': 1},
        ];
      case 'Logic Design':
        return [
          {'question': 'What is the basic building block of digital logic circuits?', 'options': ['Resistor', 'Capacitor', 'Gate', 'Transistor'], 'correctIndex': 2},
          {'question': 'What does AND gate output?', 'options': ['1 if any input is 1', '1 if both inputs are 1', '1 if inputs are different', 'Always 0'], 'correctIndex': 1},
          {'question': 'How many inputs can a basic NAND gate have?', 'options': ['1', '2', '3', '4'], 'correctIndex': 1},
          {'question': 'What is the binary equivalent of decimal 5?', 'options': ['101', '110', '100', '111'], 'correctIndex': 0},
          {'question': 'Which gate is known as universal gate?', 'options': ['AND', 'OR', 'NOT', 'NAND'], 'correctIndex': 3},
        ];
      case 'Multimedia and Graphic Designs':
        return [
          {'question': 'What does RGB stand for?', 'options': ['Red, Green, Blue', 'Red, Gray, Black', 'Royal Green Blue', 'Red, Gold, Blue'], 'correctIndex': 0},
          {'question': 'Which file format is used for images?', 'options': ['.mp3', '.avi', '.jpg', '.txt'], 'correctIndex': 2},
          {'question': 'What is the standard resolution for HD video?', 'options': ['640x480', '1280x720', '1920x1080', '3840x2160'], 'correctIndex': 1},
          {'question': 'Which software is used for photo editing?', 'options': ['Photoshop', 'Excel', 'Word', 'PowerPoint'], 'correctIndex': 0},
          {'question': 'What does MP3 stand for?', 'options': ['Music Player 3', 'MPEG-1 Audio Layer 3', 'Media Player 3', 'Music Protocol 3'], 'correctIndex': 1},
        ];
      case 'C Programming':
        return [
          {'question': 'Who developed C programming language?', 'options': ['Dennis Ritchie', 'James Gosling', 'Bjarne Stroustrup', 'Guido van Rossum'], 'correctIndex': 0},
          {'question': 'What is the correct syntax to print "Hello" in C?', 'options': ['print("Hello");', 'printf("Hello");', 'cout << "Hello";', 'System.out.println("Hello");'], 'correctIndex': 1},
          {'question': 'Which symbol is used for comments in C?', 'options': ['//', '#', '/* */', 'Both A and C'], 'correctIndex': 3},
          {'question': 'What is the size of int in 32-bit C?', 'options': ['2 bytes', '4 bytes', '8 bytes', '1 byte'], 'correctIndex': 1},
          {'question': 'Which loop guarantees at least one execution?', 'options': ['for', 'while', 'do-while', 'None'], 'correctIndex': 2},
        ];
      
      // Year 2 Courses
      case 'Data Structures and Algorithms':
        return [
          {'question': 'What is the time complexity of binary search?', 'options': ['O(n)', 'O(log n)', 'O(n²)', 'O(1)'], 'correctIndex': 1},
          {'question': 'Which data structure uses LIFO?', 'options': ['Queue', 'Stack', 'Array', 'Linked List'], 'correctIndex': 1},
          {'question': 'What is the fastest sorting algorithm?', 'options': ['Bubble Sort', 'Quick Sort', 'Selection Sort', 'Insertion Sort'], 'correctIndex': 1},
          {'question': 'Which data structure is used for BFS?', 'options': ['Stack', 'Queue', 'Tree', 'Graph'], 'correctIndex': 1},
          {'question': 'What is a hash table used for?', 'options': ['Sorting', 'Searching', 'Key-value storage', 'Graph traversal'], 'correctIndex': 2},
        ];
      case 'Microcontroller System Programming':
        return [
          {'question': 'What is a microcontroller?', 'options': ['CPU on a chip', 'Memory chip', 'Power supply', 'Display device'], 'correctIndex': 0},
          {'question': 'Which is popular microcontroller family?', 'options': ['Intel i7', 'Arduino', 'ARM', 'Both B and C'], 'correctIndex': 3},
          {'question': 'What does GPIO stand for?', 'options': ['General Purpose Input Output', 'Graphics Processing Input Output', 'General Program Input Output', 'Global Purpose Input Output'], 'correctIndex': 0},
          {'question': 'What is PWM used for?', 'options': ['Motor control', 'Data storage', 'Processing', 'Networking'], 'correctIndex': 0},
          {'question': 'Which language is commonly used for microcontrollers?', 'options': ['Python', 'Java', 'C', 'HTML'], 'correctIndex': 2},
        ];
      case 'E-commerce strategies and Architecture':
        return [
          {'question': 'What does B2B stand for?', 'options': ['Business to Business', 'Business to Consumer', 'Consumer to Consumer', 'Business to Government'], 'correctIndex': 0},
          {'question': 'Which is an e-commerce platform?', 'options': ['Amazon', 'Facebook', 'Google', 'Microsoft'], 'correctIndex': 0},
          {'question': 'What is SSL used for?', 'options': ['Security', 'Speed', 'Storage', 'Search'], 'correctIndex': 0},
          {'question': 'What is digital payment?', 'options': ['Cash payment', 'Online transaction', 'Check payment', 'Wire transfer'], 'correctIndex': 1},
          {'question': 'What is CRM?', 'options': ['Customer Relationship Management', 'Computer Resource Management', 'Customer Response Management', 'Central Resource Management'], 'correctIndex': 0},
        ];
      case 'Network Switching and Routing':
        return [
          {'question': 'What does IP stand for?', 'options': ['Internet Protocol', 'Internal Protocol', 'International Protocol', 'Interface Protocol'], 'correctIndex': 0},
          {'question': 'What is the default port for HTTP?', 'options': ['21', '22', '80', '443'], 'correctIndex': 2},
          {'question': 'What is a router used for?', 'options': ['Connect networks', 'Store data', 'Process data', 'Display data'], 'correctIndex': 0},
          {'question': 'What does LAN stand for?', 'options': ['Large Area Network', 'Local Area Network', 'Long Area Network', 'Low Area Network'], 'correctIndex': 1},
          {'question': 'What is the OSI model layer count?', 'options': ['5', '6', '7', '8'], 'correctIndex': 2},
        ];
      
      // Default
      default:
        return [
          {'question': 'What is Flutter?', 'options': ['Google UI framework', 'Facebook app', 'Apple framework', 'Microsoft tool'], 'correctIndex': 0},
          {'question': 'What is Dart?', 'options': ['Programming language', 'Database', 'Framework', 'Tool'], 'correctIndex': 0},
          {'question': 'What is a widget?', 'options': ['UI component', 'Database', 'Network', 'File'], 'correctIndex': 0},
          {'question': 'What is state?', 'options': ['Data that can change', 'Static data', 'Constant', 'Variable'], 'correctIndex': 0},
          {'question': 'What is hot reload?', 'options': ['Instant code update', 'App restart', 'Device reboot', 'Build process'], 'correctIndex': 0},
        ];
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0 && !quizCompleted) {
          timeLeft--;
        } else if (timeLeft == 0 && !quizCompleted) {
          timer.cancel();
          if (!isAnswered) {
            nextQuestion();
          }
        }
      });
    });
  }

  void checkAnswer(int selectedIndex) {
    if (isAnswered) return;
    
    setState(() {
      isAnswered = true;
      selectedAnswerIndex = selectedIndex;
      
      if (selectedIndex == questions[currentQuestionIndex]['correctIndex']) {
        score++;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('✅ Correct! +1 point'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 1),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Wrong! Correct: ${questions[currentQuestionIndex]['options'][questions[currentQuestionIndex]['correctIndex']]}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
    
    timer?.cancel();
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = -1;
        isAnswered = false;
        timeLeft = 30;
      });
      startTimer();
    } else {
      setState(() {
        quizCompleted = true;
      });
      timer?.cancel();
      showResultDialog();
    }
  }

  void showResultDialog() {
    double percentage = (score / questions.length) * 100;
    String grade = '';
    Color gradeColor = Colors.green;
    
    if (percentage >= 80) {
      grade = 'A - Excellent! 🎉';
      gradeColor = Colors.green;
    } else if (percentage >= 70) {
      grade = 'B - Very Good! 👍';
      gradeColor = Colors.blue;
    } else if (percentage >= 60) {
      grade = 'C - Good! 📚';
      gradeColor = Colors.orange;
    } else if (percentage >= 50) {
      grade = 'D - Need Improvement 💪';
      gradeColor = Colors.red;
    } else {
      grade = 'F - Study More! 📖';
      gradeColor = Colors.red;
    }
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Quiz Completed!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: widget.yearColor.withOpacity(0.2),
                child: Text(
                  '${percentage.toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: widget.yearColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Score: $score/${questions.length}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: gradeColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                grade,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: gradeColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Course: ${widget.courseName}',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                'Year: ${widget.year}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Try Another Quiz'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.yearColor,
              ),
              child: const Text('Back to Years'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (quizCompleted) {
      return const SizedBox.shrink();
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.courseName),
        backgroundColor: widget.yearColor,
        foregroundColor: Colors.white,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.quiz, size: 18, color: Colors.deepPurple),
                const SizedBox(width: 5),
                Text(
                  '${currentQuestionIndex + 1}/${questions.length}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [widget.yearColor.withOpacity(0.1), Colors.white],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: widget.yearColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          'Score: $score',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: timeLeft <= 10 ? Colors.red : widget.yearColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.timer, color: Colors.white, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          '$timeLeft sec',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    questions[currentQuestionIndex]['question'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            
            Expanded(
              flex: 3,
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: questions[currentQuestionIndex]['options'].length,
                itemBuilder: (context, index) {
                  final options = questions[currentQuestionIndex]['options'];
                  final isCorrect = index == questions[currentQuestionIndex]['correctIndex'];
                  
                  Color optionColor = Colors.white;
                  if (isAnswered) {
                    if (isCorrect) {
                      optionColor = Colors.green;
                    } else if (selectedAnswerIndex == index && !isCorrect) {
                      optionColor = Colors.red;
                    }
                  }
                  
                  return GestureDetector(
                    onTap: isAnswered ? null : () => checkAnswer(index),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: optionColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isAnswered && isCorrect ? Colors.green : widget.yearColor,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: isAnswered && isCorrect
                                  ? Colors.white
                                  : widget.yearColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                String.fromCharCode(65 + index),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isAnswered && isCorrect
                                      ? Colors.green
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              options[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: isAnswered && isCorrect
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: isAnswered && isCorrect
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                          if (isAnswered && isCorrect)
                            const Icon(Icons.check_circle, color: Colors.white),
                          if (isAnswered && selectedAnswerIndex == index && !isCorrect)
                            const Icon(Icons.cancel, color: Colors.white),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: isAnswered ? nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  backgroundColor: widget.yearColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  currentQuestionIndex < questions.length - 1
                      ? 'Next Question'
                      : 'Finish Quiz',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== ABOUT PAGE ====================
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple.shade50, Colors.blue.shade50],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.school,
                  size: 80,
                  color: Colors.deepPurple,
                ),
                const SizedBox(height: 20),
                const Text(
                  'University Quiz Master',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Version 1.0.0',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Test your knowledge across all university courses!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Courses Covered:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text('• Year 1: 4 Courses'),
                const Text('• Year 2: 4 Courses'),
                const Text('• Year 3: 4 Courses'),
                const Text('• Year 4: 4 Courses'),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Back to Home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}