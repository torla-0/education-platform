-- Kreiranje tabele za teme (npr. Angular, Java...)
CREATE TABLE quiz_topic (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Kreiranje tabele za pitanja
CREATE TABLE question (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    text VARCHAR(1000),
    correct_answer VARCHAR(500),
    topic_id BIGINT,
    CONSTRAINT fk_topic FOREIGN KEY (topic_id) REFERENCES quiz_topic(id)
);

-- Kreiranje tabele za ponuđene odgovore (vezano za pitanja)
CREATE TABLE question_options (
    question_id BIGINT,
    options VARCHAR(500),
    FOREIGN KEY (question_id) REFERENCES question(id)
);
