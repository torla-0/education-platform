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
  topicId: number;
  topicName: string;
  published: boolean;
  createdAt: string;
  updatedAt: string;
}

// Create
export interface CreateQuiz {
  title: string;
  topicId: number;
  published: boolean;
}

export interface CreateQuestion {
  text: string;
  quizId: number;
  options: CreateQuestionOption[];
}

export interface CreateQuestionOption {
  text: string;
  correct: boolean;
}

// Update

export interface UpdateQuiz {
  title?: string;
  topicId?: number;
  published?: boolean;
}

export interface UpdateQuestion {
  text?: string;
  options?: UpdateQuestionOption[];
}

export interface UpdateQuestionOption {
  id: number;
  text?: string;
  correct?: boolean;
}
