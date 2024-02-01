import { Component } from '@angular/core';
import { Course } from '../interfaces/course';
import { DataService } from '../services/data.service';

@Component({
  selector: 'app-content',
  templateUrl: './content.component.html',
  styleUrl: './content.component.css',
})
export class ContentComponent {
  courses: Course[] = [];

  constructor(private _data: DataService) {
    this.courses = this._data.getData();
  }
}
