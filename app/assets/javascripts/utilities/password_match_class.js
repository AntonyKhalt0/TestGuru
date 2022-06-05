class PasswordMatch {

  constructor (page) {
    this.page = page;
  }

  passwordsDefinition (password, password_confirmation) {
    let password_label = this.page.querySelector('.password-label');
    let password_confirmation_label = this.page.querySelector('.password-confirmation-label');
    let match = this.page.querySelector('.octicon-check');
    let noMatch = this.page.querySelector('.octicon-circle-slash');
    password_label.addEventListener('input', function () {
      if (password.value != password_confirmation.value && password.value) {
        match.classList.add('hide');
        noMatch.classList.remove('hide');
      } else if (password.value == password_confirmation.value && password.value) {
        match.classList.remove('hide');
        noMatch.classList.add('hide');
      }   
    })
    password_confirmation_label.addEventListener('input', function () {
      if (password.value != password_confirmation.value && password.value) {
        match.classList.add('hide');
        noMatch.classList.remove('hide');
      } else if (password.value == password_confirmation.value && password.value) {
        match.classList.remove('hide');
        noMatch.classList.add('hide');
      }
    }) 
  }
}

