import { ComponentFixture, TestBed } from '@angular/core/testing';

import { StackViewerComponent } from './stack-viewer.component';

describe('StackViewerComponent', () => {
  let component: StackViewerComponent;
  let fixture: ComponentFixture<StackViewerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [StackViewerComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(StackViewerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
