import { computeStyles } from "@popperjs/core"
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [
    "divNewOrga",
    "divSearchOrga",
    "selectOrga",
    "linkNew",
    "organizationTypeInput",
    "titreInput"
  ]

  newOrganisation() {
    this.divNewOrgaTarget.classList.add("d-none")
    this.divSearchOrgaTarget.classList.remove("d-none")
  }

  hideNewOrganisation() {
    this.divNewOrgaTarget.classList.remove("d-none")
    this.divSearchOrgaTarget.classList.add("d-none")
  }

  selectOrga() {
    this.linkNewTarget.href = `/organizations/${this.selectOrgaTarget.value}/chiffres_organizations/new`
    if (this.selectOrgaTarget.value != "") {
      this.linkNewTarget.classList.remove("isDisabled")
    } else {
      this.linkNewTarget.classList.add("isDisabled")
    }
  }

  selectType() {
    if (this.organizationTypeInputTarget.value == "Prix") {
      this.titreInputTarget.classList.remove("d-none")
    } else {
      this.titreInputTarget.classList.add("d-none")
    }

  }

}
