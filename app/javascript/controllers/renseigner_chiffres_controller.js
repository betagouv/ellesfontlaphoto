import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [
    "editBouton",
    "step1",
    "step2",
    "step3",
    "selectOrganization",
    "submitBouton"
  ]

  editChoice() {
    this.step2Target.classList.remove("d-none")
    this.editBoutonTarget.style.opacity = 0.5
  }

  changeChoice() {
    this.step3Target.classList.remove("d-none")
    console.log(this.selectOrganizationTarget.value)
    console.log(document.querySelector('input[name="choice"]:checked').value)
  }

  submit() {
    window.location.href = `/organizations/${this.selectOrganizationTarget.value}/chiffres_organizations/new`
    // window.location.href = `organizations/${this.selectOrganizationTarget.value}/chiffres_organization/${}/edit?&choice=${document.querySelector('input[name="choice"]:checked').value}`;
  }
}
