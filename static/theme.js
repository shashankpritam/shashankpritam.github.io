// Five themes in the header capsule: Rex day, slate, stone, light, dark.
// The choice is kept per browser. Until one is made the page wears Rex day,
// or dark when the device is in dark mode. Loaded in <head> so the page
// never paints in the wrong theme first.
(function () {
  var KEY = 'theme';
  var MODES = [['rexday', 'Rex day'], ['slate', 'Slate'], ['stone', 'Stone'], ['light', 'Light'], ['dark', 'Dark']];
  var NAMES = MODES.map(function (m) { return m[0]; });
  var root = document.documentElement;
  function device() {
    try { if (matchMedia('(prefers-color-scheme: dark)').matches) return 'dark'; } catch (e) {}
    return 'rexday';
  }
  function chosen() {
    try { var m = localStorage.getItem(KEY); return NAMES.indexOf(m) < 0 ? null : m; } catch (e) { return null; }
  }
  function mode() { return chosen() || device(); }
  function apply(m) {
    root.setAttribute('data-theme', m);
    var bs = document.querySelectorAll('#theme-pick button');
    for (var i = 0; i < bs.length; i++) bs[i].setAttribute('aria-pressed', bs[i].getAttribute('data-t') === m);
  }
  apply(mode());
  try {
    matchMedia('(prefers-color-scheme: dark)').addEventListener('change', function () {
      if (!chosen()) apply(device());
    });
  } catch (e) {}
  addEventListener('DOMContentLoaded', function () {
    var box = document.getElementById('theme-pick');
    if (!box) return;
    MODES.forEach(function (m) {
      var b = document.createElement('button');
      b.type = 'button'; b.setAttribute('data-t', m[0]); b.title = m[1]; b.setAttribute('aria-label', m[1]);
      b.appendChild(document.createElement('i'));
      b.addEventListener('click', function () {
        try { localStorage.setItem(KEY, m[0]); } catch (e) {}
        apply(m[0]);
      });
      box.appendChild(b);
    });
    box.hidden = false;
    apply(mode());
  });
})();
