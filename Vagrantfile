#################################################
##                                             ##
##  Vagrantfile для создания ВМ через Vagrant  ##
##                                             ##
#################################################
## Оглавление ##
################
#
# А. Настройка VirtualBox
#
# 1. Базовый образ (бокс)
# 2. Настройка инициализаторов
# 3. Настройка NAT-сети (guest<>host<>world)
# 4. Настройка host-only-сети (guest<>host)
# 5. Отключить проверку обновлений бокса
# 6. Настроить общие папки через NFS, и необходимую для работы NFS сеть
# 7. Настроить лимиты виртуальной машины
# 8. Настроить таймаут для загрузки виртуальной машины 
#
# n. Сообщение после vagrant up
#
Vagrant.configure(2) do |config|
  
  #############################
  ## 1. Базовый образ (бокс) ##
  #############################
  config.vm.box = "ubuntu/trusty64"
  
  ##################################
  ## 2. Настройка инициализаторов ##
  ##################################          
  
    ## 2.1. Выполняющиеся лишь при 1-ом vagrant up ##
    #################################################    
    config.vm.provision :shell, path: "bootstrap.sh"
      
    ## 2.2. Выполняющиеся при каждом vagrant up ##
    ############################################## 
    # config.vm.provision "shell", inline: "sudo service docker start", run: "always"
      
  ################################################
  ## 3. Настройка NAT-сети (guest<>host<>world) ##
  ################################################
  config.vm.network :forwarded_port, guest: 80, host: 80
  config.vm.network :forwarded_port, guest: 443, host: 443
  config.vm.network :forwarded_port, guest: 25, host: 25
  config.vm.network :forwarded_port, guest: 587, host: 587
  config.vm.network :forwarded_port, guest: 465, host: 465
  config.vm.network :forwarded_port, guest: 993, host: 993
  config.vm.network :forwarded_port, guest: 143, host: 143
  config.vm.network :forwarded_port, guest: 110, host: 110
  config.vm.network :forwarded_port, guest: 995, host: 995
  # config.vm.network :forwarded_port, guest: 9050, host: 9050
  # config.vm.network :forwarded_port, guest: 9150, host: 9150
  
  config.vm.network :forwarded_port, guest: 3306, host: 3306
  config.vm.network :forwarded_port, guest: 6001, host: 6001
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 3001, host: 3001
  config.vm.network :forwarded_port, guest: 3002, host: 3002
  
  ###############################################
  ## 4. Настройка host-only-сети (guest<>host) ##
  ###############################################     
  config.vm.network "private_network", ip: "10.10.10.10", adapter: 2
  
  ############################################
  ## 5. Отключить проверку обновлений бокса ##
  ############################################    
  config.vm.box_check_update = false
  
  ###########################################################################
  ## 6. Настроить общие папки через NFS, и необходимую для работы NFS сеть ##
  ###########################################################################   
  # - Для работы через NFS добавить в конце:       , type: "nfs"
  config.vm.synced_folder "C:/WebDev", "/c/WebDev", type: "nfs"
  #config.vm.synced_folder "C:/WebDev", "/c/WebDev", type: "nfs", mount_options: ['rw','vers=3','tcp','fsc','nolock','actimeo=2','hard','intr']
  #config.vm.synced_folder "C:/WebDev", "/c/WebDev"
  #config.vm.synced_folder "C:/WebDev", "/c/WebDev", type: "smb", "smb_username": "gtmmm2011@gmail.com", "smb_password": "77714SeVeN", owner: "root", group: "root", "mount_options": ["mfsymlinks", "dir_mode=0777", "file_mode=0777"]
  #config.vm.network "private_network", type: "dhcp", adapter: 2
  
  ############################################
  ## 7. Настроить лимиты виртуальной машины ##
  ############################################    
  config.vm.provider "virtualbox" do |v|
    
    ## 7.1. Установка лимита памяти ##
    ##################################   
    v.memory = 8192
    
    ## 7.2. Установка лимита cpu ##
    ###############################    
    v.cpus = 2
    
    ## 7.3. Вклюсить GUI vagrant'а (нужно во время дебаггинга) ##
    #############################################################
    # v.gui = true
    
  end  
  
  ####################################################################################
  ## 8. Настроить таймаут для загрузки виртуальной машины (300 секунд по умолчанию) ##
  ####################################################################################   
  config.vm.boot_timeout = 1000
  
  
  ###################################
  ## n. Сообщение после vagrant up ##
  ###################################
  config.vm.post_up_message = "Приказывай, повелитель!"
  
end
