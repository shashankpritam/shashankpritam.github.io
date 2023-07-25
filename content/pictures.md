---
title: "Pictures"
description: "Pictures!"
---

<style>
  #pictures {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
    gap: 16px;
    margin-bottom: 16px;
  }

  .picture {
    width: 100%;
    height: auto;
    display: block;
  }

  #chiku-pics {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
    gap: 16px;
    margin-bottom: 16px;
  }

  .chiku-pic {
    width: 100%;
    height: auto;
    display: block;
  }
</style>

<h2>Chiku</h2>

<div id="chiku-pics">
  <img src="/chiku.jpg" alt="Chiku 1" class="chiku-pic">
</div>