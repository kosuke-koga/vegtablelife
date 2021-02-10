'use strict';

{
  const new_open = document.getElementById('new_open');
  const new_modal = document.getElementById('new_modal');
  const new_mask = document.getElementById('new_mask');
  const new_close = document.getElementById('new_close');

  new_open.addEventListener('click', () => {
    new_modal.classList.remove('hidden');
    new_mask.classList.remove('hidden');
  });

  new_close.addEventListener('click', () => {
    new_modal.classList.add('hidden');
    new_mask.classList.add('hidden');
  });

  new_mask.addEventListener('click', () => {
    new_close.click();
  });
}
