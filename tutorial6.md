# Tutorial 6: OML Federation # {#tutorial6}

Note: This tutorial builds on the skills learned in [Tutorial 2](#tutorial2). Please do that first before proceeding.

## Learning Objectives ## {#tutorial6-learning-objectives}

This tutorial illustrates the utilization of OML in a federated approach for modeling and analyzing systems. In this context, `federation` entails the distribution of a model across distinct projects, which may reside in different repositories, encompass various concerns, and be overseen by different authorities. Within this federated framework, these projects establish dependencies on one another to import their artifacts, typically in the form of archives or models and analyses. This strategic approach not only facilitates the clear demarcation of concerns by defining well-defined boundaries but also enhances collaborative efforts. It enables concurrent work processes and allows for synchronized planning, fostering efficient teamwork.

Furthermore, we will employ a compelling real-world scenario to highlight the concept of federation support. Our illustrative scenario revolves around a home security system. Initially, an acquiring organization designs the system at an abstract level using a specific methodology. Subsequently, distinct components of this architectural design are entrusted to various suppliers for implementation with tangible, concrete components. Finally, the acquiring organization orchestrates the integration of these concrete components, utilizing the established architecture, and conducts a comprehensive analysis of this integrated system.

Upon completing this tutorial, you will gain the following essential skills:

- Applying federation to distribute OML models across different projects (possibly in separate repositories) managed by different entities. 
- Establishing dependencies between projects to import other projects' artifacts, fostering modularity and collaboration. 
- Publishing artifacts from projects with semantic versions that communicate to downstream dependencies about the impact of change on those versions.

Note: Although the tutorial provides insights into leveraging federation for efficient modeling, collaboration, and system analysis in a representative project, it is not the intention of this tutorial to promote a particular federation strategy. This is a matter of methodology, which is an orthogonal concern.

Note: The source files created in this tutorial are available for reference in this [repository](https://github.com/opencaesar/homesecurity-example), but we encourage the reader to recreate them by following the instructions below.

## Summary ## {#tutorial6-summary}

T/A