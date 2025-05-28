import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditLearningResourceComponent } from './edit-learning-resource.component';

describe('EditLearningResourceComponent', () => {
  let component: EditLearningResourceComponent;
  let fixture: ComponentFixture<EditLearningResourceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EditLearningResourceComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditLearningResourceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
