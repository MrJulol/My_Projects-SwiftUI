import { Component } from '@angular/core';
import {DataService} from "./services/data.service";
import {Course} from "./interfaces/course";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'fowo-app';
  private data: Course[] = [];

  constructor(private _data:DataService) {
    this.data = this._data.getData();
  }

}
