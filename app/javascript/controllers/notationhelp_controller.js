import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['div','text', 'form'];

  send(event) {
    event.preventDefault();
    if(event.currentTarget.id == "notation-help-yes") {
      document.querySelector("#answer").value = "yes"
    }
    if(event.currentTarget.id == "notation-help-yesbut") {
      document.querySelector("#answer").value = "yesbut"
    }
    if(event.currentTarget.id == "notation-help-no") {
      document.querySelector("#answer").value = "no";
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
          }, 4000);
        }
      })
  }
}
