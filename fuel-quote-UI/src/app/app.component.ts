import { Component } from '@angular/core';

import { AccountService } from './_services';
import { Account, Role } from './_models';
import { PrimeNGConfig } from 'primeng/api';

@Component({ selector: 'app', templateUrl: 'app.component.html' })
export class AppComponent {
    Role = Role;
    account: Account;

    constructor(private accountService: AccountService,private primengConfig: PrimeNGConfig) {
        this.accountService.account.subscribe(x => this.account = x);
        this.primengConfig.ripple = true;
    }

    logout() {
        this.accountService.logout();
    }
}