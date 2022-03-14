import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['listDossier', 'listDispositif', 'inputDossier', 'inputDispositif', 'form'];

  setDossier(event) {
    if (this.listDossierTarget.querySelector(".active")) {
      this.listDossierTarget.querySelector(".active").classList.remove("active");
    }
    event.currentTarget.classList.add("active");
    this.inputDossierTarget.value = event.currentTarget.innerHTML
  }

  setDispositif(event) {
    if (this.listDispositifTarget.querySelector(".active")) {
      this.listDispositifTarget.querySelector(".active").classList.remove("active");
    }
    event.currentTarget.classList.add("active");
    this.inputDispositifTarget.value = event.currentTarget.innerHTML
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
            this.listDossierTarget.innerHTML = "Merci, nous avons intégré votre avis !";
            this.listDispositifTarget.innerHTML = "Merci, nous avons intégré votre avis !";
          }
          else if (this.inputDossierTarget.value != "") {
            this.listDossierTarget.innerHTML = "Merci, nous avons intégré votre avis !";
          } else if (this.inputDispositifTarget.value != "") {
            this.listDispositifTarget.innerHTML = "Merci, nous avons intégré votre avis !";
          }
        }
        this.inputDossierTarget.value = ""
        this.inputDispositifTarget.value = ""
      })
  }
}
