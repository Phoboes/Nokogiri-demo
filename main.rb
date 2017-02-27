require 'nokogiri'
require 'open-uri'
require 'pry'

base_url = "http://www.badtaxidermy.com/"

index = Nokogiri::HTML( open( base_url ) )
page_title = index.css('.header .title').text.strip
pagination_length = index.css('.pagination li')[-2].text.to_i

p '---------------------------------------------'
p 
p page_title.upcase
p 
p '---------------------------------------------'

(1..pagination_length).each do |page|

  paginated_page = Nokogiri::HTML( open( base_url + '?page=' + page.to_s ) )

  posts = paginated_page.css('.post')

  posts.each do |post|
    post_title = post.css('.title').text
    post_image = post.css('.postimage img').attribute('src').value

    p post_title
    p post_image
    p '---------------------------------------------'
  end
end
p 
p '---------------------------------------------'