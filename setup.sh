
# Prerequisites:
# - install a fresh copy of OS
# - ensure public key is generated and registered with github a/c 

set -e

echo "Installing virtualenv"
sudo apt-get install python-virtualenv

echo "Making virtualenv if necessary"
if [ ! -d .venv ]; then
    virtualenv .venv
fi

echo "Activating virtualenv"
. .venv/bin/activate

echo "Installing requirements"
pip install -r requirements.txt

echo "Running playbook"
ansible-playbook --ask-become-pass -i hosts -c local -b local.yml

set +e
