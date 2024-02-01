import { Component , Input} from '@angular/core';
import { Course } from '../interfaces/course';
import { ParseTreeResult } from '@angular/compiler';

@Component({
  selector: 'app-box',
  templateUrl: './box.component.html',
  styleUrl: './box.component.css'
})
export class BoxComponent {
  @Input() input_data!: Course;
  show_id: boolean=false
}
