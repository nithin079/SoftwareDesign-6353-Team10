import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';
import { AccountService, AlertService } from '@app/_services';
import {ALLStates} from '@app/_constants'

@Component({ templateUrl: 'update.component.html' })
export class UpdateComponent implements OnInit {
    account = this.accountService.accountValue;
    form: FormGroup;
    loading = false;
    submitted = false;
    deleting = false;
    States=ALLStates;

    constructor(
        private formBuilder: FormBuilder,
        private route: ActivatedRoute,
        private router: Router,
        private accountService: AccountService,
        private alertService: AlertService
    ) { }

    ngOnInit() {
        this.form = this.formBuilder.group({
            ID: [this.account.Id, Validators.required],
            userName: [{value:this.account.UserName,disabled:true}, {disabled: true},Validators.required],
            fullname: [this.account.FullName, Validators.required],
            address1: [this.account.Address1, Validators.required],
            address2: [this.account.Address2, [Validators.required]],
            city: [this.account.City, [Validators.required]],
            state: [this.account.State, [Validators.required]],
            zipcode: [this.account.Zipcode, [Validators.required]]
        });
    }

    // convenience getter for easy access to form fields
    get f() { return this.form.controls; }

    onSubmit() {
        this.submitted = true;

        // // reset alerts on submit
        this.alertService.clear();

        // // stop here if form is invalid
        if (this.form.invalid) {
            return;
        }

         this.loading = true;
        this.accountService.update(this.form.value)
            .pipe(first())
            .subscribe({
                next: () => {
                    this.alertService.success('Update successful', { keepAfterRouteChange: true });
                    this.router.navigate(['../'], { relativeTo: this.route });
                },
                error: error => {
                    this.alertService.error(error);
                    this.loading = false;
                }
            });
    }

    
}