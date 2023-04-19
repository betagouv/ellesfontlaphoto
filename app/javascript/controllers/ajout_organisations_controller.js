import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [
    "divNewOrga",
    "divSearchOrga",
    "selectOrga",
    "linkNew"
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

}
