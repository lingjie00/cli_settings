source $HOME/venv/ds/bin/activate.fish

function venv --argument-names cmd --description "Activate Python venvs - Ling"
    set --local venv_path $HOME/venv/
    set --local activate_path bin/activate.fish
    switch "$cmd"

        case ls
            ls $venv_path

        case path
            echo $venv_path

        case \*
            echo "activate $cmd venv"
            source "$venv_path/$cmd/$activate_path"
    end
end

function tableau --description "Open PygWalker Tableau"
    streamlit run $HOME/github/pygwalker_streamlit/tableau.py
end

function git_base --description "Go to base of git repo"
    cd (git rev-parse --show-toplevel)
end

alias icat="kitten icat"
