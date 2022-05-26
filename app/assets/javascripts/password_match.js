document.addEventListener('turbolinks:load', function() {
  const registrationPage = new PasswordMatch(document, document.querySelector('.check-pass'));
  registrationPage.passwordsDefinition();
})  
