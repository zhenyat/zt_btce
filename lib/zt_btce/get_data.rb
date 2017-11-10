################################################################################
#   Gets data from yml-file
#   
#   NB! Rails.root is not defined yet
#
#   21.07.2017  ZT
#   10.11.2017  Updated to handle secrets (new methods added)
################################################################################
module ZtBtce
  app_root = `pwd`.chomp    #!!! Rails.root is nil at the moment
  
  if defined?(Rails).nil?   # While testing the Gem
    begin
      config_file = YAML.load_file(File.join(app_root, "config", "btce_api.yml"))
      
      DOMAIN = config_file['domain'].freeze
      KEY    = config_file['key'].freeze
      SECRET = config_file['secret'].freeze
      
    rescue Errno::ENOENT => e
      puts colored(RED, "Could not parse YAML-file: #{e.message}")
      exit
    end
  end

  def self.get_domain
    if const_defined?('DOMAIN')
      DOMAIN
    else
      Rails.application.class.secrets.domain
    end
  end

  def self.get_key
    if const_defined?('KEY')
      KEY
    else
      Rails.application.class.secrets.api_key
    end
  end
  
  def self.get_secret
    if const_defined?('SECRET')
      SECRET
    else
      Rails.application.class.secrets.api_secret
    end
  end
end