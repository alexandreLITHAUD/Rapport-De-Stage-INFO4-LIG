---
title: "Contribution au projet NixOS Compose"
author: Alexandre Lithaud
date-start: "17 Avril 2023"
date-end: "28 Juillet 2023"
school-year: "2022/2023"
references: references.bib
acknowledgments: |+
  Je tiens à tout d'abord à remercier le Laboratoire Informatique de Grenoble et tous ces membres pour l’accueil chaleureux que j'ai reçu à mon arrivée au laboratoire ainsi que pour l'ambiance générale du stage qui a été exemplaire.\newline

  Je remercie également Monsieur Olivier Richard et Monsieur Nicolas Palix, respectivement mon tuteur et mon référent de stage pour leurs conseils ainsi que leurs pédagogies qui m'ont permis de réaliser mes missions dans les meilleures conditions possibles et de grandement monter en compétence durant ce stage.\newline

  Enfin, je suis reconnaissant envers Quentin GUILLOTEAU et Adrien FAURE, respectivement doctorant et chercheur au Laboratoire Informatique de Grenoble pour les inestimables conseils et les réponses dispensés lors de mes différentes missions.
abstract-fr: |+
  En 4ème année d'ingénieur en informatique, j'ai eu l'opportunité de faire un stage de 15 semaines au Laboratoire Informatique de Grenoble (LIG), au sein de l'équipe DATAMOVE.\newline

  Durant ce stage, j'ai eu comme objectif d'utiliser et d'améliorer l'outil NixOS-Compose, ainsi que de créer différentes compositions dans l'optique de les utiliser à une fin de recherche. NixOS-Compose (ou NXC) est un logiciel créé par l’équipe, permettant de décrire une infrastructure complexe de plusieurs nœuds, en mettant l’accent sur la reproductibilité et la simplicité de mise en place. De plus, j'ai été amené à contribuer à la maintenance de logiciels tels que OAR et EAR, améliorant leur stabilité et performances par le biais de mise à jour. Le tout en utilisant le système Grid5000 qui m'a permis de tester mes développements dans un environnement réel.\newline

  Durant ce rapport, vous allez suivre la création des différentes compositions que j'ai créée dans le but de tester les performances de plusieurs systèmes de fichiers distribués dans le réseau de nœud Grid5000.
abstract-en: |+
  In my 4th year as a computer science engineer, I had the opportunity to do a 15-week internship at the IT Laboratory of Grenoble (LIG), in the DATAMOVE team.\newline

  During this placement, my aim was to use and improve the NixOS-Compose tool, and to create various compositions with a view to using them for research purposes. NixOS-Compose (or NXC) is a piece of software created by the team, enabling a complex infrastructure of several nodes to be described, with the emphasis on reproducibility and simplicity of implementation. I also contributed to the maintenance of software such as OAR and EAR, improving their stability and performance through updates. All this was done using the Grid5000 system, which enabled me to test my developments in a real environment.\newline 

  In this report, you will follow the creation of the various compositions I created in order to test the performance of several distributed file systems in the Grid5000 node network.
keywords-fr: "Nix, Programmation Fonctionnel, Laboratoire, NixOS, NixOS-Compose, Grid5000, Systèmes de fichiers, Logiciel de Recherche, Maintenance, HPC, Infrastructure Distribué."
keywords-en: "Nix, Functional Programming, Laboratory, NixOS, NixOS-Compose, Grid5000, File Systems, Research Softwares, Maintenance, HPC, Distributed Infrastructure"
company: Laboratoire d’informatique de Grenoble
address: "Bâtiment IMAG, 700, AV. Centrale, 38401 Saint Martin d’Hères"
phone: "07.87.30.90.36"
respo-admin:
  name: "Noel de Palma"
  phone: "04.57.42.14.78"
  email: "noel.de-palma@univ-grenoble-alpes.fr"
referent:
  name: "Nicolas Palix"
  phone: "04.57.42.15.38"
  email: "nicolas.palix@imag.fr"
tuteur:
  name: "Olivier Richard"
  phone: "06.32.29.09.18"
  email: "olivier.richard@imag.fr"
---

\listoffigures

\newpage

# Introduction

Ce rapport va représenter mon expérience de stage au Laboratoire Informatique de Grenoble. Mon stage de 15 semaines à débuter le 17 avril 2023. Au cours de cette période j'ai eu l'opportunité de travailler sur divers projet informatiques en lien avec les technologies de Nix, NixOS et le HPC (*High performance computing*). Ainsi que sur la maintenance et l'amélioration de logiciel et recherche tels que OAR et EAR. Cette opportunité m'a donné l'occasion de travailler avec le système Grid5000, qui offre une infrastructure distribuée pour l’exécution de travaux de recherche à grande échelle.\newline

L'objectif principal de mon stage était, en premier lieu, de contribuer au projet au projet NixOS-Compose, un outils puissant qui facilite le déploiement et la gestion d'environnement de développement reproductible spécialisé pour le HPC en déployant directement plusieurs machines sur Grid5000 à la manière de Docker Compose (d'où le nom). Afin de pourvoir réaliser cette tache il était important de monter en compétences sur Nix, NixOS. Grâce à cette expérience, j'ai pu approfondir ma compréhension des principes fondamentaux de la gestion des paquets et des environnements isolés, la configuration de système basé NixOS, le paradigme de programmation fonctionnelle ainsi que le déploiement d'application fonctionnelle dans un environnement d'HPC.\newline

En parallèle, j'ai participé à la maintenance et à l'amélioration de logiciel de recherche tels que OAR et EAR en les mettant à jour avec la dernière version de Nix par exemple. OAR joue un role crucial dans la planification de travaux de recherche sur des infrastructures distribué comme Grid5000 notamment. EAR quant à lui, permet d’instrumenter et donc de quantifié les performances d'applications distribuées.J'ai pu contribuer à l'amélioration de leur stabilité, de leurs performances et de leurs fonctionnalités, en collaborant étroitement avec l'équipe de développement du laboratoire.\newline

De plus, j'ai eu l'opportunité de travailler en utilisant le système Grid5000, qui m'a permis de déployer et de tester mes compositions directement dans un environnement réel et reproductible. Cette expérience m'a offert une compréhension bien plus poussé sur les méthodes de déploiement de logiciel, à l'importance de d'évolutivité et à la gestion des ressources et à la fiabilité des systèmes distribués.\newline

Dans ce rapport, je décrirai en détail les différentes tâches et projets auxquels j'ai participé tout au long de mon stage, en mettant l'accent sur les compétences acquises, les résultats obtenus et les leçons apprises. Je présenterai également une analyse critique de mes réalisations, ainsi que des suggestions pour des améliorations futures. Ce rapport témoigne de ma progression en tant que professionnel de l'informatique et des contributions significatives que j'ai apportées au sein du LIG.\newline

\newpage

<!-- Test de citation \cite{grid5000} je fait des test ici\newline -->
<!-- \begin{figure}
\centering
\includegraphics[scale=1]{logos/logo-uga.png}
\caption{Test image et table}
\end{figure} -->
<!-- Test \gls{latex} test -->

# Contexte du stage

## Le Laboratoire Informatique de Grenoble

\begin{figure}[h]
\centering
\includegraphics[width=0.8\textwidth,height=0.8\textheight,keepaspectratio]{images/imag.png}
\caption{bâtiment IMAG}
\end{figure}

Mon stage s'est déroulé au LIG ou laboratoire informatique de Grenoble, ce laboratoire ainsi que certains autres sont situés dans le bâtiment IMAG, situé au centre de Saint-martin-d'Heres. Il est le réceptacle de nombreux projets de recherches et de recherche.
Durant mon temps au LIG, j'ai eu la possibilité de rencontrer de nombreux professionnels, représentant des différents laboratoires présent dans le bâtiment.\newline

Le bâtiment est organisé de la sorte :

- 1er et 2ème étage : Gricad, AMIES, LJK : **Mathématiques** 

- 3ème et 4ème : LIG : **Informatiques**\newline

Durant mon stage j'ai eu l'occasion d'assister à de nombreuses conférences réalisées par des professionnels du sujet, comme une conférence sur les FPGA ou sur les stratégies de test dans le monde du HPC. 
J'ai aussi la chance d’animer un cours d'informatique débranché destiné à deux classes de seconde, afin de les faire réfléchir sur des problématiques d'informatique sans l’interférence d'un ordinateur.\newline

En outre, mon stage au laboratoire ma permis de faire de nombreuses découvertes et expériences en plus de toutes les connaissances que j'ai pu accumuler.

## L'équipe DATAMOVE

## Le Projet NixOS-Compose 

\newpage

# Annexe

\printbibliography

\printglossaries