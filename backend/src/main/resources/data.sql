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
