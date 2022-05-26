class PasswordMatch {

  constructor (doc, page) {
    this.document = doc;
    this.page = page;
  }

  passwordsDefinition () {
    let password = this.document.getElementById('user_password');
    let password_confirmation = this.document.getElementById('user_password_confirmation');
    let match = this.page.querySelector('.octicon-check');
    let noMatch = this.page.querySelector('.octicon-circle-slash');
    this.document.addEventListener('input', function () {
      if (password.value != password_confirmation.value && password.value) {
        match.classList.add('hide');
        noMatch.classList.remove('hide');
      } else if (password.value == password_confirmation.value && password.value) {
        match.classList.remove('hide');
        noMatch.classList.add('hide');
      }
    });    
  }
}

