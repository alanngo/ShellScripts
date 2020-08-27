# used to run typescripts
tsc *.ts
echo "JS File to run: "
read MAIN
node $MAIN".js"