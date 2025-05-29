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

-- Dummy users for pagination testing
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

--- Dummy learning resources
INSERT INTO learning_resources (title, url, author_email, status, created_at, updated_at)
VALUES
  ('Angular Fundamentals', 'https://angular.dev/docs/fundamentals', 'mod@test.com', 'PUBLISHED', '2024-05-01T09:00:00Z', '2024-05-01T09:00:00Z'),
  ('Spring Boot Guide', 'https://spring.io/guides', 'mod2@email.com', 'PUBLISHED', '2024-05-02T10:00:00Z', '2024-05-02T10:00:00Z'),
  ('React Essentials', 'https://react.dev/learn', 'mod@test.com', 'DRAFT', '2024-05-03T11:00:00Z', '2024-05-03T11:00:00Z');

-- Tags for resources (resource_id references learning_resources.id)
INSERT INTO resource_tags (resource_id, tag)
VALUES
  (1, 'angular'),
  (1, 'frontend'),
  (2, 'spring'),
  (2, 'backend'),
  (3, 'react'),
  (3, 'javascript');
