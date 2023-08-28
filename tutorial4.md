# Tutorial 4: OML Reports # {#tutorial4}

Note: This tutorial builds on the project developed in [Tutorial 3](#tutorial3). Please do that first before proceeding.

## Learning Objectives ## {#tutorial4-learning-objectives}

Modeling a system with OML would not be useful without the ability to analyze the model and share the analysis results with the project's stakeholders. In [Tutorial 2](#tutorial2), we learned how an OML model can be analyzed with SPARQL queries, and the results visualized, but we did not see how those visualizations were created. Moreover, in [Tutorial 3](#tutorial3), we learned how a (CI or Continuous Integration) pipeline can run the build task automatically, but we did not see how it can also automate the analysis of the project and the deployment of the results to the project's stakeholder (CD or Continuous Deployment).

By the end of this tutorial, readers will be able to:

1. Utilize Jupyter Notebook to create an interactive and data-rich report based on SPARQL query results.
2. Generate canonical OML documentation (OmlDoc) that can be cross referenced from the report.
3. Evolve a CI pipeline to be a CI/CD pipeline that runs analysis and deploys its results.

Note: The source files created in this tutorial are available for reference in this [repository](https://github.com/opencaesar/kepler16b-example), but we encourage the reader to recreate them by following the instructions below.

## Install Jupyter Notebook ## {#tutorial4-install-jupyter-notebook}

Jupyter is an open-source project that lets you easily combine Markdown text and executable Python source code on one canvas called a notebook. Many editors support working with Jupyter Notebooks; however, in this tutorial we will use VS Code.

1. If you don't already have Python with the Jupyter package, follow these [instructions](https://noteable.io/jupyter-notebook/install-jupyter-notebook/).

2. If you don't already have VS Code with Jupyter Notebook extension, follow these [instructions](https://code.visualstudio.com/download).

3. Run VS Code client and if the Terminal window is not already visible, open it by selecting View -> Terminal from the main menu.

Note: for best experience in this tutorial, switch VS Code to the `Light Modern` [color theme](https://code.visualstudio.com/docs/getstarted/themes).

		<img src="assets/tutorial4/VS-Code.png" width="100%" style="border:1px groove black;"/>

4. Select File -> Open Folder .. and select the folder of the project you created in [Tutorial 2](#tutorial2).

	<img src="assets/tutorial4/Open-Folder.png" width="100%" style="border:1px groove black;"/>

Note: Assuming you had also done `Tutorial 3`, this folder should be a clone of a git repository called `kepler16b-example`.`

## Run SPARQL Queries ## {#tutorial4-run-sparql-queries}

Recall from [Tutorial 2](#tutorial2) that an OML project can create SPARQL query files in some path and store results in some other path. The code below is an excerpt from the project's `./build.gradle` file showing a task called `owlQuery` that runs the SPARQL queries.

```groovy
task owlQuery(type:io.opencaesar.owl.query.OwlQueryTask, group:"oml", dependsOn: owlLoad) {
    inputs.files(owlLoad.inputs.files) // rerun when the dataset changes
    endpointURL = "http://localhost:3030/$dataset".toString()
    queryPath = file('src/sparql')
    resultPath = file('build/results')
    format = 'json'
}
```

1. In the Terminal view, run the following command, then inspect the json files in the `build/results` folder.

```shell
$ ./gradlew owlQuery

> Task :startFuseki
Fuseki server is already running with pid=56106

BUILD SUCCESSFUL in 6s
6 actionable tasks: 3 executed, 3 up-to-date
```

	<img src="assets/tutorial4/Run-Qwl-Query.png" width="100%" style="border:1px groove black;"/>

2. Open the `.github/workflows/ci.yml` file (created in [Tutorial 3](#tutorial3)) and insert the following step right before the `Upload`` one:

```yaml
    - name: Query
      run: ./gradlew owlQuery
```

	<img src="assets/tutorial4/Add-Owl-Query-To-CI.png" width="100%" style="border:1px groove black;"/>

3. Click on the Source Control tab on the left; you should find the `ci.yml` file listed. Type a commit message and select `Commit & Push` button. Answer `Yes` in the next dialog box. Wait for the operation to finish.

4. In a web browser, navigate to the `kepler16b-example` Github repo you created in [Tutorial 3](#tutorial3). Click on the Actons tab. Wait until the CI workflow succeeds.

	<img src="assets/tutorial4/Owl-Query-CI-Succeeds.png" width="100%" style="border:1px groove black;"/>

## Generate OML Doc ## {#tutorial4-generate-oml-doc}

In this step, we will add a new task of type `OwlDoc` to the `build.gradle` file. This tool generates default documentation for an Oml dataset. We will also add it to the CI script.

Not: An [OwlDoc](https://github.com/opencaesar/owl-tools/tree/master/owl-doc) task requires the Oml dataset to be converted first to Owl, which we get when we chain it to an [Oml2Owl](https://github.com/opencaesar/owl-adapter/blob/master/oml2owl/README.md) task.

1. In VS Code, wwitch to the Explorer tab on the left. Open the `build.gradle` file. Find the `buildscript.dependencies` clause. Add a new dependency on the `owl-doc-gradle` tool on the top:

```groovy
  classpath 'io.opencaesar.owl:owl-doc-gradle:2.+'
```

	<img src="assets/tutorial4/Add-Owl-Doc-Dependency.png" width="100%" style="border:1px groove black;"/>

2. In the `build.gradle` file, insert the following `generateDocs` task right before the `startFuseki` task. Save.

```groovy
/*
 * A task to generate documentation for the OWL catalog
 * @seeAlso https://github.com/opencaesar/owl-tools/blob/master/owl-doc/README.md
 */
task generateDocs(type: io.opencaesar.owl.doc.OwlDocTask, dependsOn: owlReason) {
    // OWL catalog
    inputCatalogPath = file('build/owl/catalog.xml')
    // OWL catalog title
    inputCatalogTitle = 'Kepler16b'
    // OWL Ontology Iris
    inputOntologyIris = [ "$rootIri/classes", "$rootIri/properties",  "$rootIri/individuals" ]
    // Output folder
    outputFolderPath = file('build/web/doc')
    // Output case sensitivie path
    outputCaseSensitive = org.gradle.internal.os.OperatingSystem.current().isLinux()
}
```
	<img src="assets/tutorial4/Add-Owl-Doc-Task.png" width="100%" style="border:1px groove black;"/>

3. In Terminal, run `./gradlew generateDocs`. Inspect the `build/web/doc` folder. You will find the generatd HTML documentation. 

	<img src="assets/tutorial4/Run-Owl-Doc.png" width="100%" style="border:1px groove black;"/>

4. Open the file `build/web/doc/index.html` in a web browser, and browse through the generated documentation.

	<img src="assets/tutorial4/Browse-Generated-Owl-Doc.png" width="100%" style="border:1px groove black;"/>

5. Open the `.github/workflows/ci.yml` file and add the following step right after the `Upload` step.

```yaml
    - name: Generate Docs
      run: ./gradlew generateDocs
```

	<img src="assets/tutorial4/Add-Owl-Doc-To-CI.png" width="100%" style="border:1px groove black;"/>

6. Using the Source Control tab, commit and push both `build.gradle` and `ci.yml` files. Check that the CI workflow succeeded on the repository's Actions tab.

## Setup Github Pages ## {#tutorial4-setup-github-pages}

In the next few sections, we will create a Jupyter Notebook, convert it to HTML, and publish (deploy) it. Before we can do that, we need to setup a web server to deploy it to. 

A convenient choice here is to deploy to the repository's [Github Pages](https://pages.github.com/). This makes the page accessible at the address `http://OWNER.github.io/kepler16b-example/` (where OWNER is the repository's owner on github).

- In your web browser, navigate to the repo's URL, click on the Settings tab, then on the Pages tab (on the right).

- In the `Build and Deployment` section, click on the `Source` combo box, and select `Github Actions`.

	<img src="assets/tutorial4/Setup-Github-Pages.png" width="100%" style="border:1px groove black;"/>

  Note: This choice means that the content of Pages will be published by a Github Actions workflow. As we will see below, this will allow the repository's CI script to publish it,

## Create Jupyter Notebook ## {#tutorial4-create-jupyter-notebook}

In this step, we will create a simple Jupyter Notebook in the project and setup the CI workflow to publish it to Github Pages.

1. In VS Code Explorer, right click on the `src` folder, select New Folder, and call it `ipynb`.

2. Right click on the `ipynb` folder, select New File, and call it `index.ipynb`. This opens a Jupiter Notebook editor with a single empty cell.

	<img src="assets/tutorial4/Setup-Github-Pages.png" width="100%" style="border:1px groove black;"/>

3. In the top right cornder of the editor, click on the `Select Kernel` button, select `Python Environments`, and select one of the available Python 3 environments. Notice that now the name of the selected kernel shows up in the top right corner.

4. Hover over the first empty cell in the editor. A toolbar appears with a trash can. Click on the trash can to delete the cell.

5. In place of the cell, you should now see two buttons, one says `Python` and the other says `Markdown`. Click on the latter. This adds a Markdown cell as the first cell.

6. In the cell, type the following text, then click on the `✓` (tick) icon in the cell's toolbar to apply. The editor should now look like the picture below.

```
# Kepler16b
The Kepler16b project is developing a hypothetical mission to an exoplanet that is millions of light years away.
```

	<img src="assets/tutorial4/Add-Notebook-Title.png" width="100%" style="border:1px groove black;"/>

Before we go further, let us setup the CI script to publish this simple Notebook. This involves setting up a Python environment, installing some depednencies, running a couple of python tools to execute the notebook and convert it to HTML, then finally deploying that HTML to Github Pages.

7. In VS Code Explorer, right click on the `ipynb` folder, choose New File, and name it `requirements.txt`. Insert the following text as its contents and save.

```python
ipykernel
nbconvert
pandas
plantuml
igraph
cairocffi
```
Note: A `requirements.txt` file is a typical Python mechanism to declare dependencies. In this case, the first two dependencies are the minimum required to enable executing and converting the notebook to HTML. The rest of the dependencies are libraries that will be used in the steps below to visualize the analysis results.

	<img src="assets/tutorial4/Add-Requirements.png" width="100%" style="border:1px groove black;"/>

8. Open the `.github/workflows/ci.yml` file and add the following step right after the `Generate Docs` step.

```yaml
    - name: Set up Python 3
      uses: actions/setup-python@v4
      with: 
        python-version: '3.10'
    - name: Install Requirements
      run: pip install -r src/ipynb/requirements.txt
    - name: Run Notebook
      run: python -m nbconvert --execute --to notebook --no-input src/ipynb/index.ipynb --output-dir='build/web' 
    - name: Convert Notebook to HTML
      run: python -m nbconvert --to html --no-input build/web/index.ipynb
    - name: Publish
      uses: actions/upload-pages-artifact@v1
      with:
        path: build/web
        
  deploy:
    needs: build
    permissions:
      pages: write
      id-token: write
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Deploy
        id: deployment
        uses: actions/deploy-pages@v1
```
	<img src="assets/tutorial4/Add-Owl-Doc-To-CI.png" width="100%" style="border:1px groove black;"/>

Note: The first set of steps are added to the `build` job. They setup a Python 3 environment, install the dependencies, run the notebook, convert it to HTML in the `build/web` folder, then upload the folder as a Pages artifact. Then, a new job named `deploy` is added. This job runs after `build` is done and deploys the Pages artifact to the web server.

9. Using the Source Control tab, commit and push all the three files `index.ipynb`, `requirements.txt` and `ci.yml`. Check that the CI workflow succeeded on the repository's Actions tab. You should see the following page in your browser:

	<img src="assets/tutorial4/First-Noetbook-CI-Build.png" width="100%" style="border:1px groove black;"/>

10. Click on the hyperlink in the `deploy` box to navigate the deployed Github Pages of the repository. This should open up a new page that looks like this:



## P1: Reference Documentation ## {#tutorial4-reference-documentation}

TBD

## P2: Visualize Missions ## {#tutorial4-visualize-missions}

TBD

## P3: Visualize Components ## {#tutorial4-visualize-components}

TBD

## P4: Visualize Mass Rollup ## {#tutorial4-visualize-mass-rollup}

TDB

## Experiment With Changes ## {#tutorial4-experiment-with-changes}

TBD

## Summary ## {#tutorial4-summary}

TBD