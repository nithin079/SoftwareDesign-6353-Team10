import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AccountService } from '@app/_services';

@Component({ templateUrl: 'layout.component.html' })
export class LayoutComponent { 
     account = this.accountService.accountValue; 

    constructor(private accountService: AccountService, private router: Router) 
    {
        if(this.account.FullName==null || this.account.Address1==null || this.account.Address2==null || this.account.State==null || this.account.Zipcode==null){
            this.router.navigate(['admin/update']);
        }
    }

    logout() {
        this.accountService.logout();
    }
}