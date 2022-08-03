import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { APP_Constants } from '@app/_constants';
import { ApiResponseModel, FuelQuote, FuelQuoteRequestModel } from '@app/_models';
import { AccountService, AlertService, FuelQuoteService } from '@app/_services';
import { MessageService } from 'primeng/api';
import { first } from 'rxjs/operators';

@Component({
  selector: 'app-fuel-quote',
  templateUrl: './fuel-quote.component.html',
  styleUrls: ['./fuel-quote.component.less']
})
export class FuelQuoteComponent implements OnInit {
  form: FormGroup;
  loading = false;
  submitted = false;
  deleting = false;
  products2: FuelQuote[];
  quoteGenerated: boolean = false;
  constructor(
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private fuelQuoteService: FuelQuoteService,
    private accountService: AccountService,
    private messageService: MessageService
  ) { }
  account = this.accountService.accountValue;
  ngOnInit(): void {
    this.form = this.formBuilder.group({
      ClientId: [this.account.Id, Validators.required],
      GallonsRequested: ['', Validators.required],
      DiliveryAddress: ['', Validators.required],
      DeliveryDate: ['', Validators.required],
      SuggestedPrice: ['',],
      TotalAmountDue: ['',],
    });

    this.GETFuelHistory();
  }

  private GETFuelHistory() {
    const fuelQouteMOdel = {
      ClientId: this.account.Id,
      RoleId: +this.account.Role
    } as FuelQuoteRequestModel;
    this.fuelQuoteService.GetHistory(fuelQouteMOdel)
      .subscribe((data: ApiResponseModel) => {
        if (data.StatusCode == 200) {
          this.products2 = data.Result;
        }
      });
  }

  // convenience getter for easy access to form fields
  get f() { return this.form.controls; }

  onSubmit() {
    if (this.quoteGenerated) {
      this.submitted = true;
      if (this.form.invalid) {
        return;
      }
      this.loading = true;
      this.fuelQuoteService.Add(this.form.value)
        .pipe(first())
        .subscribe({
          next: (result: ApiResponseModel) => {
            this.loading = false;
            this.messageService.add({ severity: 'success', detail: 'Save successful' });
            this.router.navigate(['/admin/fuel-history'], { relativeTo: this.route });
          },
          error: error => {
            this.messageService.add({ severity: 'error', detail: error });
            this.loading = false;
          }
        });
    }
    else {
      this.messageService.add({ severity: 'error', detail: 'Please generate quote first' });
    }
  }
  GetQuote() {
    let Margin = 0;
    let totalPrice = 0;
    let LocationTax = 0;
    let HistoryFactor = 0;
    let GallonsRequested = 0;
    if (this.account.State == "TX") {
      LocationTax = APP_Constants.IN_TEXAS
    } else {
      LocationTax = APP_Constants.OUT_TEXAS
    }

    if (this.products2.length > 0) {
      HistoryFactor = APP_Constants.RATE_HISTORY
    }
    else {
      HistoryFactor = APP_Constants.RATE_HISTORY_NOTPRESENT
    }
    if (+this.form.value?.GallonsRequested > 1000) {
      GallonsRequested = APP_Constants.PER_GALLONS_MORE_THAN_1000
    }
    else {
      GallonsRequested = APP_Constants.PER_GALLONS_LESS_THAN_1000
    }
    Margin = +((LocationTax - HistoryFactor + GallonsRequested + APP_Constants.COMPANY_PROFIT) + APP_Constants.CURRENT_PRICE).toFixed(3);
    totalPrice = +(Margin * +this.form.value?.GallonsRequested).toFixed(3);

    this.form.patchValue({
      SuggestedPrice: Margin,
      TotalAmountDue: totalPrice
    });
    this.quoteGenerated = true;
  }
  GallonChanged() {
    if (this.quoteGenerated) {
      this.messageService.add({ severity: 'info', detail: 'Gallon value changed ! Regenerate the quote' });
      this.quoteGenerated = false;
    }
  }
}
