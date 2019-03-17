function startup(elm) {
  var app = elm.Main.init({
    flags: {
      width: document.documentElement.clientWidth,
      height: document.documentElement.clientHeight
    }
  });
}

window.miyamo = { startup: startup };
