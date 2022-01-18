import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthComponent } from './auth/auth.component';
import { FiltersComponent } from './filters/filters.component';
import { SingleExhibitComponent } from './filters/single-exhibit/single-exhibit.component';


const routes: Routes = [
  { path: '', redirectTo: '/filters', pathMatch: 'full' },
  { path: 'filters', component: FiltersComponent },
  { path: 'exhibit/:id', component: SingleExhibitComponent },
  { path: 'login', component: AuthComponent },
  
  { path: '**', redirectTo: '/filters' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { relativeLinkResolution: 'legacy' })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
