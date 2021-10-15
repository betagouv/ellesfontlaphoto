const unSelectFilter = (buttonsUnSelected) => {
  buttonsUnSelected.forEach((element) => {
    element.addEventListener("click", () =>{
      if(element.classList.contains('tags')) {
        document.querySelector("#tags_").value = document.querySelector("#tags_").value.replace(element.dataset.tag, "")
      } else if (document.querySelector("#category").value == element.dataset.category) {
        document.querySelector("#category").value = ""
        document.querySelector("#tags_").value = [""]
      }
        document.querySelector('#search-form').submit();
    })
  })
}

const selectFilter = (buttonsSelected) => {
  buttonsSelected.forEach((element) => {
    element.addEventListener("click", () => {
      document.querySelector(".ici").insertAdjacentHTML("beforeend", `<input type="text" name="tags[]" id="tags_" value="${element.dataset.tag}">`)
      document.querySelector('#search-form').submit();
    })
  })
}

export { unSelectFilter }
export { selectFilter }
