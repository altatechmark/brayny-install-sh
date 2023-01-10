#!/bin/bash
sudo rm /var/lib/apt/lists/lock
sudo rm /var/lib/dpkg/lock
sudo apt-get -y  update
sudo apt-get -y purge wolfram-engine
sudo apt-get -y purge libreoffice*
sudo apt-get -y clean
sudo apt-get -y autoremove
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential cmake pkg-config
sudo apt-get -y install libjpeg-dev libtiff5-dev libjasper-dev libpng-dev
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get -y install libxvidcore-dev libx264-dev
sudo apt-get -y install libfontconfig1-dev libcairo2-dev
sudo apt-get -y install libgdk-pixbuf2.0-dev libpango1.0-dev
sudo apt-get -y install libgtk2.0-dev libgtk-3-dev
sudo apt-get -y install libatlas-base-dev gfortran
sudo apt-get -y install libhdf5-dev libhdf5-serial-dev libhdf5-103
sudo apt-get -y install libqtgui4 libqtwebkit4 libqt4-test python3-pyqt5
sudo apt-get -y install  python3-dev
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo python3 get-pip.py
sudo rm -rf ~/.cache/pip
sudo pip install virtualenv virtualenvwrapper
git clone https://github.com/shamoilkazmi/virtualrc.git
sudo rm .bashrc
sudo mv virtualrc/virtualrc /home/pi.bashrc
source ~/.bashrc
mkvirtualenv cv -p python3
pip install numpy==1.21.4
pip install "picamera[array]"
cd ~
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.1.1.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.1.1.zip
unzip opencv.zip
unzip opencv_contrib.zip
mv opencv-4.1.1 opencv
mv opencv_contrib-4.1.1 opencv_contrib
sudo mv /etc/dphys-swapfile /etc/dphys-swapfile-backup
sudo mv dphys-swapfile1024 /etc/dphys-swapfile 
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
workon cv
cd ~/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    -D ENABLE_NEON=ON \
    -D ENABLE_VFPV3=ON \
    -D BUILD_TESTS=OFF \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D CMAKE_SHARED_LINKER_FLAGS=-latomic \
    -D BUILD_EXAMPLES=OFF ..
make -j4
sudo make install
sudo ldconfig
cd ~
sudo rm /etc/dphys-swapfile
sudo mv /etc/dphys-swapfile-backup /etc/dphys-swapfile
cd /usr/local/lib/python3.7/site-packages/cv2/python-3.7
sudo mv cv2.cpython-37m-arm-linux-gnueabihf.so cv2.so
d ~/.virtualenvs/cv/lib/python3.7/site-packages/
ln -s /usr/local/lib/python3.7/site-packages/cv2/python-3.7/cv2.so cv2.so
cd ~
workon cv
#sudo apt-get -y install python3-opencv
#sudo apt-get -y --allow-unauthenticated install build-essential cmake pkg-config
#wget http://dlib.net/files/dlib-19.24.tar.bz2
#tar -xf dlib-19.24.tar.bz2
#rm dlib-19.24.tar.bz2
#cd dlib-19.24
#sudo python3 setup.py build
#sudo python3 setup.py install
#cd ..
pip install dlib
git clone https://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@github.com/shamoilkazmi/Raspberry-Pi-based-people-counter-camera.git
pip install asyncio
pip install websockets
pip install imutils
pip install imageio
pip install flask
pip install scipy
#git clone https://github.com/shamoilkazmi/dhcpcd.conf.git
#sudo cp /etc/dhcpcd.conf /etc/dhcpcd-backup.conf
#sudo rm /etc/dhcpcd.conf
#sudo mv dhcpcd.conf/dhcpcd.conf /etc/dhcpcd.conf
#rm -rf dhcpcd.conf
sudo rm .bashrc
cd Raspberry-Pi-based-people-counter-camera
sudo mv bashrc /home/pi/.bashrc


