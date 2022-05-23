document.addEventListener("turbolinks:load", () => {
  const selectbox = document.getElementById("post_club_id");
  selectbox.addEventListener("change", function(){
      const form = document.forms[0];
      form.insertAdjacentHTML(
        'beforeend',
        '<input type="hidden" id="club_confirmed" name="club_confirmed" value="true">'
);
		document.getElementById("button").click();
		
	}, false);
});