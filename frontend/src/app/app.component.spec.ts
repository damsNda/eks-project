import { TestBed } from '@angular/core/testing';
import { AppComponent } from './app.component';

describe('AppComponent', () => {
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [
        AppComponent
      ],
    }).compileComponents();
  });



  it(`should have as title 'frontend'`, () => {
    expect('frontend').toEqual('frontend');
  });

 
});
