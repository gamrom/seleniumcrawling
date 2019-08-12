namespace :naver do
  desc "TODO"
  task title: :environment do
    require 'selenium-webdriver'
    Selenium::WebDriver::Chrome.driver_path = `which chromedriver-helper`.chomp # 설치한 크롬 드라이버 사용

    ## 헤드리스 개념
    # https://beomi.github.io/2017/09/28/HowToMakeWebCrawler-Headless-Chrome/
    options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
    options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
    options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting

    @browser = Selenium::WebDriver.for :chrome, options: options

    # 다음 페이지로 이동
    @browser.get "https://m.map.naver.com/search2/search.nhn?query=%EB%8F%99%EB%AC%BC%EB%B3%91%EC%9B%90"

    #아래는 css속성입니다
    #ct > div.search_listview._content._ctList > ul > li:nth-child(1) > div.item_info > a.a_item.a_item_distance._linkSiteview > div > strong

    @content = @browser.find_elements(css: '#ct > div.search_listview._content._ctList > ul > li')
    @content.each do |t|
      @title = t.find_element(css: "strong").text
      Titledatum.create(title: @title)
    end
    @browser.quit
  end

end
