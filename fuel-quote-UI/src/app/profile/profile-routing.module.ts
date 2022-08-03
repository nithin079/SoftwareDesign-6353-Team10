import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { LayoutComponent } from './layout.component';
import { DetailsComponent } from './details.component';
import { UpdateComponent } from './profile-update/update.component';
import { MyProfileComponent } from './my-profile/my-profile.component';
import { FuelQuoteComponent } from './fuel-quote/fuel-quote.component';
import { FuelHistoryComponent } from './fuel-history/fuel-history.component';

const routes: Routes = [
    {
        path: '', component: LayoutComponent,
        children: [
            { path: '', component: DetailsComponent },
            { path: 'update', component: UpdateComponent },
            { path: 'myprofile', component: MyProfileComponent },
            { path: 'fuel-quote', component: FuelQuoteComponent },
            { path: 'fuel-history', component: FuelHistoryComponent }
        ]
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class ProfileRoutingModule { }