# Getting Ready # {#getting-ready}

## Install Rosetta Workbench ## {#install-rosetta-workbench}

### Install Locally ### {#install-locally}

1. Download the latest release of the Rosetta Workbench archive that matches your OS from [oml-rosetta](https://github.com/opencaesar/oml-rosetta/releases/latest).

    <img src="assets/img/Rosetta-Download.png" width="100%" style="border:1px groove black;"/>

1. Unzip the archive to some folder on your local drive to get the Rosetta app.
    
    Note: If you're on Mac, run this command in terminal to get around the issue that the app is not signed.

     ```javascript
      $xattr -cr <path/to/Rosetta.app>
     ```

1. Navigate to the Rosetta app icon and double click to run it.

    <img src="assets/img/splash.bmp" width="100%"/>

1. When prompted to choose a workspace, create a new one in your local file system.

    <img src="assets/img/Rosetta-Launcher.png" width="100%"/>

### Install from Docker Image ### {#install-from-docker-image}

Note: TBD

## Run Rosetta Workbench ## {#run-rosetta-workbench}

1. Once Rosetta opens with the workspace, switch to the Modeling Perspective.

   <video width="100%" style="border:1px groove black;" controls>
     <source src="assets/mov/Switch-to-Modeling-Perspective.mov"/>
   </video>

1. Once the Modeling Perspective opens, show some extra views.

   <video width="100%" style="border:1px groove black;" controls>
     <source src="assets/mov/Show-Views.mov"/>
   </video>

1. This is how the Modeling Perspective should look like now.

   <img src="assets/img/Final-Modeling-Perspective.png" width="100%"/>

    Notice the following components of the Modeling Perspective above:

    1. <dfn>**Model Explorer view**</dfn> (top-left): shows your project files hierarchy
    1. <dfn>**Properties view**</dfn> (bottom-right): shows detailed propery sheet of the selection
    1. <dfn>**Problems view**</dfn> (bottom-right): shows problems (errors, warnings) with your projects
    1. <dfn>**Gradle Task view**</dfn> (bottom-right): shows the list of Gradle tasks in your projects
    1. <dfn>**Gradle Executions view**</dfn> (bottom-right): shows the details of execution of Gradle tasks
    1. <dfn>**Console view**</dfn> (bottom-right): shows messages printed by gradle tasks
    1. <dfn>**Editors**</dfn> (top-right): this area shows the open editors (if any)
    1. <dfn>**Outline view**</dfn>  (bottom-left): shows the outline of content in the active editor

    1. Turn on the Show line number preference by navigating to the Preferences dialog in the main menu bar (on a Mac, you will find it under the `Rosetta` menu; on Windows, you will find it under the `Windows` menu).

       <video width="100%" style="border:1px groove black;" controls>
         <source src="assets/mov/Enable-Line-Numbers.mov"/>
        </video>
