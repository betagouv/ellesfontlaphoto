import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['div','text', 'form', 'modal', 'subtitle', 'checkboxesutiles', 'checkboxesinutiles', 'answerInput'];

  close(event) {
    this.divTarget.style.display = "none";
  }

  set(event) {
    if(event.currentTarget.id == "notation-conseil-utile") {
      document.querySelector("#answer").value = "utile"
      this.subtitleTarget.innerHTML = "C'est utile car ..."
      this.checkboxesinutilesTarget.style.display = "none"
      this.checkboxesutilesTarget.style.display = "block"
    }
    if(event.currentTarget.id == "notation-conseil-inutile") {
      document.querySelector("#answer").value = "inutile";
      this.subtitleTarget.innerHTML = "C'est inutile car ..."
      this.checkboxesutilesTarget.style.display = "none"
      this.checkboxesinutilesTarget.style.display = "block"
    }
  }

  send(event) {
    event.preventDefault();
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': 'application/json', 'X-CSRF-Token': csrfToken()  },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.divTarget.innerHTML = "Merci de votre réponse!";
          this.modalTarget.querySelector( '.modal-inner').classList.remove( 'modal-reveal' );
          document.body.classList.remove("modal-body")
          const myTimeout = setTimeout(() => {
            this.divTarget.style.display = "none";
          }, 3500);
        }
      })
  }
}
