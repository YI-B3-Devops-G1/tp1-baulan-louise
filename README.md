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
