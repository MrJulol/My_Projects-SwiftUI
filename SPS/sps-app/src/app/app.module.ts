import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavigationComponent } from './navigation/navigation.component';
import { StackViewerComponent } from './stack-viewer/stack-viewer.component';
import { DetailsComponent } from './details/details.component';
import { LabelComponent } from './label/label.component';
import { ProductComponent } from './product/product.component';
import { StepsComponent } from './steps/steps.component';
import { PositionComponent } from './position/position.component';

@NgModule({
  declarations: [
    AppComponent,
    NavigationComponent,
    StackViewerComponent,
    DetailsComponent,
    LabelComponent,
    ProductComponent,
    StepsComponent,
    PositionComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
