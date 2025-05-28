import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddLearningResourceComponent } from './add-learning-resource.component';

describe('AddLearningResourceComponent', () => {
  let component: AddLearningResourceComponent;
  let fixture: ComponentFixture<AddLearningResourceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AddLearningResourceComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AddLearningResourceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
