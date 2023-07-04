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
  Mon stage de 15 semaines au Laboratoire d'Informatique de Grenoble (LIG) a été axé sur l'utilisation de Nix et NixOS, ainsi que sur la maintenance et l'amélioration de logiciels de recherche tels que OAR et EAR. J'ai également travaillé avec le système Grid5000, une infrastructure distribuée pour la recherche.\newline

  En utilisant NixOS-compose, j'ai pu déployer et gérer des environnements de développement reproductibles. J'ai acquis une solide compréhension de la gestion des paquets et des environnements isolés. J'ai contribué à la maintenance de logiciels tels que OAR et EAR, améliorant leur stabilité et leurs performances. J'ai également eu l'opportunité de travailler avec le système Grid5000, ce qui m'a permis de tester mes développements dans un environnement réel.\newline

  Ce stage m'a permis d'acquérir des compétences techniques avancées et de développer des compétences en gestion de projet et en collaboration d'équipe. J'ai apprécié les défis liés à la recherche et au développement de logiciels dans un environnement exigeant.\newline

  Dans l'ensemble, ce stage a été une expérience enrichissante qui a renforcé ma passion pour l'informatique et ouvert de nouvelles perspectives pour ma carrière future dans la recherche et le développement de logiciels avancés.
abstract-en: |+
  My 15-week placement at the Laboratoire d'Informatique de Grenoble (LIG) focused on using Nix and NixOS, as well as maintaining and improving research software such as OAR and EAR. I also worked with the Grid5000 system, a distributed infrastructure for research.\newline

  Using NixOS-compose, I was able to deploy and manage reproducible development environments. I gained a solid understanding of package management and isolated environments. I helped maintain software such as OAR and EAR, improving their stability and performance. I also had the opportunity to work with the Grid5000 system, which enabled me to test my developments in a real environment.\newline

  This placement has enabled me to acquire advanced technical skills and to develop project management and teamwork skills. I enjoyed the challenges of researching and developing software in a demanding environment.\newline

  Overall, this internship has been a rewarding experience that has strengthened my passion for computer science and opened up new prospects for my future career in advanced software research and development.
keywords-fr: "Nix, Programmation Fonctionnel, NixOS, NixOS-Compose, Grid5000, Systèmes de fichiers, Logiciel de Recherche, Maintenance, HPC, Infrastructure Distribué."
keywords-en: "Nix, Fonctional Programming, NixOS, NixOS-Compose, Grid5000, File Systems, Research Softwares, Maintenance, HPC, Distributed Infrastructure"
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

# Introduction

Ce rapport va représenter mon expérience de stage au Laboratoire Informatique de Grenoble. Mon stage de 15 semaines à débuter le 17 avril 2023. Au cours de cette période j'ai eu l'opportunité de travailler sur divers projet informatiques en lien avec les technologies de Nix, NixOS et le HPC (*High performance computing*). Ainsi que sur la maintenance et l'amélioration de logiciel et recherche tels que OAR et EAR. Cette opportunité m'a donné l'occasion de travailler avec le système Grid5000, qui offre une infrastructure distribuée pour l’exécution de travaux de recherche à grande échelle.\newline

L'objectif principal de mon stage était, en premier lieu, de contribuer au projet au projet NixOS-Compose, un outils puissant qui facilite le déploiement et la gestion d'environnement de développement reproductible spécialisé pour le HPC en déployant directement plusieurs machines sur Grid5000 à la manière de Docker Compose (d'où le nom). Afin de pourvoir réaliser cette tache il était important de monter en compétences sur Nix, NixOS. Grâce à cette expérience, j'ai pu approfondir ma compréhension des principes fondamentaux de la gestion des paquets et des environnements isolés, la configuration de système basé NixOS, le paradigme de programmation fonctionnelle ainsi que le déploiement d'application fonctionnelle dans un environnement d'HPC.\newline

En parallèle, j'ai participé à la maintenance et à l'amélioration de logiciel de recherche tels que OAR et EAR en les mettant à jour avec la dernière version de Nix par exemple. OAR joue un role crucial dans la planification de travaux de recherche sur des infrastructures distribué comme Grid5000 notamment. EAR quant à lui, permet d’instrumenter et donc de quantifié les performances d'applications distribuées.J'ai pu contribuer à l'amélioration de leur stabilité, de leurs performances et de leurs fonctionnalités, en collaborant étroitement avec l'équipe de développement du laboratoire.\newline

De plus, j'ai eu l'opportunité de travailler en utilisant le système Grid5000, qui m'a permis de déployer et de tester mes compositions directement dans un environnement réel et reproductible. Cette expérience m'a offert une compréhension bien plus poussé sur les méthodes de déploiement de logiciel, à l'importance de d'évolutivité et à la gestion des ressources et à la fiabilité des systèmes distribués.\newline

Dans ce rapport, je décrirai en détail les différentes tâches et projets auxquels j'ai participé tout au long de mon stage, en mettant l'accent sur les compétences acquises, les résultats obtenus et les leçons apprises. Je présenterai également une analyse critique de mes réalisations, ainsi que des suggestions pour des améliorations futures. Ce rapport témoigne de ma progression en tant que professionnel de l'informatique et des contributions significatives que j'ai apportées au sein du LIG.\newline

Test de citation \cite{grid5000} je fait des test ici\newline

\newpage
<!-- \begin{figure}
\centering
\includegraphics[scale=1]{logos/logo-uga.png}
\caption{Test image et table}
\end{figure} -->

# Test de mise en page

\newpage

# Annexe

\listoffigures

\printbibliography

