import { Component } from '@angular/core';
import axios from 'axios';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'frontend';
  personnes:Personn[];

  constructor(){
    this.init();
    this.personnes=[];
  }

  public async init(): Promise<void>{
    console.log("Iniiiiiiiiiiiit");
    await axios.get<Personn[]>("/api/personnes").then((response) => {
      this.personnes=response.data;
    });
    console.log("End Iniiiiiiiiiiiit " + JSON.stringify(this.personnes));
  }

}

export class Personn{
 
  constructor(public  id:string, public  firstName:string,public  lastName:string){

  }
}
