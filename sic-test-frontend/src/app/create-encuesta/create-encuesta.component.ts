import { EncuestaService } from '../services/encuesta.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Encuesta } from '../models/encuesta';
import { MarcaPCService } from '../services/marcapc.service';
import { Observable } from 'rxjs/internal/Observable';
import { MarcaPC } from '../models/marcapc';

@Component({
  selector: 'app-create-encuesta',
  templateUrl: './create-encuesta.component.html',
  styleUrls: ['./create-encuesta.component.css']
})
export class CreateEncuestaComponent implements OnInit {

  encuesta: Encuesta = new Encuesta();
  marcaPc: number;
  listMarcaPC: Observable<MarcaPC[]>;

  submitted = false;

  constructor(private encuestaService: EncuestaService,
    private marcaPCService: MarcaPCService,
    private router: Router) { }

  ngOnInit() {
    this.marcaPCService.getTodosList()
      .subscribe(data => {
        this.listMarcaPC = data;
      }, error => console.log(error));
  }

  save() {
    this.encuesta.marcaPc = new MarcaPC();
    this.encuesta.marcaPc.id = this.marcaPc;
    this.encuestaService.createEncuesta(this.encuesta)
      .subscribe(data => {
        this.encuesta = new Encuesta();
        this.gotoList();
      }, error => console.log(error));
  }

  onSubmit() {
    this.submitted = true;
    this.save();
  }

  gotoList() {
    this.router.navigate(['/list']);
  }
}
