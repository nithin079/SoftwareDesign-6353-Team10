import { Component, OnInit } from '@angular/core';
import { ApiResponseModel, FuelQuote, FuelQuoteRequestModel } from '@app/_models';
import { AccountService, FuelQuoteService } from '@app/_services';

@Component({
  selector: 'app-fuel-history',
  templateUrl: './fuel-history.component.html',
  styleUrls: ['./fuel-history.component.less']
})
export class FuelHistoryComponent implements OnInit {
  products2: FuelQuote[];
  account = this.accountService.accountValue;
  constructor(private accountService: AccountService,
    private fuelQuoteService: FuelQuoteService) { }

  ngOnInit(): void {
    const fuelQouteMOdel = {
      ClientId: this.account.Id,
      RoleId: +this.account.Role
    } as FuelQuoteRequestModel;
    this.fuelQuoteService.GetHistory(fuelQouteMOdel)
    .subscribe((data: ApiResponseModel) => {
      if (data.StatusCode == 200) {
        this.products2 = data.Result;
      }
    })
  }
}
