require 'nokogiri'
require 'open-uri'
class HomeController < ApplicationController
  def index
    @data_list= Titledatum.all
  end
end

#ct > div.search_listview._content._ctList > ul > li:nth-child(2)
#ct > div.search_listview._content._ctList > ul > li:nth-child(1)

# "https://m.map.naver.com/search2/search.nhn?query=동물병원"

#ct > div.search_listview._content._ctList > ul > li:nth-child(1) > div.item_info > a.a_item.a_item_distance._linkSiteview > div > strong

#ct > div.search_listview._content._ctList > ul > li:nth-child(1) > div.item_info
