-- Ubacivanje tema
INSERT INTO quiz_topic (id, name) VALUES 
(1, 'Angular'), 
(2, 'Java');

-- Pitanja
INSERT INTO question (id, text, correct_answer, topic_id) VALUES 
(1, 'Šta radi @Input dekorator u Angularu?', 'Dekorator za primanje vrijednosti iz parent komponente', 1),
(2, 'Šta predstavlja ključnu riječ "class" u Javi?', 'Definisanje klase', 2);

-- Opcije za pitanje 1 (Angular)
INSERT INTO question_options (question_id, options) VALUES 
(1, 'Dekorator za primanje vrijednosti iz parent komponente'),
(1, 'Funkcija za slanje podataka u bazu'),
(1, 'CSS stil koji se primjenjuje na roditelja'),
(1, 'Metoda za lifecycle hook');

-- Opcije za pitanje 2 (Java)
INSERT INTO question_options (question_id, options) VALUES 
(2, 'Petlja koja ponavlja kod'),
(2, 'Definisanje klase'),
(2, 'Zauzimanje memorije'),
(2, 'Deklaracija varijable');
