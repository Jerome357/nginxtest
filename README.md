#Initialiser le nouveau projet à partir de GitHub :


$echo "# test2" >> README.md

git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/Jerome357/nginxtest.git
git push -u origin master

______________________________________________________________________________________________________________________________

#Créer un fichier Dockerfile à partir de Dockerhub afin de pouvoir générer l'image nginx :


Créer le fichier Dockerfile :

$vi Dockerfile

    i   éditer le fichier

Copier le contenu du dockerfile nginx :

__________________________________________________

FROM nginx
COPY static-html-directory /usr/share/nginx/html
__________________________________________________


    :wq   enregister le fichier et quitter


#Créer un dossier static-html-directory et créer un fichier index.html à l’intérieur :


Créer le dossier :

    $ mkdir static-html-directory

Entrer dans le nouveau dossier :

    $ cd !$

Créer le fichier index :

    $ vi index.html

    i    éditer le fichier
__________________________________________________
    
HELLO
__________________________________________________

    :wq   enregister le fichier et quitter


#Construire la nouvelle image nginx :


Se placer à la racine du projet et lancer la commande pour build l'image :

    $ docker build -t some-content-nginx .
    
    
Démarrer ensuite le container nommé [some-nginx] en mode détaché (daemon) à partir de l'image buildé [some-content-nginx],
et mapper le port 80 du container sur le port 8080 de ma machine :
    
     $ docker run --name some-nginx -d -p 8080:80 some-content-nginx












