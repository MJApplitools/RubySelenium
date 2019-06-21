require 'eyes_selenium'
require 'selenium-webdriver'

eyes = Applitools::Selenium::Eyes.new
eyes.api_key = ENV["APPLITOOLS_API_KEY"]

driver = Selenium::WebDriver.for :chrome

begin 
	eyes.test(app_name: "Ruby Test", test_name: "Ruby", viewport_size: {width:800, height:600}, driver: driver) do
		driver.get 'https://applitools.com/helloworld'
		eyes.check_window 'Hello!'

		driver.find_element(:tag_name => 'button').click

		eyes.check_window 'Click!'
	end
ensure
	driver.quit
	eyes.abort_if_not_closed
end