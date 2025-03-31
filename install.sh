echo "Running install.sh"

#source ~/venv/bin/activate
. ~/venv/bin/activate
python3 -m pip install wheel ansible ibmsecurity pywinrm "pypsrp<=1.0.0" "pypsrp[credssp]<=1.0.0"
ansible-galaxy collection install ibm.isam

