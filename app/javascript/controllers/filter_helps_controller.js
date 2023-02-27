import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [
    "form",
    "crossLieu",
    "crossTypePhoto",
    "inputType",
    "switchButton",
    "inputLieu"];

  selectCriteria(event) {
    event.currentTarget.classList.toggle("selected")
    event.currentTarget.querySelector(".cross-criteria").classList.toggle("display-inline")
    if(this.inputTypeTarget.value.includes(event.currentTarget.dataset.text)) {
      this.inputTypeTarget.value = this.inputTypeTarget.value.replace(event.currentTarget.dataset.text, "")
    } else {
      this.inputTypeTarget.value += event.currentTarget.dataset.text + ","
    }
    this.refreshHelps();
  }

  clearSelectedLieu(){
    this.crossLieuTarget.style.display = "none"
    this.inputLieuTarget.classList.remove("hide-arrow")
    var elements = this.inputLieuTarget.options;
    for(var i = 0; i < elements.length; i++){
      elements[i].selected = false;
    }
    this.refreshHelps();
  }

  refreshLieu(event) {
    event.currentTarget.classList.add("hide-arrow")
    this.crossLieuTarget.style.display = "block"
    this.refreshHelps();
  }

  refreshHelps() {
    fetch(`${this.formTarget.action}?&type_list=${this.inputTypeTarget.value}&open=${this.switchButtonTarget.checked}&residence=${this.inputLieuTarget.value}`, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => {
      document.querySelector("#main-index-helps").outerHTML = data;
    })
    window.scrollTo(0, 0);
  }

}
