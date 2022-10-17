import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["bannerHelp", "bannerConseils", "bannerEntraide", "bannerIndex", "bannerChiffres"]

  helpMouseOver() {
    this.bannerHelpTarget.style.display = "flex";
  }


  helpMouseOut() {
    this.bannerHelpTarget.style.display = "none";
  }

  conseilsMouseOver() {
    this.bannerConseilsTarget.style.display = "flex";
  }


  conseilsMouseOut() {
    this.bannerConseilsTarget.style.display = "none";
  }

  entraideMouseOver() {
    this.bannerEntraideTarget.style.display = "flex";
  }


  entraideMouseOut() {
    this.bannerEntraideTarget.style.display = "none";
  }

  indexMouseOver() {
    this.bannerIndexTarget.style.display = "flex";
  }


  indexMouseOut() {
    this.bannerIndexTarget.style.display = "none";
  }

  chiffresMouseOver() {
    this.bannerChiffresTarget.style.display = "flex";
  }


  chiffresMouseOut() {
    this.bannerChiffresTarget.style.display = "none";
  }
}
