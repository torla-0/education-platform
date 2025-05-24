-- Ubacivanje tema
INSERT INTO quiz_topic (id, name) VALUES 
(1, 'Angular'), 
(2, 'Java');

-- Ubacivanje pitanja
INSERT INTO question (id, text, correct_answer, topic_id) VALUES 
(1, 'Šta radi @Input dekorator u Angularu?', 'Dekorator za primanje vrijednosti iz parent komponente', 1),
(2, 'Šta predstavlja ključnu riječ "class" u Javi?', 'Definisanje klase', 2);

-- Opcije za pitanje 1
INSERT INTO question_option (id, text, question_id) VALUES
(1, 'Dekorator za primanje vrijednosti iz parent komponente', 1),
(2, 'Funkcija za slanje podataka u bazu', 1),
(3, 'CSS stil koji se primjenjuje na roditelja', 1),
(4, 'Metoda za lifecycle hook', 1);

-- Opcije za pitanje 2
INSERT INTO question_option (id, text, question_id) VALUES
(5, 'Petlja koja ponavlja kod', 2),
(6, 'Definisanje klase', 2),
(7, 'Zauzimanje memorije', 2),
(8, 'Deklaracija varijable', 2);

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
