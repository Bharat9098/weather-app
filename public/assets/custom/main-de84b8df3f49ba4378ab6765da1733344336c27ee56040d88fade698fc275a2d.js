function sayHi() {
	debugger
	var fn = document.getElementById("search-input").val();
	var regex = /^[0-9\_]+$/
	alert(regex.test(fn));
}

window.sayHi = sayHi;

// $(document).ready(function () {
    // alert("page has loaded!")
    //   function myFunction() {}
    // $("#search-input").click(function(){
    //   var fn = $("#search-input").val();
    //   var regex = /^[0-9\_]+$/
    //   alert(regex.test(fn));
    // });
  // });
