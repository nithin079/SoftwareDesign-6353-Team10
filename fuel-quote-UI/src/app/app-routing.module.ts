import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from './_helpers';


const accountModule = () => import('./account/account.module').then(x => x.AccountModule);
const profileModule = () => import('./profile/profile.module').then(x => x.ProfileModule);

const routes: Routes = [
    //{ path: 'account', loadChildren: accountModule },
    //{ path: 'admin', loadChildren: profileModule, canActivate: [AuthGuard] },
    // otherwise redirect to home
    //{ path: '**', redirectTo: '' }
    { 
        path: '', 
        redirectTo: 'account/login', 
        pathMatch: 'full'
       },
    { path: 'account', loadChildren: accountModule },
    { path: 'admin', loadChildren: profileModule, canActivate: [AuthGuard] },
   
    // otherwise redirect to home
    { path: '**', redirectTo: '' }
];

@NgModule({
    imports: [RouterModule.forRoot(routes, { relativeLinkResolution: 'legacy' })],
    exports: [RouterModule]
})
export class AppRoutingModule { }
