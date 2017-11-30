alias stop_emacs="kill $(ps aux | grep '[e]macs --daemon' | awk '{ print $2 }')"
