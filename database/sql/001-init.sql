-- creation de la base de données mysql pour le projet set-it-up
CREATE DATABASE IF NOT EXISTS db_setitup;
-- utilisation de la base de données
USE db_setitup;

-- création de la table du composant stockage (HDD/SSD)
-- reference : instructions.MD
-- id est la clé primaire et auto-increment pour chaque composant ajouté
-- identifiantsheet est un varchar de 20 caractères pour stocker l'identifiant unique de chaque composant dans la feuille de calcul google sheet
-- etu est l'ID de l'étudiant qui a ajouté le composant, c'est un char(10) de la forme "ETU00####".
-- marque est un varchar de 200 caractères pour stocker la marque du composant
-- modele est un varchar de 200 caractères pour stocker le modèle du composant
-- format_physique est un enum pour stocker le format physique du composant, qui peut entre "M.2","2.5" ou "3.5"
-- generation_pcie est un entier pour stocker la génération PCIe du composant, qui peut être 0 (pour SATA/HDD), 3 (Gen3), 4 (Gen4), 5 (Gen5).
-- capacite_go est un entier pour stocker la capacité du composant en Go (ex: 512, 1024, 2048, etc.)
-- vitesse_lecture est un entier pour stocker la vitesse de lecture du composant en Mo/s (ex: 550, 3500, etc.)
-- vitesse_ecriture est un entier pour stocker la vitesse d'écriture du composant en Mo/s (ex: 520, 3000, etc.)
-- endurance_tbw est un entier pour stocker l'endurance du composant en TBW (ex: 300, 600, etc.)
-- cache_dram est un entier booléen pour indiquer si le composant a un cache DRAM ou pas (1 pour oui, 0 pour non)
-- annee_sortie est un entier pour stocker l'année de sortie du composant (ex: 2020, 2021, etc.)
-- prix est un entier pour stocker le prix du composant en ariary (ex: 150000, 220000, etc.)
-- boutique est un varchar de 200 caractères pour stocker le nom de la boutique où le composant a été trouvé, c'est un champ optionnel qui peut être laissé vide
-- sources est un champ pour stocker les sources d'information utilisées pour remplir les données du composant (contact ou liens), c'est un champ optionnel qui peut être laissé vide
CREATE TABLE IF NOT EXISTS stockage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifiantsheet VARCHAR(20) NOT NULL,
    etu CHAR(10) NOT NULL DEFAULT 'ETU000000',
    marque VARCHAR(200) NOT NULL,
    modele VARCHAR(200) NOT NULL,
    format_physique ENUM('M.2', '2.5', '3.5') NOT NULL,
    generation_pcie INT NOT NULL DEFAULT 0,
    capacite_go INT NOT NULL DEFAULT 0,
    vitesse_lecture INT NOT NULL DEFAULT 1,
    vitesse_ecriture INT NOT NULL DEFAULT 1,
    endurance_tbw INT NOT NULL DEFAULT 1,
    cache_dram BOOLEAN NOT NULL DEFAULT 0,
    annee_sortie INT NOT NULL DEFAULT 2000,
    prix INT NOT NULL DEFAULT 0,
    boutique VARCHAR(200) DEFAULT '',
    sources TEXT DEFAULT '',
    remarques TEXT DEFAULT ''
);

-- création de la table du composant CPU
-- reference : instructions.MD
-- id est la clé primaire et auto-increment pour chaque composant ajouté
-- identifiantsheet est un varchar de 20 caractères pour stocker l'identifiant unique de chaque composant dans la feuille de calcul google sheet
-- etu est l'ID de l'étudiant qui a ajouté le composant, c'est un char(10) de la forme "ETU00####".
-- marque est un varchar de 200 caractères pour stocker la marque du composant
-- modele est un varchar de 200 caractères pour stocker le modèle du composant
-- socket est un varchar de 50 caractères pour stocker le type de socket du composant (ex: LGA1200, AM4, etc.)
-- nb_p_core est un entier pour stocker le nombre de cœurs P-Cores du composant (ex: 8, 16, etc.)
-- nb_e_core est un entier pour stocker le nombre de cœurs E-Cores du composant (ex: 0, 8, etc.)
-- freq_base_ghz est un float pour stocker la fréquence de base du composant en GHz (ex: 3.6, 4.0, etc.)
-- freq_boost_ghz est un float pour stocker la fréquence de boost du composant en GHz (ex: 4.2, 5.0, etc.)
-- cache_l3_mo est un entier pour stocker la quantité de mémoire cache L3 du composant en Mo (ex: 16, 32, etc.)
-- tdp_w est un entier pour stocker le TDP du composant en Watts (ex: 65, 125, etc.)
-- igpu_integre est un entier booléen pour indiquer si le composant a une puce graphique intégrée ou pas (1 pour oui, 0 pour non)
-- nb_proc_graph est un entier pour stocker le nombre total de cœurs graphiques intégrés du composant (ex: 0, 2, etc.)
-- annee_sortie est un entier pour stocker l'année de sortie du composant (ex: 2020, 2021, etc.)
-- prix est un entier pour stocker le prix du composant en ariary (ex: 150000, 220000, etc.)
-- boutique est un varchar de 200 caractères pour stocker le nom de la boutique où le composant a été trouvé, c'est un champ optionnel qui peut être laissé vide
-- sources est un champ pour stocker les sources d'information utilisées pour remplir les données du composant (contact ou liens), c'est un champ optionnel qui peut être laissé vide
CREATE TABLE IF NOT EXISTS cpu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifiantsheet VARCHAR(20) NOT NULL,
    etu CHAR(10) NOT NULL DEFAULT 'ETU000000',
    marque VARCHAR(200) NOT NULL,
    modele VARCHAR(200) NOT NULL,
    socket VARCHAR(50) NOT NULL,
    nb_p_cores INT NOT NULL DEFAULT 0,
    nb_e_cores INT NOT NULL DEFAULT 0,
    nb_threads INT NOT NULL DEFAULT 1,
    freq_base_ghz FLOAT NOT NULL DEFAULT 1.0,
    freq_boost_ghz FLOAT NOT NULL DEFAULT 1.0,
    cache_l3_mo INT NOT NULL DEFAULT 1,
    tdp_w INT NOT NULL DEFAULT 1,
    igpu_integre BOOLEAN NOT NULL DEFAULT 0,
    nb_proc_graph INT NOT NULL DEFAULT 0,
    annee_sortie INT NOT NULL DEFAULT 2000,
    prix INT NOT NULL DEFAULT 0,
    boutique VARCHAR(200) DEFAULT '',
    sources TEXT DEFAULT '',
    remarques TEXT DEFAULT ''
);

-- création de la table du composant RAM
-- reference : instructions.MD
-- id est la clé primaire et auto-increment pour chaque composant ajouté
-- identifiantsheet est un varchar de 20 caractères pour stocker l'identifiant unique de chaque composant dans la feuille de calcul google sheet
-- etu est l'ID de l'étudiant qui a ajouté le composant, c'est un char(10) de la forme "ETU00####".
-- marque est un varchar de 200 caractères pour stocker la marque du composant
-- modele est un varchar de 200 caractères pour stocker le modèle du composant
-- generation est un entier pour stocker la génération de la RAM (ex: 3 pour DDR3, 4 pour DDR4, 5 pour DDR5)
-- capacite_totale_go est un entier pour stocker la capacité totale de la RAM en Go (ex: 16, 32, etc.)
-- nb_barrettes est un entier pour stocker le nombre de barrettes de RAM (ex: 2, 4, etc.)
-- frequence_ghz est un float pour stocker la fréquence de la RAM en GHz (ex: 2.4, 3.2, etc.)
-- cas_latency est un float pour stocker la latence CAS de la RAM (ex: 16, 18, etc.)
-- profil_oc est une texte pour stocker les profils d'overclocking de la RAM (Profil d'overclocking d'usine : `XMP` (Intel), `EXPO` (AMD), ou `Aucun`. Par defaut 'Aucun')
-- annee_sortie est un entier pour stocker l'année de sortie du composant (ex: 2020, 2021, etc.)
-- prix est un entier pour stocker le prix du composant en ariary (ex: 150000, 220000, etc.)
-- boutique est un varchar de 200 caractères pour stocker le nom de la boutique où le composant a été trouvé, c'est un champ optionnel qui peut être laissé vide
-- sources est un champ pour stocker les sources d'information utilisées pour remplir les données du composant (contact ou liens), c'est un champ optionnel qui peut être laissé vide
CREATE TABLE IF NOT EXISTS ram (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifiantsheet VARCHAR(20) NOT NULL,
    etu CHAR(10) NOT NULL DEFAULT 'ETU000000',
    marque VARCHAR(200) NOT NULL,
    modele VARCHAR(200) NOT NULL,
    generation INT NOT NULL DEFAULT 0,
    capacite_totale_go INT NOT NULL DEFAULT 0,
    nb_barrettes INT NOT NULL DEFAULT 1,
    frequence_mhz INT NOT NULL DEFAULT 1,
    cas_latency INT NOT NULL DEFAULT 1,
    profil_oc VARCHAR(50) NOT NULL DEFAULT 'Aucun',
    annee_sortie INT NOT NULL DEFAULT 2000,
    prix INT NOT NULL DEFAULT 0,
    boutique VARCHAR(200) DEFAULT '',
    sources TEXT DEFAULT '',
    remarques TEXT DEFAULT ''
);

-- création de la table du composant carte graphique (GPU)
-- reference : instructions.MD
-- id est la clé primaire et auto-increment pour chaque composant ajouté
-- identifiantsheet est un varchar de 20 caractères pour stocker l'identifiant unique
-- etu est l'ID de l'étudiant qui a ajouté le composant, c'est un char(10) de la forme "ETU00####".
-- constructeur_puce : l'architecte du processeur graphique (NVIDIA, AMD ou Intel)
-- marque_carte : le fabricant du système de refroidissement (Asus, MSI, Gigabyte...)
-- modele : nom exact du modèle (ex: RTX 4070 Ti Super)
-- vram_go : quantité de mémoire vidéo dédiée en Go (ex: 8, 16, 24)
-- bus_memoire_bits : largeur du bus mémoire en bits (ex: 128, 256, 384)
-- freq_boost_mhz : fréquence maximale (Boost Clock) en MHz
-- longueur_mm : longueur totale de la carte en mm
-- epaisseur_slots : nombre d'emplacements PCIe condamnés par l'épaisseur (2, 2.5, 3...)
-- generation_pcie : génération PCIe du GPU (3, 4, 5)
-- connecteur_alim : type de câble requis (8-pin ou 12VHPWR)
-- port_hdmi : nombre de sorties HDMI
-- port_dp : nombre de sorties DisplayPort
-- port_vga : nombre de sorties VGA
-- port_dvi : nombre de sorties DVI
-- tdp_w : consommation électrique maximale en Watts
-- annee_sortie : année de commercialisation
-- prix : prix en ariary
-- boutique : nom du revendeur
-- sources : lien ou contact
CREATE TABLE IF NOT EXISTS gpu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifiantsheet VARCHAR(20) NOT NULL,
    etu CHAR(10) NOT NULL DEFAULT 'ETU000000',
    constructeur_puce VARCHAR(50) NOT NULL,
    marque_carte VARCHAR(200) NOT NULL,
    modele VARCHAR(200) NOT NULL,
    vram_go INT NOT NULL DEFAULT 0,
    bus_memoire_bits INT NOT NULL DEFAULT 128,
    freq_boost_mhz INT NOT NULL DEFAULT 1,
    longueur_mm INT NOT NULL DEFAULT 1,
    epaisseur_slots FLOAT NOT NULL DEFAULT 2.0,
    generation_pcie INT NOT NULL DEFAULT 4,
    connecteur_alim VARCHAR(50) NOT NULL DEFAULT '8-pin',
    port_hdmi INT NOT NULL DEFAULT 0,
    port_dp INT NOT NULL DEFAULT 0,
    port_vga INT NOT NULL DEFAULT 0,
    port_dvi INT NOT NULL DEFAULT 0,
    tdp_w INT NOT NULL DEFAULT 1,
    annee_sortie INT NOT NULL DEFAULT 2000,
    prix INT NOT NULL DEFAULT 0,
    boutique VARCHAR(200) DEFAULT '',
    sources TEXT DEFAULT '',
    remarques TEXT DEFAULT ''
);

-- création de la table du composant alimentation (PSU)
-- reference : instructions.MD
-- id est la clé primaire et auto-increment pour chaque composant ajouté
-- identifiantsheet est un varchar de 20 caractères pour stocker l'identifiant unique
-- etu est l'ID de l'étudiant qui a ajouté le composant, c'est un char(10) de la forme "ETU00####".
-- marque : fabricant du composant (Seasonic, Corsair, BeQuiet...)
-- modele : nom exact de la gamme (ex: Focus GX-850)
-- format : format physique (ATX ou SFX)
-- puissance_w : puissance totale délivrée en Watts
-- score_certification : efficacité 80 Plus (1=White, 2=Bronze, 3=Silver, 4=Gold, 5=Platinum, 6=Titanium)
-- score_modularite : gestion câbles (0=Non-modulaire, 1=Semi, 2=Full)
-- connecteur_12vhpwr : possède le câble PCIe Gen 5 natif (1=Oui, 0=Non)
-- annee_sortie : année de commercialisation
-- prix : prix en ariary
-- boutique : nom du revendeur
-- sources : lien ou contact
CREATE TABLE IF NOT EXISTS psu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifiantsheet VARCHAR(20) NOT NULL,
    etu CHAR(10) NOT NULL DEFAULT 'ETU000000',
    marque VARCHAR(200) NOT NULL,
    modele VARCHAR(200) NOT NULL,
    format ENUM('ATX', 'SFX') NOT NULL DEFAULT 'ATX',
    puissance_w INT NOT NULL DEFAULT 0,
    score_certification INT NOT NULL DEFAULT 1,
    score_modularite INT NOT NULL DEFAULT 0,
    connecteur_12vhpwr BOOLEAN NOT NULL DEFAULT 0,
    annee_sortie INT NOT NULL DEFAULT 2000,
    prix INT NOT NULL DEFAULT 0,
    boutique VARCHAR(200) DEFAULT '',
    sources TEXT DEFAULT '',
    remarques TEXT DEFAULT ''
);

-- création de la table du composant carte mère (Motherboard)
-- reference : instructions.MD
-- id est la clé primaire et auto-increment pour chaque composant ajouté
-- identifiantsheet est un varchar de 20 caractères pour stocker l'identifiant unique
-- etu est l'ID de l'étudiant qui a ajouté le composant, c'est un char(10) de la forme "ETU00####".
-- marque : fabricant du composant (Asus, MSI, Gigabyte...)
-- modele : nom exact du produit
-- format : format physique (ATX, Micro-ATX, Mini-ITX, E-ATX)
-- socket : réceptacle du CPU (ex: AM5, LGA1700)
-- chipset : puce de contrôle principale (ex: B650, Z790)
-- type_ram_supporte : génération de RAM acceptée (4=DDR4, 5=DDR5)
-- nb_slots_ram : nombre d'emplacements pour les barrettes de RAM
-- max_ram_go : capacité maximale de RAM tolérée
-- nb_ports_m2 : nombre d'emplacements pour les SSD NVMe
-- nb_ports_sata : nombre de connecteurs SATA pour HDD 3.5" et SSD 2.5"
-- generation_pcie : génération PCIe du slot x16 principal et ports M.2 (3, 4, 5)
-- version_wifi : norme Wi-Fi intégrée (0=pas de Wi-Fi, 5, 6, 7)
-- annee_sortie : année de commercialisation
-- prix : prix en ariary
-- boutique : nom du revendeur
-- sources : lien ou contact
CREATE TABLE IF NOT EXISTS carte_mere (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifiantsheet VARCHAR(20) NOT NULL,
    etu CHAR(10) NOT NULL DEFAULT 'ETU000000',
    marque VARCHAR(200) NOT NULL,
    modele VARCHAR(200) NOT NULL,
    format ENUM('ATX', 'Micro-ATX', 'Mini-ITX', 'E-ATX') NOT NULL DEFAULT 'ATX',
    socket VARCHAR(50) NOT NULL,
    chipset VARCHAR(50) NOT NULL,
    type_ram_supporte INT NOT NULL DEFAULT 5,
    nb_slots_ram INT NOT NULL DEFAULT 2,
    max_ram_go INT NOT NULL DEFAULT 64,
    nb_ports_m2 INT NOT NULL DEFAULT 1,
    nb_ports_sata INT NOT NULL DEFAULT 4,
    generation_pcie INT NOT NULL DEFAULT 4,
    version_wifi INT NOT NULL DEFAULT 0,
    annee_sortie INT NOT NULL DEFAULT 2000,
    prix INT NOT NULL DEFAULT 0,
    boutique VARCHAR(200) DEFAULT '',
    sources TEXT DEFAULT '',
    remarques TEXT DEFAULT ''
);