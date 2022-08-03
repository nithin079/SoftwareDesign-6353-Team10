import { NgModule } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

import { ProfileRoutingModule } from './profile-routing.module';
import { LayoutComponent } from './layout.component';
import { DetailsComponent } from './details.component';
import { UpdateComponent } from './profile-update/update.component';
import { MyProfileComponent } from './my-profile/my-profile.component';
import { FuelQuoteComponent } from './fuel-quote/fuel-quote.component';
import { FuelHistoryComponent } from './fuel-history/fuel-history.component';
import {TableModule} from 'primeng/table';
import {DropdownModule} from 'primeng/dropdown';
@NgModule({
    imports: [
        CommonModule,
        ReactiveFormsModule,
        ProfileRoutingModule,
        TableModule,
        DropdownModule
    ],
    declarations: [
        LayoutComponent,
        DetailsComponent,
        UpdateComponent,
        MyProfileComponent,
        FuelQuoteComponent,
        FuelHistoryComponent
    ]
})
export class ProfileModule { }