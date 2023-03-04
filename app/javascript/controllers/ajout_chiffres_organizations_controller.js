import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["divExpo", "divCollection"]

  champsExposition() {
    this.divExpoTarget.classList.remove("d-none")
  }

  hideChampsExposition() {
    this.divExpoTarget.classList.add("d-none")
  }

  champsCollection() {
    this.divCollectionTarget.classList.remove("d-none")
  }

  hideChampsCollection() {
    this.divCollectionTarget.classList.add("d-none")
  }
}
