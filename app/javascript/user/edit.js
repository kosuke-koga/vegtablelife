'use strict';

{
  const user_show_open = document.getElementById('user_show_open');
  const user_show_modal = document.getElementById('user_show_modal');
  const user_show_mask = document.getElementById('user_show_mask');
  const user_show_close = document.getElementById('user_show_close');

  user_show_open.addEventListener('click', () => {
    user_show_modal.classList.remove('hidden');
    user_show_mask.classList.remove('hidden');
  });

  user_show_close.addEventListener('click', () => {
    user_show_modal.classList.add('hidden');
    user_show_mask.classList.add('hidden');
  });

  user_show_mask.addEventListener('click', () => {
    user_show_close.click();
  });
}