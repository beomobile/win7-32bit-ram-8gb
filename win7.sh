wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Dán authtoken vào đây (Sao chép và Ctrl + V để dán rồi nhấn Enter): " CRP
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 &>/dev/null &
echo Đợi đến khi cài đặt hoàn tất...
echo "Đang cài đặt QEMU (2-3m)..."
sudo apt install qemu-system-x86 curl -y > /dev/null 2>&1
echo Downloading Windows Disk...
curl -L -o lite7.qcow2 https://app.vagrantup.com/thuonghai2711/boxes/WindowsQCOW2/versions/1.0.3/providers/qemu.box
echo "Windows 7 x86 Lite On Google Colab"
echo Your VNC IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Lưu ý: Sử dụng Nhấp chuột phải hoặc Ctrl + C để sao chép"
echo "Vui lòng mở tab Colab, Thời gian tối đa 12h"
echo Chúc vui vẻ!!!
sudo qemu-system-x86_64 -vnc :0 -hda lite7.qcow2  -smp cores=2  -m 8192M -machine usb=on -device usb-tablet > /dev/null 2>&1
