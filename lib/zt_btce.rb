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
      puts ZtBtce::colored BLUE, "Hello from ZtBtce! Just first test" 
    end
  end
  
  def self.error_check response
    if !response.nil?
      if response.first[0] == 'success' and response.first[1] == 0
        puts colored RED, "#{timestamp}  #{response['error']}"
        {}
      else
        response
      end
    end
  end
  
#  error_check debug_connection
 
   
#####  Testing Public API   #####
#  puts "-----   info   ------"
#  puts info

#  puts "-----   ticker   ------"
#  puts ticker pairs: 'btc_rur-btc_eur-btc_usd'
#  puts ticker.to_json
  
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

#  puts "-----    Trade (create orders)  -----"
#  puts trade pair: 'btc_usd', type: 'buy', rate: 8000.0, amount: 0.01

#  puts "-----    Cancel Order  -----"
#  puts cancel_order order_id: 343152

end