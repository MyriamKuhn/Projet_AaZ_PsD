const loadFiles = (folder, fileName, target) => {
  const r = new XMLHttpRequest();
  const url = "/"+folder+"/"+fileName+".html";
  r.open("GET", url, true);
  r.onreadystatechange = function () {
    if(r.readyState != 4 || r.status != 200) return;
    document.getElementById(target).innerHTML = r.responseText;
  };
  r.send();
}

window.addEventListener("DOMContentLoaded", (event) => {
  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);
  loadFiles(urlParams.get("fold"), urlParams.get("file"), "page-content");
});