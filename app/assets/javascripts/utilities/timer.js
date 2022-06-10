document.addEventListener('turbolinks:load', function() {
  let allTime = document.querySelector('.timer');
  if (allTime) {
    const timeValue = allTime.dataset.timer;
    let delay = 1000;
    setInterval(function() {
      let timeFinish = new Date(timeValue);
      let timeNow = new Date();
      let timeDifference = (timeFinish.getTime() - timeNow.getTime());
      let minutes = Math.trunc((timeDifference / (1000 * 60)) % 60);
      let seconds = Math.trunc((timeDifference % (1000 * 60)) / 1000);

      minutes = minutes < 10 ? "0" + minutes : minutes;
      seconds = seconds < 10 ? "0" + seconds : seconds;

      if (timeDifference <= 0) {
        const form = document.querySelector('.test-passage-form');
        const passageId = form.dataset.testPassageId;
        
        alert("Time is out!")
        document.location.href = `http://localhost:3000/test_passages/${passageId}/result`
      } else {
        let strTimer = `${minutes}:${seconds}`;
        allTime.innerHTML = strTimer;
      }
    }, delay)
  }
})
