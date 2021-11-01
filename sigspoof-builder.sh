mkdir sigspoof

cd sigspoof

wget "https://gitlab.com/oF2pks/haystack/-/raw/11-attempt/spoof_AVDapi30.zip.ONLY'MAGISK&ANDROID-STUDIO"

mv spoof_AVDapi30.zip.ONLY\'MAGISK\&ANDROID-STUDIO spoof\_AVDapi30.zip

wget https://gitlab.com/oF2pks/haystack/-/archive/11-attempt/haystack-11-attempt.zip

unzip haystack-11-attempt.zip

rm haystack-11-attempt.zip

wget https://github.com/DexPatcher/dexpatcher-tool/releases/download/v1.8.0-beta1/dexpatcher-1.8.0-beta1.jar

cp dexpatcher-1.8.0-beta1.jar haystack-11-attempt/

cd haystack-11-attempt/

adb pull /system/framework/services.jar

java -jar dexpatcher-1.8.0-beta1.jar -a 11 -M -v -d -o ./ services.jar 11-hook-services.jar.dex 11core-services.jar.dex

mkdir repack

zip -j repack/services.jar classes*.dex

cd ..

unzip spoof_AVDapi30.zip -d spoof_AVDapi30

rm spoof_AVDapi30.zip

rm spoof_AVDapi30/system/framework/services.jar

mv haystack-11-attempt/repack/services.jar spoof_AVDapi30/system/framework/

cd spoof_AVDapi30 

zip -r spoof_AVDapi30.zip *

cd ..

cp spoof_AVDapi30/spoof_AVDapi30.zip .

rm -rv haystack-11-attempt spoof_AVDapi30 dexpatcher-1.8.0-beta1.jar 
