import { searchProgressBar } from '../plugins/progress_bar';

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
  // Animations for type changing
  const types = [
  "📸 financer du matériel",
  "🛠 financer une production",
  "🔮 un secours exceptionnel",
  "🏠 une résidence (artistique)",
  "📣 financer une diffusion",
  ];
  const element = document.getElementById("text-to-change-type");
  if (element) {
    let counter = 0;
    const inst = setInterval(() => {
      element.innerHTML = types[counter];
      counter++;
      if (counter >= types.length) {
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
      document.querySelector("#select-search-residence").innerHTML = element.innerHTML;
      document.querySelector("#select-search-residence").classList.add("choosen");
      document.getElementById("dropdown-elements-residence").classList.toggle("show");
      // document.querySelector('#search-form').submit();

    })
  })

  dropdownElementsTypes.forEach((element) => {
    element.addEventListener("click", () => {
      document.querySelector("#type").value = element.innerHTML;
      document.querySelector("#select-search-type").innerHTML = element.innerHTML;
      document.querySelector("#select-search-type").classList.add("choosen");
      document.getElementById("dropdown-elements-type").classList.toggle("show");
      // clearInterval(inst);
      // document.querySelector('#search-form').submit();
    })
  })

  // Submit the form when user click on the button
  document.querySelector(".button-search").addEventListener("click", () => {
     animSearch();
  })
}

const animSearch = async () => {
    searchProgressBar();
    document.querySelector(".index-direction").style.opacity = 0.2;
    document.querySelector(".cards").style.opacity = 0.2;
    await sleep(2500)
    document.querySelector('#search-form').submit()
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

const changeResidence = () => {
  const residences = [
    "Auvergne-Rhône Alpes",
    "Bourgogne-Franche Comté",
    "Bretagne",
    "Centre Val de Loire",
    "Corse",
    "Grand-Est",
    "Guadeloupe",
    "Guyane",
    "Hauts de France",
    "Ile de France",
    "Martinique",
    "Mayotte",
    "Normandie",
    "Nouvelle Aquitaine",
    "Occitanie",
    "Pays de la Loire",
    "Provence-Alpes-Côte-d'Azur",
    "Réunion",
    "Française ou résidant en France"
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
