params =
  'bounds':
    'width': 400,
    'height': 500

chrome.app.runtime.onLaunched.addListener( ->
  chrome.app.window.create 'index.html', params)
