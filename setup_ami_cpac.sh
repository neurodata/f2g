cd

mkdir ~/Documents/inputs
mkdir ~/Documents/outputs
mkdir ~/Documents/moving_outputs

cd Documents

echo 'FSLDIR=/usr/share/fsl/5.0' >> .bashrc
echo '. ${FSLDIR}/etc/fslconf/fsl.sh' >> .bashrc
echo 'PATH=${FSLDIR}/bin:${PATH}' >> .bashrc
echo 'export FSLDIR PATH' >> .bashrc
. ~/.bashrc
chmod -R 777 ~/Documents/*
