import { Component } from '@angular/core';
import { DataService } from '../services/data.service';
import { Course } from '../interfaces/course';
import { Router } from '@angular/router';

@Component({
  selector: 'app-master',
  templateUrl: './master.component.html',
  styleUrl: './master.component.css',
})
export class MasterComponent {
  data: Course[] = [];
  constructor(private _data: DataService, private _router: Router) {
    this.data = this._data.getData();
  }

  goToDetails(id: Number) {
    this._router.navigate(['/detail', id]);
  }
}
