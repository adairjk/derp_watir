Before() do
  @browser = Watir::Browser.new
  @browser.goto 'http://derp-bear.herokuapp.com/'
end

After() do
  @browser.close
end