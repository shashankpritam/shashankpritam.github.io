---
title: "Pictures"
description: "Pictures!"
---



#### Some random but cool pictures (of my cat mostly).

<div style="display: flex; flex-wrap: wrap;">
    <div style="flex: 50%;">
        <img src="/pics/chikuhandsome.jpg" alt="Handsome" style="width: 100%;">
        <p>Striking a Dashing Pose</p>
    </div>
    <div style="flex: 50%;">
        <img src="/pics/chikupose.jpg" alt="Pose" style="width: 100%;">
        <p>Elegantly Poised</p>
    </div>
    <!-- more divs for other images -->
</div>

<div>
    <img src="{{ .Get "src" }}" alt="{{ .Get "alt" }}">
    <p>{{ .Get "caption" }}</p>
</div>

{{< image src="/pics/chikuhandsome.jpg" alt="Handsome" caption="Striking a Dashing Pose" >}}
{{< image src="/pics/chikupose.jpg" alt="Pose" caption="Elegantly Poised" >}}
<!-- more shortcodes for other images -->



![Handsome](/pics/chikuhandsome.jpg) - Striking a Dashing Pos
  
![Pose](/pics/chikupose.jpg) - Elegantly Poised
  
![Rawr](/pics/chikurawr.jpg) - Chiku: Fierce and Feisty

![Wonder](/pics/chikuwonder.jpg) - Lost in Thought and Wonder
  
![MrTurt](/pics/mrturt.jpg) - MrTurt: The Wise and Ancient One
  
![Sneak](/pics/sneak.jpg) - Sneak: Sneaky
  
![Uni](/pics/uni.jpg) - University






