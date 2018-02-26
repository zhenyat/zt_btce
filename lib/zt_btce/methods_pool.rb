################################################################################
# Library of common methods for the Gem
#
# 21.07.2017  ZT adapted from zt_admin
# 26.02.2018  Update of nonce 
################################################################################

#require 'fileutils'

module ZtBtce

  ##############################################################################
  # Colorizes text for output to bash terminal
  ##############################################################################
  def self.colored flag, text
    case flag
      when BLACK
        index = 30
      when BLUE
        index = 34
      when CYAN
        index = 36
      when GREEN
        index = 32
      when GREY, GRAY
        index = 37
      when MAGENTA
        index = 35
      when RED
        index = 31
      when WHITE
        index = 37
      when YELLOW
        index = 33
    else
      index = 0
    end
    "\e[#{index}m #{text}" + "\e[0m"
  end
  
  def self.myconnect()
    []
  end
  
  ##############################################################################
  #   Modified for case of a series of tapi requests within one second
  #   ( Approach:   (Time.now.to_f*10).to_i  - Too big value for nonce)
  ##############################################################################
  def self.nonce
    current = Time.now.to_i
    if @last_value.nil? || current > @last_value
      @last_value = current
    else
      @last_value += 1
    end
    @last_value
  end

  def self.timestamp
    Time.now.strftime('%Y-%m-%d %H:%M:%S')
  end
  
  def self.zt_pub method, options
    puts options
  end
end