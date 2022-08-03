import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';

import { AccountService, AlertService } from '@app/_services';
import { ApiResponseModel, LoginRequestModel } from '@app/_models';
import {MessageService} from 'primeng/api';
@Component({ templateUrl: 'login.component.html' })
export class LoginComponent implements OnInit {
    form: FormGroup;
    loading = false;
    submitted = false;

    constructor(
        private formBuilder: FormBuilder,
        private route: ActivatedRoute,
        private router: Router,
        private accountService: AccountService,
        private alertService: AlertService,
        private messageService: MessageService
    ) { }

    ngOnInit() {
        this.form = this.formBuilder.group({
            UserName: ['', [Validators.required]],
            PasswordHash: ['', Validators.required]
        });
    }

    // convenience getter for easy access to form fields
    get f() { return this.form.controls; }

    onSubmit() {
        this.submitted = true;
        // stop here if form is invalid
        if (this.form.invalid) {
            return;
        }
        this.loading = true;
        this.accountService.login(this.form.value as LoginRequestModel)
            .pipe(first())
            .subscribe({
                next: (loginDetail: ApiResponseModel) => {
                    if (loginDetail.StatusCode == 404) {
                        this.messageService.add({severity:'error', detail:loginDetail.Result});
                        this.loading = false;
                    } else {
                        const returnUrl = '/admin';
                        this.router.navigateByUrl(returnUrl);
                        this.messageService.add({severity:'success', detail:'Login Successfull'});
                    }
                    // get return url from query parameters or default to home page

                },
                error: error => {
                    this.messageService.add({severity:'error', detail:error});
                    this.loading = false;
                }
            });
    }
}