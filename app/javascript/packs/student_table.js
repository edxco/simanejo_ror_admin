const buttons = Object.values(document.getElementsByClassName('btn-List'));
console.log(buttons);

const showHide = (item) => {
  console.log('item2', item);
  if (item.classList.contains("hidden")) {
    item.classList.remove("hidden");
  } else {
    item.classList.add("hidden");
  }
}

const selectProject = (e) => {
  e.preventDefault();
  console.log('e', e);
  currentProject = e.target.id;
  console.log('E.target', currentProject);
  const x = Object.values(document.getElementsByClassName(currentProject));
  console.log('x', x)
  x.forEach(item => {
    console.log('item', item)
  showHide(item);
});
}

buttons.forEach(item => {
  console.log('item', item)
  item.addEventListener('click', selectProject);
});