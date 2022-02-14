import { searchProgressBarHelp } from '../plugins/progress_bar';

const searchIndex = () => {
  document.getElementById("select-search-residence").addEventListener("click", () => {
    document.getElementById("dropdown-elements-residence").classList.toggle("show");
  });

  document.getElementById("select-search-type").addEventListener("click", () => {
    document.getElementById("dropdown-elements-type").classList.toggle("show");
  });

  window.onclick = function(event) {
    if ((event.target.matches('.search-div-residence')) || (event.target.matches('.search-div-type'))) {
      const dropdowns_residence = document.querySelector("#dropdown-elements-residence");
      const dropdowns_type = document.querySelector("#dropdown-elements-type");
      if (dropdowns_residence.classList.contains('show')) {
        dropdowns_residence.classList.remove('show');
        // clearInterval(inst);
      }
      if (dropdowns_type.classList.contains('show')) {
        dropdowns_type.classList.remove('show');
        // clearInterval(inst);
      }
    }
  }
}

const updateInput = () => {
  const types = {
  "financer du matériel" : "Matériel",
  "financer une production": "Production",
  "un secours exceptionnel": "Aide Sociale",
  "une résidence (artistique)": "Résidence",
  "financer une diffusion": "Diffusion"
  }
  const element = document.getElementById("text-to-change-type");
  if (element) {
    let counter = 0;
    const inst = setInterval(() => {
      if(types[Object.keys(types)[counter]] == "Aide Sociale") {
        element.innerHTML = `<img src="${document.querySelector(`#img-Aide-Sociale`).innerHTML}" alt="émoji aide sociale" class="emojis-eflc-large"> ${Object.keys(types)[counter]}`;
      }
      else {
        element.innerHTML = `<img src="${document.querySelector(`#img-${types[Object.keys(types)[counter]]}`).innerHTML}" alt="émoji ${types[Object.keys(types)[counter]]}" class="emojis-eflc-large"> ${Object.keys(types)[counter]}`;
      }
      counter++;
      if (counter >= Object.keys(types).length) {
        counter = 0;
      }
    }, 1500);
  }

  // Change the input value when a type/residence is selected
  const dropdownElementsResidences = document.querySelectorAll(".dropdown-content-residence")
  const dropdownElementsTypes = document.querySelectorAll(".dropdown-content-type")

  dropdownElementsResidences.forEach((element) => {
    element.addEventListener("click", () => {
      document.querySelector("#residence").value = element.innerHTML;
      document.querySelector("#select-search-residence").innerHTML = `${element.innerHTML} <img src="${document.querySelector("#img-arrow-down").innerHTML}" alt="icône flèche" class="arrow-search" style="width: 25px !important;">`;
      document.querySelector("#select-search-residence").classList.add("choosen");
      document.getElementById("dropdown-elements-residence").classList.toggle("show");
    })
  })

  dropdownElementsTypes.forEach((element) => {
    element.addEventListener("click", () => {
      document.querySelector("#type_list").value = element.dataset.filter;
      document.querySelector("#select-search-type").innerHTML = `${element.innerHTML} <img src="${document.querySelector("#img-arrow-down").innerHTML}" alt="icône flèche" class="arrow-search" style="width: 25px !important;">`;
      document.querySelector("#select-search-type").classList.add("choosen");
      document.getElementById("dropdown-elements-type").classList.toggle("show");
    })
  })

  // Submit the form when user click on the button
  document.querySelector(".button-search-helps").addEventListener("click", () => {
     animSearch();
  })
}

const animSearch = async () => {
    searchProgressBarHelp();
    document.querySelector(".main-index").style.opacity = 0.2;
    await sleep(2500)
    document.querySelector('#search-form').submit()
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

const changeResidence = () => {
  const residences = [
    "Auvergne-Rhône Alpes",
    "Bourgogne-Franche-Comté",
    "Bretagne",
    "Centre-Val de Loire",
    "Corse",
    "Grand-Est",
    "Guadeloupe",
    "Guyane",
    "Hauts de France",
    "Ile-de-France",
    "Martinique",
    "Mayotte",
    "Normandie",
    "Nouvelle-Aquitaine",
    "Occitanie",
    "Pays de la Loire",
    "Provence-Alpes-Côte-d'Azur",
    "Réunion",
    "France",
    "Outre-mer",
    "À l'étranger"
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

export { changeResidence }
export { updateInput }
export { searchIndex }
