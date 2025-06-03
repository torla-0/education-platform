-- Topics
INSERT INTO quiz_topic (id, name) VALUES 
(1, 'Angular'), 
(2, 'Java'), 
(3, 'React');

-- Quizzes
INSERT INTO quiz (id, title, topic_id) VALUES
(1, 'Angular Basics Quiz', 1),
(2, 'Java Fundamentals Quiz', 2),
(3, 'React Essentials Quiz', 3);

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
INSERT INTO learning_resources (title, url, author_email, status, created_at, updated_at)
VALUES
  ('Angular Fundamentals', 'https://angular.dev/docs/fundamentals', 'mod@test.com', 'PUBLISHED', '2024-05-01T09:00:00Z', '2024-05-01T09:00:00Z'),
  ('Spring Boot Guide', 'https://spring.io/guides', 'mod2@email.com', 'PUBLISHED', '2024-05-02T10:00:00Z', '2024-05-02T10:00:00Z'),
  ('React Essentials', 'https://react.dev/learn', 'mod@test.com', 'DRAFT', '2024-05-03T11:00:00Z', '2024-05-03T11:00:00Z'),
  ('JavaScript Basics', 'https://javascript.info', 'mod2@email.com', 'PUBLISHED', '2024-05-04T13:30:00Z', '2024-05-04T13:30:00Z'),
  ('Python Crash Course', 'https://docs.python.org/3/tutorial/', 'mod@test.com', 'PUBLISHED', '2024-05-05T10:20:00Z', '2024-05-05T10:20:00Z'),
  ('Docker for Beginners', 'https://docker-curriculum.com/', 'mod3@email.com', 'PUBLISHED', '2024-05-06T08:15:00Z', '2024-05-06T08:15:00Z'),
  ('Kubernetes Basics', 'https://kubernetes.io/docs/tutorials/', 'mod3@email.com', 'DRAFT', '2024-05-07T09:10:00Z', '2024-05-07T09:10:00Z'),
  ('SQL Fundamentals', 'https://www.sqltutorial.org/', 'mod2@email.com', 'PUBLISHED', '2024-05-08T07:00:00Z', '2024-05-08T07:00:00Z'),
  ('HTML & CSS Foundations', 'https://developer.mozilla.org/en-US/docs/Learn', 'mod@test.com', 'PUBLISHED', '2024-05-09T14:30:00Z', '2024-05-09T14:30:00Z'),
  ('DevOps Introduction', 'https://roadmap.sh/devops', 'mod3@email.com', 'PUBLISHED', '2024-05-10T16:30:00Z', '2024-05-10T16:30:00Z'),
  ('Node.js Quickstart', 'https://nodejs.dev/learn', 'mod2@email.com', 'PUBLISHED', '2024-05-11T11:30:00Z', '2024-05-11T11:30:00Z'),
  ('Git & GitHub', 'https://guides.github.com', 'mod@test.com', 'PUBLISHED', '2024-05-12T12:30:00Z', '2024-05-12T12:30:00Z'),
  ('TypeScript in Depth', 'https://www.typescriptlang.org/docs/', 'mod2@email.com', 'DRAFT', '2024-05-13T13:30:00Z', '2024-05-13T13:30:00Z'),
  ('REST API Design', 'https://restfulapi.net/', 'mod3@email.com', 'PUBLISHED', '2024-05-14T10:30:00Z', '2024-05-14T10:30:00Z'),
  ('Testing with JUnit', 'https://junit.org/junit5/docs/current/user-guide/', 'mod@test.com', 'PUBLISHED', '2024-05-15T12:30:00Z', '2024-05-15T12:30:00Z');

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

-- Sections for resources (resource_id, title, content, position)
INSERT INTO sections (resource_id, title, content, section_order) VALUES
  -- Angular Fundamentals
  (1, 'Introduction to Angular', 'Learn what Angular is and why it is used.', 1),
  (1, 'Components and Templates', 'How to build and compose components and templates.', 2),
  (1, 'Data Binding', 'Property binding, event binding, and two-way binding.', 3),
  (1, 'Directives and Pipes', 'Using built-in directives and pipes for dynamic behavior.', 4),

  -- Spring Boot Guide
  (2, 'Getting Started with Spring Boot', 'What is Spring Boot and why is it popular?', 1),
  (2, 'Creating Your First Project', 'How to use Spring Initializr.', 2),
  (2, 'Dependency Injection', 'Beans and dependency injection in Spring.', 3),
  (2, 'REST APIs', 'Building REST APIs with Spring Boot.', 4),

  -- React Essentials
  (3, 'React Overview', 'Introduction to React and its main concepts.', 1),
  (3, 'JSX and Rendering', 'How JSX works and how to render elements.', 2),
  (3, 'State and Props', 'Managing state and passing data using props.', 3),

  -- JavaScript Basics
  (4, 'JS Syntax', 'Learn the syntax of JavaScript.', 1),
  (4, 'Variables and Data Types', 'Working with variables and different data types.', 2),
  (4, 'Control Flow', 'if, else, switch, loops in JavaScript.', 3),

  -- Python Crash Course
  (5, 'Python Introduction', 'Intro to Python and its features.', 1),
  (5, 'Data Types & Variables', 'Understanding data types and variables in Python.', 2),
  (5, 'Control Structures', 'if, for, while, and other flow controls.', 3),

  -- Docker for Beginners
  (6, 'What is Docker?', 'Understanding containers and Docker basics.', 1),
  (6, 'Docker Images', 'Building and using Docker images.', 2),
  (6, 'Docker Compose', 'Defining multi-container apps with Docker Compose.', 3),

  -- Kubernetes Basics
  (7, 'Kubernetes Overview', 'Introduction to Kubernetes.', 1),
  (7, 'Pods and Deployments', 'Understanding pods and deployments.', 2),
  (7, 'Services', 'Kubernetes Services and networking basics.', 3),

  -- SQL Fundamentals
  (8, 'What is SQL?', 'Introduction to SQL databases.', 1),
  (8, 'SELECT Queries', 'Writing basic SELECT queries.', 2),
  (8, 'Joins', 'Combining data from multiple tables.', 3),

  -- HTML & CSS Foundations
  (9, 'HTML Structure', 'Learn about HTML tags and structure.', 1),
  (9, 'CSS Basics', 'Styling with CSS.', 2),
  (9, 'Layout Techniques', 'Flexbox, Grid, and modern layout methods.', 3),

  -- DevOps Introduction
  (10, 'What is DevOps?', 'Understanding DevOps principles.', 1),
  (10, 'CI/CD', 'Continuous integration and delivery.', 2),
  (10, 'Monitoring', 'Basics of system and application monitoring.', 3),

  -- Node.js Quickstart
  (11, 'Node.js Overview', 'What is Node.js and where to use it?', 1),
  (11, 'npm & Modules', 'Using npm and managing modules.', 2),
  (11, 'Asynchronous JS', 'Callbacks, Promises, and async/await.', 3),

  -- Git & GitHub
  (12, 'Git Basics', 'Version control with Git.', 1),
  (12, 'Branching', 'Working with branches.', 2),
  (12, 'Using GitHub', 'Collaborating with GitHub.', 3),

  -- TypeScript in Depth
  (13, 'TypeScript Basics', 'What is TypeScript and why use it?', 1),
  (13, 'Types', 'Understanding types in TypeScript.', 2),
  (13, 'Interfaces & Classes', 'Object-oriented programming in TS.', 3),

  -- REST API Design
  (14, 'REST Principles', 'What makes an API RESTful?', 1),
  (14, 'Endpoints & Methods', 'Designing endpoints and using HTTP methods.', 2),
  (14, 'Status Codes', 'Using correct status codes.', 3),

  -- Testing with JUnit
  (15, 'Introduction to JUnit', 'Getting started with unit testing in Java.', 1),
  (15, 'Annotations', 'Understanding JUnit annotations.', 2),
  (15, 'Assertions', 'Writing and using assertions.', 3);

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

