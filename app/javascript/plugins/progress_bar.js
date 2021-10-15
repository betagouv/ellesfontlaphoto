const searchProgressBarHelp = () => {
  const progressbar = document.querySelector(".progress-help");

  const changeProgress = (progress) => {
    progressbar.style.width = `${progress}%`;
  };

  /* change progress after 1 second (only for showcase) */
  setTimeout(() => changeProgress(22), 1000);
  setTimeout(() => changeProgress(45), 1500);
  setTimeout(() => changeProgress(85), 2000);
  setTimeout(() => changeProgress(98), 2000);
  setTimeout(() => changeProgress(100), 2000);
  return true;
}

const searchProgressBar = () => {
  const progressbar = document.querySelector(".progress");

  const changeProgress = (progress) => {
    progressbar.style.width = `${progress}%`;
  };

  /* change progress after 1 second (only for showcase) */
  setTimeout(() => changeProgress(22), 1000);
  setTimeout(() => changeProgress(45), 1500);
  setTimeout(() => changeProgress(85), 2000);
  setTimeout(() => changeProgress(98), 2000);
  setTimeout(() => changeProgress(100), 2000);
  return true;
}

export { searchProgressBar }

export { searchProgressBarHelp }
