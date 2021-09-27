const searchIndex = () => {
  document.getElementById("select-search-residence").addEventListener("click", () => {
    document.getElementById("dropdown-elements-residence").classList.toggle("show");
  });

  document.getElementById("select-search-type").addEventListener("click", () => {
    document.getElementById("dropdown-elements-type").classList.toggle("show");
  });

  // Close the dropdown if the user clicks outside of it
  window.onclick = function(event) {
    if (event.target.matches('.search-div-residence')) {
      const dropdowns = document.querySelector("#dropdown-elements-residence");
      if (dropdowns.classList.contains('show')) {
        dropdowns.classList.remove('show');
        // clearInterval(inst);
      }
    }
    if (event.target.matches('.search-div-type')) {
      const dropdowns = document.querySelector("#dropdown-elements-type");
      if (dropdowns.classList.contains('show')) {
        dropdowns.classList.remove('show');
        // clearInterval(inst);
      }
    }
  }
}

const updateInput = () => {
    const types = [
    "Achat de matériel",
    "Aide à la production",
    "Aide sociale",
    "Aide à la diffusion",
  ];
  let counter = 0;
  const element = document.getElementById("text-to-change-type");
  const inst = setInterval(() => {
    element.innerHTML = types[counter];
    counter++;
    if (counter >= types.length) {
      counter = 0;
    }
  }, 1500);

  const dropdownElementsResidences = document.querySelectorAll(".dropdown-content-residence")
  const dropdownElementsTypes = document.querySelectorAll(".dropdown-content-type")

  dropdownElementsResidences.forEach((element) => {
    element.addEventListener("click", () => {
      document.querySelector("#query_residence").value = element.innerHTML;
      document.querySelector("#select-search-residence").innerHTML = element.innerHTML;
      document.getElementById("dropdown-elements-residence").classList.toggle("show");
      // document.querySelector('#search-form').submit();

    })
  })

  dropdownElementsTypes.forEach((element) => {
    element.addEventListener("click", () => {
      document.querySelector("#query_type").value = element.innerHTML;
      document.querySelector("#select-search-type").innerHTML = element.innerHTML;
      document.getElementById("dropdown-elements-type").classList.toggle("show");
      clearInterval(inst);
      // document.querySelector('#search-form').submit();
    })
  })
  document.querySelector(".button-search").addEventListener("click", () => {
    document.querySelector('#search-form').submit();
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
  const element = document.getElementById("text-to-change-residence");
  const inst = setInterval(() => {
    element.innerHTML = residences[counter];
    counter++;
    if (counter >= residences.length) {
      counter = 0;
    }
  }, 1500);
}

const changeTypes = () => {
  const types = [
    "Achat de matériel",
    "Aide à la production",
    "Aide sociale",
    "Aide à la diffusion",
  ];
  let counter = 0;
  const element = document.getElementById("text-to-change-type");
  const inst = setInterval(() => {
    element.innerHTML = types[counter];
    counter++;
    if (counter >= types.length) {
      counter = 0;
    }
  }, 1500);
}

export { changeTypes }
export { changeResidence }
export { updateInput }
export { searchIndex }
