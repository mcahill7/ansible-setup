#install homebrew
if [ ! -x /usr/local/bin/brew ]; then
    echo "installing homebrew"
    /usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "homebrew is installed"
fi

if [ ! -x /usr/local/bin/ansible ]; then
    echo "installing ansible via homebrew"
    brew install ansible
else
    echo "ansible is installed"
fi

#brew
sudo chown -R $(whoami) /usr/local
sudo chown -R ${USER}:staff /opt/homebrew-cask
sudo chown -R $(whoami) /usr/local/Cellar
brew doctor
brew update
brew upgrade
brew cleanup
brew cask cleanup
brew link gdbm
brew install wget
brew install python
pip install --upgrade pip setuptools

#run playbook
sudo ansible-galaxy install geerlingguy.homebrew --ignore-certs
ansible-playbook pb.yml
