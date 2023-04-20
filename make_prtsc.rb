require 'watir'
require 'pry'

browser = Watir::Browser.new :firefox, headless: true
browser.goto('http://localhost:3001/isdoc/286')
screenshot = browser.screenshot
screenshot.save('screenshot.png')
system 'xdg-open', 'screenshot.png'
