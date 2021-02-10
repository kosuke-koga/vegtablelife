'use strict';

{
  const menuItem = document.querySelectorAll('.task_open');
  const contents = document.querySelectorAll('.task_modal');

  menuItem.forEach(clickedItem => {
    clickedItem.addEventListener('click', () => {

      menuItem.forEach(item=>{
        item.classList.remove('active');
      });
      clickedItem.classList.add('active');

      contents.forEach(content => {
        content.classList.remove('active');
      });
      document.getElementById(clickedItem.dataset.id).classList.add('active');
    });
  });

}