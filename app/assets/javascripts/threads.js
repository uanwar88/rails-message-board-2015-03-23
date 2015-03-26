$(document).ready(function() {
  var edit_post_links = document.getElementsByClassName('edit-post-links');

  function update_post(post_id,message) {
    var url = window.location.pathname + "/posts/" + post_id;
    var params = "authenticity_token=" + encodeURIComponent(window._token.authenticity_token) + "&message=" + escape(message.trim().replace("<br>", "").replace("<p></p>", ""))
    console.log("URL: " + url);
    console.log("PARAMS: " + params);

    js_req = new XMLHttpRequest();
    js_req.open("PATCH", url);
    js_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    js_req.send(params);
  }

  function append_child() {
      br = document.createElement("br");
      p = document.createElement("p");
      p.style.color = "green";
      p.setAttribute("id", "success");
      p.innerHTML = "Successfully updated!";
      td.appendChild(p);
  }

  for (var i = 0; i < edit_post_links.length; i++) {
    edit_post_links[i].onclick = function() {
      var initial_success = document.getElementById("success");
      if (initial_success != null) {
        td.removeChild(initial_success);
      }
      var post_id = this.getAttribute("id");
      var div_id = "post-" + post_id;
      var td_id = "td-" + post_id;
      div = document.getElementById(div_id);
      td = document.getElementById(td_id)
      // console.log(div);
      div.setAttribute("contenteditable", "true");
      div.style.backgroundColor = "#ffffff";
      div.focus();
      div.onblur = function() {
        this.style.backgroundColor = "transparent";
        div.setAttribute("contenteditable", "false");
        message = this.innerHTML;
        update_post(post_id,message);
        js_req.addEventListener("load", append_child);
      };
    }
  }
});
