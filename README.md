# B3 Devops - TP 1

## Info 
mail: louise.baulan@ynov.com    
github_username: Fayaah

# Virtual Box

### Installation des paquets 
```
sudo apt-get install nodejs openssh-server nginx
```

### Configuration des ports 
Sur l'interface Virtual Box, cliquer sur la configuration de la VM 
Puis `Réseau` > `Avancé` > `Redirection de ports` 
Puis ajouter les réseaux comme suit 
```
http  | TCP | 127.0.0.1 | 8000 | 10.0.2.15 | 80
ssh   | TCP | 127.0.0.1 | 2222 | 10.0.2.15 | 22
https | TCP | 127.0.0.1 | 4443 | 10.0.2.15 | 443
```

### Configuration de nginx 
Entrer dans le fichier html créé à l'installation de `nginx`
```
$ cd /var/www/html 
$ sudo nano index.nginx-debian.html
```

Puis modifier le fichier comme suit : 
```html
<!DOCTYPE html>
<html>
  <body>
    B3 Devops - TP 1
  </body>
</html>
```

Pour tester si tout fonctionne bien, tapez cette adresse sur un navigateur web, sur votre machine locale: `http://localhost:8000/`

# Vagrant 

> Il faut tout d'abord installer **Vagrant** via l'installeur fournit sur le site officiel puis vous positionnez via votre invite de commande dans le dossier de votre projet

### Création du Vagrantfile 

Création du fichier et initialisation de vagrant
`$ vagrant init`

Remplir le fichier tout juste créé comme suit : 
```
Vagrant.require_version ">= 1.3.5"

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"

  config.vm.network "forwarded_port", guest: 80, host: 8001, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 22, host: 2223, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 443, host: 4444, host_ip: "127.0.0.1"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "DevOpsVagrant"
    vb.gui = true 
    vb.memory = "1024"
  end  

  config.vm.provision :shell, path: "bootstrap.sh"
end
```

### Création du provisioner bootstrap.sh

Créez un nouveau fichier dans le dossier de votre projet qui se nomme `bootstrap.sh`

Remplir le fichier comme suit : 
```bash
#!/bin/bash

# Update on witch build 
sudo apt-get update 

# Install NodeJs 12
wget -qO- https://deb.nodesource.com/setup_12.x | -E bash -
apt-get install -yq nodejs

# Install Nginx 
apt-get install -yq nginx
```

### Build de la VM 

Via l'invite de commande : 
```
$ vagrant up 
```

Une fois lancée, vous devriez pouvoir voir une nouvelle vm dans Virtual Box. 

> Pour supprimer une VM, `$ vagrant destroy`
