module ZtBtce
  ##############################################################################
  #   Sends a request to BTCE via Public API v3 and returns result as a Hash
  #
  #   Ref:  https://btc-e.nz/api/3/documentation
  #   
  #   23.07.2017  ZT
  ##############################################################################
  def self.public_api method, options = {}
    # Hanlde options
    options[:pairs].nil? ? pairs = 'btc_usd' : pairs = options[:pairs]
    limit = options[:limit] unless options[:limit].nil?

    uri =  DOMAIN + '/api/3'    # Public API URI

    # Just verify method / options
    case method
    when 'info'
      pairs = nil
      limit = nil
    when 'ticker'
      limit = nil
    when 'depth', 'trades'
      # it's OK. both: pairs and limit to be applied
    else 
      return {:success => 0, :error => "Public API: Invalid method"}
    end

    uri =  URI "#{uri}/#{method}/#{pairs}"   # Add Method & Pairs
    
    # Add *limit* e.g. *https://btc-e.nz/api/3/trades/btc_eur?limit=50*    
    uri.query = URI.encode_www_form({:limit => limit}) if !limit.nil? and limit != HTTP_LIMIT

    # Send a request
    begin
      response = Net::HTTP.get(uri)
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
           Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
    rescue StandardError => e
      return {:success => 0, :error => e}
      exit
    end

    # Return response as a Hash
    JSON.parse response
  end
  
  ##############################################################################
  # Checks that response is not an error message aka:
  #   {"success":0, "error":"Invalid method"}
  # If error: returns empty hash, otherwise: returns response
  # 
  # caller_locations(1,1)[0].label - the calling method
  ##############################################################################
  def self.public_error_check response
    if response.first.class == Array and response.first[0] == :success and response.first[1] == 0
      puts colored RED, "#{timestamp}  Error in method '#{caller_locations(1,1)[0].label}': #{response[:error]}"
      {}
    else
      response
    end
  end
  
  def self.info
    response = public_api 'info'
    public_error_check response        # Return result through error check at first
  end
  
  def self.ticker opts = {}
    response = public_api 'ticker', pairs: opts[:pairs]
    public_error_check response
  end
  
  def self.depth opts = {}
    response = public_api 'depth',  pairs: opts[:pairs], limit: opts[:limit]
    public_error_check response
  end

  def self.trades opts = {}
    response = public_api 'trades', pairs: opts[:pairs], limit: opts[:limit]
    public_error_check response
  end
end
