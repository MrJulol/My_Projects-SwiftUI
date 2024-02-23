import { Component } from '@angular/core';
import { Product } from '../interfaces/product';
import { DataService } from '../services/data.service';

@Component({
  selector: 'app-stack-viewer',
  templateUrl: './stack-viewer.component.html',
  styleUrl: './stack-viewer.component.css',
})
export class StackViewerComponent {
  stack: Product[] = [];
  constructor(private _data: DataService) {
    this.stack = _data.getData();
  }
}
