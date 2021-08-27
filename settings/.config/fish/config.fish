
abbr -a bd "cd .."
abbr -a bdd "cd ../.."
abbr -a bddd "cd ../../.."
abbr -a bdddd "cd ../../../.."
abbr -a bddddd "cd ../../../../.."
abbr -a nv "nvim"
abbr -a vi "vim"
abbr -a ls "ls -a"
abbr -a rm "rm -rf"
abbr -a mkdir "mkdir -p"
abbr -a cp "cp -rp"
abbr -a mv "mv -i"
abbr -a ln "ln -s"
abbr -a tar "tar fzx"
abbr -a zip "zip -rq"
abbr -a du "du -bS --max-depth 1 . | sort -n | numfmt --to=iec --suffix=B --padding=5"
abbr -a uniq " | sort | uniq "
abbr -a diff "diff (sort filename | psub) (sort filename | psub)"
abbr -a comm "comm (sort filename | psub) (sort filename | psub)"
abbr -a awk "awk -F '' '{print \$}'"
abbr -a sed "sed -e 's///g'"
abbr -a find 'find -type -name ""'

abbr -a asc "aws s3 cp"
abbr -a ass "aws s3 sync"
abbr -a asl "aws s3 ls"
abbr -a alc "aws lambda"

abbr -a ps "ps -a"
abbr -a psf "ps aux | fzf"
abbr -a glow "glow -p"
abbr -a lsof "sudo lsof -i:"
abbr -a rsync "rsync -a --delete"
abbr -a tmux "tmux -2"
abbr -a column "sed 's/,,/, ,/g'  | column -t -s ,"

abbr -a "cat-" "cat"
abbr -a "cat" "bat --paging=never"

abbr -a "less-" "less"
abbr -a less "bat"
abbr -a lwss "bat"

abbr -a dokcer "docker"
abbr -a docer "docker"
abbr -a doker "docker"
abbr -a docke "docker"
abbr -a dockr "docker"

abbr -a dcls "docker container ls -a | less"
abbr -a dclsf "docker container ls -a | fzf"
abbr -a dce "docker container exec -it "
abbr -a dcr "docker container run --rm --mount (pwd)/:  --name name "
abbr -a dci "docker container inspect anyone | less"
abbr -a dclo "docker container log -f "
abbr -a dcrm "docker container rm"

abbr -a dib "docker image build -t imagename ."
abbr -a dils "docker image ls -a | less"
abbr -a dilsf "docker image ls -a | fzf"
abbr -a dipl "docker image pull" 
abbr -a dips "docker image push" 
abbr -a dirm "docker image rm"

abbr -a dnls "docker network ls -a | less"
abbr -a dnlsf "docker network ls -a | fzf"
abbr -a dnrm "docker network rm"


abbr -a dvls "docker volume ls -a | less"
abbr -a dvlsf "docker volume ls -a | fzf"
abbr -a dvrm "docker volume rm"

abbr -a dcp "docker-compose"
abbr -a dcpb "docker-compose build"
abbr -a dcpu "docker-compose up -d"
abbr -a dcpd "docker-compose down"
abbr -a dcpp "docker-compose ps -a"

abbr -a suod "sudo"
abbr -a mdkir "mkdir -p"
abbr -a mkdri "mkdir -p"

# abbr -a bash bash

abbr -a bashl "FISH_AUTO_START=0 bash -c 'FISH_AUTO_START=0 source ~/.bashrc'"
abbr -a fishl "FISH_AUTO_START=0 bash -c 'FISH_AUTO_START=1 source ~/.bashrc'"

set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_COMPLETE 2
set -U FZF_FIND_FILE_OPTS '--no-height --reverse --select-1 --exit-0 --preview "bat --paging=never --color=always {} | head -n 55"'
set -U FZF_CD_OPTS             '--no-height --reverse --select-1 --exit-0 --preview "exa -a -T -L 2 {} | head -n 55"'
set -U FZF_CD_WITH_HIDDEN_OPTS '--no-height --reverse --select-1 --exit-0 --preview "exa -a -T -L 2 {} | head -n 55"'
set -U FZF_PREVIEW_FILE_CMD "bat --paging=never --color=always 2> /dev/null | head -n 55"
set -U FZF_PREVIEW_DIR_CMD "exa -ha -T -L 2 | head -n 55"
