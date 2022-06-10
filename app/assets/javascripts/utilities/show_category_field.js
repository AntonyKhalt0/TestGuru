document.addEventListener('turbolinks:load', function() {
  let control = document.getElementById('badge_rule');

  if (control) { control.addEventListener('input', showCategoryField); }
})

function showCategoryField() {
  let rule = document.getElementById('badge_rule').value;
  let categoryField = document.querySelector('.category');
  if (rule == 'all_tests_passage_from_category_rule') {
    categoryField.classList.remove('hide');
  } else {
    categoryField.classList.add('hide');
  }
}
