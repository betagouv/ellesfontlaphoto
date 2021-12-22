import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['div','text', 'form'];

  close(event) {
    this.divTarget.style.display = "none";
  }

  send(event) {
    event.preventDefault();
    if(event.currentTarget.id == "notation-conseil-utile") {
      document.querySelector("#answer").value = "utile"
    }
    if(event.currentTarget.id == "notation-conseil-inutile") {
      document.querySelector("#answer").value = "inutile";
    }

    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': 'application/json', 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.textTarget.innerHTML = "Merci de votre réponse!";
          const myTimeout = setTimeout(() => {
            this.divTarget.style.display = "none";
          }, 3500);
        }
      })
  }
}
