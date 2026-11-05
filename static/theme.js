// Five themes in the header capsule: Rex day, slate, stone, light, dark.
// The capsule rests closed on the current dot; a click opens it, a pick closes it.
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
    var open = !!(box() && box().classList.contains('open'));
    for (var i = 0; i < bs.length; i++) {
      var on = bs[i].getAttribute('data-t') === m;
      bs[i].setAttribute('aria-pressed', on);
      bs[i].setAttribute('aria-label', on && !open ? 'Theme: ' + bs[i].title + '. Choose another.' : bs[i].title);
      if (on) bs[i].setAttribute('aria-expanded', open); else bs[i].removeAttribute('aria-expanded');
    }
  }
  function box() { return document.getElementById('theme-pick'); }
  function setOpen(o) { var b = box(); if (b) { b.classList.toggle('open', o); apply(mode()); } }
  apply(mode());
  try {
    matchMedia('(prefers-color-scheme: dark)').addEventListener('change', function () {
      if (!chosen()) apply(device());
    });
  } catch (e) {}
  addEventListener('DOMContentLoaded', function () {
    var pick = box();
    if (!pick) return;
    MODES.forEach(function (m) {
      var b = document.createElement('button');
      b.type = 'button'; b.setAttribute('data-t', m[0]); b.title = m[1]; b.setAttribute('aria-label', m[1]);
      b.appendChild(document.createElement('i'));
      b.addEventListener('click', function () {
        if (!pick.classList.contains('open')) { setOpen(true); return; }
        try { localStorage.setItem(KEY, m[0]); } catch (e) {}
        pick.classList.remove('open');
        apply(m[0]);
      });
      pick.appendChild(b);
    });
    document.addEventListener('click', function (e) { if (!pick.contains(e.target)) setOpen(false); });
    document.addEventListener('keydown', function (e) { if (e.key === 'Escape' && pick.classList.contains('open')) setOpen(false); });
    pick.hidden = false;
    apply(mode());
  });
})();
