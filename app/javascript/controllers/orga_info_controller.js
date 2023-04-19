import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["card"]
  static values = {
    orgaId: String
  }

  submit() {
    fetch(`/organizations/${this.orgaIdValue}/add_request_info`, {
      method: "GET",
      headers: { "Accept": "text/plain" }
    })
      .then(response => response.text())
      .then((data) => {
        this.cardTarget.innerHTML = data
      })
  }
}
