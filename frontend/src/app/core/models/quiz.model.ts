export interface QuestionOption {
  id: number;
  text: string;
  correct: boolean;
}

export interface Question {
  id: number;
  text: string;
  options: QuestionOption[];
  selectedAnswer?: QuestionOption;
}

export interface QuizTopic {
  id: number;
  name: string;
  questions: Question[];
}

export interface Quiz {
  id: number;
  title: string;
  topic: QuizTopic;
  questions: Question[];
}
