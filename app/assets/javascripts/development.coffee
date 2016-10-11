$ ->
  if $('html.development').length > 0
    title = $('title').html().replace('[dev]', '').replace(/\s*Pugetive.com\s*/, '').replace(/\s*ToddGehman.(com|net|dev\:3000)\s*/i, '').replace(/\s*Todd Gehman\s*/, '').replace(/\s*[^a-zA-Z0-9]\s*/, '')
    if title.length == 0
      alert("Hey! This page is missing a specific HTML title. You should fix that.")
