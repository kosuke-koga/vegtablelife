'use strict';

{
  const header_open = document.getElementById('header_open');
  const overlay = document.querySelector('.overlay');
  const header_close = document.getElementById('header_close');

  header_open.addEventListener('click', () => {
    overlay.classList.add('header_show');
    header_open.classList.add('header_hide');
  });

  header_close.addEventListener('click', () => {
    overlay.classList.remove('header_show');
    header_open.classList.remove('header_hide');
  });
}