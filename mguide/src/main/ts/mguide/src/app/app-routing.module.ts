import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { FiltersComponent } from './filters/filters.component';


const routes: Routes = [
  { path: '', redirectTo: '/filters', pathMatch: 'full' },
  { path: 'filters', component: FiltersComponent },
  { path: '**', redirectTo: '/filters' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { relativeLinkResolution: 'legacy' })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
