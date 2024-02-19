import { Component } from '@angular/core';
import {DataService} from "../services/data.service";
import {Course} from "../interfaces/course";

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrl: './navigation.component.css',
})
export class NavigationComponent {
  data: Course[] = [];
  constructor(private _data : DataService) {
    this.data = this._data.getData();

  }

}
