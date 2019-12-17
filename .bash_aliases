# Load GNU aliases for mac
# Use homebrew's coreutils if possible or the standard command otherwise
if [ -d "$HOME/.homebrew/Cellar/coreutils" ]; then
    LATEST_COREUTILS_DIR=$(ls -td -- $HOME/.homebrew/Cellar/coreutils/*/ | head -n 1)
    if [[ ! -z ${LATEST_COREUTILS_DIR+x} ]] && [[ -d "$LATEST_COREUTILS_DIR" ]]; then
        export PATH=$PATH:$LATEST_COREUTILS_DIR/bin
        alias ls='gls --color=auto'
        alias dircolors=gdircolors
    fi
else
    if [[ `uname -s` == 'Darwin' ]]; then
        alias ls='ls -G'
    else
        alias ls='ls --color=auto'
    fi
fi

# Set other ls aliases
alias ll='ls -l'
alias lla='ls -alF'
alias lh='ls -sh'
alias la='ls -A'
alias l='ls -CF'

# Colourize grep output.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Colourize diff
command -v colordiff >/dev/null 2>&1 && { alias diff=colordiff; }

# Graphical vim
if type vimx >/dev/null 2>&1; then 
    alias vim='vimx'
    export GIT_EDITOR="vimx"
elif type mvim >/dev/null 2>&1; then 
    alias vim='mvim -v'
    export GIT_EDITOR="mvim -v"
fi

# Git fast-forward merge
alias gff='git merge --ff-only'

# hub command for better GitHub integration.
# [ $(which hub 2>/dev/null) ] && alias git=hub

# Force password authentication with SSH. Used to get around the situation
# where SSH freezes while trying to do public key authentication because
# DIRO has the NFS/Kerberos Setup From Hell.
# From http://unix.stackexchange.com/q/15138
alias sshpw='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'

# Force 256 colors tmux
alias tmux="TERM=xterm-256color /home/ciccone/.local/bin/tmux -2"
#alias tmux="tmux -2"  # Force tmux to use 256 colors
# . $HOME/.tmux/set_tmux_config.sh
# alias tmux='TERM=screen-256color tmux -2'
alias vim="nvim"


# Autocomplete ssh names in bash (defined in .ssh/config)
_complete_ssh_hosts () {
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                    cut -f 1 -d ' ' | \
                    sed -e s/,.*//g | \
                    grep -v ^# | \
                    uniq | \
                    grep -v "\[" ;
            cat ~/.ssh/config | \
                    grep "^Host " | \
                    awk '{print $2}'
            `
    COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
    return 0
}
complete -F _complete_ssh_hosts ssh

# Montreal
lisa() {
    if [ $# == 0 ]; then
        sshpass -f ~/.lisa ssh -YC visin@elisa1
    elif [ $# == 1 ]; then
        sshpass -f ~/.lisa ssh -YC -L $1:localhost:$1 visin@elisa1
    else
        echo "usage: sshlisa [port]"
    fi
}
alias lisassh=lisa
lisascp() {
    sshpass -f ~/.lisa scp -Cr visin@elisa1.iro.umontreal.ca:$1 $2
}
lisarsync() {
    sshpass -f ~/.lisa rsync -a -X --partial -h --progress --copy-links visin@elisa1.iro.umontreal.ca:$1 $2
}
alias squeue='squeue -o "%.6i %.1t %.6q %.7m %.12b %.3C %.3D %.18k %.11L %R"'

# Quick and dirty installation of packages with pip from GitHub.
ghpip() {
    if [ $# == 0 ]; then
        echo "usage: ghpip user/project [branch/refspec]"
        return 1
    fi
    if [ $# == 1 ]; then
        GITHUBPATH=$1
        BRANCH=master
    else
        GITHUBPATH=$1
        BRANCH=$2
    fi
    pip install --upgrade "git+git://github.com/$GITHUBPATH.git@$BRANCH"
}

# disk usage
disk_usage() {
    # TODO: apparently ncdu is better
    du -h $1 2> >(grep -v '^du: cannot \(access\|read\)' >&2) | grep '[0-9\.]\+G' | sort -rn
}

# who is using gpus
gpu_who() {
    for i in `nvidia-smi -q -d PIDS | grep ID | cut -d ":" -f2`; do ps -u -p "$i"; done
}

# rsync options
alias rsyncopt="rsync -a -X --partial -h --progress --bwlimit=20000 --copy-links "
alias rsyncopt_nolimit="rsync -a -X --partial -h --progress --copy-links "
cpdataset() {
    if [ "$#" -ne 4 ]; then
        echo "Usage: cpdataset <source_files> <dest_user> <dest_server> <dest_root_dir>"
    else
        tar czf - $1 | ssh $2@$3 "cd $4 && tar xvzf -"
    fi
    }
export -f cpdataset

# Manage the weird pkscreen routine for lisa lab
alias frascreen="pkscreen; sleep 5; screen -r; sleep 2"

CVD_CLR(){ export CUDA_VISIBLE_DEVICES=''; }
CVD0(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}0; }
CVD1(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}1; }
CVD2(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}2; }
CVD3(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}3; }
CVD4(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}4; }
CVD5(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}5; }
CVD6(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}6; }
CVD7(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}7; }
CVDNONE(){ export CUDA_VISIBLE_DEVICES=-1; }

# Displays
D0(){ export DISPLAY=localhost:0.0; }
D10(){ export DISPLAY=localhost:10.0; }
D11(){ export DISPLAY=localhost:11.0; }
D12(){ export DISPLAY=localhost:12.0; }

# DOCKER
# ======

alias dk="docker"
alias dkl="docker logs"
alias dki="docker images"
alias dkrm="docker rm"
alias dkps="docker ps"
alias dkpsa="docker ps -a"

# dkattach <name>: attach to existing container
dkattach() { docker start $1 && docker attach $1; }
# dkrun [<args>] <image>: runs a container from a docker image

dkrun(){ 
   nvidia-docker run  -ti\
       --workdir /host$PWD \
       --volume /:/host \
       --env PYTHONUNBUFFERED=x \
       --env CUDA_CACHE_PATH=/host/tmp/cuda-cache "$@"
}
# dklaunch [<args>] <image> <cmd>: runs a command on a docker container; when the command finishes, it removes the container
dklaunch(){ dkrun -ti --rm "$@"; }
# dkpython <cmd>: launches a python2.7 command on the default docker container
dkpython(){ dklaunch airlab/dl:latest bash -c "source activate py27; python $@"; }
# dkipython <image> <cmd>: launches a python2.7 command a a user specified image
dkipython(){ dklaunch $1 PY27; python "${@:2}"; }
# dkpython3 <cmd>: launches a python3.6 command on the default docker container
dkpython3(){ dklaunch airlab/dl:latest bash -c "source activate py36; python $@"; }
# dkipython3 <image> <cmd>: launches a python3.6 command a a user specified image
dkipython3(){ dklaunch $1 PY36; python "${@:2}"; }

tb-docker() {
	run-docker --container_name="{user}_tensorboard_{date}" --image_name="tensorflow/tensorflow:latest" --symlinks=0 --docker_args="-p $1:$1" '' '' tensorboard --port $1 --bind_all --logdir /exp;
}

jupyter-docker() {
    docker run --rm -it --shm-size 8G --cpuset-cpus=$2 -p $1:$1 --user $(id -u):$(id -g) --group-add users -v `pwd`:/exp -v $HOME/.jupyter/:/.jupyter -t ciccone/dl:cuda10_pytorch-1.1.0_tf-1.14_py36 jupyter notebook  --ip=0.0.0.0 --port=$1;
}

jupyter-nvidia-docker() {
    NV_GPU=$3 nvidia-docker run --rm -it --shm-size 8G --cpuset-cpus=$2 -p $1:$1 --user $(id -u):$(id -g) --group-add users -v `pwd`:/exp -v $HOME/.jupyter/:/.jupyter  -t ciccone/dl:cuda10_pytorch-1.1.0_tf-1.14_py36 jupyter notebook --ip=0.0.0.0 --port=$1;
}

jupyterlab-docker() {
    docker run --rm -it --shm-size 8G --cpuset-cpus=$2 -p $1:$1 --user $(id -u):$(id -g) --group-add users -v `pwd`:/exp -v $HOME/.jupyter/:/.jupyter -t ciccone/dl:cuda10_pytorch-1.1.0_tf-1.14_py36 jupyter lab  --ip=0.0.0.0 --port=$1;
}

jupyterlab-nvidia-docker() {
    NV_GPU=$3 nvidia-docker run --rm -it --shm-size 8G --cpuset-cpus=$2 -p $1:$1 --user $(id -u):$(id -g) --group-add users -v `pwd`:/exp -v $HOME/.jupyter/:/.jupyter -t ciccone/dl:cuda10_pytorch-1.1.0_tf-1.14_py36 jupyter lab  --ip=0.0.0.0 --port=$1;
}

# jupyter-nvidia-docker() {
#     NV_GPU=$3 nvidia-docker run --rm -it --shm-size 8G --cpuset-cpus=$2 -p $1:$1 --cap-add SYS_ADMIN --device /dev/fuse --security-opt apparmor=unconfined --user $(id -u):$(id -g) --group-add users -v `pwd`:/exp -t ciccone/dl:cuda10_pytorch-1.1.0_tf-1.14_py36 jupyter notebook --ip=0.0.0.0 --port=$1 --NotebookApp.allow_origin='https://colab.research.google.com' --port=$1 --NotebookApp.port_retries=0;
# }
# 

