# Put this in your .bashrc
# Assumes you have gopass installed

yubi-env() {
    eval $(gopass "$1" | awk '/^_export/ {print "export", $2}')
}
