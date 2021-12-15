const fillNotationHelpForm = () => {
  document.querySelector("#notation-help-yes").addEventListener("click", () => {
    document.querySelector("#answer").value = "yes"
    document.querySelector("#notation-help").submit();
  })
  document.querySelector("#notation-help-yesbut").addEventListener("click", () => {
    document.querySelector("#answer").value = "yesbut"
    document.querySelector("#notation-help").submit();
  })
  document.querySelector("#notation-help-no").addEventListener("click", () => {
    document.querySelector("#answer").value = "no";
    document.querySelector("#notation-help").submit();
  })
}

export { fillNotationHelpForm }
