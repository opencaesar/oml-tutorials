<h2 id="getting-ready" class="no-num">Getting Ready</h2>

OML has a user-friendly [textual grammar](http://www.opencaesar.io/oml/#Language-Reference) that can be edited using a simple text editor. However, for extra support like wizards, syntax highlighting, live validation, and content-assist, a user can use one of the OML editors provided by openCAESAR project. One such editor, called [OML Rosetta](https://github.com/opencaesar/oml-rosetta), is a plugin to the Eclipse IDE. Another editor, called [OML Luxor](https://github.com/opencaesar/oml-luxor), is an extension to the VSCode IDE that can be used in a VSCode desktop client or browser-based client (like [Gitpod](https://www.gitpod.io/)). In this tutorial, we will demonstrate using the OML Rosetta editor, but the reader can follow using any other editor. 

Note: that OML also has a UML-like [graphical notation](http://www.opencaesar.io/oml/#Graphical-BNF). Although we will not demonstrate how to create them, we will sometimes show OML diagrams to help visualize the models. 

Furthermore, OML projects created by openCAESAR are Gradle projects that have OML analysis tools configured as Gradle tasks (in a `build.gradle` script). A user can choose to invoke such tools from a console/terminal session using the Gradle Wrapper CLI (e.g., `./gradlew <task>`). Alternatively, the supported OML editors mentioned above allow invoking those Gradle tasks using a UI. We will demonstrate invoking Gradle tasks from the UI in Eclipse, but the reader can choose to invoke them using the CLI (or another UI) instead.

## Install OML Rosetta ## {#install-oml-rosetta}

1. Download the latest release of OML Rosetta archive that matches your OS from [oml-rosetta](https://github.com/opencaesar/oml-rosetta/releases/latest).

    <img src="assets/tutorial0/Rosetta-Download.png" width="100%" style="border:1px groove black;"/>

1. Unzip the archive to some folder on your local drive to get the Rosetta app.
    
    Note: If you're on a Mac, run this command in the terminal to get around the issue that the app is not yet signed (a temporary issue).

     ```javascript
      $xattr -cr <path/to/Rosetta.app>
     ```

1. Navigate to the Rosetta app icon and double click to run it.

    <img src="assets/tutorial0/splash.bmp" width="100%"/>

1. When prompted to choose a workspace, create a new one in your local file system.

    <img src="assets/tutorial0/Rosetta-Launcher.png" width="100%"/>

## Run OML Rosetta ## {#run-oml-rosetta}

1. Once Rosetta opens with the workspace, switch to the Modeling Perspective.

   <video width="100%" style="border:1px groove black;" controls>
     <source src="assets/tutorial0/Switch-to-Modeling-Perspective.mov"/>
   </video>

1. Once the Modeling Perspective opens, make some extra views visible.

   <video width="100%" style="border:1px groove black;" controls>
     <source src="assets/tutorial0/Show-Views.mov"/>
   </video>

1. This is how the Modeling Perspective should look like now.

   <img src="assets/tutorial0/Final-Modeling-Perspective.png" width="100%"/>

    Notice the following components of the Modeling Perspective above:

    1. <dfn>**Model Explorer view**</dfn> (top-left): shows your project files hierarchy.
    1. <dfn>**Properties view**</dfn> (bottom-right): shows detailed property sheet of the selection.
    1. <dfn>**Problems view**</dfn> (bottom-right): shows problems (errors, warnings) with your projects.
    1. <dfn>**Gradle Task view**</dfn> (bottom-right): shows the list of Gradle tasks in your projects.
    1. <dfn>**Gradle Executions view**</dfn> (bottom-right): shows the details of execution of Gradle tasks.
    1. <dfn>**Console view**</dfn> (bottom-right): shows messages printed by Gradle tasks.
    1. <dfn>**Editors**</dfn> (top-right): this area shows the open editors (if any).
    1. <dfn>**Outline view**</dfn>  (bottom-left): shows the outline of content in the active editor.

    1. Turn on the Show line number preference by navigating to the Preferences dialog in the main menu bar (on a Mac, you will find it under the `Rosetta` menu; on Windows, you will find it under the `Windows` menu).

       <video width="100%" style="border:1px groove black;" controls>
         <source src="assets/tutorial0/Enable-Line-Numbers.mov"/>
        </video>