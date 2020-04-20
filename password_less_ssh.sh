STEP-1:
Login into cdhmn03
Generate key(run ssh-keygen)[run below syntax]
ssh-keygen -b 2048 -t rsa -q -N "" -f ~/.ssh/id.rsa
Now to copy this key to all nodes.[run below syntax; it will ask your login password ]
for i in cdhdn{01..25};do ssh-copy-id -o StrictHostKeyChecking=no -i .ssh/id_rsa.pub $i;done
