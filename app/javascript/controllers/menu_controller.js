import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["bannerHelp", "bannerConseils", "bannerEntraide", "bannerIndex", "bannerChiffres"]

  helpMouseOver() {
    this.bannerHelpTarget.style.display = "block";
  }


  helpMouseOut() {
    this.bannerHelpTarget.style.display = "none";
  }

  conseilsMouseOver() {
    this.bannerConseilsTarget.style.display = "block";
  }


  conseilsMouseOut() {
    this.bannerConseilsTarget.style.display = "none";
  }

  entraideMouseOver() {
    this.bannerEntraideTarget.style.display = "block";
  }


  entraideMouseOut() {
    this.bannerEntraideTarget.style.display = "none";
  }

  indexMouseOver() {
    this.bannerIndexTarget.style.display = "block";
  }


  indexMouseOut() {
    this.bannerIndexTarget.style.display = "none";
  }

  chiffresMouseOver() {
    this.bannerChiffresTarget.style.display = "block";
  }


  chiffresMouseOut() {
    this.bannerChiffresTarget.style.display = "none";
  }
}
