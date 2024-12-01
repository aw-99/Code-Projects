const positiveAff = [
    { id: 1, quote: "Important quote 1, it will change your life!" },
    { id: 2, quote: "consectetur adipisicing elit. Velit, dolores!" },
    { id: 3, quote: "amet consectetur adipisicing elit. Velit, dolores!" }]
    
    const button = document.getElementById('button')
    
    button.addEventListener("click", function () {
        newQuote()
    })
    function newQuote() {
      var randomNumber = Math.floor(Math.random() * (positiveAff.length));
        document.getElementById("affirmations").innerHTML = positiveAff[randomNumber].quote;
    }