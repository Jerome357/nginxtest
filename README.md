#Initialiser le nouveau projet à partir de GitHub :

$echo "# test2" >> README.md

git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/Jerome357/nginxtest.git
git push -u origin master

________________________________________________________________________________________________________________________

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


________________________________________________________________________________________________________________________

#Création d'un fichier Makefile qui va permettre de lancer docker compose :

build: ##@Docker install services dependencies
	docker-compose -f infrastructure/docker/docker-compose-build.yml up --build

up: build ##@Docker Build and deploy services
	docker-compose -f infrastructure/docker/docker-compose-local.yml --project-name nginxtest up --build -d


#Créer une arborescence pour regrouper les images docker :

    application/infrastructure/docker/nginx  et /composer

#Déplacer le dossier static-html-directory avec le fichier index.html dans le dossier application.


#Créer un dossier ./infrastructure/docker à la racine du projet contenant les fichiers composer suivants : 

    docker-compose-build.yml        ------->        Image composer
    
    docker-compose-local.yml        ------->        Images ajoutées au projet (ex: nginx)
    
                                           
Pour chaque image ajouté dans docker-compose-local.yml, spécifier le nom du container, le répertoire courant, et
le chemin pour accéder au Dockerfile des images.
Renseigner ensuite la partie Volume et le port sur lequel va se lancer le container.








