if [ ! -d /root/.bashrcs ]; then
  mkdir /root/.bashrcs
fi

cp -f ./bashrc ~/.bashrc
cp -f ./vscode.sh ~/.bashrcs/~vscode.sh