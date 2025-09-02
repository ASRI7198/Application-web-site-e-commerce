/**
 * 
 */
 let state = true;
 
 let bienvennue = document.querySelector(".Bienvennue");
 console.log(bienvennue);
 
 window.onload = function() {
	console.log("hello");
	if(state){
		state = !state ;
		setTimeout(hideBien, 2000);
	}
}

function hideBien() {
	bienvennue.classList.add("hide");
}