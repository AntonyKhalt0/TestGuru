class PasswordMatch {

  constructor (page) {
    this.page = page;
  }

  passwordsDefinition (password, password_confirmation) {
    let passwordLabel = this.page.querySelector('.password-label');
    let passwordConfirmationLabel = this.page.querySelector('.password-confirmation-label');
    let passwordMatch = passwordLabel.querySelector('.octicon-check');
    let passwordNoMatch = passwordLabel.querySelector('.octicon-circle-slash');
    let passwordConfirmMatch = passwordConfirmationLabel.querySelector('.octicon-check');
    let passwordConfirmNoMatch = passwordConfirmationLabel.querySelector('.octicon-circle-slash');
    passwordLabel.addEventListener('input', function () {
      if (password.value) {
        if (password.value != password_confirmation.value) {
          passwordMatch.classList.add('hide');
          passwordNoMatch.classList.remove('hide');
        } else if (password.value == password_confirmation.value) {
          passwordMatch.classList.remove('hide');
          passwordNoMatch.classList.add('hide');
        }  
      }  
    })
    passwordConfirmationLabel.addEventListener('input', function () {
      if (password.value) {
        if (password.value != password_confirmation.value) {
          passwordConfirmMatch.classList.add('hide');
          passwordConfirmNoMatch.classList.remove('hide');
        } else if (password.value == password_confirmation.value) {
          passwordConfirmMatch.classList.remove('hide');
          passwordConfirmNoMatch.classList.add('hide');
          passwordMatch.classList.remove('hide');
          passwordNoMatch.classList.add('hide');
        } 
      }
    }) 
  }
}

