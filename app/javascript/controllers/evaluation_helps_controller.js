import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['listDossier',
  'listDispositif',
  'inputDossier',
  'inputDispositif',
  'formDossier',
  'formDispositif',
  'formIndex',
  'divEval',
  'divNewEval',
  'cross',
  'buttonDossier',
  'buttonDispositif'];

  setDossier(event) {
    if (this.listDossierTarget.querySelector(".active")) {
      this.listDossierTarget.querySelector(".active").classList.remove("active");
    }
    if (this.inputDossierTarget.value == event.currentTarget.innerHTML) {
      this.inputDossierTarget.value = ""
    } else {
      event.currentTarget.classList.add("active");
      this.inputDossierTarget.value = event.currentTarget.innerHTML
    }
  }

  setDispositif(event) {
    if (this.listDispositifTarget.querySelector(".active")) {
      this.listDispositifTarget.querySelector(".active").classList.remove("active");
    }
    if (this.inputDispositifTarget.value == event.currentTarget.innerHTML) {
      this.inputDispositifTarget.value = ""
    } else {
      event.currentTarget.classList.add("active");
      this.inputDispositifTarget.value = event.currentTarget.innerHTML
    }
  }

  close() {
    console.log("ici")
    this.divNewEvalTarget.style.display = "none"
  }

  sendDossier(event) {
    event.preventDefault();
    fetch(this.formDossierTarget.action, {
      method: 'POST',
      headers: { 'Accept': 'application/json', 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formDossierTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          if (this.inputDossierTarget.value != "" && this.inputDispositifTarget.value != "") {
            if (this.inputDispositifTarget.value != "") {
              this.listDossierTarget.innerHTML = "Merci, nous avons intégré votre avis !";
              this.buttonDossierTarget.style.display = "none"
            } else {
              this.divEvalTarget.innerHTML = "Merci, nous avons intégré votre avis !";
              this.crossTarget.style.display = "block"
            }
          }
          else if (this.inputDossierTarget.value != "") {
            if(this.listDispositifTarget.innerHTML == "Merci, nous avons intégré votre avis !") {
              this.divEvalTarget.innerHTML = "Merci, nous avons intégré votre avis !";
              this.crossTarget.style.display = "block"
            } else {
              this.listDossierTarget.innerHTML = "Merci, nous avons intégré votre avis !";
              this.buttonDossierTarget.style.display = "none"
            }
          }
        }
         this.inputDossierTarget.value = ""
        this.refreshData()
      })
  }

  sendDispositif(event) {
    event.preventDefault();

    fetch(this.formDispositifTarget.action, {
      method: 'POST',
      headers: { 'Accept': 'application/json', 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formDispositifTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          if (this.inputDossierTarget.value != "" && this.inputDispositifTarget.value != "") {
            if (this.inputDossierTarget.value != "") {
              this.listDispositifTarget.innerHTML = "Merci, nous avons intégré votre avis !";
              this.buttonDispositifTarget.style.display = "none"
            } else {
              this.divEvalTarget.innerHTML = "Merci, nous avons intégré votre avis !";
              this.crossTarget.style.display = "block"
            }
          } else if (this.inputDispositifTarget.value != "") {
            if (this.listDossierTarget.innerHTML == "Merci, nous avons intégré votre avis !") {
              this.divEvalTarget.innerHTML = "Merci, nous avons intégré votre avis !";
              this.crossTarget.style.display = "block"
            } else {
              this.listDispositifTarget.innerHTML = "Merci, nous avons intégré votre avis !";
              this.buttonDispositifTarget.style.display = "none"
            }
          }
        }
        this.inputDispositifTarget.value = ""
        this.refreshData()
      })
  }

  refreshData() {
    fetch(this.formIndexTarget.action, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        document.querySelector(".evaluations_helps_index").outerHTML = data;
      })
  }
}
