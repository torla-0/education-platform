import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ShowAllResourcesComponent } from './show-all-resources.component';

describe('ShowAllResourcesComponent', () => {
  let component: ShowAllResourcesComponent;
  let fixture: ComponentFixture<ShowAllResourcesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ShowAllResourcesComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ShowAllResourcesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
