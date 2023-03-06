import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [
    "divExpo",
    "divCollection",
    "photographesResidence",
    "photographesOuvrage",
    "photographesExpo"
  ]

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

  photographesResidence() {
    this.photographesResidenceTarget.classList.remove("d-none")
  }

  hidePhotographesResidence() {
    this.photographesResidenceTarget.classList.add("d-none")
  }

  photographesOuvrage() {
    this.photographesOuvrageTarget.classList.remove("d-none")
  }

  hidePhotographesOuvrage() {
    this.photographesOuvrageTarget.classList.add("d-none")
  }

  photographesExpo() {
    this.photographesExpoTarget.classList.remove("d-none")
  }

  hidePhotographesExpo() {
    this.photographesExpoTarget.classList.add("d-none")
  }
}
