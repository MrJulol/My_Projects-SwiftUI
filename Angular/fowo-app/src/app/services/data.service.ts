import { Injectable } from '@angular/core';
import { Course } from '../interfaces/course';

@Injectable({
  providedIn: 'root',
})
export class DataService {
  _courses: Course[] = [];

  constructor() {
    this.fetchData();
  }

  fetchData() {
    fetch('http://localhost:3000/getdata')
      .then((response) => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then((data: Course[]) => {
        console.log('Data received:', data);
        this._courses = data;
      })
      .catch((error) => {
        console.error('Fetch error:', error);
      });
  }

  getData(): Course[] {
    return this._courses;
  }

  addCourse(course: Course) {
    this._courses.push(course);
  }
}
