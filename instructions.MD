# Sujet

https://www.figma.com/deck/hMei7MEPtJ8amCJkxPPjk5/TP-Set-IT-UP?node-id=15-1223&t=UnlCB5cehaCVt3BY-1

# Projet final

https://github.com/superealabs/set-it-up-tp

# Documentation

## Composants - Stockage (SSD & HDD)

### Rôle dans le Build :

Le stockage détermine la réactivité globale du système, les temps de chargement en jeu et la vitesse de transfert des gros fichiers (montage vidéo, etc.).

### Dictionnaire des Données (Colonnes du fichier)

Les données doivent être **strictement numériques** là où c'est indiqué. Tout fichier contenant du texte dans une colonne numérique (ex: "3500 Mo/s" au lieu de "3500") sera automatiquement rejeté par notre algorithme de validation.

| **Nom de la colonne** | **Type de donnée attendu** | **Description & Règle de saisie** | **Exemple valide** |
| --- | --- | --- | --- |
| `id` | Texte | Identifiant unique généré par vos soins (ex: STO-001). | `STO-001` |
| `marque` | Texte | Fabricant du composant. | `Samsung` |
| `model` | Texte | Nom exact du produit. | `990 Pro` |
| `format_physique` | Enumération | Choisir strictement parmi : `M.2`, `2.5`, `3.5`. | `M.2` |
| `generation_pcie` | Entier | 0 (pour SATA/HDD), 3 (Gen3), 4 (Gen4), 5 (Gen5). | `4` |
| `capacite_go` | Entier | Capacité totale convertie en Gigaoctets. | `2000` *(pour 2 To)* |
| `vitesse_lecture` | Entier | Vitesse maximale annoncée en Mo/s. | `7450` |
| `vitesse_ecriture` | Entier | Vitesse maximale annoncée en Mo/s. | `6900` |
| `endurance_tbw` | Entier | "Terabytes Written" (Durée de vie garantie par le constructeur en To). | `1200` |
| `cache_dram` | Entier (Booléen) | Le SSD possède-t-il une puce DRAM ? `1` = Oui, `0` = Non. (Mettre 0 pour les HDD). | `1` |
| `annee_sortie` | Entier | Année de commercialisation (doit être $\ge 2022$ pour 50% de vos choix). | `2023` |
| `prix` | Entier | Prix actuel (sans espace). | `179000` |
| `boutique` | Texte | Nom du revendeur ou de la boutique | `PCUpgrade` , `Les Casaniers` |
| `source` | Texte | Lien hypertexte direct vers la page du produit ou contact | `https://...` |

### **Comment nous allons évaluer vos choix (Le "Versus")**

En tant que prestataires pour **Set IT Up**, vous devez comprendre comment notre simulateur va utiliser vos données pour classer les composants lors d'un duel ("Versus").
Vos composants de stockage seront évalués par nos algorithmes selon deux scores principaux :
1. **L'Indice de Vélocité Brute :**

$$
Score_{vitesse} = \frac{vitesse_{lecture} + vitesse_{ecriture}}{2} + (generation_{pcie} \times 200)
$$

*Un SSD avec un cache DRAM (`cache_dram = 1`) recevra un multiplicateur bonus de 1.15 sur ce score, car il sera beaucoup plus stable lors des gros transferts. La génération PCIe apporte un léger bonus contextuel, mais ce sont les vitesses réelles qui pilotent le classement.*

2. **L'Indice de Rentabilité (Value for Money) :**

$Score_{valeur} = \frac{capacite\_go}{prix}$

*Plus le résultat est haut, plus le composant est rentable pour le client final.*

## Composant : Processeur (CPU)

### Rôle dans le Build :

C'est le cerveau de l'ordinateur. Il traite toutes les instructions et détermine la compatibilité avec la carte mère (via le Socket).

### Dictionnaire des Données (Colonnes du fichier)

Comme pour le stockage, les données de performance doivent être **strictement numériques**. Ne mettez pas "GHz" ou "Mo" dans les cellules, utilisez uniquement des nombres (entiers ou décimales avec un point).

| **Nom de la colonne** | **Type de donnée attendu** | **Description & Règle de saisie** | **Exemple valide** |
| --- | --- | --- | --- |
| `id` | Texte | Identifiant unique généré par vos soins. | `CPU-001` |
| `marque` | Texte | Fabricant du composant (`Intel` ou `AMD`). | `Intel` |
| `model` | Texte | Nom exact et complet du processeur. | `Core i5-13600K` |
| `socket` | Texte | Format physique (Crucial pour la compatibilité Carte Mère). | `LGA1700` |
| `nb_p_cores` | Entier | Nombre de cœurs de Performance (P-Cores). | `6` |
| `nb_e_cores` | Entier | Nombre de cœurs d'Efficience (E-Cores). *Mettre 0 si le CPU n'a qu'un seul type de cœur (ex: anciens AMD).* | `8` |
| `nb_threads` | Entier | Nombre total de threads logiques. | `20` |
| `freq_base_ghz` | Décimal | Fréquence de base en GHz (utiliser un point). | `3.5` |
| `freq_boost_ghz` | Décimal | Fréquence maximale (Boost/Turbo) en GHz. | `5.1` |
| `cache_l3_mo` | Entier | Quantité de mémoire Cache L3 en Mégaoctets (Mo). | `24` |
| `tdp_w` | Entier | Thermal Design Power en Watts (Consommation thermique). | `125` |
| `igpu_integre` | Entier (Booléen) | Possède-t-il une puce graphique intégrée ? `1` = Oui, `0` = Non (ex: Intel "F"). | `1` |
| `nb_proc_graph` | Entier | Nombre total de coeurs graphiques intégrés. | `2` |
| `annee_sortie` | Entier | Année de commercialisation. | `2022` |
| `prix` | Entier | Prix actuel (sans espace). | `179000` |
| `boutique` | Texte | Nom du revendeur ou de la boutique | `PCUpgrade` , `Les Casaniers` |
| `source` | Texte | Lien hypertexte direct vers la page du produit ou contact. | `https://...` |

**Note Importante sur les Cœurs :**

Intel a popularisé l'architecture hybride avec ses P-Cores (haute performance) et ses E-Cores (efficience énergétique). AMD, de son côté, continue d'utiliser des cœurs complets sans distinction officielle. Les distinctions d'Intel ont commencé à partir de la 12ème génération (Alder Lake). Pour les anciennes générations d'Intel et pour tous les AMD, vous devez remplir la colonne `nb_p_cores` avec le nombre total de cœurs, et mettre *0* dans `nb_e_cores`.

Liens utiles: 
* https://www.intel.fr/content/www/fr/fr/gaming/resources/how-hybrid-design-works.html
* https://www.amd.com/fr/products/processors/desktops/ryzen.html

### Comment nous allons évaluer vos choix (Le "Versus")

Pour le simulateur, vos processeurs seront soumis à deux algorithmes de notation distincts pour définir leur profil (Gaming ou Productivité) :

1. **L'Indice de Productivité (Multitâche & Rendu) :**

Notre moteur va calculer la puissance de calcul brute en valorisant l'architecture hybride et la fréquence :

$Score_{Pro} = \left[(nb\_p\_cores \times 2) + nb\_e\_cores\right] \times freq\_boost\_ghz + \frac{cache\_l3\_mo}{2}$

*La fréquence boost agit comme multiplicateur du nombre de cœurs : un CPU avec peu de cœurs mais une haute fréquence restera compétitif. Le cache L3 apporte un léger bonus supplémentaire. Ce score permettra de recommander les meilleurs processeurs pour les stations de travail (Montage 3D, Code, etc.).*

2. **L'Indice Gaming (Jeux Vidéo) :**

Pour le jeu, la fréquence et le cache priment sur le nombre total de cœurs, mais les P-Cores comptent également (les jeux modernes exploitent 6 à 8 cœurs) :

$Score_{Gaming} = (freq\_boost\_ghz \times 10) + (cache\_l3\_mo \times 0.5) + (nb\_p\_cores \times 3)$

*Un CPU avec un énorme Cache L3 (comme les versions "X3D" d'AMD) obtiendra un bonus significatif, tandis que la fréquence boost reste le facteur dominant du score.*

3. **L'Indice Thermique (Pour le Build Simulator) :**

Dans le mode "Construction", le `tdp_w` sera soustrait de la capacité de l'alimentation (PSU). Si l'étudiant choisit un CPU avec un TDP de 253W, le budget énergétique restant pour la carte graphique sera drastiquement réduit !

## Composant : Mémoire Vive (RAM)

### Rôle dans le Build :

Espace de travail à court terme du processeur. Plus elle est rapide et réactive, plus le processeur peut être alimenté en données efficacement (évitant ainsi les goulots d'étranglement, surtout en jeu).

### Dictionnaire des Données (Colonnes du fichier)

Vos données doivent être **strictement numériques** dans les colonnes de performance. Par exemple, pour un kit "2x16 Go à 6000 MHz", vous devrez séparer ces informations logiquement dans les colonnes dédiées.

| **Nom de la colonne** | **Type de donnée attendu** | **Description & Règle de saisie** | **Exemple valide** |
| --- | --- | --- | --- |
| `id` | Texte | Identifiant unique (ex: RAM-001). | `RAM-001` |
| `marque` | Texte | Fabricant du composant. | `Corsair` |
| `model` | Texte | Nom exact de la gamme (ex: Vengeance, Fury). | `Vengeance RGB` |
| `generation` | Entier | `4` pour DDR4, `5` pour DDR5. | `5` |
| `capacite_totale_go` | Entier | Capacité totale du kit en Gigaoctets. | `32` |
| `nb_barrettes` | Entier | Nombre de modules inclus dans le kit (important pour les slots de la carte mère). | `2` |
| `frequence_mhz` | Entier | Fréquence de fonctionnement certifiée en MHz. | `6000` |
| `cas_latency` | Entier | La latence CAS (souvent notée CL ou C, ex: CL30). Plus ce chiffre est bas, mieux c'est. | `30` |
| `profil_oc` | Texte | Profil d'overclocking d'usine : `XMP` (Intel), `EXPO` (AMD), ou `Aucun`. | `EXPO` |
| `annee_sortie` | Entier | Année de commercialisation (doit être $\ge 2023$ pour 30% du catalogue). | `2024` |
| `prix` | Entier | Prix actuel (sans espace). | `179000` |
| `boutique` | Texte | Nom du revendeur ou de la boutique | `PCUpgrade` , `Les Casaniers` |
| `source` | Texte | Lien hypertexte direct vers la page du produit ou contact. | `https://...` |

### Comment nous allons évaluer vos choix (Le "Versus")

Dans notre application, comparer deux kits de RAM ne se limite pas à regarder la fréquence. Notre algorithme calcule la **latence absolue** (le temps de réponse réel) pour départager les composants.

1. **L'Indice de Vélocité (Performance Score) :**

Notre système calcule un ratio entre la fréquence et la latence, pondéré par la génération DDR. Plus le score est haut, plus la mémoire est réactive.

$Score_{RAM} = \frac{frequence\_mhz}{cas\_latency} \times generation$

*Exemple : Une DDR5 à 6000 MHz en CL30 aura un score de 1000, tandis qu'une DDR4 à 3600 MHz en CL16 obtiendra 900. La DDR5 est naturellement avantagée grâce à sa supériorité en bande passante.*

2. **2. L'Indice Dual-Channel (Validation Build) :**

Lors d'une simulation de montage, si vous choisissez un composant avec `nb_barrettes = 1` (Single Channel), notre validateur appliquera un malus de performance sur le système final. Le standard est de **2** barrettes pour activer le Dual-Channel.

3. **Le Check de Compatibilité Intel/AMD :**

**G**râce à la colonne `profil_oc`, le simulateur vérifiera la cohérence. Associer de la RAM optimisée `EXPO` avec un processeur Intel fonctionnera, mais déclenchera un avertissement "Optimisation non garantie" dans l'outil.

## Composant : Carte Graphique (GPU)

### Rôle dans le build:

C'est le moteur de rendu visuel. Elle gère la 3D, le ray-tracing et les calculs parallèles lourds (IA, montage vidéo). C'est aussi le composant le plus encombrant et le plus gourmand en énergie.

### Dictionnaire des Données (Colonnes du fichier)

| **Nom de la colonne** | **Type de donnée attendu** | **Description & Règle de saisie** | **Exemple valide** |
| --- | --- | --- | --- |
| `id` | Texte | Identifiant unique (ex: GPU-001). | `GPU-001` |
| `constructeur_puce` | Texte | L'architecte du processeur graphique : `NVIDIA`, `AMD` ou `Intel`. | `NVIDIA` |
| `marque_carte` | Texte | Le fabricant du système de refroidissement (Asus, MSI, Gigabyte...). | `MSI` |
| `model` | Texte | Le nom du modèle exact. | `RTX 4070 Ti Super` |
| `vram_go` | Entier | Quantité de mémoire vidéo dédiée en Gigaoctets. | `16` |
| `bus_memoire_bits` | Entier | La largeur du bus mémoire (très important pour la bande passante 4K). | `256` |
| `freq_boost_mhz` | Entier | Fréquence maximale (Boost Clock) en MHz. | `2610` |
| `longueur_mm` | Entier | Longueur totale de la carte en millimètres (Crucial pour le boîtier). | `308` |
| `epaisseur_slots` | Décimal | Nombre d'emplacements PCIe condamnés par l'épaisseur (2, 2.5, 3...). | `2.5` |
| `generation_pcie` | Entier | Génération PCIe du GPU : `3` (Gen3), `4` (Gen4), `5` (Gen5). | `4` |
| `connecteur_alim` | Texte | Type de câble requis : `8-pin` (classique) ou `12VHPWR` (nouvelle norme). | `12VHPWR` |
| `port_hdmi` | Entier | Nombre de sorties HDMI. | `1` |
| `port_dp` | Entier | Nombre de sorties DisplayPort. | `3` |
| `port_vga` | Entier | Nombre de sorties VGA. | `1` |
| `port_dvi` | Entier | Nombre de sorties DVI. | `1` |
| `tdp_w` | Entier | Consommation électrique maximale en Watts. | `285` |
| `annee_sortie` | Entier | Année de commercialisation (doit être $\ge 2023$ pour 50% de la liste). | `2024` |
| `prix` | Entier | Prix actuel (sans espace). | `179000` |
| `boutique` | Texte | Nom du revendeur ou de la boutique | `PCUpgrade` , `Les Casaniers` |
| `source` | Texte | Lien hypertexte direct vers la page du produit ou contact. | `https://...` |

### Comment nous allons évaluer vos choix (Le "Versus")

La solution va analyser les GPU sous trois angles précis. Un GPU avec beaucoup de VRAM mais un bus mémoire bridé sera pénalisé par l'algorithme.

1. **Le Score de Puissance Brute (Rasterization) :**

Notre algorithme croise la VRAM, la largeur du bus et la fréquence dans une approche multiplicative pour établir un score de performance en jeu :

$Score_{GPU} = vram\_go \times \frac{bus\_memoire\_bits}{128} \times \frac{freq\_boost\_mhz}{1000}$

*Exemple : Une RTX 4070 Ti Super (16 Go, 256-bit, 2610 MHz) obtiendra un score de 83.5, tandis qu'une RTX 4060 (8 Go, 128-bit, 2460 MHz) n'obtiendra que 19.7. Les tiers de performance sont ainsi clairement séparés : Entry (~20) → Mid (~50) → High (~80) → Ultra (~180).*

2. **Le Crash-Test de Compatibilité (Le Piège du Build) :**

Dans le simulateur, si un client choisit un petit boîtier, votre carte graphique sera rejetée si sa `longueur_mm` dépasse la limite du châssis. De même, si son `epaisseur_slots` est de 3, le configurateur bloquera l'ajout d'une carte Wi-Fi supplémentaire.

3. **Le Check "Alimentation Nouvelle Génération" :**

Grâce à la colonne `connecteur_alim`, si la carte exige du `12VHPWR` (comme beaucoup de NVIDIA récentes), le simulateur imposera automatiquement au client de choisir une alimentation certifiée **ATX 3.0** (que vous devrez sourcer dans le fichier PSU !).

4. **Le Check de Compatibilité PCIe (GPU ↔ Carte Mère) :**

Si `GPU.generation_pcie > MOBO.generation_pcie`, le simulateur affichera un avertissement **"Bridage bande passante : le GPU ne sera pas exploité à son plein potentiel sur cette carte mère"**. Le GPU fonctionnera (rétrocompatibilité PCIe), mais les performances seront limitées par le débit du slot inférieur.

## Composant : Boîtier d'Alimentation (PSU)

### Rôle dans le Build :

C'est le cœur du système. L'alimentation convertit le courant mural (alternatif) en courant continu pour les composants. Une alimentation de mauvaise qualité ou sous-dimensionnée peut littéralement faire griller le PC entier ou causer des redémarrages intempestifs en plein jeu.

### Dictionnaire des Données (Colonnes du fichier)

| **Nom de la colonne** | **Type de donnée attendu** | **Description & Règle de saisie** | **Exemple valide** |
| --- | --- | --- | --- |
| `id` | Texte | Identifiant unique (ex: PSU-001). | `PSU-001` |
| `marque` | Texte | Fabricant du composant (Seasonic, Corsair, BeQuiet...). | `Seasonic` |
| `model` | Texte | Nom exact de la gamme. | `Focus GX-850` |
| `format` | Texte | Format physique : `ATX` (standard) ou `SFX` (compact). | `ATX` |
| `puissance_w` | Entier | Puissance totale délivrée en Watts. | `850` |
| `score_certification` | Entier | Efficacité énergétique (80 Plus). Saisir strictement un chiffre : `1` (White), `2` (Bronze), `3` (Silver), `4` (Gold), `5` (Platinum), `6` (Titanium). | `4` |
| `score_modularite` | Entier | Gestion des câbles : `0` (Non-modulaire), `1` (Semi-modulaire), `2` (Full-modulaire). | `2` |
| `connecteur_12vhpwr` | Entier (Booléen) | Possède-t-il le câble PCIe Gen 5 natif pour les nouveaux GPU ? `1` = Oui, `0` = Non. | `1` |
| `annee_sortie` | Entier | Année de commercialisation (doit être $\ge 2023$ pour 50% de la liste). | `2023` |
| `prix` | Décimal | Prix actuel (utiliser un point pour les décimales). | `139.90` |
| `boutique` | Texte | Nom du revendeur ou de la boutique | `PCUpgrade` , `Les Casaniers` |
| `source` | Texte | Lien hypertexte direct vers la page du produit ou contact. | `https://...` |

### Comment nous allons évaluer vos choix (Le "Versus")

L'alimentation n'est pas évaluée sur ses FPS en jeu, mais sur sa **fiabilité** et sa **capacité à sécuriser le montage**.

1. **L'Indice de Qualité (Premium Score) :**

Notre algorithme valorise les alimentations qui chauffent peu (bonne certification), qui facilitent le montage (modularité), et qui offrent une marge d'évolution (puissance) .

$Score_{PSU} = (score\_certification \times 10) + (score\_modularite \times 5) + \frac{puissance\_w}{100}$

*Exemple : Une alimentation 850W Gold (4) Full-modulaire (2) aura un score de 58.5. Une 650W Bronze (2) Non-modulaire (0) aura 26.5.*

2. **La Règle d'Or de la Capacité (Crash-Test Build) :**

Lors du simulateur de build, notre moteur calculera la consommation maximale théorique du système. Si la puissance de votre PSU ne respecte pas cette marge de sécurité de 30%, le build sera refusé :

$Puissance\_W > (TDP\_CPU + TDP\_GPU + 100) \times 1.3$

3. **La Tolérance Zéro sur les Câbles (Le Piège de Compatibilité) :**

Si un client choisit dans notre catalogue une carte graphique récente (comme une RTX 4080) exigeant un connecteur `12VHPWR`, et que vous lui proposez une alimentation avec `connecteur_12vhpwr = 0`, le système générera une **Alerte Rouge : Risque de fonte de l'adaptateur**.

## Composant : Carte Mère (Motherboard)

### Rôle dans le Build:

C'est le système nerveux central de l'ordinateur. Elle interconnecte le processeur, la mémoire, la carte graphique et le stockage. Ses caractéristiques définissent les limites physiques et technologiques de toute la machine (Overclocking, génération PCIe, normes réseau).

### Dictionnaire des Données (Colonnes du fichier)

| **Nom de la colonne** | **Type de donnée attendu** | **Description & Règle de saisie** | **Exemple valide** |
| --- | --- | --- | --- |
| `id` | Texte | Identifiant unique (ex: MOBO-001). | `MOBO-001` |
| `marque` | Texte | Fabricant du composant (Asus, MSI, Gigabyte...). | `Asus` |
| `model` | Texte | Nom exact du produit. | `ROG Strix B650E-F Gaming WiFi` |
| `format` | Texte | Format physique strict : `ATX`, `Micro-ATX`, `Mini-ITX`, ou `E-ATX`. | `ATX` |
| `socket` | Texte | Le réceptacle du CPU. Doit correspondre exactement aux standards. | `AM5` |
| `chipset` | Texte | La puce de contrôle principale (ex: B650, Z790, A620). | `B650` |
| `type_ram_supporte` | Entier | Génération de RAM acceptée : `4` (pour DDR4) ou `5` (pour DDR5). | `5` |
| `nb_slots_ram` | Entier | Nombre d'emplacements pour les barrettes de RAM. | `4` |
| `max_ram_go` | Entier | Capacité maximale de mémoire vive tolérée par la carte. | `128` |
| `nb_ports_m2` | Entier | Nombre d'emplacements pour les SSD NVMe. | `3` |
| `nb_ports_sata` | Entier | Nombre de connecteurs SATA sur la carte mère (pour les HDD 3.5" et SSD 2.5" SATA). | `6` |
| `generation_pcie` | Entier | Génération PCIe du slot x16 principal et des ports M.2 : `3` (Gen3), `4` (Gen4), `5` (Gen5). | `5` |
| `version_wifi` | Entier | Norme Wi-Fi intégrée : `0` (Pas de Wi-Fi), `5` (Wi-Fi 5), `6` (Wi-Fi 6/6E), `7` (Wi-Fi 7). | `6` |
| `annee_sortie` | Entier | Année de commercialisation. | `2022` |
| `prix` | Entier | Prix actuel (sans espace). | `259000` |
| `boutique` | Texte | Nom du revendeur ou de la boutique | `PCUpgrade` , `Les Casaniers` |
| `source` | Texte | Lien hypertexte direct vers la page du produit ou contact. | `https://...` |

### Comment nous allons évaluer vos choix (Le "Versus")

La carte mère n'apporte pas de FPS (images par seconde) directement, mais elle est évaluée sur son potentiel d'évolution (Future-Proofing) et sa connectivité.

1. **L'Indice d'Évolutivité (Future-Proof Score) :**

Notre algorithme calcule la capacité de la carte mère à accueillir des améliorations dans les années à venir (plus de stockage, réseau plus rapide, compatibilité GPU) :

$Score_{Evo} = (type\_ram\_supporte \times 10) + (nb\_ports\_m2 \times 5) + (nb\_ports\_sata \times 2) + (version\_wifi \times 3) + (generation\_pcie \times 5)$

*Exemple : Une carte mère DDR5 avec 3 ports M.2, 6 ports SATA, Wi-Fi 7 et PCIe 5 obtiendra un score de $(50 + 15 + 12 + 21 + 25 = 123)$, contre $(40 + 5 + 8 + 0 + 15 = 68)$ pour une ancienne carte DDR4 avec 1 port M.2, 4 ports SATA, sans Wi-Fi et en PCIe 3.*

2. **Le Check de Compatibilité Ultime (Le Gardien du Build) :**

C'est ici que l'algorithme est le plus sévère. Pour qu'un PC démarre dans le simulateur, la carte mère doit valider les contrôles suivants :
* **Test Processeur :** `MOBO.socket` DOIT ÊTRE ÉGAL à `CPU.socket`.
* **Test Mémoire :** `MOBO.type_ram_supporte` DOIT ÊTRE ÉGAL à `RAM.generation`.
* **Test Quantité RAM :** `RAM.nb_barrettes` DOIT ÊTRE $\le$ `MOBO.nb_slots_ram`.
* **Test Stockage NVMe :** Le nombre de SSD au format `M.2` sélectionnés DOIT ÊTRE $\le$ `MOBO.nb_ports_m2`.
* **Test Stockage SATA :** Le nombre de disques SATA (format `2.5` ou `3.5` avec `generation_pcie = 0`) DOIT ÊTRE $\le$ `MOBO.nb_ports_sata`.
* **Test Gen PCIe Stockage :** Si `STO.generation_pcie > MOBO.generation_pcie`, le simulateur affichera un avertissement **"SSD bridé : le SSD NVMe ne sera pas exploité à son plein potentiel sur cette carte mère"**.
* **Test GPU-CM PCIe :** Si `GPU.generation_pcie > MOBO.generation_pcie`, avertissement **"GPU bridé : bande passante limitée par le slot PCIe de la carte mère"**.

 
3. **Le Piège du Boîtier :**

Si vous sélectionnez une carte mère au format `ATX` et que le client a choisi un boîtier ultra-compact prévu pour du `Mini-ITX`, le montage sera physiquement impossible et bloqué.
