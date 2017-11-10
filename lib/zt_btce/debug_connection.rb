# Net::HTTP
# http://ruby-doc.org/stdlib-2.4.1/libdoc/net/http/rdoc/Net/HTTP.html#top

module ZtBtce
  ##############################################################################
  #   Plays with Net::HTTP connections to fallen BTC-e
  #   10.11.2017  Updated to handle secrets
  ##############################################################################
  def self.debug_connection
    uri_string =  get_domain + '/api/3/info'
#   uri_string = 'http://google.com'
    puts "uri_sting = #{uri_string}"
    
    uri =  URI "#{uri_string}"
    puts "uri.host = #{uri.host} / uri.port = #{uri.port}"
    puts "uri.class = #{uri.class}"
    puts "uri: #{uri}"

#    response = Net::HTTP.get(uri)
    response = Net::HTTP.get_response(uri)

    case response
    when Net::HTTPSuccess, Net::HTTPRedirection 
      puts response
    else
      puts colored RED, 'debug_connection: Response problem!'
      return {'success' => 0, 'error' => "#HTTP error! Code: #{response.code}, Message: #{response.message}"}
    end  
      puts "response.class: #{response.class}"
      puts "response.class.name: #{response.class.name}"
      puts "========="
  
      puts "response.code: #{response.code}"          # => 200 | 302   | 301               | 503                             | 522
      puts "response.message: #{response.message}"    # => OK  | Found | Moved Permanently | Service Temporarily Unavailable |  ...Time-out 
      puts "" # => 'HTTPOK' 

      puts "response['Set-Cookie']: #{response['Set-Cookie']}"                        # => String
      puts "response.get_fields('set-cookie'): #{response.get_fields('set-cookie')}"  # => Array
      puts "response.to_hash['set-cookie']: #{response.to_hash['set-cookie']}"        # => Array
      puts "Headers: #{response.to_hash.inspect}"
    
      puts "response: #{response}"
  end
end

=begin
Responses:

1) uri_string =  DOMAIN + '/api/3/info'
uri_sting = https://btc-e.nz/api/3/info
uri.host = btc-e.nz / uri.port = 443
uri.class = URI::HTTPS
uri: https://btc-e.nz/api/3/info
 BAD Response!
response.class: Net::HTTPServerError
response.class.name: Net::HTTPServerError
=========
response.code: 522
response.message: Origin Connection Time-out

response['Set-Cookie']: __cfduid=d2ab5eae20286a16471bf7c1cc0d96cf81501056470; expires=Thu, 26-Jul-18 08:07:50 GMT; path=/; domain=.btc-e.nz; HttpOnly
response.get_fields('set-cookie'): ["__cfduid=d2ab5eae20286a16471bf7c1cc0d96cf81501056470; expires=Thu, 26-Jul-18 08:07:50 GMT; path=/; domain=.btc-e.nz; HttpOnly"]
response.to_hash['set-cookie']: ["__cfduid=d2ab5eae20286a16471bf7c1cc0d96cf81501056470; expires=Thu, 26-Jul-18 08:07:50 GMT; path=/; domain=.btc-e.nz; HttpOnly"]
Headers: {"date"=>["Wed, 26 Jul 2017 08:08:20 GMT"], "content-type"=>["text/html; charset=UTF-8"], "transfer-encoding"=>["chunked"], "connection"=>["keep-alive"], "set-cookie"=>["__cfduid=d2ab5eae20286a16471bf7c1cc0d96cf81501056470; expires=Thu, 26-Jul-18 08:07:50 GMT; path=/; domain=.btc-e.nz; HttpOnly"], "expires"=>["Thu, 01 Jan 1970 00:00:01 GMT"], "cache-control"=>["no-store, no-cache, must-revalidate, post-check=0, pre-check=0"], "pragma"=>["no-cache"], "x-frame-options"=>["SAMEORIGIN"], "strict-transport-security"=>["max-age=15552000; preload"], "x-content-type-options"=>["nosniff"], "server"=>["cloudflare-nginx"], "cf-ray"=>["3845de1dfcaa4ea2-DME"]}
response: #<Net::HTTPServerError:0x007f9b5f0a0b20>


2) uri_string = 'http://google.com'

uri_sting = http://google.com
uri.host = google.com / uri.port = 80
uri.class = URI::HTTP
uri: http://google.com
#<Net::HTTPFound:0x007ff7bc027ea0>
response.class: Net::HTTPFound
response.class.name: Net::HTTPFound
=========
response.code: 302
response.message: Found

response['Set-Cookie']: 
response.get_fields('set-cookie'): 
response.to_hash['set-cookie']: 
Headers: {"cache-control"=>["private"], "content-type"=>["text/html; charset=UTF-8"], "referrer-policy"=>["no-referrer"], "location"=>["http://www.google.ru/?gfe_rd=cr&ei=q054WaToKePAuAGFpaCgCw"], "content-length"=>["258"], "date"=>["Wed, 26 Jul 2017 08:11:23 GMT"]}
response: #<Net::HTTPFound:0x007ff7bc027ea0>

3) uri_string = 'http://rbc.ru'

uri_sting = http://rbc.ru
uri.host = rbc.ru / uri.port = 80
uri.class = URI::HTTP
uri: http://rbc.ru
#<Net::HTTPMovedPermanently:0x007fc43e8378e0>
response.class: Net::HTTPMovedPermanently
response.class.name: Net::HTTPMovedPermanently
=========
response.code: 301
response.message: Moved Permanently

response['Set-Cookie']: 
response.get_fields('set-cookie'): 
response.to_hash['set-cookie']: 
Headers: {"server"=>["nginx"], "date"=>["Wed, 26 Jul 2017 08:15:03 GMT"], "content-type"=>["text/html"], "content-length"=>["178"], "connection"=>["keep-alive"], "location"=>["http://www.rbc.ru/"]}
response: #<Net::HTTPMovedPermanently:0x007fc43e8378e0>
=end


