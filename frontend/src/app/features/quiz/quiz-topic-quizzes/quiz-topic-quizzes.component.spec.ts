import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuizTopicQuizzesComponent } from './quiz-topic-quizzes.component';

describe('QuizTopicQuizzesComponent', () => {
  let component: QuizTopicQuizzesComponent;
  let fixture: ComponentFixture<QuizTopicQuizzesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [QuizTopicQuizzesComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(QuizTopicQuizzesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
