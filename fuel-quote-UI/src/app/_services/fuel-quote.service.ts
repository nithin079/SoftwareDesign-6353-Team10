import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { FuelQuote, FuelQuoteRequestModel } from '@app/_models';
import { environment } from '@environments/environment';

const baseUrl = `${environment.apiUrl}/FuelQuote`;
@Injectable({
  providedIn: 'root'
})
export class FuelQuoteService {

  constructor(private http: HttpClient) { }

  Add(fuelQuote: FuelQuote) {
    return this.http.post(`${baseUrl}/add`, fuelQuote);
  }

  GetHistory(fuelQuote: FuelQuoteRequestModel) {
    return this.http.post(`${baseUrl}/getHistory`, fuelQuote);
  }
}
