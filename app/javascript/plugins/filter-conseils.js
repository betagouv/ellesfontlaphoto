const unSelectFilter = (buttonsUnSelected) => {
  buttonsUnSelected.forEach((element) => {
    element.addEventListener("click", () =>{
      if(element.classList.contains('tags')) {
        document.querySelector("#tag_list").value = document.querySelector("#tag_list").value.replace(","+element.dataset.tag, "")
      } else if (document.querySelector("#category").value == element.dataset.category) {
        document.querySelector("#category").value = ""
      }
      document.querySelector('#search-form').submit();
    })
  })
}

const selectFilter = (buttonsSelected) => {
  buttonsSelected.forEach((element) => {
    element.addEventListener("click", () => {
      document.querySelector("#tag_list").value = document.querySelector("#tag_list").value + "," + element.dataset.tag;
      document.querySelector('#search-form').submit();
    })
  })
}

export { unSelectFilter }
export { selectFilter }
