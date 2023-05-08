import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [
    "divCollection",
    "photographesResidence",
    "photographesOuvrage",
    "photographesExpo",

    // ChampsCollection
    "inputTotalFonds",
    "inputFemmesFonds",
    "inputTotalOeuvresPhoto",
    "inputTotalFemmesOeuvresPhoto",
    "inputTotalOeuvresPhotoAjoutees",
    "inputFemmesOeuvresPhotoAjoutees",

    "radioChampsCollection",

    // photographesResidence
    "inputTotalResidence",
    "inputFemmesResidence",

    "radioChampsResidence",
    // photographesOuvrage
    "inputTotalOuvrages",
    "inputFemmesOuvrages",

    "radioChampsPhotographeOuvrage",
    // photographesExpo
    "inputTotalInvites",
    "inputFemmesInvites",

    "radioChampsPhotographeExpo"


  ]

  connect() {
    if (this.inputTotalFondsTarget.value.trim().length != 0 ||
    this.inputFemmesFondsTarget.value.trim().length != 0 ||
    this.inputTotalOeuvresPhotoTarget.value.trim().length != 0 ||
    this.inputTotalFemmesOeuvresPhotoTarget.value.trim().length != 0 ||
    this.inputTotalOeuvresPhotoAjouteesTarget.value.trim().length != 0 ||
    this.inputFemmesOeuvresPhotoAjouteesTarget.value.trim().length != 0) {
      this.champsCollection();
      this.radioChampsCollectionTarget.checked = true;
    }

    if (this.inputTotalResidenceTarget.value.trim().length != 0 ||
    this.inputFemmesResidenceTarget.value.trim().length != 0) {
      this.photographesResidence();
      this.radioChampsResidenceTarget.checked = true;
    }

    if (this.inputTotalOuvragesTarget.value.trim().length != 0 ||
    this.inputFemmesOuvragesTarget.value.trim().length != 0) {
      this.photographesOuvrage();
      this.radioChampsPhotographeOuvrageTarget.checked = true;
    }

    if(this.inputTotalInvitesTarget.value.trim().length != 0 ||
    this.inputFemmesInvitesTarget.value.trim().length != 0) {
      this.photographesExpo();
      this.radioChampsPhotographeExpoTarget.checked = true;
    }
  }

  champsCollection() {
    this.divCollectionTarget.classList.remove("d-none")
  }

  hideChampsCollection() {
    this.divCollectionTarget.classList.add("d-none")
  }

  champsPrix() {
    this.divPrixTarget.classList.remove("d-none")
  }

  hideChampsPrix() {
    this.divPrixTarget.classList.add("d-none")
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
