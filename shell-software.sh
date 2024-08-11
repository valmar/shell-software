set -eou pipefail

mkdir -p ${HOME}/Software/shell-software/atuin
mkdir -p ${HOME}/Software/shell-software/bat
mkdir -p ${HOME}/Software/shell-software/direnv
mkdir -p ${HOME}/Software/shell-software/eza
mkdir -p ${HOME}/Software/shell-software/fd
mkdir -p ${HOME}/Software/shell-software/fzf
mkdir -p ${HOME}/Software/shell-software/just
mkdir -p ${HOME}/Software/shell-software/neovim
mkdir -p ${HOME}/Software/shell-software/ripgrep
mkdir -p ${HOME}/Software/shell-software/ruff
mkdir -p ${HOME}/Software/shell-software/starship
mkdir -p ${HOME}/Software/shell-software/uv
mkdir -p ${HOME}/Software/shell-software/zoxide


# Atuin
ATUIN_VERSION=$(curl -s https://api.github.com/repos/atuinsh/atuin/releases/latest | grep html | head -n1 | sed 's/.*\/\(v.*\)\",/\1/')
wget -c https://github.com/atuinsh/atuin/releases/download/${ATUIN_VERSION}/atuin-x86_64-unknown-linux-musl.tar.gz -O - | tar xz
mv ./atuin-x86_64-unknown-linux-musl/atuin ${HOME}/Software/shell-software/atuin
rm -r ./atuin-x86_64-unknown-linux-musl
mkdir -p ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/atuin/atuin ${HOME}/.local/bin/


# Bat
BAT_VERSION=$(curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | grep html | head -n1 | sed 's/.*\/\(v.*\)\",/\1/')
wget -c https://github.com/sharkdp/bat/releases/download/${BAT_VERSION}/bat-${BAT_VERSION}-x86_64-unknown-linux-musl.tar.gz -O - | tar xz
mv ./bat-${BAT_VERSION}-x86_64-unknown-linux-musl/bat ${HOME}/Software/shell-software/bat/
mv ./bat-${BAT_VERSION}-x86_64-unknown-linux-musl/bat.1 ${HOME}/Software/shell-software/bat/
mv ./bat-${BAT_VERSION}-x86_64-unknown-linux-musl/autocomplete/bat.bash ${HOME}/Software/shell-software/bat/
mv ./bat-${BAT_VERSION}-x86_64-unknown-linux-musl/autocomplete/bat.zsh ${HOME}/Software/shell-software/bat/
rm -r ./bat-${BAT_VERSION}-x86_64-unknown-linux-musl
mkdir -p ${HOME}/.local/bin/
mkdir -p ${HOME}/.local/share/man/man1/
mkdir -p ${HOME}/.local/share/bash-completion/completions/
mkdir -p ${HOME}/.oh-my-zsh/custom/completions
ln -sf ${HOME}/Software/shell-software/bat/bat ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/bat/bat.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/bat/bat.bash ${HOME}/.local/share/bash-completion/completions/
ln -sf ${HOME}/Software/shell-software/bat/bat.zsh ${HOME}/.oh-my-zsh/custom/completions/_bat


# Direnv
wget https://direnv.net/install.sh
bin_path=${HOME}/Software/shell-software/direnv/ sh ./install.sh
rm ./install.sh
DIRENV_VERSION=$(curl -s https://api.github.com/repos/direnv/direnv/releases/latest | grep html | head -n1 | sed 's/.*\/v\(.*\)\",/\1/')
wget -c https://github.com/direnv/direnv/archive/refs/tags/v${DIRENV_VERSION}.tar.gz -O - | tar xz
mv ./direnv-${DIRENV_VERSION}/man/direnv-fetchurl.1 ${HOME}/Software/shell-software/direnv/
mv ./direnv-${DIRENV_VERSION}/man/direnv-stdlib.1 ${HOME}/Software/shell-software/direnv/
mv ./direnv-${DIRENV_VERSION}/man/direnv.1 ${HOME}/Software/shell-software/direnv/
mv ./direnv-${DIRENV_VERSION}/man/direnv.toml.1 ${HOME}/Software/shell-software/direnv/
rm -r ./direnv-${DIRENV_VERSION}
mkdir -p ${HOME}/.local/bin/
mkdir -p ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/direnv/direnv ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/direnv/direnv-fetchurl.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/direnv/direnv-stdlib.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/direnv/direnv.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/direnv/direnv.toml.1 ${HOME}/.local/share/man/man1/


# Eza
wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-musl.tar.gz -O - | tar xz
chmod +x ./eza
mv ./eza ${HOME}/Software/shell-software/eza/
EZA_VERSION=$(curl -s https://api.github.com/repos/eza-community/eza/releases/latest | grep html | head -n1 | sed 's/.*\/v\(.*\)\",/\1/')
wget -c https://github.com/eza-community/eza/archive/refs/tags/v${EZA_VERSION}.tar.gz -O - | tar xz
mkdir -p ${HOME}/Software/shell-software/eza/bash
mkdir -p ${HOME}/Software/shell-software/eza/zsh
mv ./eza-${EZA_VERSION}/completions/bash/eza ${HOME}/Software/shell-software/eza/bash
mv ./eza-${EZA_VERSION}/completions/zsh/_eza ${HOME}/Software/shell-software/eza/zsh
rm -r ./eza-${EZA_VERSION}
mkdir -p ${HOME}/.local/bin/
mkdir -p ${HOME}/.local/share/bash-completion/completions/
mkdir -p ${HOME}/.oh-my-zsh/custom/completions
ln -sf ${HOME}/Software/shell-software/eza/eza ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/eza/bash/eza ${HOME}/.local/share/bash-completion/completions/
ln -sf ${HOME}/Software/shell-software/eza/zsh/_eza ${HOME}/.oh-my-zsh/custom/completions/


# Fd
FD_VERSION=$(curl -s https://api.github.com/repos/sharkdp/fd/releases/latest | grep html | head -n1 | sed 's/.*\/\(v.*\)\",/\1/')
wget -c https://github.com/sharkdp/fd/releases/download/${FD_VERSION}/fd-${FD_VERSION}-x86_64-unknown-linux-musl.tar.gz -O - | tar xz
mv ./fd-${FD_VERSION}-x86_64-unknown-linux-musl/fd ${HOME}/Software/shell-software/fd/
mv ./fd-${FD_VERSION}-x86_64-unknown-linux-musl/fd.1 ${HOME}/Software/shell-software/fd/
mv ./fd-${FD_VERSION}-x86_64-unknown-linux-musl/autocomplete/fd.bash ${HOME}/Software/shell-software/fd/
mv ./fd-${FD_VERSION}-x86_64-unknown-linux-musl/autocomplete/_fd ${HOME}/Software/shell-software/fd/
rm -r ./fd-${FD_VERSION}-x86_64-unknown-linux-musl
mkdir -p ${HOME}/.local/bin/
mkdir -p ${HOME}/.local/share/man/man1/
mkdir -p ${HOME}/.local/share/bash-completion/completions/
mkdir -p ${HOME}/.oh-my-zsh/custom/completions
ln -sf ${HOME}/Software/shell-software/fd/fd ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/fd/fd.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/fd/fd.bash ${HOME}/.local/share/bash-completion/completions/
ln -sf ${HOME}/Software/shell-software/fd/_fd ${HOME}/.oh-my-zsh/custom/completions/


# Fzf
FZF_VERSION=$(curl -s https://api.github.com/repos/junegunn/fzf/releases/latest | grep html | head -n1 | sed 's/.*\/v\(.*\)\",/\1/')
wget -c https://github.com/junegunn/fzf/releases/download/v${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tar.gz -O - | tar xz
mv ./fzf ${HOME}/Software/shell-software/fzf/
wget -c https://github.com/junegunn/fzf/archive/refs/tags/v${FZF_VERSION}.tar.gz -O - | tar xz
mv ./fzf-${FZF_VERSION}/man/man1/fzf-tmux.1 ${HOME}/Software/shell-software/fzf/
mv ./fzf-${FZF_VERSION}/man/man1/fzf.1 ${HOME}/Software/shell-software/fzf/
mv ./fzf-${FZF_VERSION}/shell/completion.bash ${HOME}/Software/shell-software/fzf/
mv ./fzf-${FZF_VERSION}/shell/completion.zsh ${HOME}/Software/shell-software/fzf/
rm -r ./fzf-${FZF_VERSION}
mkdir -p ${HOME}/.local/bin/
mkdir -p ${HOME}/.local/share/man/man1/
mkdir -p ${HOME}/.local/share/bash-completion/completions/
mkdir -p ${HOME}/.oh-my-zsh/custom/completions
ln -sf ${HOME}/Software/shell-software/fzf/fzf ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/fzf/fzf-tmux.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/fzf/fzf.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/fzf/completion.bash ${HOME}/.local/share/bash-completion/completions/
ln -sf ${HOME}/Software/shell-software/fzf/completion.zsh ${HOME}/.oh-my-zsh/custom/completions/_fzf


# Just
JUST_VERSION=$(curl -s https://api.github.com/repos/casey/just/releases/latest | grep html | head -n1 | sed 's/.*tag\/\(.*\)\",/\1/')
mkdir just && cd just
wget -c https://github.com/casey/just/releases/download/${JUST_VERSION}/just-${JUST_VERSION}-x86_64-unknown-linux-musl.tar.gz -O - | tar xz
mv ./just ${HOME}/Software/shell-software/just/
mv ./just.1 ${HOME}/Software/shell-software/just/
mv ./completions/just.bash ${HOME}/Software/shell-software/just/
mv ./completions/just.zsh ${HOME}/Software/shell-software/just/
cd ../
rm -r ./just
mkdir -p ${HOME}/.local/bin/
mkdir -p ${HOME}/.local/share/man/man1/
mkdir -p ${HOME}/.local/share/bash-completion/completions/
mkdir -p ${HOME}/.oh-my-zsh/custom/completions
ln -sf ${HOME}/Software/shell-software/just/just ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/just/just.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/just/just.bash ${HOME}/.local/share/bash-completion/completions/
ln -sf ${HOME}/Software/shell-software/just/just.zsh ${HOME}/.oh-my-zsh/custom/completions/_just


# Neovim
NEOVIM_VERSION=$(curl -s https://api.github.com/repos/neovim/neovim-releases/releases/latest | grep html | head -n1 | sed 's/.*tag\/\(.*\)\",/\1/')
wget -c https://github.com/neovim/neovim-releases/releases/download/${NEOVIM_VERSION}/nvim-linux64.tar.gz -O - | tar xz
rm -fr ${HOME}/Software/shell-software/neovim/bin
rm -fr ${HOME}/Software/shell-software/neovim/lib
rm -fr ${HOME}/Software/shell-software/neovim/share
mv ./nvim-linux64/* ${HOME}/Software/shell-software/neovim/
rm -r ./nvim-linux64
mkdir -p ${HOME}/.local/bin/
mkdir -p ${HOME}/.local/share/man/man1/
mkdir -p ${HOME}/.local/share/
mkdir -p ${HOME}/.local/share/applications/
mkdir -p ${HOME}/.local/share/icons/hicolor/128x128/apps/
mkdir -p ${HOME}/.local/share/locale/af/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/ca/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/cs/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/cs.cp1250/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/da/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/de/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/en_GB/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/eo/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/es/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/fi/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/fr/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/ga/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/it/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/ja/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/ja.euc-jp/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/ko.UTF-8/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/nb/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/nl/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/no/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/pl.UTF-8/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/pt_BR/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/ru/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/sk/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/sk.cp1250/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/sv/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/tr/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/uk/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/vi/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/zh_CN.UTF-8/LC_MESSAGES/
mkdir -p ${HOME}/.local/share/locale/zh_TW.UTF-8/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/bin/nvim ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/neovim/share/man/man1/nvim.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/neovim/share/nvim ${HOME}/.local/share/
ln -sf ${HOME}/Software/shell-software/neovim/share/application/nvim.desktop ${HOME}/.local/share/applications/
ln -sf ${HOME}/Software/shell-software/neovim/share/icons/hicolor/128x128/apps/nvim.png ${HOME}/.local/share/icons/hicolor/128x128/apps/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/af/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/af/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/ca/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/ca/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/cs/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/cs/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/cs.cp1250/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/cs.cp1250/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/da/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/da/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/de/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/de/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/en_GB/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/en_GB/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/eo/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/eo/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/es/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/es/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/fi/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/fi/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/fr/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/fr/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/ga/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/ga/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/it/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/it/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/ja/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/ja/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/ja.euc-jp/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/ja.euc-jp/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/ko.UTF-8/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/ko.UTF-8/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/nb/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/nb/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/nl/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/nl/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/no/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/no/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/pl.UTF-8/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/pl.UTF-8/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/pt_BR/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/pt_BR/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/ru/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/ru/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/sk/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/sk/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/sk.cp1250/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/sk.cp1250/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/sv/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/sv/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/tr/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/tr/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/uk/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/uk/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/vi/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/vi/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/zh_CN.UTF-8/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/zh_CN.UTF-8/LC_MESSAGES/
ln -sf ${HOME}/Software/shell-software/neovim/share/locale/zh_TW.UTF-8/LC_MESSAGES/nvim.mo ${HOME}/.local/share/locale/zh_TW.UTF-8/LC_MESSAGES/


# RipGrep
RIPGREP_VERSION=$(curl -s https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | grep html | head -n1 | sed 's/.*tag\/\(.*\)\",/\1/')
wget -c https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep-${RIPGREP_VERSION}-x86_64-unknown-linux-musl.tar.gz -O - | tar xz
mv ./ripgrep-${RIPGREP_VERSION}-x86_64-unknown-linux-musl/rg ${HOME}/Software/shell-software/ripgrep/
mv ./ripgrep-${RIPGREP_VERSION}-x86_64-unknown-linux-musl/doc/rg.1 ${HOME}/Software/shell-software/ripgrep/
mv ./ripgrep-${RIPGREP_VERSION}-x86_64-unknown-linux-musl/complete/rg.bash ${HOME}/Software/shell-software/ripgrep/
mv ./ripgrep-${RIPGREP_VERSION}-x86_64-unknown-linux-musl/complete/_rg ${HOME}/Software/shell-software/ripgrep/
rm -r ./ripgrep-${RIPGREP_VERSION}-x86_64-unknown-linux-musl
mkdir -p ${HOME}/.local/bin/
mkdir -p ${HOME}/.local/share/man/man1/
mkdir -p ${HOME}/.local/share/bash-completion/completions/
mkdir -p ${HOME}/.oh-my-zsh/custom/completions
ln -sf ${HOME}/Software/shell-software/ripgrep/rg ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/ripgrep/rg.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/ripgrep/rg.bash ${HOME}/.local/share/bash-completion/completions/
ln -sf ${HOME}/Software/shell-software/ripgrep/_rg ${HOME}/.oh-my-zsh/custom/completions/


# Ruff
RUFF_VERSION=$(curl -s https://api.github.com/repos/astral-sh/ruff/releases/latest | grep html | head -n1 | sed 's/.*tag\/\(.*\)\",/\1/')
wget -c https://github.com/astral-sh/ruff/releases/download/${RUFF_VERSION}/ruff-x86_64-unknown-linux-musl.tar.gz -O - | tar xz
chmod +x ./ruff-x86_64-unknown-linux-musl/ruff
mv ruff-x86_64-unknown-linux-musl/ruff ${HOME}/Software/shell-software/ruff/
rm -r ./ruff-x86_64-unknown-linux-musl
mkdir -p ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/ruff/ruff ${HOME}/.local/bin/


# Starship
wget  https://starship.rs/install.sh
sh ./install.sh --yes --bin-dir=${HOME}/Software/shell-software/starship/
rm ./install.sh
mkdir -p ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/starship/starship ${HOME}/.local/bin/

# Uv
UV_VERSION=$(curl -s https://api.github.com/repos/astral-sh/uv/releases/latest | grep html | head -n1 | sed 's/.*tag\/\(.*\)\",/\1/')
wget -c https://github.com/astral-sh/uv/releases/download/${UV_VERSION}/uv-x86_64-unknown-linux-musl.tar.gz -O - | tar xz
chmod +x ./uv-x86_64-unknown-linux-musl/uv
chmod +x ./uv-x86_64-unknown-linux-musl/uvx
mv ./uv-x86_64-unknown-linux-musl/uv ${HOME}/Software/shell-software/uv/
mv ./uv-x86_64-unknown-linux-musl/uvx ${HOME}/Software/shell-software/uv/
rm -r ./uv-x86_64-unknown-linux-musl
mkdir -p ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/uv/uv ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/uv/uvx ${HOME}/.local/bin/


# Zoxide
wget https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh
sh ./install.sh --bin-dir=${HOME}/Software/shell-software/zoxide --man-dir=${HOME}/Software/shell-software/zoxide/
rm ./install.sh
mkdir -p ${HOME}/.local/bin/
mkdir -p ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/zoxide/zoxide ${HOME}/.local/bin/
ln -sf ${HOME}/Software/shell-software/zoxide/man1/zoxide.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/zoxide/man1/zoxide-add.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/zoxide/man1/zoxide-import.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/zoxide/man1/zoxide-init.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/zoxide/man1/zoxide-query.1 ${HOME}/.local/share/man/man1/
ln -sf ${HOME}/Software/shell-software/zoxide/man1/zoxide-remove.1 ${HOME}/.local/share/man/man1/


echo Done!

