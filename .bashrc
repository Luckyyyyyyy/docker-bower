# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

composer () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --user $(id -u):$(id -g) \
        --volume ~/dnmp/composer:/tmp \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume $(pwd):/app \
        composer "$@"
}
alias bower='docker run -it --rm \
	-v $(pwd):$(pwd) \
        -w $(pwd) \
        -e UID=$(id -u) \
        xataz/bower'


# php7 cli
php () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --volume $PWD:/www:rw \
        --workdir /www \
        dnmp_php php "$@"
}

