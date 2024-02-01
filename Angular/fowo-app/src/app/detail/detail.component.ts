import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { DataService } from '../services/data.service';
import { Course } from '../interfaces/course';

@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrl: './detail.component.css',
})
export class DetailComponent implements OnInit {
  itemId: number = 0;
  data: Course[] = [];

  constructor(
    private _route: ActivatedRoute,
    private _dataService: DataService
  ) {
    this.data = this._dataService.getData();
  }

  ngOnInit(): void {
    this._route.params.subscribe((params) => {
      this.itemId = +params['id'];
    });
  }
  getCourse(): Course[] {
    let data2 = [];
    for (let course of this.data) {
      if (course.id == this.itemId) {
        data2.push(course);
      }
    }
    return data2;
  }
}
