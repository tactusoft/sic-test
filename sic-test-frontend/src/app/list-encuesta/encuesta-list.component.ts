import { Observable } from 'rxjs';
import { EncuestaService } from '../services/encuesta.service';
import { Encuesta } from '../models/encuesta';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-encuesta-list',
  templateUrl: './encuesta-list.component.html',
  styleUrls: ['./encuesta-list.component.css']
})
export class EncuestaListComponent implements OnInit {
  list: Observable<Encuesta[]>;

  constructor(private encuestaService: EncuestaService,
    private router: Router) { }

  ngOnInit() {
    this.reloadData();
  }

  reloadData() {
    this.list = this.encuestaService.getEncuestaList();
  }

  deleteEmployee(id: number) {
    this.encuestaService.deleteEncuesta(id)
      .subscribe(
        data => {
          console.log(data);
          this.reloadData();
        },
        error => console.log(error));
  }
}
