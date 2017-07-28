################################################################################
# Library of common methods for the Gem
#
# 21.07.2017  ZT adapted from zt_admin
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
  
  def self.nonce
    Time.now.to_i
  end
  
  def self.timestamp
    Time.now.strftime('%Y-%m-%d %H:%M:%S')
  end
  
  def self.zt_pub method, options
    puts options
  end
end