import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [
    "divExpo",
    "divCollection",
    "divPrix",
    "photographesResidence",
    "photographesOuvrage",
    "photographesExpo",
    // champsExposition
    "inputTotalExpoCollective",
    "inputFemmesExpoCollective",
    "inputTotalExpoMono",
    "inputFemmesExpoCollective",
    "inputMoins40",
    "inputPlus40",
    "inputPostMortem",
    "inputTotalCommissaires",
    "inputFemmesCommissaires",

    "radioChampsExpo",
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
    console.log(this.inputTotalExpoCollectiveTarget.value)
    if (this.inputTotalExpoCollectiveTarget.value.trim().length != 0 ||
    this.inputTotalExpoCollectiveTarget.value.trim().length != 0 ||
    this.inputFemmesExpoCollectiveTarget.value.trim().length != 0 ||
    this.inputTotalExpoMonoTarget.value.trim().length != 0 ||
    this.inputFemmesExpoCollectiveTarget.value.trim().length != 0 ||
    this.inputMoins40Target.value.trim().length != 0 ||
    this.inputPlus40Target.value.trim().length != 0 ||
    this.inputPostMortemTarget.value.trim().length != 0 ||
    this.inputTotalCommissairesTarget.value.trim().length != 0 ||
    this.inputFemmesCommissairesTarget.value.trim().length != 0) {
      this.champsExposition();
      this.radioChampsExpoTarget.checked = true
    }

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
