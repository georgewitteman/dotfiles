PS4="%f%b%D{%H:%M:%S.%5.} +%N:%i(%I):%B "
zmodload zsh/datetime

# benchmark_start() {
#   _start_time=$(($EPOCHREALTIME*1000000))
# }

# benchmark_end() {
#   local now=$(($EPOCHREALTIME*1000000))
#   echo "$1 ${$(( $now - $_start_time ))[0,-2]}ns"
# }

[ -f ~/.config/zsh/config.zsh ] && source ~/.config/zsh/config.zsh
