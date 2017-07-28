################################################################################
#   Gets data from yml-file
#   
#   NB! Rails.root is not defined yet
#
#   21.07.2017  ZT
################################################################################
module ZtBtce
  app_root = `pwd`.chomp    #!!! Rails.root is nil at the moment
  
  begin
    config_file = YAML.load_file(File.join(app_root, "config", "btce_api.yml"))
  rescue Errno::ENOENT => e
    puts colored(RED, "Could not parse YAML-file: #{e.message}")
    exit
  end

  DOMAIN = config_file['domain']
  KEY    = config_file['key']
  SECRET = config_file['secret']
  puts SECRET[-1..-4]
end