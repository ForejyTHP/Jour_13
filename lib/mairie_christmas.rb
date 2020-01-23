require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
  html = open(townhall_url)
  doc = Nokogiri::HTML(html)
  townhall_email = doc.css('tbody')[0]
                      .css('tr')[3]
                      .css('td')[1].text
  return townhall_email
end

def get_townhall_urls
  html = open('https://www.annuaire-des-mairies.com/val-d-oise.html')
  doc = Nokogiri::HTML(html)
  townhall_list = doc.css("a[class='lientxt']")
  hash_townhall_email = Hash.new
  townhall_list.each do |townhall|
    temp = 'http://annuaire-des-mairies.com' + townhall['href'].delete_prefix('.')
    temp2 = adapt_syntax(townhall)
    hash_townhall_email[temp2] = get_townhall_email(temp)
  end
  pp hash_townhall_email
end

def adapt_syntax(word)
  word.text.split.each do |word|
    if (word.size >= 3 && word != 'SUR') || word == 'WU' || word == 'US' || word == 'DIT' || word == 'SOUS'
      word.capitalize!
    else
      word.downcase!
    end
  end.join(' ')
end
get_townhall_urls
