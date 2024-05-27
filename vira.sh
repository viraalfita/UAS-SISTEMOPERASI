#!/bin/bash

tambah_user() {
    read -p "Masukkan nama pengguna baru: " username
    sudo adduser $username
    echo " "
}

edit_user() {
    read -p "Masukkan nama pengguna yang akan diedit: " username
    sudo chfn $username
    echo " "
}

user_aktif() {
    who
    echo " "
}

ganti_user() {
    read -p "Masukkan nama pengguna yang akan diubah: " username
    su $username
    echo " "
}

hapus_user() {
    read -p "Masukkan nama pengguna yang akan dihapus: " username
    sudo deluser $username
    echo " "
}

tambah_direktori() {
    read -p "Masukkan nama folder baru: " folder
    mkdir $folder
    ls
}

masuk_direktori() {
    read -p "Masukkan nama folder: " folder
    cd $folder
}

tambah_file() {
    read -p "Masukkan nama file baru: " file
    touch $file
    ls
    echo " "
}

lihat_file() {
    read -p "Masukkan nama file yang diedit: " file
    nano $file
}

hapus_file() {
    read -p "Masukkan nama file yang dihapus: " file
    rm $file
    echo "Data berhasil terhapus"
    ls
    echo " "
}

jalankan_file() {
    read -p "Masukkan nama file yang dijalankan: " file
    source ./$file
    echo " "
}

list_folder() {
    read -p "Masukkan nama folder yang dilihat: " folder
    cd $folder
    ls
    echo " "
}

gabungkan_file() {
    read -p "Masukkan nama file pertama: " file1
    read -p "Masukkan nama file kedua: " file2
    read -p "Masukkan nama file gabungan: " gabungan

    cat "$file1" "$file2" > "$gabungan"
    echo "File $file1 dan $file2 berhasil digabungkan"
    ls
    echo " "
}

kompres_folder() {
    read -p "Masukkan nama folder yang dikompres: " folder
    zip -r $folder.zip $folder/
    echo " "
}

download_file(){
    read -p "Masukkan URL file: " url
    read -p "Masukkan nama file yang akan disimpan: " file
    wget -o $file $url
    echo " "
}

echo "-------- Selamat Datang di VManage --------"
echo " "
echo "VManager merupakan aplikasi pengelolaan sistem berbasis shell yang memudahkan untuk melakukan manajemen user, manajemen folder, hingga manajemen file."

echo "NIM    : 2341720055"
echo "Nama   : Vira Alfita Yunia"
echo "Kelas  : TI-1B"
echo "-------------------------------------------"

while true; do
    echo " "
    echo "1. Manajemen User"
    echo "2. Manajemen Folder"
    echo "3. Manajemen File"
    echo "4. Keluar"
    
    read -p "Masukkan pilihan (1-4): " choice
    
    case $choice in
        1) echo " "
           echo "Manajemen User"
           echo "1. Tambah user"
           echo "2. Edit user"
           echo "3. Melihat user yang sedang aktif"
           echo "4. Ganti user"
           echo "5. Hapus user"
           echo "6. Keluar"
           
           read -p "Masukkan pilihan (1-6): " choice
           
           case $choice in
               1) tambah_user ;;
               2) edit_user ;;
               3) user_aktif ;;
               4) ganti_user ;;
               5) hapus_user ;;
               6) exit ;;
           esac
           ;;
           
        2) echo " "
           echo "Manajemen Folder"
           echo "1. Tambah folder"
           echo "2. Masuk folder"
           echo "3. List file pada folder"
           echo "4. Kompres file (zip)"
           echo "5. Keluar"
           
           read -p "Masukkan pilihan (1-5): " choice
           
           case $choice in
               1) tambah_direktori ;;
               2) masuk_direktori ;;
               3) list_folder ;;
               4) kompres_file ;;
               5) exit ;;
           esac
           ;;
           
        3) echo " "
           echo "Manajemen File"
           echo "1. Tambah file"
           echo "2. Lihat file"
           echo "3. Jalankan file"
           echo "4. Hapus file"
           echo "5. Gabungkan file"
           echo "6. Download file dari internet"
           echo "7. Keluar"

           read -p "Masukkan pilihan (1-7): " choice
           
           case $choice in
               1) tambah_file ;;
               2) lihat_file ;;
               3) jalankan_file ;;
               4) hapus_file ;;
               5) gabungkan_file ;;
               6) download_file ;;
               7) exit ;;
           esac
           ;;
           
        *) echo "Inputan tidak valid";;
    esac
done