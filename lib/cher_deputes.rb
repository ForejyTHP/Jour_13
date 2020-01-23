require 'nokogiri'
require 'open-uri'

def get_depute_mail(depute_page_link)
  html = open(depute_page_link)
  depute_page = Nokogiri::HTML(html)

  mail = depute_page.css("dl[class='deputes-liste-attributs']")
                    .css('a[href]')[2].text
  mail.delete_prefix('Mél : ')
end

def get_deputes_list
  html = open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")
  doc = Nokogiri::HTML(html)

  ary_depute_list = []
  depute_list = doc.css("div[id='deputes-list']")
                   .css('li a')
  depute_list.each do |depute|
    ary_full_name = depute.text.split(' ')
    hash_du_depute = {}
    hash_du_depute['first_name'] = ary_full_name[1]
    hash_du_depute['last_name'] = ary_full_name[2]
    hash_du_depute['email'] = (hash_du_depute['first_name']
                              + '.' + hash_du_depute['last_name']).downcase
                              + '@assemblee-nationale.fr'
    # Version ultra-longue (577 pages a ouvrir)
    # hash_du_depute["email"] = get_depute_mail("http://www2.assemblee-nationale.fr" + depute['href'])
    ary_depute_list.push(hash_du_depute)
    # Version ultra-longue suite, pour afficher en 'temps reel'"
    pp ary_depute_list
  end
end
