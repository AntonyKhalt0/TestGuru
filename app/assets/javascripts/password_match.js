class passwordMatch {

  constructor (doc) {
    this.document = doc;
  }

  passwordsDefinition () {
    let password = this.document.getElementById('user_password');
    let password_confirmation = this.document.getElementById('user_password_confirmation');
    this.clickSubmit(password, password_confirmation);    
  }

  clickSubmit (password, password_confirmation) {
    submit.onclick = function () { 
      if (password.value != password_confirmation.value && password.value) {
        return alert('Passwords dont match!');  
      } else if (password.value == password_confirmation.value && password.value) {
        return alert('Well done, the passwords match!');
      }
    }
  }
}

document.addEventListener('turbolinks:load', function() {
  const registrationPage = new passwordMatch(document);
  registrationPage.passwordsDefinition();
})  
