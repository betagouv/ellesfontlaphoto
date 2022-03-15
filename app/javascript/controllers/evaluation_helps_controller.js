import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['listDossier', 'listDispositif', 'inputDossier', 'inputDispositif', 'form', 'formIndex', 'divEval', 'divNewEval', 'cross'];

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

  send() {
    event.preventDefault();

    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': 'application/json', 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          if (this.inputDossierTarget.value != "" && this.inputDispositifTarget.value != "") {
            this.divEvalTarget.innerHTML = "Merci, nous avons intégré votre avis !";
            this.crossTarget.style.display = "block"
          }
          else if (this.inputDossierTarget.value != "") {
            if(this.listDispositifTarget.innerHTML == "Merci, nous avons intégré votre avis !") {
              this.divEvalTarget.innerHTML = "Merci, nous avons intégré votre avis !";
              this.crossTarget.style.display = "block"
            } else {
              this.listDossierTarget.innerHTML = "Merci, nous avons intégré votre avis !";
            }
          } else if (this.inputDispositifTarget.value != "") {
            if (this.listDossierTarget.innerHTML == "Merci, nous avons intégré votre avis !") {
              this.divEvalTarget.innerHTML = "Merci, nous avons intégré votre avis !";
              this.crossTarget.style.display = "block"
            } else {
              this.listDispositifTarget.innerHTML = "Merci, nous avons intégré votre avis !";
            }
          }
        }
        this.inputDossierTarget.value = ""
        this.inputDispositifTarget.value = ""
        this.refreshData()
      })
  }

  refreshData() {
    fetch(this.formIndexTarget.action, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        document.querySelector(".evaluations_helps_index").outerHTML = data;
      })
  }
}
