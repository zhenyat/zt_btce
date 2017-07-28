#require "zt_btce/version"
require 'yaml'
require 'json'
require 'cgi'
require 'openssl'
require 'net/http'
require 'zt_btce/setpar'
require 'zt_btce/methods_pool'
require 'zt_btce/get_data'
require 'zt_btce/public_api'
require 'zt_btce/trade_api'
require 'zt_btce/trade_emulator'
require 'zt_btce/debug_connection'

module ZtBtce
  
  # for CLI Test
  class CliTest
    AppRoot = `pwd`.chomp
    
    def say_hello
      puts "Hello from ZtBtce! Just first test"
    end
  end
  
  def self.error_check response
    puts response
    if response.first[0] == 'success' and response.first[1] == 0
      puts colored RED, "#{timestamp}  #{response['error']}"
      {}
    else
      response
    end
  end
  
  error_check debug_connection
 
   
#####  Testing Public API   #####
#  puts "-----   info   ------"
#  puts info
#  
#  puts "-----   ticker   ------"
#  puts ticker pairs: 'btc_rur-btc_eur-btc_usd'

#  puts "-----   depth   ------"
#  puts depth pairs: 'btc_rur', limit: 20
 
#  puts "-----   trades   ------"
#  puts trades pairs: 'btc_rur', limit: 20
#   puts trades 

#####   Testing Trade API   #####
#  puts "-----    getInfo   -----"
#  puts account_info

#  puts "-----    ActiveOrders   -----"
#  puts active_orders 'mode' => 'emulator'
#  puts active_orders
#  puts active_orders "pair" => 'btc_rur'

  #  puts "-----    ActiveOrders   -----"
#  puts order_info 343152, 'mode' => 'emulator'
end