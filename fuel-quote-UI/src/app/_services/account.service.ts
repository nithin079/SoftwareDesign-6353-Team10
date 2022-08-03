import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { map, finalize } from 'rxjs/operators';

import { environment } from '@environments/environment';
import { Account, FuelQuote, LoginRequestModel } from '@app/_models';

const baseUrl = `${environment.apiUrl}/Clients`;

@Injectable({ providedIn: 'root' })
export class AccountService {
    private accountSubject: BehaviorSubject<Account>;
    public account: Observable<Account>;

    constructor(
        private router: Router,
        private http: HttpClient
    ) {
        this.accountSubject = new BehaviorSubject<Account>(null);
        this.account = this.accountSubject.asObservable();
        
    }

    public get accountValue(): Account {
        return this.accountSubject.value;
    }

    login(loginRequestModel: LoginRequestModel) {
        return this.http.post<any>(`${baseUrl}/authenticate`, loginRequestModel)
            .pipe(map(account => {
                this.accountSubject.next(account.Result);
                return account;
            }));
    }

    logout() {
        this.accountSubject.next(null);
        this.router.navigate(['/account/login']);
    }

    register(account: Account) {
        return this.http.post(`${baseUrl}/register`, account);
    }

    update(params) {
        return this.http.post(`${baseUrl}/update`, params)
            .pipe(map((account: any) => {
            console.log('account :', account);
                // update the current account if it was updated
                if (account.id === this.accountValue.Id) {
                    account = { ...this.accountValue, ...account };
                    this.accountSubject.next(account);
                }
                return account;
            }));
    }

}