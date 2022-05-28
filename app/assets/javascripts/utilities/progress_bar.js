document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.container');
  //console.log(control);

  if (control) { control.addEventListener('input', showProgress); }
})

function showProgress() {
  let progressBar = document.getElementById('progress-bar');
  let progressPercent = progressBar.dataset.progress;
  let ariaValueNow = progressBar.getAttribute('aria-valuenow');
  ariaValueNow = progressPercent;
  progressBar.style.width = progressPercent + '%';
} 
