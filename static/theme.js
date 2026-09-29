// Three themes, cycled by the round button in the header: mint, light, dark.
// The choice is kept per browser. Until one is made the page follows the
// device's light or dark mode, and mint when that cannot be read. Loaded in
// <head> so the page never paints in the wrong theme first.
(function () {
  var KEY = 'theme', MODES = ['mint', 'light', 'dark'];
  var root = document.documentElement;
  function device() {
    try {
      if (matchMedia('(prefers-color-scheme: dark)').matches) return 'dark';
      if (matchMedia('(prefers-color-scheme: light)').matches) return 'light';
    } catch (e) {}
    return 'mint';
  }
  function chosen() {
    try { var m = localStorage.getItem(KEY); return MODES.indexOf(m) < 0 ? null : m; } catch (e) { return null; }
  }
  function mode() { return chosen() || device(); }
  function apply(m) {
    root.setAttribute('data-theme', m);
    var b = document.getElementById('theme-cycle');
    if (b) { b.title = 'Theme: ' + m; b.setAttribute('aria-label', 'Theme: ' + m + '. Click to change.'); }
  }
  apply(mode());
  try {
    matchMedia('(prefers-color-scheme: dark)').addEventListener('change', function () {
      if (!chosen()) apply(device());
    });
  } catch (e) {}
  addEventListener('DOMContentLoaded', function () {
    var b = document.getElementById('theme-cycle');
    if (!b) return;
    b.hidden = false;
    apply(mode());
    b.addEventListener('click', function () {
      var n = MODES[(MODES.indexOf(mode()) + 1) % MODES.length];
      try { localStorage.setItem(KEY, n); } catch (e) {}
      apply(n);
    });
  });
})();
