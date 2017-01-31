# !/bin/bash  
home=`pwd`
echo "----------- home dir" 
echo $home


echo "--- Downloading wrfv3.8.1 if not exists"
if [ ! -f WRFV3.8.1.TAR.gz ]; then
	echo "No test tar. Downloading... "
	wget http://www2.mmm.ucar.edu/wrf/src/WRFV3.8.1.TAR.gz
fi

# rm -r WRFV3
echo "--- compiling wrf"
if [ ! -d WRFV3 ]; then
	tar -xvzf WRFV3.8.1.TAR.gz
fi

cd WRFV3

./clean -a
./configure
./compile em_real > log.compile 2>&1
