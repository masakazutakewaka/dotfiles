require 'irb/completion'

autoload :ERB, 'erb'
autoload :JSON, 'json'
autoload :YAML, 'yaml'
autoload :URI, 'uri'

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000

clear = "\e[0m"
bold = "\e[1m"
yellow = "\e[33m"
blue = "\e[34m"
magenta = "\e[35m"
cyan = "\e[36m"

IRB.conf[:PROMPT][:DEFAULT] = {
  PROMPT_I: "#{magenta}#{bold}%N#{clear}(#{yellow}#{bold}%m#{clear})[#{cyan}#{bold}%02n#{clear}:%i]> ",
  PROMPT_N: "#{magenta}#{bold}%N#{clear}(#{yellow}#{bold}%m#{clear})[#{cyan}#{bold}%02n#{clear}:%i]> ",
  PROMPT_S: "#{magenta}#{bold}%N#{clear}(#{yellow}#{bold}%m#{clear})[#{cyan}#{bold}%02n#{clear}:%i]%l ",
  PROMPT_C: "#{magenta}#{bold}%N#{clear}(#{yellow}#{bold}%m#{clear})[#{cyan}#{bold}%02n#{clear}:%i]* ",
  RETURN: "=> %s\n",
}
