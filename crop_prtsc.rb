# frozen_string_literal: true

require 'watir'
require 'mini_magick'

browser = Watir::Browser.new :firefox, headless: true
browser.goto('http://localhost:3001/isdoc/286')
browser.window.resize_to(1606, 1314)
element = browser.element(css: '.row.justify-content-center')
location = element.location
size = element.size
browser.screenshot.save('screenshot.png')
image = MiniMagick::Image.open('screenshot.png')
image.crop("#{size[:width]}x#{size[:height]}+#{location[:x]}+#{location[:y]}")
image.write('screenshot.png')

system 'xdg-open', 'screenshot.png'
