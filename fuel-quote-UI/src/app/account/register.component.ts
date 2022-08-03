import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';

import { AccountService, AlertService } from '@app/_services';
import { ApiResponseModel } from '@app/_models';

@Component({ templateUrl: 'register.component.html' })
export class RegisterComponent implements OnInit {
    form: FormGroup;
    loading = false;
    submitted = false;

    constructor(
        private formBuilder: FormBuilder,
        private route: ActivatedRoute,
        private router: Router,
        private accountService: AccountService,
        private alertService: AlertService
    ) { }

    ngOnInit() {
        this.form = this.formBuilder.group({
            userName: ['', Validators.required],
            PasswordHash: ['', [Validators.required, Validators.minLength(6)]],
            acceptTerms: [false, Validators.requiredTrue]
        });
    }

    // convenience getter for easy access to form fields
    get f() { return this.form.controls; }

    onSubmit() {
        this.submitted = true;
        // reset alerts on submit
        this.alertService.clear();
        // stop here if form is invalid
        if (this.form.invalid) {
            return;
        }
        this.loading = true;
        this.accountService.register(this.form.value)
            .pipe(first())
            .subscribe({
                next: (data: ApiResponseModel) => {
                    if (data.StatusCode == 409) {
                        this.alertService.error(data.message);
                        this.loading = false;
                    }
                    else {
                        this.alertService.success('Registration successful', { keepAfterRouteChange: false });
                        this.router.navigate(['../login'], { relativeTo: this.route });
                    }
                },
                error: error => {
                    this.alertService.error(error);
                    this.loading = false;
                }
            });
    }
}