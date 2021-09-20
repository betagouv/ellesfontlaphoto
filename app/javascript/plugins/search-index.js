const searchIndex = () => {
  document.getElementById("select-search").addEventListener("click", () => {
    document.getElementById("dropdown-elements").classList.toggle("show");
  });

  // Close the dropdown if the user clicks outside of it
  window.onclick = function(event) {
    if (event.target.matches('.search-div')) {
      const dropdowns = document.querySelector("#dropdown-elements");
      if (dropdowns.classList.contains('show')) {
        dropdowns.classList.remove('show');
        // clearInterval(inst);
      }
    }
  }
}

const updateInput = () => {
  const dropdownElements = document.querySelectorAll(".dropdown-content")
  dropdownElements.forEach((element) => {
    element.addEventListener("click", () => {
      document.querySelector("#query_residence").value = element.innerHTML;
      document.querySelector('#search-form').submit();
    })
  })
}

const changeResidence = () => {
  const residences = [
    "Provence-Alpes-Côte-d'Azur",
    "Pays de la Loire",
    "Occitanie",
    "Nouvelle Aquitaine",
    "Normandie",
    "Ile de France",
    "Hauts de France",
    "Grand-Est",
    "Corse",
    "Centre Val de Loire",
    "Bretagne",
    "Bourgogne -Franche Comté",
    "Auvergne-Rhône Alpes",
    "Réunion",
    "Mayotte",
    "Martinique",
    "Guyane",
    "Guadeloupe",
    "France ou résidant en France"
  ];
  let counter = 0;
  const element = document.getElementById("text-to-change");
  const inst = setInterval(() => {
    element.innerHTML = residences[counter];
    counter++;
    if (counter >= residences.length) {
      counter = 0;
    }
  }, 1500);
}

export { changeResidence }
export { updateInput }
export { searchIndex }
