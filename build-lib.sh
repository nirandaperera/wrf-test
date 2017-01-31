# !/bin/bash  
home=`pwd`
echo "----------- home dir" 
echo $home

mkdir -p libraries
cd libraries

echo "--- downloading libraries"
if [ ! -f netcdf-4.1.3.tar.gz ]; then
	echo "netcdf-4.1.3.tar.gz not found! Downloading... "
	wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/netcdf-4.1.3.tar.gz
fi

if [ ! -f jasper-1.900.1.tar.gz ]; then
	echo "jasper-1.900.1.tar.gz not found! Downloading... "
	wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/jasper-1.900.1.tar.gz
fi

if [ ! -f libpng-1.2.50.tar.gz ]; then
	echo "jasper-1.900.1.tar.gz not found! Downloading... "
	wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/libpng-1.2.50.tar.gz
fi

if [ ! -f zlib-1.2.7.tar.gz ]; then
	echo "jasper-1.900.1.tar.gz not found! Downloading... "
	wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/zlib-1.2.7.tar.gz
fi

if [ ! -f mpich-3.0.4.tar.gz ]; then
	echo "mpich-3.0.4.tar.gz not found! Downloading... "
	wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/mpich-3.0.4.tar.gz
fi

echo "--- installing netcdf"

if [ ! -d netcdf-4.1.3 ]; then 
	echo "netcdf not present. installing... "
	export DIR=$home/libraries
	export CC=gcc
	export CXX=g++
	export FC=gfortran
	export FCFLAGS=-m64
	export F77=gfortran
	export FFLAGS=-m64

	#rm -rf netcdf-4.1.3
	tar xzvf netcdf-4.1.3.tar.gz 
	cd netcdf-4.1.3
	./configure --prefix=$DIR/netcdf --disable-dap \
	--disable-netcdf-4 --disable-shared
	make
	make install
	export PATH=$DIR/netcdf/bin:$PATH
	export NETCDF=$DIR/netcdf
	cd ..
fi 

if [ ! -d mpich-3.0.4 ]; then 
	tar xzvf mpich-3.0.4.tar.gz
	cd mpich-3.0.4
	./configure --prefix=$DIR/mpich
	make
	make install
	export PATH=$DIR/mpich/bin:$PATH
	cd ..
fi

# echo "--- installing zlib"

# if [ ! -d zlib-1.2.7 ]; then 
# 	setenv LDFLAGS -L$DIR/grib2/lib 
# 	setenv CPPFLAGS -I$DIR/grib2/include 
# 	tar xzvf zlib-1.2.7.tar.gz     #or just .tar if no .gz present
# 	cd zlib-1.2.7
# 	./configure --prefix=$DIR/grib2
# 	make
# 	make install
# 	cd ..
# fi