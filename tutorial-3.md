# Tutorial 3: OML CI/CD # {#tutorial3}

Note: This tutorial builds on [Tutorial 2](#tutorial2). Please do that first before going further.

## Learning Objectives ## {#tutorial3-learning-objectives}
Managing an OML project in a git repository makes a lot of sense. First, OML models are textual files, which allows git to edit them natively. Second, all the OML IDEs already support git. Third, the VS Code extension for OML supports editing OML files in the cloud (and even in the browser in the future). Finally, the products of an OML project, typically documents, can be published online in git directly. Following the best practices of model-based development, such documents should be produced automatically from models through a rigorous and repeatable process. This is possible to achieve thanks to the process of Continuous Integration of Delivery (CI/CD) that is supported by most git repos.

This tutorial teaches how to set up a CI/CD pipeline for an OML project managed in a git repo. Users will learn the following:

1. How to setup an OML build script with Gradle.
1. How to generate default docs for an OML project.
1. How to create custom but consistent docs for an OML project with Jupyter Notebooks.
1. How to manage an OML project in a git repository and publish its docs to its web server.
1. How to setup a CI/CD pipeline in the gut repository to build and update the docs on each commit.

Note: the source files created in this tutorial are available for reference in this [repository](https://github.com/opencaesar/kepler16b-example), but we encourage the reader to recreate them by following the instructions below.

