# Tutorial 2: OML Patterns # {#tutorial2}

Note: If you have not already done so, please do [Tutorial 1](#tutorial1) first before doing this one since we assume your familiarity with the basics of OML.

## Learning Objectives ## {#tutorial2-learning-objectives}
This tutorial demonstrates the process of developing a methodology for capturing knowledge in a given business domain with OML. The methodology will be developed as a series of patterns, each of which repersents a small step in the methodology, and is encoded by some new vocabulary. As an example, we will develop a simple systems engineering methodology.

The tutorial also demonstrates describing knowledge using instances of those patterns and organizing them into modules that capture related concerns. As an example, we will describe a fanciful space mission called Kepler16b, which is an exoplanet orbiting a binary star system called Kepler16 .. approximately 245 light-years from Earth.

Note: the source files created in this tutorial are available for reference in this [repository](https://github.com/opencaesar/oml-tutorials/tree/master/tutorial1), but we encourage the reader to recreate them by following the instructions below.

## OML Project ##  {#tutorial2-oml-project}

1. In the [=Model Explorer view], right click and choose New -> OML Project.
1. Name the project `tutorial2`. Click Next.
1. 

## P1: Objective aggregates Objective ## {#tutorial2-p1}

**Pattern P1 Synopsis**

A systems engineering endeavor begins with *objectives* to be achieved. *Objectives* are not requirements; they are desires. They may be in conflict. They may not be achievable in principle. They may not be feasible. They may be related such that achieving one objective helps to achieve another. We call this relationship *aggregates*, which may be important for planning a campaign of pursuit. *Aggregates* is a general relationship, broader than *objectives*, but is homeomeric, meaning that parts and whole are of the same type. We say an *Objective* is an *AggregatedThing*, meaning it can aggregate or be aggregated in. We further say an *Objective* aggregates only *Objectives* and is aggregated in only *Objectives* (this is called a restriction in in ontologies).



## P2: Mission pursues Objective ## {#tutorial2-p2}

## P3: Mission deploys Component ## {#tutorial2-p3}

## P4: Component contains Component ## {#tutorial2-p4}

## P5: Component presents Interface ## {#tutorial2-p5}

## P6: Junction joins Interface ## {#tutorial2-p6}

## P7: Requirement specifies (Component presents Interface) ## {#tutorial2-p7}

## P8: Requirement refines Requirement ## {#tutorial2-p8}

## P9: Interface transfers (Flow or Item) ## {#tutorial2-p9}

## Summary ## {#tutorial2-summary}
