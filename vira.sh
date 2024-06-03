#!/bin/bash

tambah_user() {
    read -p "Masukkan nama pengguna baru: " username
    sudo adduser $username && echo -e "${GREEN}Pengguna $username berhasil ditambahkan!${NC}"
    echo " "
}

edit_user() {
    read -p "Masukkan nama pengguna yang akan diedit: " username
    sudo chfn $username && echo -e "${GREEN}Pengguna $username berhasil diedit!${NC}"
    echo " "
}

user_aktif() {
    who
    echo " "
}

ganti_user() {
    read -p "Masukkan nama pengguna yang akan diubah: " username
    echo -e "${GREEN}Berhasil ganti ke pengguna $username!${NC}"
    su $username
    echo " "
}

lihat_semua_user() {
    echo -e "${GREEN}List User${NC}"
    cut -d: -f1 /etc/passwd
    echo " "
}

hapus_user() {
    read -p "Masukkan nama pengguna yang akan dihapus: " username
    sudo deluser $username && echo -e "${GREEN}Pengguna $username berhasil dihapus!${NC}"
    echo " "
}

tambah_direktori() {
    read -p "Masukkan nama folder baru: " folder
    mkdir $folder && echo -e "${GREEN}Folder $folder berhasil ditambahkan!${NC}"
    ls
}

list_folder() {
    read -p "Masukkan nama folder yang dilihat: " folder
    cd $folder
    echo -e "${GREEN}List folder $folder${NC}"
    ls
    cd..
    echo " "
}

gabungkan_folder() {
    read -p "Masukkan nama folder pertama: " folder1
    read -p "Masukkan nama folder kedua: " folder2
    read -p "Masukkan nama folder gabungan: " folder_gabungan

    rsync -a $folder1 $folder_gabungan
    rsync -a $folder2 $folder_gabungan

    echo -e "${GREEN}File $folder1 dan $folder2 berhasil digabungkan menjadi $folder_gabungan!${NC}"
    ls
    echo " "
}

kompres_folder() {
    read -p "Masukkan nama folder yang dikompres: " folder
    zip -r $folder.zip $folder/ && echo -e "${GREEN}Folder $folder berhasil dikompres!${NC}"
    echo " "
}

tambah_file() {
    read -p "Masukkan nama file baru: " file
    touch $file && echo -e "${GREEN}File $file berhasil ditambahkan!${NC}"
    ls
    echo " "
}

lihat_file() {
    read -p "Masukkan nama file yang diedit: " file
    nano $file && echo -e "${GREEN}File $file berhasil diedit!${NC}"
}

hapus_file() {
    read -p "Masukkan nama file yang dihapus: " file
    rm $file && echo -e "${GREEN}File $file berhasil dihapus!${NC}"
    ls
    echo " "
}

jalankan_file() {
    read -p "Masukkan nama file yang dijalankan: " file
    source ./$file && echo -e "${GREEN}File $file berhasil dijalankan!${NC}"
    echo " "
}

gabungkan_file() {
    read -p "Masukkan nama file pertama: " file1
    read -p "Masukkan nama file kedua: " file2
    read -p "Masukkan nama file gabungan: " gabungan

    cat "$file1" "$file2" > "$gabungan" && echo -e "${GREEN}File $file1 dan $file2 berhasil digabungkan menjadi $gabungan!${NC}"
    ls
    echo " "
}



download_file() {
    read -p "Masukkan URL file: " url
    wget $url
    echo -e "${GREEN}File dari $url berhasil didownload!${NC}"
    echo " "
}

PINK='\033[38;5;205m'
YELLOW='\033[38;5;226m'
GREEN='\033[38;5;82m'
RED='\033[38;5;196m'
BLUE='\033[38;5;27m'
NC='\033[0m' # No Color

echo -e "${PINK}----------- Selamat Datang di VManager -----------${NC}"
echo " "
echo "VManager merupakan aplikasi pengelolaan sistem 
berbasis shell yang memudahkan untuk melakukan 
manajemen user, manajemen folder, hingga manajemen 
file."

echo " "
echo "-------------------------------------------"
echo -e "${BLUE}NIM    : 2341720055${NC}"
echo -e "${BLUE}Nama   : Vira Alfita Yunia${NC}"
echo -e "${BLUE}Kelas  : TI-1B${NC}"
echo "-------------------------------------------"

while true; do
    echo " "
    echo "=================================="
    echo -e "|          ${YELLOW}Menu Utama${NC}            |"
    echo "=================================="
    echo "| 1. Manajemen User              |"
    echo "| 2. Manajemen Folder            |"
    echo "| 3. Manajemen File              |"
    echo "| 4. Keluar                      |"
    echo "=================================="
    
    read -p "Masukkan pilihan (1-4): " choice
    
    case $choice in
        1) 
            while true; do
                echo " "
                echo "=================================="
                echo -e "|        ${YELLOW}Manajemen User${NC}          |"
                echo "=================================="
                echo "| 1. Tambah user                 |"
                echo "| 2. Edit user                   |"
                echo "| 3. Melihat user aktif          |"
                echo "| 4. Ganti user                  |"
                echo "| 5. Lihat seluruh user          |"
                echo "| 6. Hapus user                  |"
                echo "| 7. Kembali ke menu utama       |"
                echo "=================================="
                
                read -p "Masukkan pilihan (1-7): " choice_user
                
                case $choice_user in
                    1) tambah_user ;;
                    2) edit_user ;;
                    3) user_aktif ;;
                    4) ganti_user ;;
                    5) lihat_semua_user ;;
                    6) hapus_user ;;
                    7) break ;;
                    *) echo -e "${RED}Inputan tidak valid${NC}";;
                esac
            done
            ;;
           
        2) 
            while true; do
                echo " "
                echo "=================================="
                echo -e "|       ${YELLOW}Manajemen Folder${NC}         |"
                echo "=================================="
                echo "| 1. Tambah folder               |"
                echo "| 2. Gabungkan folder            |"
                echo "| 3. List file pada folder       |"
                echo "| 4. Kompres folder (zip)        |"
                echo "| 5. Kembali ke menu utama       |"
                echo "=================================="
                
                read -p "Masukkan pilihan (1-5): " choice_folder
                
                case $choice_folder in
                    1) tambah_direktori ;;
                    2) gabungkan_folder ;;
                    3) list_folder ;;
                    4) kompres_folder ;;
                    5) break ;;
                    *) echo -e "${RED}Inputan tidak valid${NC}";;
                esac
            done
            ;;
           
        3) 
            while true; do
                echo " "
                echo "=================================="
                echo -e "|        ${YELLOW}Manajemen File${NC}          |"
                echo "=================================="
                echo "| 1. Tambah file                 |"
                echo "| 2. Lihat file                  |"
                echo "| 3. Jalankan file               |"
                echo "| 4. Hapus file                  |"
                echo "| 5. Gabungkan file              |"
                echo "| 6. Download file dari internet |"
                echo "| 7. Kembali ke menu utama       |"
                echo "=================================="
                
                read -p "Masukkan pilihan (1-7): " choice_file
                
                case $choice_file in
                    1) tambah_file ;;
                    2) lihat_file ;;
                    3) jalankan_file ;;
                    4) hapus_file ;;
                    5) gabungkan_file ;;
                    6) download_file ;;
                    7) break ;;
                    *) echo -e "${RED}Inputan tidak valid${NC}";;
                esac
            done
            ;;
           
        4) 
            exit ;;

        *) echo -e "${RED}Inputan tidak valid${NC}";;

    esac
done
