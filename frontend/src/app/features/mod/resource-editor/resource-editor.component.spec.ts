import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ResourceEditorComponent } from './resource-editor.component';

describe('ResourceEditorComponent', () => {
  let component: ResourceEditorComponent;
  let fixture: ComponentFixture<ResourceEditorComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ResourceEditorComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ResourceEditorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
