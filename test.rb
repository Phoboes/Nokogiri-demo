require 'nokogiri'
require 'open-uri'
require 'pry'

base_url = "https://badtaxidermy.com"

index = Nokogiri::HTML( open( base_url ) )
site_title = index.css( '.header .title' ).text.strip

p site_title

pagination_length = index.css( '.pagination li' )[-2].text.to_i


(1..pagination_length).each do | page |
  paginated_index = Nokogiri::HTML( open( base_url + "?page=" + page.to_s ) )

  posts = paginated_index.css( '.post' )

posts.each do |post|
  post_title = post.css('.title').text
  post_image = post.css('.postimage img').attribute('src').value

  p post_title
  p post_image
end

end

