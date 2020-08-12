#check root
if  [ `id -u` != '0' ] ;then
    echo "Please use root privilege to make sure installation sucessful."
    exit
fi

#custom directory
if [ "$1" != "" ] && [ "$1" != "-s" ];then
    echo "use '-s [service_dir]' to assign a customized systemd directory."
    exit
elif [ "$1" == "-s" ] && [ !"$2" ];then
    echo "use '-s [service_dir]' to assign a customized systemd directory."
    exit
elif [ "$1" == "-s" ] && [ "$2" ];then
    dir=$2
elif [ !"$1" ];then
    dir=/usr/lib/systemd/system/
else
    echo "Some errors occured..."
    exit
fi

echo "Be sure you are under root privilege have installed the following dependences:"
echo "  1.cmake\n  2.libevdev\n  3.yaml-cpp"

read -p "Have you installed all?(Y/n)" option
if [ "$option" == "n" ] || [ "$option" == "N" ];then
    echo "Aborting installation"
    exit
fi
#install tools and caps2esc
mkdir ./tools/build
mkdir ./caps2esc/build
cd ./tools && cmake ./
make && make install
cd ../
cd ./caps2esc && cmake ./
make && make install 
cd ../
cp ./udevmon.yaml /etc/udevmon.yaml
#May not work if local service files is not set here
function move_service {
    cp ./udevmon.service $dir
    sudo systemctl enable --now udevmon
}
if move_service ;then
    echo "Service has been installed and started successfully, use 'systemctl disable --now udevmon' to stop the service."
elif [ !"$1" ];then
    echo "Systemd services is not in '/usr/lib/systemd/system/', please use -s [service_dir] to assign your customized location"
else
    echo "You may not input a correct directory."
fi
