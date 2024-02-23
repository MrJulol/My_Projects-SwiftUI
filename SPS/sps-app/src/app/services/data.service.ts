import { Injectable } from '@angular/core';
import { Product } from '../interfaces/product';

@Injectable({
  providedIn: 'root',
})
export class DataService {
  _stack: Product[] = [];
  constructor() {
    this._stack = [
      { id: 1, title: 'Test1' },
      { id: 2, title: 'Test2' },
    ];
  }
  getData(): Product[] {
    return this._stack;
  }
}
