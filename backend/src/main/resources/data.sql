-- Topics
INSERT INTO quiz_topic (id, name) VALUES 
(1, 'Angular'), 
(2, 'Java'), 
(3, 'React'),
(4, 'Python'),
(5, 'C++'),
(6, 'SQL'),
(7, 'Spring Boot'),
(8, 'HTML & CSS'),
(9, 'Git & GitHub'),
(10, 'Linux CLI');

-- Quizzes
INSERT INTO quiz (id, title, topic_id, published, total_questions, created_at, updated_at) VALUES
(1, 'Angular Basics Quiz', 1, true, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Java Fundamentals Quiz', 2, false, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'React Essentials Quiz', 3, true, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 'Python Essentials Quiz', 4, true, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 'C++ Basics Quiz', 5, false, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(6, 'SQL Fundamentals Quiz', 6, true, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(7, 'Spring Boot Quiz', 7, true, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(8, 'HTML & CSS Basics Quiz', 8, false, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(9, 'Git & GitHub Quiz', 9, true, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10, 'Linux CLI Quiz', 10, false, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Questions 
INSERT INTO question (id, text, topic_id, quiz_id) VALUES
(1, '@Input decorator in Angular is used for?', 1, 1),
(2, 'What is Angular CLI used for?', 1, 1),
(3, 'Which directive is used to conditionally include a template?', 1, 1),
(4, 'What is the purpose of NgModule?', 1, 1),
(5, 'Which lifecycle hook is called after the component’s view has been fully initialized?', 1, 1),
(6, 'What is the default change detection strategy in Angular?', 1, 1),
(7, 'What does [(ngModel)] represent?', 1, 1),
(8, 'How can you create a service in Angular?', 1, 1),
(9, 'Which decorator is used to define a component?', 1, 1),
(10, 'What is the role of HttpClient in Angular?', 1, 1),
(11, 'What does the "class" keyword define in Java?', 2, 2),
(12, 'Which method is the entry point of any Java program?', 2, 2),
(13, 'What is the default value of a boolean in Java?', 2, 2),
(14, 'What does JVM stand for?', 2, 2),
(15, 'Which keyword is used to inherit a class in Java?', 2, 2),
(16, 'What is method overloading?', 2, 2),
(17, 'Which exception is thrown when array index is out of bounds?', 2, 2),
(18, 'Which access modifier makes a member visible only within its own class?', 2, 2),
(19, 'What is the size of int in Java?', 2, 2),
(20, 'What does ''final'' keyword mean for a variable?', 2, 2),
(21, 'What is JSX in React?', 3, 3),
(22, 'Which hook is used for state management?', 3, 3),
(23, 'How do you pass data to child components?', 3, 3),
(24, 'What is the purpose of useEffect?', 3, 3),
(25, 'What is a key in React list rendering?', 3, 3),
(26, 'What is a controlled component in React?', 3, 3),
(27, 'Which method is used to render components to the DOM?', 3, 3),
(28, 'How can you handle forms in React?', 3, 3),
(29, 'What is the purpose of React Router?', 3, 3),
(30, 'What is virtual DOM?', 3, 3);

-- Python Questions
INSERT INTO question (id, text, topic_id, quiz_id) VALUES
(31, 'What is the output of print(2 ** 3)?', 4, 4),
(32, 'Which keyword is used to define a function in Python?', 4, 4),
(33, 'What is the output of len(''Hello'')?', 4, 4),
(34, 'What is a list in Python?', 4, 4),
(35, 'How do you start a comment in Python?', 4, 4),
(36, 'Which of these is a valid variable name?', 4, 4),
(37, 'What does the \''in\'' keyword do?', 4, 4),
(38, 'Which built-in function returns the type of a variable?', 4, 4),
(39, 'What is the result of 10 // 3?', 4, 4),
(40, 'What is the correct file extension for Python files?', 4, 4);

-- SQL Questions
INSERT INTO question (id, text, topic_id, quiz_id) VALUES
(51, 'Which SQL statement is used to retrieve data from a database?', 6, 6),
(52, 'What does the WHERE clause do in SQL?', 6, 6),
(53, 'Which SQL keyword is used to sort the result-set?', 6, 6),
(54, 'What is the default sorting order of ORDER BY?', 6, 6),
(55, 'Which SQL statement is used to insert new data?', 6, 6),
(56, 'What is a primary key?', 6, 6),
(57, 'Which SQL clause is used to group rows?', 6, 6),
(58, 'What does COUNT(*) do?', 6, 6),
(59, 'How do you remove duplicates in a SELECT statement?', 6, 6),
(60, 'Which command removes all records but not the table?', 6, 6);

-- C++ Questions
INSERT INTO question (id, text, topic_id, quiz_id) VALUES
(61, 'Which of the following is used to define a constant in C++?', 5, 5),
(62, 'Which operator is used for dynamic memory allocation in C++?', 5, 5),
(63, 'Which header file is needed to use cout?', 5, 5),
(64, 'Which keyword is used to define a class in C++?', 5, 5),
(65, 'What does the delete operator do?', 5, 5),
(66, 'Which of these is a correct for loop syntax in C++?', 5, 5),
(67, 'Which symbol is used for a single-line comment in C++?', 5, 5),
(68, 'Which function is the entry point in a C++ program?', 5, 5),
(69, 'What is the output type of sizeof() operator?', 5, 5),
(70, 'Which keyword is used to inherit a class?', 5, 5);

-- Spring Boot Questions
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (71, 'Which annotation is used to mark a Spring Boot application entry point?', 7, 7);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (72, 'What is the default embedded server in Spring Boot?', 7, 7);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (73, 'Which annotation is used for REST controllers?', 7, 7);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (74, 'What does @Autowired do in Spring Boot?', 7, 7);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (75, 'How do you define a bean in Spring Boot?', 7, 7);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (76, 'Which file is commonly used for Spring Boot configuration?', 7, 7);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (77, 'What is the use of application.properties?', 7, 7);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (78, 'What port does Spring Boot run on by default?', 7, 7);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (79, 'What is Spring Boot Starter?', 7, 7);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (80, 'Which annotation maps a method to a GET request?', 7, 7);

-- HTML & CSS Questions 
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (81, 'Which tag defines a hyperlink in HTML?', 8, 8);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (82, 'How do you add a comment in HTML?', 8, 8);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (83, 'What does CSS stand for?', 8, 8);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (84, 'Which CSS property sets the background color?', 8, 8);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (85, 'How do you select all &lt;p&gt; tags in CSS?', 8, 8);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (86, 'Which tag defines a table row?', 8, 8);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (87, 'What is the default display property of a div?', 8, 8);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (88, 'How do you center a block element in CSS?', 8, 8);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (89, 'Which HTML tag is used for the largest heading?', 8, 8);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (90, 'How do you link an external CSS file?', 8, 8);

-- Git & GitHub Questions
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (91, 'Which command initializes a Git repository?', 9, 9);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (92, 'Which command shows commit history?', 9, 9);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (93, 'What is a branch in Git?', 9, 9);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (94, 'Which command creates a new branch?', 9, 9);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (95, 'Which command is used to merge branches?', 9, 9);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (96, 'What does git clone do?', 9, 9);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (97, 'What is the command to stage changes?', 9, 9);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (98, 'What does .gitignore do?', 9, 9);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (99, 'What does git pull do?', 9, 9);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (100, 'What does git remote -v show?', 9, 9);

-- Linux CLI Questions
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (101, 'Which command lists all files including hidden ones?', 10, 10);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (102, 'How do you change directory in Linux?', 10, 10);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (103, 'What is the command to create a new file?', 10, 10);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (104, 'Which command shows the current path?', 10, 10);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (105, 'How do you copy a file?', 10, 10);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (106, 'Which command is used to delete a file?', 10, 10);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (107, 'What does the "chmod" command do?', 10, 10);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (108, 'Which command shows running processes?', 10, 10);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (109, 'What is the superuser command in Linux?', 10, 10);
INSERT INTO question (id, text, topic_id, quiz_id) VALUES (110, 'How do you clear the terminal screen?', 10, 10);


-- Options for Angular Question
INSERT INTO question_option (id, text, is_correct, question_id) VALUES
(1, 'To receive values from a parent component', TRUE, 1),
(2, 'To send data to the database', FALSE, 1),
(3, 'To apply CSS to parent', FALSE, 1),
(4, 'A lifecycle method', FALSE, 1),
(5, 'To scaffold Angular projects', TRUE, 2),
(6, 'To install Node.js', FALSE, 2),
(7, 'To compile Java code', FALSE, 2),
(8, 'To write HTML templates', FALSE, 2),
(9, '*ngIf', TRUE, 3),
(10, '*ngFor', FALSE, 3),
(11, 'ngModel', FALSE, 3),
(12, 'ngSwitch', FALSE, 3),
(13, 'To define a module that contains components, services, etc.', TRUE, 4),
(14, 'To declare routes', FALSE, 4),
(15, 'To create forms', FALSE, 4),
(16, 'To handle HTTP requests', FALSE, 4),
(17, 'ngAfterViewInit', TRUE, 5),
(18, 'ngOnInit', FALSE, 5),
(19, 'ngDestroy', FALSE, 5),
(20, 'ngDoCheck', FALSE, 5),
(21, 'Default', TRUE, 6),
(22, 'OnPush', FALSE, 6),
(23, 'Manual', FALSE, 6),
(24, 'Detached', FALSE, 6),
(25, 'Two-way data binding', TRUE, 7),
(26, 'One-way binding', FALSE, 7),
(27, 'A directive', FALSE, 7),
(28, 'A CSS class', FALSE, 7),
(29, 'Using ng generate service', TRUE, 8),
(30, 'Writing a controller', FALSE, 8),
(31, 'Importing a pipe', FALSE, 8),
(32, 'Using a directive', FALSE, 8),
(33, '@Component', TRUE, 9),
(34, '@Injectable', FALSE, 9),
(35, '@NgModule', FALSE, 9),
(36, '@Directive', FALSE, 9),
(37, 'To perform HTTP requests', TRUE, 10),
(38, 'To manipulate DOM', FALSE, 10),
(39, 'To create forms', FALSE, 10),
(40, 'To route URLs', FALSE, 10);

-- Options for Java Questions
INSERT INTO question_option (id, text, is_correct, question_id) VALUES
(41, 'Defines a class', TRUE, 11),
(42, 'Starts a loop', FALSE, 11),
(43, 'Allocates memory', FALSE, 11),
(44, 'Initializes a variable', FALSE, 11),
(45, 'main method', TRUE, 12),
(46, 'start method', FALSE, 12),
(47, 'run method', FALSE, 12),
(48, 'init method', FALSE, 12),
(49, 'false', TRUE, 13),
(50, 'true', FALSE, 13),
(51, 'null', FALSE, 13),
(52, '0', FALSE, 13),
(53, 'Java Virtual Machine', TRUE, 14),
(54, 'Java Variable Manager', FALSE, 14),
(55, 'Just-in-time Version Mapper', FALSE, 14),
(56, 'Java Vendor Module', FALSE, 14),
(57, 'extends', TRUE, 15),
(58, 'implements', FALSE, 15),
(59, 'inherits', FALSE, 15),
(60, 'super', FALSE, 15),
(61, 'Multiple methods with same name but different parameters', TRUE, 16),
(62, 'Overriding a method in subclass', FALSE, 16),
(63, 'Calling a superclass constructor', FALSE, 16),
(64, 'Using default constructor', FALSE, 16),
(65, 'ArrayIndexOutOfBoundsException', TRUE, 17),
(66, 'NullPointerException', FALSE, 17),
(67, 'ClassCastException', FALSE, 17),
(68, 'IOException', FALSE, 17),
(69, 'private', TRUE, 18),
(70, 'protected', FALSE, 18),
(71, 'public', FALSE, 18),
(72, 'default', FALSE, 18),
(73, '32 bits', TRUE, 19),
(74, '64 bits', FALSE, 19),
(75, '16 bits', FALSE, 19),
(76, '8 bits', FALSE, 19),
(77, 'It cannot be changed once assigned', TRUE, 20),
(78, 'It is a global variable', FALSE, 20),
(79, 'It can be reassigned once', FALSE, 20),
(80, 'It must be static', FALSE, 20);

-- Options for React Questions
INSERT INTO question_option (id, text, is_correct, question_id) VALUES
(81, 'A syntax extension for JavaScript', TRUE, 21),
(82, 'A CSS preprocessor', FALSE, 21),
(83, 'A type checker', FALSE, 21),
(84, 'A server-side language', FALSE, 21),
(85, 'useState', TRUE, 22),
(86, 'useEffect', FALSE, 22),
(87, 'useRef', FALSE, 22),
(88, 'useContext', FALSE, 22),
(89, 'Using props', TRUE, 23),
(90, 'Using state', FALSE, 23),
(91, 'Using Redux', FALSE, 23),
(92, 'Using context', FALSE, 23),
(93, 'To perform side effects in function components', TRUE, 24),
(94, 'To store data persistently', FALSE, 24),
(95, 'To render JSX', FALSE, 24),
(96, 'To create routes', FALSE, 24),
(97, 'A unique identifier for list elements', TRUE, 25),
(98, 'A CSS class name', FALSE, 25),
(99, 'A DOM reference', FALSE, 25),
(100, 'A prop value', FALSE, 25),
(101, 'Component whose input is controlled by React state', TRUE, 26),
(102, 'Component using props only', FALSE, 26),
(103, 'Component that fetches API data', FALSE, 26),
(104, 'Component that uses useEffect', FALSE, 26),
(105, 'ReactDOM.render()', TRUE, 27),
(106, 'renderComponent()', FALSE, 27),
(107, 'useRender()', FALSE, 27),
(108, 'createDOM()', FALSE, 27),
(109, 'By using controlled components with state', TRUE, 28),
(110, 'By editing HTML files', FALSE, 28),
(111, 'By using jQuery', FALSE, 28),
(112, 'By calling event.preventDefault()', FALSE, 28),
(113, 'To manage navigation and routing in single-page apps', TRUE, 29),
(114, 'To manage component state', FALSE, 29),
(115, 'To style components', FALSE, 29),
(116, 'To fetch API data', FALSE, 29),
(117, 'A lightweight copy of the actual DOM', TRUE, 30),
(118, 'A part of Node.js', FALSE, 30),
(119, 'A feature of CSS-in-JS', FALSE, 30),
(120, 'A JavaScript array', FALSE, 30);

-- Options for Python Questions
INSERT INTO question_option (id, text, is_correct, question_id) VALUES
(121, '6', FALSE, 31),
(122, '8', TRUE, 31),
(123, '9', FALSE, 31),
(124, '2', FALSE, 31),
(125, 'func', FALSE, 32),
(126, 'define', FALSE, 32),
(127, 'def', TRUE, 32),
(128, 'function', FALSE, 32),
(129, '5', TRUE, 33),
(130, '4', FALSE, 33),
(131, '6', FALSE, 33),
(132, 'None', FALSE, 33),
(133, 'A mutable sequence', TRUE, 34),
(134, 'An immutable dictionary', FALSE, 34),
(135, 'A type of loop', FALSE, 34),
(136, 'A keyword', FALSE, 34),
(137, '// comment', FALSE, 35),
(138, '/* comment */', FALSE, 35),
(139, '# comment', TRUE, 35),
(140, '<!-- comment -->', FALSE, 35),
(141, '2variable', FALSE, 36),
(142, 'variable_name', TRUE, 36),
(143, 'variable-name', FALSE, 36),
(144, 'class', FALSE, 36),
(145, 'Checks for membership', TRUE, 37),
(146, 'Initializes a variable', FALSE, 37),
(147, 'Imports a module', FALSE, 37),
(148, 'Terminates a loop', FALSE, 37),
(149, 'typeof()', FALSE, 38),
(150, 'type()', TRUE, 38),
(151, 'varType()', FALSE, 38),
(152, 'getType()', FALSE, 38),
(153, '3.33', FALSE, 39),
(154, '3', TRUE, 39),
(155, '4', FALSE, 39),
(156, 'Error', FALSE, 39),
(157, '.python', FALSE, 40),
(158, '.py', TRUE, 40),
(159, '.pt', FALSE, 40),
(160, '.pyc', FALSE, 40);

-- Options for SQL Questions
INSERT INTO question_option (id, text, is_correct, question_id) VALUES
(161, 'SELECT', TRUE, 51),
(162, 'GET', FALSE, 51),
(163, 'EXTRACT', FALSE, 51),
(164, 'FETCH', FALSE, 51),
(165, 'Filters records', TRUE, 52),
(166, 'Sorts records', FALSE, 52),
(167, 'Deletes records', FALSE, 52),
(168, 'Updates records', FALSE, 52),
(169, 'ORDER BY', TRUE, 53),
(170, 'SORT BY', FALSE, 53),
(171, 'GROUP BY', FALSE, 53),
(172, 'ARRANGE BY', FALSE, 53),
(173, 'Ascending', TRUE, 54),
(174, 'Descending', FALSE, 54),
(175, 'Random', FALSE, 54),
(176, 'Grouped', FALSE, 54),
(177, 'INSERT INTO', TRUE, 55),
(178, 'ADD', FALSE, 55),
(179, 'UPDATE', FALSE, 55),
(180, 'CREATE', FALSE, 55),
(181, 'A unique identifier for each row', TRUE, 56),
(182, 'A foreign key reference', FALSE, 56),
(183, 'An index for fast access', FALSE, 56),
(184, 'A duplicate column', FALSE, 56),
(185, 'GROUP BY', TRUE, 57),
(186, 'ORDER BY', FALSE, 57),
(187, 'JOIN', FALSE, 57),
(188, 'HAVING', FALSE, 57),
(189, 'Counts all rows', TRUE, 58),
(190, 'Counts only NULLs', FALSE, 58),
(191, 'Counts distinct values', FALSE, 58),
(192, 'Counts foreign keys', FALSE, 58),
(193, 'DISTINCT', TRUE, 59),
(194, 'UNIQUE', FALSE, 59),
(195, 'NO DUPLICATES', FALSE, 59),
(196, 'REMOVE DUPLICATES', FALSE, 59),
(197, 'DELETE', FALSE, 60),
(198, 'DROP', FALSE, 60),
(199, 'TRUNCATE', TRUE, 60),
(200, 'CLEAR', FALSE, 60);

-- C++ (Quiz 5)
INSERT INTO question_option (id, text, is_correct, question_id) VALUES
(201, '#define', TRUE, 61),
(202, 'const()', FALSE, 61),
(203, 'int const', FALSE, 61),
(204, 'define()', FALSE, 61),

(205, 'malloc', FALSE, 62),
(206, 'new', TRUE, 62),
(207, 'allocate()', FALSE, 62),
(208, 'calloc', FALSE, 62),

(209, '<iostream>', TRUE, 63),
(210, '<stdio.h>', FALSE, 63),
(211, '<stdlib.h>', FALSE, 63),
(212, '<string>', FALSE, 63),

(213, 'class', TRUE, 64),
(214, 'object', FALSE, 64),
(215, 'define', FALSE, 64),
(216, 'method', FALSE, 64),

(217, 'Frees memory allocated by new', TRUE, 65),
(218, 'Creates a pointer', FALSE, 65),
(219, 'Initializes memory', FALSE, 65),
(220, 'Deletes a class', FALSE, 65),

(221, 'for(int i=0; i<10; i++)', TRUE, 66),
(222, 'foreach i in range(10)', FALSE, 66),
(223, 'loop i = 1 to 10', FALSE, 66),
(224, 'repeat 10 times', FALSE, 66),

(225, '//', TRUE, 67),
(226, '##', FALSE, 67),
(227, '#', FALSE, 67),
(228, '--', FALSE, 67),

(229, 'main()', TRUE, 68),
(230, 'start()', FALSE, 68),
(231, 'init()', FALSE, 68),
(232, 'launch()', FALSE, 68),

(233, 'size_t', TRUE, 69),
(234, 'int', FALSE, 69),
(235, 'bool', FALSE, 69),
(236, 'float', FALSE, 69),

(237, 'public', TRUE, 70),
(238, 'inherits', FALSE, 70),
(239, 'extends', FALSE, 70),
(240, 'super', FALSE, 70);

-- HTML & CSS (Quiz 8)
INSERT INTO question_option (id, text, is_correct, question_id) VALUES
(241, '<a>', TRUE, 81),
(242, '<link>', FALSE, 81),
(243, '<href>', FALSE, 81),
(244, '<url>', FALSE, 81),

(245, '<!-- comment -->', TRUE, 82),
(246, '// comment', FALSE, 82),
(247, '# comment', FALSE, 82),
(248, '/* comment */', FALSE, 82),

(249, 'Cascading Style Sheets', TRUE, 83),
(250, 'Computer Style Syntax', FALSE, 83),
(251, 'Creative Sheet System', FALSE, 83),
(252, 'Color Style Syntax', FALSE, 83),

(253, 'background-color', TRUE, 84),
(254, 'bgcolor', FALSE, 84),
(255, 'color-background', FALSE, 84),
(256, 'bg-style', FALSE, 84),

(257, 'p', TRUE, 85),
(258, '*p', FALSE, 85),
(259, 'paragraph', FALSE, 85),
(260, '#p', FALSE, 85),

(261, '<tr>', TRUE, 86),
(262, '<td>', FALSE, 86),
(263, '<table>', FALSE, 86),
(264, '<row>', FALSE, 86),

(265, 'block', TRUE, 87),
(266, 'inline', FALSE, 87),
(267, 'flex', FALSE, 87),
(268, 'grid', FALSE, 87),

(269, 'margin: 0 auto;', TRUE, 88),
(270, 'align: center;', FALSE, 88),
(271, 'text-align: middle;', FALSE, 88),
(272, 'center: true;', FALSE, 88),

(273, '<h1>', TRUE, 89),
(274, '<heading>', FALSE, 89),
(275, '<head>', FALSE, 89),
(276, '<title>', FALSE, 89),

(277, '<link rel="stylesheet" href="style.css">', TRUE, 90),
(278, '<style src="style.css">', FALSE, 90),
(279, '<css href="style.css">', FALSE, 90),
(280, '<script src="style.css">', FALSE, 90);

-- Git & GitHub (Quiz 9)
INSERT INTO question_option (id, text, is_correct, question_id) VALUES
(281, 'git init', TRUE, 91),
(282, 'git start', FALSE, 91),
(283, 'git begin', FALSE, 91),
(284, 'git new', FALSE, 91),

(285, 'git log', TRUE, 92),
(286, 'git history', FALSE, 92),
(287, 'git commits', FALSE, 92),
(288, 'git status', FALSE, 92),

(289, 'A pointer to a specific commit', TRUE, 93),
(290, 'A backup of your repo', FALSE, 93),
(291, 'A remote copy', FALSE, 93),
(292, 'A merged state', FALSE, 93),

(293, 'git branch <name>', TRUE, 94),
(294, 'git new <branch>', FALSE, 94),
(295, 'git create branch', FALSE, 94),
(296, 'git init-branch', FALSE, 94),

(297, 'git merge', TRUE, 95),
(298, 'git combine', FALSE, 95),
(299, 'git join', FALSE, 95),
(300, 'git mix', FALSE, 95),

(301, 'Clones a remote repo to your machine', TRUE, 96),
(302, 'Deletes a branch', FALSE, 96),
(303, 'Shows commit log', FALSE, 96),
(304, 'Pushes changes to remote', FALSE, 96),

(305, 'git add', TRUE, 97),
(306, 'git stage', FALSE, 97),
(307, 'git commit', FALSE, 97),
(308, 'git push', FALSE, 97),

(309, 'Specifies files to ignore in the repo', TRUE, 98),
(310, 'Adds files to staging', FALSE, 98),
(311, 'Sets remote URL', FALSE, 98),
(312, 'Hides files from git log', FALSE, 98),

(313, 'Downloads and merges remote changes', TRUE, 99),
(314, 'Pushes changes to remote', FALSE, 99),
(315, 'Creates a new branch', FALSE, 99),
(316, 'Commits changes', FALSE, 99),

(317, 'Shows configured remotes and URLs', TRUE, 100),
(318, 'Lists all local branches', FALSE, 100),
(319, 'Deletes remote branches', FALSE, 100),
(320, 'Clones a remote repo', FALSE, 100);

-- Linux CLI 
INSERT INTO question_option (id, text, is_correct, question_id) VALUES
(321, 'ls -a', TRUE, 101),
(322, 'ls', FALSE, 101),
(323, 'dir /hidden', FALSE, 101),
(324, 'showall', FALSE, 101),

(325, 'cd', TRUE, 102),
(326, 'chdir', FALSE, 102),
(327, 'goto', FALSE, 102),
(328, 'dir', FALSE, 102),

(329, 'touch', TRUE, 103),
(330, 'newfile', FALSE, 103),
(331, 'mkfile', FALSE, 103),
(332, 'create', FALSE, 103),

(333, 'pwd', TRUE, 104),
(334, 'whereami', FALSE, 104),
(335, 'path', FALSE, 104),
(336, 'cwd', FALSE, 104),

(337, 'cp', TRUE, 105),
(338, 'copy', FALSE, 105),
(339, 'duplicate', FALSE, 105),
(340, 'clone', FALSE, 105),

(341, 'rm', TRUE, 106),
(342, 'del', FALSE, 106),
(343, 'erase', FALSE, 106),
(344, 'delete', FALSE, 106),

(345, 'Changes file permissions', TRUE, 107),
(346, 'Changes file ownership', FALSE, 107),
(347, 'Changes file type', FALSE, 107),
(348, 'Opens file viewer', FALSE, 107),

(349, 'ps', TRUE, 108),
(350, 'listproc', FALSE, 108),
(351, 'jobs', FALSE, 108),
(352, 'procshow', FALSE, 108),

(353, 'sudo', TRUE, 109),
(354, 'admin', FALSE, 109),
(355, 'su', FALSE, 109),
(356, 'root', FALSE, 109),

(357, 'clear', TRUE, 110),
(358, 'clr', FALSE, 110),
(359, 'clean', FALSE, 110),
(360, 'reset', FALSE, 110);

-- Options for Question 71
INSERT INTO question_option (id, text, is_correct, question_id) VALUES
(361, '@SpringBootApplication', TRUE, 71),
(362, '@EnableAutoConfiguration', FALSE, 71),
(363, '@ComponentScan', FALSE, 71),
(364, '@Configuration', FALSE, 71),

-- Options for Question 72
(365, 'Tomcat', TRUE, 72),
(366, 'Jetty', FALSE, 72),
(367, 'Undertow', FALSE, 72),
(368, 'Netty', FALSE, 72),

-- Options for Question 73
(369, '@RestController', TRUE, 73),
(370, '@Controller', FALSE, 73),
(371, '@Service', FALSE, 73),
(372, '@Component', FALSE, 73),

-- Options for Question 74
(373, 'Injects a bean automatically by type', TRUE, 74),
(374, 'Starts the application', FALSE, 74),
(375, 'Maps HTTP requests', FALSE, 74),
(376, 'Configures application properties', FALSE, 74),

-- Options for Question 75
(377, 'Using @Bean annotation', TRUE, 75),
(378, 'Using @Value annotation', FALSE, 75),
(379, 'Using @ComponentScan', FALSE, 75),
(380, 'Using @EnableAutoConfiguration', FALSE, 75),

-- Options for Question 76
(381, 'application.properties', TRUE, 76),
(382, 'config.json', FALSE, 76),
(383, 'settings.xml', FALSE, 76),
(384, 'bootstrap.yml only', FALSE, 76),

-- Options for Question 77
(385, 'It defines application configuration properties', TRUE, 77),
(386, 'It defines database schema', FALSE, 77),
(387, 'It sets Java version', FALSE, 77),
(388, 'It initializes Spring context', FALSE, 77),

-- Options for Question 78
(389, '8080', TRUE, 78),
(390, '8000', FALSE, 78),
(391, '9090', FALSE, 78),
(392, '3306', FALSE, 78),

-- Options for Question 79
(393, 'A dependency that simplifies project setup', TRUE, 79),
(394, 'A plugin for logging', FALSE, 79),
(395, 'A built-in database', FALSE, 79),
(396, 'An annotation processor', FALSE, 79),

-- Options for Question 80
(397, '@GetMapping', TRUE, 80),
(398, '@RequestMapping(method = POST)', FALSE, 80),
(399, '@PostMapping', FALSE, 80),
(400, '@PutMapping', FALSE, 80);

ALTER TABLE question ALTER COLUMN id RESTART WITH 111;
ALTER TABLE question_option ALTER COLUMN id RESTART WITH 401;


-- Dummy user
INSERT INTO users (
  username, email, password, first_name, last_name, role,
  deletion_requested, scheduled_deletion_at
)
VALUES (
  'mujo123',
  'mujo@test.com',
  '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey',
  'Mujo',
  'Mujic',
  'USER',
  false,
  NULL
);
-- Dummy admin user
INSERT INTO users (
  username, email, password, first_name, last_name, role,
  deletion_requested, scheduled_deletion_at
)
VALUES (
  'admin123',
  'admin@test.com',
  '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey',
  'Admin',
  'Administrator',
  'ADMIN',
  false,
  NULL
);
-- Dummy moderator user
INSERT INTO users (
  username, email, password, first_name, last_name, role,
  deletion_requested, scheduled_deletion_at
)
VALUES (
  'mod123',
  'mod@test.com',
  '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey',
  'mod',
  'modistrator',
  'MODERATOR',
  false,
  NULL
);

-- Dummy users 
INSERT INTO users (username, email, password, first_name, last_name, role, deletion_requested, scheduled_deletion_at) VALUES
('user1', 'user1@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'User', 'One', 'USER', false, NULL),
('user2', 'user2@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'User', 'Two', 'USER', false, NULL),
('user3', 'user3@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'User', 'Three', 'USER', false, NULL),
('user4', 'user4@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'User', 'Four', 'USER', false, NULL),
('user5', 'user5@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'User', 'Five', 'USER', false, NULL),
('user6', 'user6@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'User', 'Six', 'USER', false, NULL),
('user7', 'user7@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'User', 'Seven', 'USER', false, NULL),
('user8', 'user8@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'User', 'Eight', 'USER', false, NULL),
('user9', 'user9@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'User', 'Nine', 'USER', false, NULL),
('user10', 'user10@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'User', 'Ten', 'USER', false, NULL);

-- Dummy moderators
INSERT INTO users (username, email, password, first_name, last_name, role, deletion_requested, scheduled_deletion_at) VALUES
('mod1', 'mod1@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'Mod', 'One', 'MODERATOR', false, NULL),
('mod2', 'mod2@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'Mod', 'Two', 'MODERATOR', false, NULL),
('mod3', 'mod3@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'Mod', 'Three', 'MODERATOR', false, NULL),
('mod4', 'mod4@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'Mod', 'Four', 'MODERATOR', false, NULL),
('mod5', 'mod5@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'Mod', 'Five', 'MODERATOR', false, NULL),
('mod6', 'mod6@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'Mod', 'Six', 'MODERATOR', false, NULL),
('mod7', 'mod7@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'Mod', 'Seven', 'MODERATOR', false, NULL),
('mod8', 'mod8@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'Mod', 'Eight', 'MODERATOR', false, NULL),
('mod9', 'mod9@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'Mod', 'Nine', 'MODERATOR', false, NULL),
('mod10', 'mod10@test.com', '$2y$10$JQ8JErQ.uMmvp2I4G8SJ1ueiFn/WIq8HRGtMySyzHYT6JUhTeixey', 'Mod', 'Ten', 'MODERATOR', false, NULL);

-- Dummy learning resources 
INSERT INTO learning_resources (title, url, description, author_email, status, created_at, updated_at)
VALUES
  ('Angular Fundamentals', 'https://angular.dev/docs/fundamentals', 'Learn Angular core concepts, components, services, and routing.', 'mod@test.com', 'PUBLISHED', '2024-05-01T09:00:00Z', '2024-05-01T09:00:00Z'),
  ('Spring Boot Guide', 'https://spring.io/guides', 'Comprehensive tutorials on Spring Boot, REST APIs, and more.', 'mod2@email.com', 'PUBLISHED', '2024-05-02T10:00:00Z', '2024-05-02T10:00:00Z'),
  ('React Essentials', 'https://react.dev/learn', 'Start learning React with hooks, components, and state management.', 'mod@test.com', 'DRAFT', '2024-05-03T11:00:00Z', '2024-05-03T11:00:00Z'),
  ('JavaScript Basics', 'https://javascript.info', 'Understand JavaScript fundamentals including types, loops, and functions.', 'mod2@email.com', 'PUBLISHED', '2024-05-04T13:30:00Z', '2024-05-04T13:30:00Z'),
  ('Python Crash Course', 'https://docs.python.org/3/tutorial/', 'Intro to Python syntax, data structures, and control flow.', 'mod@test.com', 'PUBLISHED', '2024-05-05T10:20:00Z', '2024-05-05T10:20:00Z'),
  ('Docker for Beginners', 'https://docker-curriculum.com/', 'Step-by-step guide to containers, images, and Docker commands.', 'mod3@email.com', 'PUBLISHED', '2024-05-06T08:15:00Z', '2024-05-06T08:15:00Z'),
  ('Kubernetes Basics', 'https://kubernetes.io/docs/tutorials/', 'Get started with Kubernetes clusters, pods, and deployments.', 'mod3@email.com', 'DRAFT', '2024-05-07T09:10:00Z', '2024-05-07T09:10:00Z'),
  ('SQL Fundamentals', 'https://www.sqltutorial.org/', 'Learn SQL syntax, joins, grouping, and subqueries.', 'mod2@email.com', 'PUBLISHED', '2024-05-08T07:00:00Z', '2024-05-08T07:00:00Z'),
  ('HTML & CSS Foundations', 'https://developer.mozilla.org/en-US/docs/Learn', 'MDN learning path for HTML semantics and CSS styling.', 'mod@test.com', 'PUBLISHED', '2024-05-09T14:30:00Z', '2024-05-09T14:30:00Z'),
  ('DevOps Introduction', 'https://roadmap.sh/devops', 'Overview of the DevOps roadmap and core tools.', 'mod3@email.com', 'PUBLISHED', '2024-05-10T16:30:00Z', '2024-05-10T16:30:00Z'),
  ('Node.js Quickstart', 'https://nodejs.dev/learn', 'Beginner-friendly guide to Node.js, modules, and HTTP.', 'mod2@email.com', 'PUBLISHED', '2024-05-11T11:30:00Z', '2024-05-11T11:30:00Z'),
  ('Git & GitHub', 'https://guides.github.com', 'Master Git basics, GitHub workflows, and pull requests.', 'mod@test.com', 'PUBLISHED', '2024-05-12T12:30:00Z', '2024-05-12T12:30:00Z'),
  ('TypeScript in Depth', 'https://www.typescriptlang.org/docs/', 'Advanced guide to TypeScript types, interfaces, and generics.', 'mod2@email.com', 'DRAFT', '2024-05-13T13:30:00Z', '2024-05-13T13:30:00Z'),
  ('REST API Design', 'https://restfulapi.net/', 'Learn best practices for designing RESTful APIs.', 'mod3@email.com', 'PUBLISHED', '2024-05-14T10:30:00Z', '2024-05-14T10:30:00Z'),
  ('Testing with JUnit', 'https://junit.org/junit5/docs/current/user-guide/', 'JUnit testing strategies for Java applications.', 'mod@test.com', 'PUBLISHED', '2024-05-15T12:30:00Z', '2024-05-15T12:30:00Z');

-- Tags for resources (resource_id references learning_resources.id)
INSERT INTO resource_tags (resource_id, tag) VALUES
  (1, 'angular'),        (1, 'frontend'),
  (2, 'spring'),         (2, 'backend'),
  (3, 'react'),          (3, 'javascript'),
  (4, 'javascript'),     (4, 'basics'),
  (5, 'python'),         (5, 'backend'),
  (6, 'docker'),         (6, 'devops'),
  (7, 'kubernetes'),     (7, 'devops'),
  (8, 'sql'),            (8, 'database'),
  (9, 'html'),           (9, 'css'),              (9, 'frontend'),
  (10, 'devops'),        (10, 'tools'),
  (11, 'nodejs'),        (11, 'backend'),
  (12, 'git'),           (12, 'github'),          (12, 'tools'),
  (13, 'typescript'),    (13, 'javascript'),
  (14, 'rest'),          (14, 'api'),
  (15, 'junit'),         (15, 'testing');

-- Sections for resources (resource_id, title, content, section_order, published)
INSERT INTO sections (resource_id, title, content, section_order, published) VALUES
  -- Angular Fundamentals
  (1, 'Introduction to Angular', 'Learn what Angular is and why it is used.', 1, true),
  (1, 'Components and Templates', 'How to build and compose components and templates.', 2, true),
  (1, 'Data Binding', 'Property binding, event binding, and two-way binding.', 3, true),
  (1, 'Directives and Pipes', 'Using built-in directives and pipes for dynamic behavior.', 4, true),

  -- Spring Boot Guide
  (2, 'Getting Started with Spring Boot', 'What is Spring Boot and why it is popular?', 1, true),
  (2, 'Creating Your First Project', 'How to use Spring Initializr.', 2, true),
  (2, 'Dependency Injection', 'Beans and dependency injection in Spring.', 3, true),
  (2, 'REST APIs', 'Building REST APIs with Spring Boot.', 4, true),

  -- React Essentials
  (3, 'React Overview', 'Introduction to React and its main concepts.', 1, true),
  (3, 'JSX and Rendering', 'How JSX works and how to render elements.', 2, true),
  (3, 'State and Props', 'Managing state and passing data using props.', 3, true),

  -- JavaScript Basics
  (4, 'JS Syntax', 'Learn the syntax of JavaScript.', 1, true),
  (4, 'Variables and Data Types', 'Working with variables and different data types.', 2, true),
  (4, 'Control Flow', 'if, else, switch, loops in JavaScript.', 3, true),

  -- Python Crash Course
  (5, 'Python Introduction', 'Intro to Python and its features.', 1, true),
  (5, 'Data Types & Variables', 'Understanding data types and variables in Python.', 2, true),
  (5, 'Control Structures', 'if, for, while, and other flow controls.', 3, true),

  -- Docker for Beginners
  (6, 'What is Docker?', 'Understanding containers and Docker basics.', 1, true),
  (6, 'Docker Images', 'Building and using Docker images.', 2, true),
  (6, 'Docker Compose', 'Defining multi-container apps with Docker Compose.', 3, true),

  -- Kubernetes Basics
  (7, 'Kubernetes Overview', 'Introduction to Kubernetes.', 1, true),
  (7, 'Pods and Deployments', 'Understanding pods and deployments.', 2, true),
  (7, 'Services', 'Kubernetes Services and networking basics.', 3, true),

  -- SQL Fundamentals
  (8, 'What is SQL?', 'Introduction to SQL databases.', 1, true),
  (8, 'SELECT Queries', 'Writing basic SELECT queries.', 2, true),
  (8, 'Joins', 'Combining data from multiple tables.', 3, true),

  -- HTML & CSS Foundations
  (9, 'HTML Structure', 'Learn about HTML tags and structure.', 1, true),
  (9, 'CSS Basics', 'Styling with CSS.', 2, true),
  (9, 'Layout Techniques', 'Flexbox, Grid, and modern layout methods.', 3, true),

  -- DevOps Introduction
  (10, 'What is DevOps?', 'Understanding DevOps principles.', 1, true),
  (10, 'CI/CD', 'Continuous integration and delivery.', 2, true),
  (10, 'Monitoring', 'Basics of system and application monitoring.', 3, true),

  -- Node.js Quickstart
  (11, 'Node.js Overview', 'What is Node.js and where to use it?', 1, true),
  (11, 'npm & Modules', 'Using npm and managing modules.', 2, true),
  (11, 'Asynchronous JS', 'Callbacks, Promises, and async/await.', 3, true),

  -- Git & GitHub
  (12, 'Git Basics', 'Version control with Git.', 1, true),
  (12, 'Branching', 'Working with branches.', 2, true),
  (12, 'Using GitHub', 'Collaborating with GitHub.', 3, true),

  -- TypeScript in Depth
  (13, 'TypeScript Basics', 'What is TypeScript and why use it?', 1, true),
  (13, 'Types', 'Understanding types in TypeScript.', 2, true),
  (13, 'Interfaces & Classes', 'Object-oriented programming in TS.', 3, true),

  -- REST API Design
  (14, 'REST Principles', 'What makes an API RESTful?', 1, true),
  (14, 'Endpoints & Methods', 'Designing endpoints and using HTTP methods.', 2, true),
  (14, 'Status Codes', 'Using correct status codes.', 3, true),

  -- Testing with JUnit
  (15, 'Introduction to JUnit', 'Getting started with unit testing in Java.', 1, true),
  (15, 'Annotations', 'Understanding JUnit annotations.', 2, true),
  (15, 'Assertions', 'Writing and using assertions.', 3, true);


-- ENROLLMENTS (ENROLLED_AT, RESOURCE_ID, USER_ID)
-- Angular Fundamentals (resource 1), sections 1–4
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 09:00:00', 1, (SELECT id FROM users WHERE email = 'mujo@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 09:10:00', 1, (SELECT id FROM users WHERE email = 'user1@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 09:15:00', 1, (SELECT id FROM users WHERE email = 'user2@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 09:20:00', 1, (SELECT id FROM users WHERE email = 'user3@test.com'));

-- Spring Boot Guide (resource 2), sections 5–8
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 09:25:00', 2, (SELECT id FROM users WHERE email = 'user4@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 09:30:00', 2, (SELECT id FROM users WHERE email = 'user5@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 09:35:00', 2, (SELECT id FROM users WHERE email = 'user6@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 09:40:00', 2, (SELECT id FROM users WHERE email = 'user7@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 09:45:00', 2, (SELECT id FROM users WHERE email = 'mujo@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 09:50:00', 2, (SELECT id FROM users WHERE email = 'user1@test.com'));

-- React Essentials (resource 3), sections 9–11
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 10:00:00', 3, (SELECT id FROM users WHERE email = 'user8@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 10:05:00', 3, (SELECT id FROM users WHERE email = 'user9@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 10:10:00', 3, (SELECT id FROM users WHERE email = 'user10@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 10:15:00', 3, (SELECT id FROM users WHERE email = 'mujo@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 10:20:00', 3, (SELECT id FROM users WHERE email = 'user1@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 10:25:00', 3, (SELECT id FROM users WHERE email = 'user2@test.com'));
INSERT INTO enrollments (enrolled_at, resource_id, user_id) VALUES ('2025-05-28 10:30:00', 3, (SELECT id FROM users WHERE email = 'user5@test.com'));

-- Section Likes 
INSERT INTO section_like (id, user_id, section_id) VALUES
-- Angular sections likes (sections 1-4)
(1001, (SELECT id FROM users WHERE email = 'mujo@test.com' AND role = 'USER'), 1),
(1002, (SELECT id FROM users WHERE email = 'user1@test.com'), 2),
(1003, (SELECT id FROM users WHERE email = 'user2@test.com'), 3),
(1004, (SELECT id FROM users WHERE email = 'user3@test.com'), 4),
-- Spring Boot sections likes (sections 5-8)
(1005, (SELECT id FROM users WHERE email = 'user4@test.com'), 5),
(1006, (SELECT id FROM users WHERE email = 'user5@test.com'), 6),
(1007, (SELECT id FROM users WHERE email = 'user6@test.com'), 7),
(1008, (SELECT id FROM users WHERE email = 'user7@test.com'), 8),
-- React sections likes (sections 9-11)
(1009, (SELECT id FROM users WHERE email = 'user8@test.com'), 9),
(1010, (SELECT id FROM users WHERE email = 'user9@test.com'), 10),
(1011, (SELECT id FROM users WHERE email = 'user10@test.com'), 11),
-- Additional likes for popular sections
(1012, (SELECT id FROM users WHERE email = 'mujo@test.com' AND role = 'USER'), 5),
(1013, (SELECT id FROM users WHERE email = 'user1@test.com'), 9),
(1014, (SELECT id FROM users WHERE email = 'user2@test.com'), 10),
(1015, (SELECT id FROM users WHERE email = 'user3@test.com'), 11),
(1016, (SELECT id FROM users WHERE email = 'mujo@test.com' AND role = 'USER'), 2),
(1017, (SELECT id FROM users WHERE email = 'mujo@test.com' AND role = 'USER'), 3);

-- Section Bookmarks
INSERT INTO section_bookmark (id, user_id, section_id) VALUES
-- Angular sections bookmarks
(2001, (SELECT id FROM users WHERE email = 'mujo@test.com'), 1),
(2002, (SELECT id FROM users WHERE email = 'user1@test.com'), 2),
(2003, (SELECT id FROM users WHERE email = 'user2@test.com'), 3),
-- Spring Boot sections bookmarks
(2004, (SELECT id FROM users WHERE email = 'user3@test.com'), 5),
(2005, (SELECT id FROM users WHERE email = 'user4@test.com'), 6),
-- React sections bookmarks
(2006, (SELECT id FROM users WHERE email = 'user5@test.com'), 9),
(2007, (SELECT id FROM users WHERE email = 'user6@test.com'), 10);

-- Section Comments
INSERT INTO section_comment (id, user_id, section_id, content, created_at) VALUES
(3001, (SELECT id FROM users WHERE email = 'mujo@test.com'), 1, 'Great introduction to Angular fundamentals!', '2025-06-01 10:00:00'),
(3002, (SELECT id FROM users WHERE email = 'user1@test.com'), 1, 'This helped me understand Angular better.', '2025-06-01 10:30:00'),
(3003, (SELECT id FROM users WHERE email = 'user2@test.com'), 2, 'The Components section is very detailed.', '2025-06-01 11:00:00'),
(3004, (SELECT id FROM users WHERE email = 'user3@test.com'), 5, 'Spring Boot explanation is clear and concise.', '2025-06-01 11:30:00'),
(3005, (SELECT id FROM users WHERE email = 'user4@test.com'), 6, 'Great examples in the Spring Boot project section!', '2025-06-01 12:00:00'),
(3006, (SELECT id FROM users WHERE email = 'user5@test.com'), 9, 'React overview is very helpful for beginners.', '2025-06-01 12:30:00'),
(3007, (SELECT id FROM users WHERE email = 'user6@test.com'), 10, 'JSX explanation could use more examples.', '2025-06-01 13:00:00');

-- Section Notes
INSERT INTO section_note (id, user_id, section_id, note_content) VALUES
(4001, (SELECT id FROM users WHERE email = 'mujo@test.com'), 1, 'Remember to review Angular CLI commands'),
(4002, (SELECT id FROM users WHERE email = 'user1@test.com'), 2, 'Key points about component lifecycle hooks: ngOnInit, ngOnDestroy'),
(4003, (SELECT id FROM users WHERE email = 'user2@test.com'), 3, 'Different types of data binding in Angular: [], (), [()]'),
(4004, (SELECT id FROM users WHERE email = 'user3@test.com'), 5, 'Spring Boot starters and their purposes'),
(4005, (SELECT id FROM users WHERE email = 'user4@test.com'), 6, 'Steps to create a new Spring Boot project with dependencies'),
(4006, (SELECT id FROM users WHERE email = 'user5@test.com'), 9, 'React components vs elements - key differences'),
(4007, (SELECT id FROM users WHERE email = 'user6@test.com'), 10, 'JSX syntax rules and conventions to remember');

