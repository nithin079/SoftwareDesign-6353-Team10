import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FuelQuoteComponent } from './fuel-quote.component';

describe('FuelQuoteComponent', () => {
  let component: FuelQuoteComponent;
  let fixture: ComponentFixture<FuelQuoteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FuelQuoteComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FuelQuoteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
