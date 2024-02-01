import { Component, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ContentComponent } from './content/content.component';
import { MasterComponent } from './master/master.component';
import { DetailComponent } from './detail/detail.component';

const routes: Routes = [
  { path: '', component: ContentComponent },
  { path: 'master', component: MasterComponent },
  { path: 'detail/:id', component: DetailComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
