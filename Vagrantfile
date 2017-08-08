#################################################
##                                             ##
##   Vagrantfile for VM creating via Vagrant   ##
##                                             ##
#################################################
## Table of contents ##
#######################
#
# 1. Configure folders to share via NFS
# 2. Other settings, you can don't touch them
#   2.1. The base image (box)
#   2.2. Configuring of initializers
#   2.3. Configuring of NAT-network (guest<>host<>world)
#   2.4. Configuring of host-only-network (guest<>host)
#   2.5. Disable the check for updates box
#   2.6. Set limits on virtual machine
#   2.7. Configure the timeout for the virtual machine (1000 seconds default)
#   2.n. Message after vagrant up
#
Vagrant.configure(2) do |config|
  
  ###########################################
  ## 1. Configure folders to share via NFS ##
  ###########################################  
  config.vm.synced_folder "C:/warp", "/c/warp", type: "nfs"

  #################################################
  ## 2. Other settings, you can don't touch them ##
  #################################################    
    
    ###############################
    ## 2.1. The base image (box) ##
    ###############################
    config.vm.box = "ubuntu/trusty64"
    
    ######################################
    ## 2.2. Configuring of initializers ##
    ######################################          
    
      ## 2.2.1. Running only in the 1st vagrant up ##
      ###############################################    
      config.vm.provision :shell, path: "bootstrap.sh"
        
      ## 2.2.2. Running every vagrant up ##
      ##################################### 
      # config.vm.provision "shell", inline: "sudo service docker start", run: "always"
        
    ##########################################################
    ## 2.3. Configuring of NAT-network (guest<>host<>world) ##
    ##########################################################
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
    
    #########################################################
    ## 2.4. Configuring of host-only-network (guest<>host) ##
    #########################################################     
    config.vm.network "private_network", ip: "10.10.10.10", adapter: 2
    
    ############################################
    ## 2.5. Disable the check for updates box ##
    ############################################    
    config.vm.box_check_update = false

    ########################################
    ## 2.6. Set limits on virtual machine ##
    ########################################    
    config.vm.provider "virtualbox" do |v|
      
      ## 2.6.1. Memory ##
      ###################   
      v.memory = 8192
      
      ## 2.6.2. cpu ##
      ################    
      v.cpus = 2
      
      ## 2.6.3. Enable vagrant GUI (for debugging) ##
      ###############################################
      # v.gui = true
      
    end  
    
    ###############################################################################
    ## 2.7. Configure the timeout for the virtual machine (1000 seconds default) ##
    ###############################################################################   
    config.vm.boot_timeout = 1000
    
    #####################################
    ## 2.n. Сообщение после vagrant up ##
    #####################################
    config.vm.post_up_message = "Virtual machine is ready to work!"
  
end
