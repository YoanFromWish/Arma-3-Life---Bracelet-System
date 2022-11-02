<a name="readme-top"></a>

<div align="center">

  <a href="">![Stargazers][stars-shield]</a>
  <a href="">![Issues][issues-shield]</a>


</div>


<!-- PROJECT LOGO -->
<br />
<div align="center">
<h3 align="center">Arma 3 Life - Bracelet System</h3>

  <p align="center">
    Le bracelet System, permet aux policiers d'ajouter un bracelet éléctronique à un civil.
    <br />
    <br />
    <a href="https://github.com/YoanFromWish/Arma-3-Life---Bracelet-System/issues">Reporter un bug</a>
    ·
    <a href="https://github.com/YoanFromWish/Arma-3-Life---Bracelet-System/issues">Demander une fonctionnalité</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Sommaire</summary>
  <ol>
    <li>
      <a href="#about-the-project">À propos du projet</a>
      <ul>
        <li><a href="#built-with">Conçu pour</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Installation</a>
    </li>
    <li><a href="#usage">Utilisation</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## A propos


Ce script à été conçu suite à un vote de la communauté d'<a href="https://arma3dev.fr/">Arma3Dev</a>, merci à eux pour leurs vote

<p align="right">(<a href="#readme-top">Retour au haut de page</a>)</p>



### Conçu pour

* <a href="https://github.com/AsYetUntitled/Framework">FrameWork AlisLife 5.0.0</a>

<p align="right">(<a href="#readme-top">Retour au haut de page</a>)</p>


## Installation

1. Télécharger la dernière release 
2. Déplacer les fichiers dans le dossier `client` dans votre mission
3. Ajouter le code suivant dans votre `Functions.hpp` comme la photo ci-dessous
    ```sqf
    class Yoan_Bracelet {
        file = "Yoan\Bracelet\Functions"
        class braceletAdd {};
        class BraceletInitMap {};
        class braceletAddToPlayer {};
    };
    ```
4. Creer un item dans le `Config_vItem.hpp`
    ```sqf
    class pince {
          variable = "pince";
          displayName = "Pince Monseigneur";
          weight = 5;
          buyPrice = 7500;
          sellPrice = 1000;
          illegal = true;
          edible = -1;
          drinkable = -1;
          icon = "icons\ico_boltCutter.paa";
      };
    ```
5. Aller dans le fichier `core\pmenu\fn_useItem.sqf` ajouté ceci
    ```sqf
    case "pince": {
          [0,player,player,"remove"] remoteExec ["Yoan_Server_fnc_braceletGetData",2]; 
    };
    ```
    au dessus de :
    ```sqf
    default {
          hint localize "STR_ISTR_NotUsable";
    };
    ```
6. dans le `cfgRemoteExec.hpp` ajouter :
    ```sqf
    F(Yoan_Server_fnc_braceletGetData,SERVER)
    ```
    
     en dessous de :

    ```sqf
    F(TON_fnc_houseGarage,SERVER)
    ```
7. dans le fichier `core\init.sqf`
ajouter 
    ```sqf
    [0,player,player,"connect"] remoteExec ["Yoan_Server_fnc_braceletGetData", RSERV];
    ```
    au dessus de :
    ```sqf
    diag_log "----------------------------------------------------------------------------------------------------";
    diag_log format ["               End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime - _timeStamp)];
    diag_log "----------------------------------------------------------------------------------------------------";
    ```
8. dans le fichier `core\functions\fn_checkMap.sqf` remplacer :
    ```sqf
    case west: {[] spawn life_fnc_copMarkers};
    ```
    par :
    ```sqf
    case west: {
            [] spawn life_fnc_copMarkers;
            [] spawn life_fnc_BraceletInitMap;
        };
    ```
9. dans le fichier `dialog\masterHandler.hpp` ajouter :
    ```sqf
    #include "bracelet.hpp"
    ```
10. Déplacer les fichiers qui sont dans le dossier `server` dans votre life_server
11. dans le dossier `init.sqf` au dessus de : 

    ```sqf
    diag_log "----------------------------------------------------------------------------------------------------";
    diag_log format ["               End of Altis Life Server Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
    diag_log "----------------------------------------------------------------------------------------------------";
    ```

    ajouter :

    ```sqf
    [] spawn Yoan_Server_fnc_braceletWhile;
    ```

12. dans le `config.cpp` en dessous de :

  `class CfgFunctions {`

  ajouter :

  `#include "\life_server\Yoan\masterFunctions.hpp"`

<p align="right">(<a href="#readme-top">Retour au haut de page</a>)</p>

<!-- CONTACT -->
## Contact

YoanFromWish (Yoan Verquion)
<br>
[![xcode-version](https://img.shields.io/badge/discord-Yoan%231000-green)](discord.com) · [![xcode-version](https://img.shields.io/badge/steam-186072502-green)](steam.com)
<br>
Lien GitHub: https://github.com/YoanFromWish/Arma-3-Life---Bracelet-System

<p align="right">(<a href="#readme-top">Retour au haut de page</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[stars-shield]: https://img.shields.io/github/stars/YoanFromWish/Arma-3-Life---Bracelet-System.svg?style=for-the-badge
[stars-url]: https://github.com/YoanFromWish/Arma-3-Life---Bracelet-System/stargazers
[issues-shield]: https://img.shields.io/github/issues/YoanFromWish/Arma-3-Life---Bracelet-System.svg?style=for-the-badge
[issues-url]: https://github.com/YoanFromWish/Arma-3-Life---Bracelet-System/issues
[discord]: https://img.shields.io/badge/discord-Yoan%231000-green
[steam]: https://img.shields.io/badge/steam-186072502-green
