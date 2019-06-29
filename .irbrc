require 'irb/completion'

autoload :ERB, 'erb'
autoload :JSON, 'json'
autoload :YAML, 'yaml'
autoload :URI, 'uri'

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000
