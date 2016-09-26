---
title: "24 mm Rocket: Design Log"
---


Design Log
==========

{% for post in site.posts %}
### <span style="color:#aaa;width:140px;display:inline-block;" markdown="1">{{ post.date | date: "%Y %b %d" }}:</span>[{{ post.title }}](/24mm-rocket{{ post.url }})

<div style="margin-bottom:40px;margin-left:140px;" markdown="1">
  {{ post.excerpt }}
</div>
{% endfor %}

