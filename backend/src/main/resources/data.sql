-- Topics
INSERT INTO quiz_topic  (name) VALUES 
('Angular'), 
('Java'), 
('React'),
('Python'),
('C++'),
('SQL'),
('Spring Boot'),
('HTML & CSS'),
('Git & GitHub'),
('Linux CLI');

-- Quizzes
INSERT INTO quiz (title, topic_id, published, total_questions, created_at, updated_at) VALUES
('Angular Basics Quiz', 1, true, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Java Fundamentals Quiz', 2, false, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('React Essentials Quiz', 3, true, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Python Essentials Quiz', 4, true, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('C++ Basics Quiz', 5, false, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),('SQL Fundamentals Quiz', 6, true, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Spring Boot Quiz', 7, true, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('HTML & CSS Basics Quiz', 8, false, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Git & GitHub Quiz', 9, true, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Linux CLI Quiz', 10, false, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Questions 
INSERT INTO question (text, topic_id, quiz_id) VALUES
('@Input decorator in Angular is used for?', 1, 1),
('What is Angular CLI used for?', 1, 1),
('Which directive is used to conditionally include a template?', 1, 1),
('What is the purpose of NgModule?', 1, 1),
('Which lifecycle hook is called after the component’s view has been fully initialized?', 1, 1),
('What is the default change detection strategy in Angular?', 1, 1),
('What does [(ngModel)] represent?', 1, 1),
('How can you create a service in Angular?', 1, 1),
('Which decorator is used to define a component?', 1, 1),
('What is the role of HttpClient in Angular?', 1, 1),
('What does the "class" keyword define in Java?', 2, 2),
('Which method is the entry point of any Java program?', 2, 2),
('What is the default value of a boolean in Java?', 2, 2),
('What does JVM stand for?', 2, 2),
('Which keyword is used to inherit a class in Java?', 2, 2),
('What is method overloading?', 2, 2),
('Which exception is thrown when array index is out of bounds?', 2, 2),
('Which access modifier makes a member visible only within its own class?', 2, 2),
('What is the size of int in Java?', 2, 2),
('What does ''final'' keyword mean for a variable?', 2, 2),
('What is JSX in React?', 3, 3),
('Which hook is used for state management?', 3, 3),
('How do you pass data to child components?', 3, 3),
('What is the purpose of useEffect?', 3, 3),
('What is a key in React list rendering?', 3, 3),
('What is a controlled component in React?', 3, 3),
('Which method is used to render components to the DOM?', 3, 3),
('How can you handle forms in React?', 3, 3),
('What is the purpose of React Router?', 3, 3),
('What is virtual DOM?', 3, 3);

-- Python Questions
INSERT INTO question (text, topic_id, quiz_id) VALUES
('What is the output of print(2 ** 3)?', 4, 4),
('Which keyword is used to define a function in Python?', 4, 4),
('What is the output of len(''Hello'')?', 4, 4),
('What is a list in Python?', 4, 4),
('How do you start a comment in Python?', 4, 4),
('Which of these is a valid variable name?', 4, 4),
('What does the \''in\'' keyword do?', 4, 4),
('Which built-in function returns the type of a variable?', 4, 4),
('What is the result of 10 // 3?', 4, 4),
('What is the correct file extension for Python files?', 4, 4);

-- SQL Questions
INSERT INTO question (text, topic_id, quiz_id) VALUES
('Which SQL statement is used to retrieve data from a database?', 6, 6),
('What does the WHERE clause do in SQL?', 6, 6),
('Which SQL keyword is used to sort the result-set?', 6, 6),
('What is the default sorting order of ORDER BY?', 6, 6),
('Which SQL statement is used to insert new data?', 6, 6),
('What is a primary key?', 6, 6),
('Which SQL clause is used to group rows?', 6, 6),
('What does COUNT(*) do?', 6, 6),
('How do you remove duplicates in a SELECT statement?', 6, 6),
('Which command removes all records but not the table?', 6, 6);

-- C++ Questions
INSERT INTO question (text, topic_id, quiz_id) VALUES
('Which of the following is used to define a constant in C++?', 5, 5),
('Which operator is used for dynamic memory allocation in C++?', 5, 5),
('Which header file is needed to use cout?', 5, 5),
('Which keyword is used to define a class in C++?', 5, 5),
('What does the delete operator do?', 5, 5),
('Which of these is a correct for loop syntax in C++?', 5, 5),
('Which symbol is used for a single-line comment in C++?', 5, 5),
('Which function is the entry point in a C++ program?', 5, 5),
('What is the output type of sizeof() operator?', 5, 5),
('Which keyword is used to inherit a class?', 5, 5);

-- Spring Boot Questions
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which annotation is used to mark a Spring Boot application entry point?', 7, 7);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What is the default embedded server in Spring Boot?', 7, 7);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which annotation is used for REST controllers?', 7, 7);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What does @Autowired do in Spring Boot?', 7, 7);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('How do you define a bean in Spring Boot?', 7, 7);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which file is commonly used for Spring Boot configuration?', 7, 7);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What is the use of application.properties?', 7, 7);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What port does Spring Boot run on by default?', 7, 7);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What is Spring Boot Starter?', 7, 7);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which annotation maps a method to a GET request?', 7, 7);

-- HTML & CSS Questions 
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which tag defines a hyperlink in HTML?', 8, 8);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('How do you add a comment in HTML?', 8, 8);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What does CSS stand for?', 8, 8);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which CSS property sets the background color?', 8, 8);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('How do you select all &lt;p&gt; tags in CSS?', 8, 8);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which tag defines a table row?', 8, 8);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What is the default display property of a div?', 8, 8);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('How do you center a block element in CSS?', 8, 8);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which HTML tag is used for the largest heading?', 8, 8);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('How do you link an external CSS file?', 8, 8);

-- Git & GitHub Questions
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which command initializes a Git repository?', 9, 9);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which command shows commit history?', 9, 9);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What is a branch in Git?', 9, 9);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which command creates a new branch?', 9, 9);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which command is used to merge branches?', 9, 9);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What does git clone do?', 9, 9);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What is the command to stage changes?', 9, 9);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What does .gitignore do?', 9, 9);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What does git pull do?', 9, 9);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What does git remote -v show?', 9, 9);

-- Linux CLI Questions
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which command lists all files including hidden ones?', 10, 10);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('How do you change directory in Linux?', 10, 10);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What is the command to create a new file?', 10, 10);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which command shows the current path?', 10, 10);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('How do you copy a file?', 10, 10);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which command is used to delete a file?', 10, 10);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What does the "chmod" command do?', 10, 10);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('Which command shows running processes?', 10, 10);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('What is the superuser command in Linux?', 10, 10);
INSERT INTO question (text, topic_id, quiz_id) VALUES ('How do you clear the terminal screen?', 10, 10);

-- Options for Angular Question
INSERT INTO question_option (text, is_correct, question_id) VALUES
('To receive values from a parent component', TRUE, 1),
('To send data to the database', FALSE, 1),
('To apply CSS to parent', FALSE, 1),
('A lifecycle method', FALSE, 1),
('To scaffold Angular projects', TRUE, 2),
('To install Node.js', FALSE, 2),
('To compile Java code', FALSE, 2),
('To write HTML templates', FALSE, 2),
('*ngIf', TRUE, 3),
('*ngFor', FALSE, 3),
('ngModel', FALSE, 3),
('ngSwitch', FALSE, 3),
('To define a module that contains components, services, etc.', TRUE, 4),
('To declare routes', FALSE, 4),
('To create forms', FALSE, 4),
('To handle HTTP requests', FALSE, 4),
('ngAfterViewInit', TRUE, 5),
('ngOnInit', FALSE, 5),
('ngDestroy', FALSE, 5),
('ngDoCheck', FALSE, 5),
('Default', TRUE, 6),
('OnPush', FALSE, 6),
('Manual', FALSE, 6),
('Detached', FALSE, 6),
('Two-way data binding', TRUE, 7),
('One-way binding', FALSE, 7),
('A directive', FALSE, 7),
('A CSS class', FALSE, 7),
('Using ng generate service', TRUE, 8),
('Writing a controller', FALSE, 8),
('Importing a pipe', FALSE, 8),
('Using a directive', FALSE, 8),
('@Component', TRUE, 9),
('@Injectable', FALSE, 9),
('@NgModule', FALSE, 9),
('@Directive', FALSE, 9),
('To perform HTTP requests', TRUE, 10),
('To manipulate DOM', FALSE, 10),
('To create forms', FALSE, 10),
('To route URLs', FALSE, 10);

-- Options for Java Questions
INSERT INTO question_option (text, is_correct, question_id) VALUES
('Defines a class', TRUE, 11),
('Starts a loop', FALSE, 11),
('Allocates memory', FALSE, 11),
('Initializes a variable', FALSE, 11),
('main method', TRUE, 12),
('start method', FALSE, 12),
('run method', FALSE, 12),
('init method', FALSE, 12),
('false', TRUE, 13),
('true', FALSE, 13),
('null', FALSE, 13),
('0', FALSE, 13),
('Java Virtual Machine', TRUE, 14),
('Java Variable Manager', FALSE, 14),
('Just-in-time Version Mapper', FALSE, 14),
('Java Vendor Module', FALSE, 14),
('extends', TRUE, 15),
('implements', FALSE, 15),
('inherits', FALSE, 15),
('super', FALSE, 15),
('Multiple methods with same name but different parameters', TRUE, 16),
('Overriding a method in subclass', FALSE, 16),
('Calling a superclass constructor', FALSE, 16),
('Using default constructor', FALSE, 16),
('ArrayIndexOutOfBoundsException', TRUE, 17),
('NullPointerException', FALSE, 17),
('ClassCastException', FALSE, 17),
('IOException', FALSE, 17),
('private', TRUE, 18),
('protected', FALSE, 18),
('public', FALSE, 18),
('default', FALSE, 18),
('32 bits', TRUE, 19),
('64 bits', FALSE, 19),
('16 bits', FALSE, 19),
('8 bits', FALSE, 19),
('It cannot be changed once assigned', TRUE, 20),
('It is a global variable', FALSE, 20),
('It can be reassigned once', FALSE, 20),
('It must be static', FALSE, 20);

-- Options for React Questions
INSERT INTO question_option (text, is_correct, question_id) VALUES
('A syntax extension for JavaScript', TRUE, 21),
('A CSS preprocessor', FALSE, 21),
('A type checker', FALSE, 21),
('A server-side language', FALSE, 21),
('useState', TRUE, 22),
('useEffect', FALSE, 22),
('useRef', FALSE, 22),
('useContext', FALSE, 22),
('Using props', TRUE, 23),
('Using state', FALSE, 23),
('Using Redux', FALSE, 23),
('Using context', FALSE, 23),
('To perform side effects in function components', TRUE, 24),
('To store data persistently', FALSE, 24),
('To render JSX', FALSE, 24),
('To create routes', FALSE, 24),
('A unique identifier for list elements', TRUE, 25),
('A CSS class name', FALSE, 25),
('A DOM reference', FALSE, 25),
('A prop value', FALSE, 25),
('Component whose input is controlled by React state', TRUE, 26),
('Component using props only', FALSE, 26),
('Component that fetches API data', FALSE, 26),
('Component that uses useEffect', FALSE, 26),
('ReactDOM.render()', TRUE, 27),
('renderComponent()', FALSE, 27),
('useRender()', FALSE, 27),
('createDOM()', FALSE, 27),
('By using controlled components with state', TRUE, 28),
('By editing HTML files', FALSE, 28),
('By using jQuery', FALSE, 28),
('By calling event.preventDefault()', FALSE, 28),
('To manage navigation and routing in single-page apps', TRUE, 29),
('To manage component state', FALSE, 29),
('To style components', FALSE, 29),
('To fetch API data', FALSE, 29),
('A lightweight copy of the actual DOM', TRUE, 30),
('A part of Node.js', FALSE, 30),
('A feature of CSS-in-JS', FALSE, 30),
('A JavaScript array', FALSE, 30);

-- Options for Python Questions
INSERT INTO question_option (text, is_correct, question_id) VALUES
('6', FALSE, 31),
('8', TRUE, 31),
('9', FALSE, 31),
('2', FALSE, 31),
('func', FALSE, 32),
('define', FALSE, 32),
('def', TRUE, 32),
('function', FALSE, 32),
('5', TRUE, 33),
('4', FALSE, 33),
('6', FALSE, 33),
('None', FALSE, 33),
('A mutable sequence', TRUE, 34),
('An immutable dictionary', FALSE, 34),
('A type of loop', FALSE, 34),
('A keyword', FALSE, 34),
('// comment', FALSE, 35),
('/* comment */', FALSE, 35),
('# comment', TRUE, 35),
('<!-- comment -->', FALSE, 35),
('2variable', FALSE, 36),
('variable_name', TRUE, 36),
('variable-name', FALSE, 36),
('class', FALSE, 36),
('Checks for membership', TRUE, 37),
('Initializes a variable', FALSE, 37),
('Imports a module', FALSE, 37),
('Terminates a loop', FALSE, 37),
('typeof()', FALSE, 38),
('type()', TRUE, 38),
('varType()', FALSE, 38),
('getType()', FALSE, 38),
('3.33', FALSE, 39),
('3', TRUE, 39),
('4', FALSE, 39),
('Error', FALSE, 39),
('.python', FALSE, 40),
('.py', TRUE, 40),
('.pt', FALSE, 40),
('.pyc', FALSE, 40);

-- Options for SQL Questions
INSERT INTO question_option (text, is_correct, question_id) VALUES
('SELECT', TRUE, 51),
('GET', FALSE, 51),
('EXTRACT', FALSE, 51),
('FETCH', FALSE, 51),
('Filters records', TRUE, 52),
('Sorts records', FALSE, 52),
('Deletes records', FALSE, 52),
('Updates records', FALSE, 52),
('ORDER BY', TRUE, 53),
('SORT BY', FALSE, 53),
('GROUP BY', FALSE, 53),
('ARRANGE BY', FALSE, 53),
('Ascending', TRUE, 54),
('Descending', FALSE, 54),
('Random', FALSE, 54),
('Grouped', FALSE, 54),
('INSERT INTO', TRUE, 55),
('ADD', FALSE, 55),
('UPDATE', FALSE, 55),
('CREATE', FALSE, 55),
('A unique identifier for each row', TRUE, 56),
('A foreign key reference', FALSE, 56),
('An index for fast access', FALSE, 56),
('A duplicate column', FALSE, 56),
('GROUP BY', TRUE, 57),
('ORDER BY', FALSE, 57),
('JOIN', FALSE, 57),
('HAVING', FALSE, 57),
('Counts all rows', TRUE, 58),
('Counts only NULLs', FALSE, 58),
('Counts distinct values', FALSE, 58),
('Counts foreign keys', FALSE, 58),
('DISTINCT', TRUE, 59),
('UNIQUE', FALSE, 59),
('NO DUPLICATES', FALSE, 59),
('REMOVE DUPLICATES', FALSE, 59),
('DELETE', FALSE, 60),
('DROP', FALSE, 60),
('TRUNCATE', TRUE, 60),
('CLEAR', FALSE, 60);

-- C++ (Quiz 5)
INSERT INTO question_option (text, is_correct, question_id) VALUES
('#define', TRUE, 61),
('const()', FALSE, 61),
('int const', FALSE, 61),
('define()', FALSE, 61),
('malloc', FALSE, 62),
('new', TRUE, 62),
('allocate()', FALSE, 62),
('calloc', FALSE, 62),
('<iostream>', TRUE, 63),
('<stdio.h>', FALSE, 63),
('<stdlib.h>', FALSE, 63),
('<string>', FALSE, 63),
('class', TRUE, 64),
('object', FALSE, 64),
('define', FALSE, 64),
('method', FALSE, 64),
('Frees memory allocated by new', TRUE, 65),
('Creates a pointer', FALSE, 65),
('Initializes memory', FALSE, 65),
('Deletes a class', FALSE, 65),
('for(int i=0; i<10; i++)', TRUE, 66),
('foreach i in range(10)', FALSE, 66),
('loop i = 1 to 10', FALSE, 66),
('repeat 10 times', FALSE, 66),
('//', TRUE, 67),
('##', FALSE, 67),
('#', FALSE, 67),
('--', FALSE, 67),
('main()', TRUE, 68),
('start()', FALSE, 68),
('init()', FALSE, 68),
('launch()', FALSE, 68),
('size_t', TRUE, 69),
('int', FALSE, 69),
('bool', FALSE, 69),
('float', FALSE, 69),
('public', TRUE, 70),
('inherits', FALSE, 70),
('extends', FALSE, 70),
('super', FALSE, 70);

-- HTML & CSS (Quiz 8)
INSERT INTO question_option (text, is_correct, question_id) VALUES
('<a>', TRUE, 81),
('<link>', FALSE, 81),
('<href>', FALSE, 81),
('<url>', FALSE, 81),

('<!-- comment -->', TRUE, 82),
('// comment', FALSE, 82),
('# comment', FALSE, 82),
('/* comment */', FALSE, 82),

('Cascading Style Sheets', TRUE, 83),
('Computer Style Syntax', FALSE, 83),
('Creative Sheet System', FALSE, 83),
('Color Style Syntax', FALSE, 83),

('background-color', TRUE, 84),
('bgcolor', FALSE, 84),
('color-background', FALSE, 84),
('bg-style', FALSE, 84),

('p', TRUE, 85),
('*p', FALSE, 85),
('paragraph', FALSE, 85),
('#p', FALSE, 85),

('<tr>', TRUE, 86),
('<td>', FALSE, 86),
('<table>', FALSE, 86),
('<row>', FALSE, 86),

('block', TRUE, 87),
('inline', FALSE, 87),
('flex', FALSE, 87),
('grid', FALSE, 87),

('margin: 0 auto;', TRUE, 88),
('align: center;', FALSE, 88),
('text-align: middle;', FALSE, 88),
('center: true;', FALSE, 88),

('<h1>', TRUE, 89),
('<heading>', FALSE, 89),
('<head>', FALSE, 89),
('<title>', FALSE, 89),

('<link rel="stylesheet" href="style.css">', TRUE, 90),
('<style src="style.css">', FALSE, 90),
('<css href="style.css">', FALSE, 90),
('<script src="style.css">', FALSE, 90);

-- Git & GitHub (Quiz 9)
INSERT INTO question_option (text, is_correct, question_id) VALUES
('git init', TRUE, 91),
('git start', FALSE, 91),
('git begin', FALSE, 91),
('git new', FALSE, 91),

('git log', TRUE, 92),
('git history', FALSE, 92),
('git commits', FALSE, 92),
('git status', FALSE, 92),

('A pointer to a specific commit', TRUE, 93),
('A backup of your repo', FALSE, 93),
('A remote copy', FALSE, 93),
('A merged state', FALSE, 93),

('git branch <name>', TRUE, 94),
('git new <branch>', FALSE, 94),
('git create branch', FALSE, 94),
('git init-branch', FALSE, 94),

('git merge', TRUE, 95),
('git combine', FALSE, 95),
('git join', FALSE, 95),
('git mix', FALSE, 95),

('Clones a remote repo to your machine', TRUE, 96),
('Deletes a branch', FALSE, 96),
('Shows commit log', FALSE, 96),
('Pushes changes to remote', FALSE, 96),

('git add', TRUE, 97),
('git stage', FALSE, 97),
('git commit', FALSE, 97),
('git push', FALSE, 97),

('Specifies files to ignore in the repo', TRUE, 98),
('Adds files to staging', FALSE, 98),
('Sets remote URL', FALSE, 98),
('Hides files from git log', FALSE, 98),

('Downloads and merges remote changes', TRUE, 99),
('Pushes changes to remote', FALSE, 99),
('Creates a new branch', FALSE, 99),
('Commits changes', FALSE, 99),

('Shows configured remotes and URLs', TRUE, 100),
('Lists all local branches', FALSE, 100),
('Deletes remote branches', FALSE, 100),
('Clones a remote repo', FALSE, 100);

-- Linux CLI 
INSERT INTO question_option (text, is_correct, question_id) VALUES
('ls -a', TRUE, 101),
('ls', FALSE, 101),
('dir /hidden', FALSE, 101),
('showall', FALSE, 101),

('cd', TRUE, 102),
('chdir', FALSE, 102),
('goto', FALSE, 102),
('dir', FALSE, 102),

('touch', TRUE, 103),
('newfile', FALSE, 103),
('mkfile', FALSE, 103),
('create', FALSE, 103),

('pwd', TRUE, 104),
('whereami', FALSE, 104),
('path', FALSE, 104),
('cwd', FALSE, 104),

('cp', TRUE, 105),
('copy', FALSE, 105),
('duplicate', FALSE, 105),
('clone', FALSE, 105),

('rm', TRUE, 106),
('del', FALSE, 106),
('erase', FALSE, 106),
('delete', FALSE, 106),

('Changes file permissions', TRUE, 107),
('Changes file ownership', FALSE, 107),
('Changes file type', FALSE, 107),
('Opens file viewer', FALSE, 107),

('ps', TRUE, 108),
('listproc', FALSE, 108),
('jobs', FALSE, 108),
('procshow', FALSE, 108),

('sudo', TRUE, 109),
('admin', FALSE, 109),
('su', FALSE, 109),
('root', FALSE, 109),

('clear', TRUE, 110),
('clr', FALSE, 110),
('clean', FALSE, 110),
('reset', FALSE, 110);

-- Options for Question 71
INSERT INTO question_option (text, is_correct, question_id) VALUES
('@SpringBootApplication', TRUE, 71),
('@EnableAutoConfiguration', FALSE, 71),
('@ComponentScan', FALSE, 71),
('@Configuration', FALSE, 71),

-- Options for Question 72
('Tomcat', TRUE, 72),
('Jetty', FALSE, 72),
('Undertow', FALSE, 72),
('Netty', FALSE, 72),

-- Options for Question 73
('@RestController', TRUE, 73),
('@Controller', FALSE, 73),
('@Service', FALSE, 73),
('@Component', FALSE, 73),

-- Options for Question 74
('Injects a bean automatically by type', TRUE, 74),
('Starts the application', FALSE, 74),
('Maps HTTP requests', FALSE, 74),
('Configures application properties', FALSE, 74),

-- Options for Question 75
('Using @Bean annotation', TRUE, 75),
('Using @Value annotation', FALSE, 75),
('Using @ComponentScan', FALSE, 75),
('Using @EnableAutoConfiguration', FALSE, 75),

-- Options for Question 76
('application.properties', TRUE, 76),
('config.json', FALSE, 76),
('settings.xml', FALSE, 76),
('bootstrap.yml only', FALSE, 76),

-- Options for Question 77
('It defines application configuration properties', TRUE, 77),
('It defines database schema', FALSE, 77),
('It sets Java version', FALSE, 77),
('It initializes Spring context', FALSE, 77),

-- Options for Question 78
('8080', TRUE, 78),
('8000', FALSE, 78),
('9090', FALSE, 78),
('3306', FALSE, 78),

-- Options for Question 79
('A dependency that simplifies project setup', TRUE, 79),
('A plugin for logging', FALSE, 79),
('A built-in database', FALSE, 79),
('An annotation processor', FALSE, 79),

-- Options for Question 80
('@GetMapping', TRUE, 80),
('@RequestMapping(method = POST)', FALSE, 80),
('@PostMapping', FALSE, 80),
('@PutMapping', FALSE, 80);


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
