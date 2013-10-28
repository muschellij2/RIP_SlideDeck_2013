---
title       : Clot Volume Prediction in Stroke
subtitle    : John Muschelli
author      : "@StrictlyStat (github: muschellij2)" 
job         : Johns Hopkins Bloomberg School of Public Health
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : prettify  # {highlight.js, prettify, highlight}
hitheme     : hemisu-light      # 
widgets     : mathjax            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
--- .cover #Cover

<style>
em {
  font-style: italic
}

strong {
  font-weight: bold;
  color: black;
}
</style>









## Research...in progress

Outline of Talk
<img src="RIP_SlideDeck_2013Oct28-figure/zombie_brains.jpg" style="width:300px; height:300px; float: right" alt="ZOmbies" >
* Stroke is bad, and the elderly population is affected
* Bigger stroke volumes are worse
* Estimation of the size of a stroke is important
* Automatic estimation of stroke size seems possible
* CT scans are NOT MRI scans
* Methods for CT image analysis

<font size="2">Photo from [http://zombieshootersassociation.com/wp-content/uploads/2011/01/loRes-zombie1.jpg](http://zombieshootersassociation.com/wp-content/uploads/2011/01/loRes-zombie1.jpg)</font>

---

## Strokes are bad

From AHA Stroke statistics 2013 report$^1$:

* Of all strokes, 87% are ischemic and **10%** are intracerebral hemorrhagic strokes, whereas 3% are subarachnoid hemorrhage strokes (GCNKSS, NINDS, 1999).

* Each year, $\approx$ **795,000** people experience a new or recurrent stroke, 610,000 new, 185,000 recurrent.

* On average, **every 40 seconds**, someone in the United States has a stroke (90 strokes/hour)

* Intracerebral hemorrhage has a **high mortality rate**; **38%** survive the first year$^2$

<font size="2">$^1$ Go, Alan S., et al. "Heart disease and stroke statistics—2013 update a report from the American Heart Association." Circulation 127.1 (2013): e6-e245.</font><br>
<font size="2">$^2$ Qureshi, Adnan I., et al. "Spontaneous intracerebral hemorrhage." New England Journal of Medicine 344.19 (2001): 1450-1460.</font>

---

## Stokes affect the elderly

From Italian Longitudinal Study of Aging (ILSA) (**N =5,632** individuals aged 65-84)
* Incidence for first-ever stroke was **9.51** (95% CI: 7.75-11.27) per 1,000 person years and **12.99** (95% CI: 10.99-14.98) including recurrent stroke (total incidence). 

* Crude **mortality was 49.2% among first stroke patients** and 15% among persons without stroke$^3$

<font size="2">$^3$ Di Carlo, Antonio, et al. "Stroke in an elderly population: incidence and impact on survival and daily function." Cerebrovascular Diseases 16.2 (2003): 141-150.</font>

---

## Stroke Trials I'm involved with

* Intracerebral (bleeds mainly in tissue, <strong>ICH</strong>) or Intraventricular (bleeds into ventricles, <strong>IVH</strong>) Hemorrhage trials

* Minimally Invasive Surgery plus rt-PA for ICH Evacuation (<strong>MISTIE</strong>) 

<img src="RIP_SlideDeck_2013Oct28-figure/MISTIE3-LOGO.png" style="width:200px; height:100px; display: block; margin: auto;" alt="MISTIE LOGO">

* Clot Lysis: Evaluating Accelerated Resolution of Intraventricular Hemorrhage Phase III (<strong>CLEAR III</strong>)

<img src="RIP_SlideDeck_2013Oct28-figure/clear3_logo.png" style="width:125px; height:100px; display: block; margin: auto;" alt="CLEAR LOGO" >


* http://braininjuryoutcomes.com/mistie-about


---


## MISTIE Trial - Intracerebral Hemorrhage

* Number of patients: **N = 123**, number randomized: **N = 96**

* Inclusion criteria: age **18-80** years old 

<img src="RIP_SlideDeck_2013Oct28-figure/demog_table_short.png" style="width:500px; height:225px; display: block; margin: auto;" alt="Demog">


* MIS group received doses of recombinant-tissue Plasminogen Activator (**rtPA**) - clot buster

* **Over 65 years old**: 36 (37.5%), Surgical: 18 (33.3%), Medical: 18 (42.9%)

---


## Age Distribution
<img src="figure/ggage.png" title="plot of chunk ggage" alt="plot of chunk ggage" style="display: block; margin: auto;" />


---







## An "Ideal" MISTIE Patient: Blood Clot Formed

<img src="RIP_SlideDeck_2013Oct28-figure/bloodclot.png" style="width:1000px; height:600px; display: block; margin: auto;" alt="Blood Clot">

---

## An "Ideal"" MISTIE Patient: Catheter Placed

<img src="RIP_SlideDeck_2013Oct28-figure/catheter.png" style="width:1000px; height:600px; display: block; margin: auto;" alt="Blood Clot">

---

## An "Ideal" MISTIE Patient: Clearance!

<img src="RIP_SlideDeck_2013Oct28-figure/clearance.png" style="width:1000px; height:600px; display: block; margin: auto;" alt="Blood Clot">

---


## Clot trajectories: Volume

<img src="RIP_SlideDeck_2013Oct28-figure/ICH_vol_plot.png" style="width:500px; height:590px; display: block; margin: auto;" alt="Blood Clot">

---

## Clot trajectories: Volume Difference
<font size="2">Method based on: Crainiceanu, Ciprian M., et al. "Bootstrap‐based inference on the difference in the means of two correlated functional processes." Statistics in Medicine 31.26 (2012): 3223-3240.</font>
<img src="RIP_SlideDeck_2013Oct28-figure/ICH_vol_diff.png" style="width:500px; height:500px; display: block; margin: auto;" alt="Blood Clot Difference">

---

## Clot Trajectories: % of Baseline

<img src="RIP_SlideDeck_2013Oct28-figure/ICH_perc_plot.png" style="width:500px; height:500px; display: block; margin: auto;" alt="Blood Clot">

---

## Clot trajectories: % Difference

<img src="RIP_SlideDeck_2013Oct28-figure/ICH_perc_diff.png" style="width:500px; height:500px; display: block; margin: auto;" alt="Blood Clot Difference">

---

## Outcome - modified Rankin Scale

* Outcome - modified Rankin Score (**mRS**) - a functional measure of mobility and $\text{independence}^{4,5,6}$.  Good outcome: $\leq 3$ at 180 Day followup
<img src="RIP_SlideDeck_2013Oct28-figure/mRS.png" style="width:660px; height:390px; display: block; margin: auto;" alt="Rankin_Scale">
<font size="2">$^4$ Rankin J. “Cerebral vascular accidents in patients over the age of 60.” Scott Med J 1957;2:200-15</font><br>
<font size="2">$^5$ Bonita R, Beaglehole R. “Modification of Rankin Scale: Recovery of motor function after stroke.” Stroke 1988 Dec;19(12):1497-1500</font><br>
<font size="2">$^6$ Scale from [http://www.strokecenter.org/wp-content/uploads/2011/08/modified_rankin.pdf](http://www.strokecenter.org/wp-content/uploads/2011/08/modified_rankin.pdf)</font>

---




## Does Blood matter?

<img src="figure/plot_loess.png" title="plot of chunk plot_loess" alt="plot of chunk plot_loess" style="display: block; margin: auto;" />

---

## Does Blood matter?

<img src="RIP_SlideDeck_2013Oct28-figure/Outcome_Model.png" style="width:800px; height:200px; display: block; margin: auto;" alt="Rankin_Scale">
* Adjusted model seems to indicate that lower end of treatment volume is has higher likelihood of mRS $\leq 3$.
* Not the primary hypothesis for this trial (was a phase II).
* Investigating on a Phase III trial.

<font size="2">CI presentation based on: Louis, Thomas A., and Scott L. Zeger. "Effective communication of standard errors and confidence intervals." (2007).</font>

---



## Neuroimaging Data - voxels = 3D pixels

<img src="RIP_SlideDeck_2013Oct28-figure/clear_zoom.png" height=308 width=600 alt="Data structure", style="float:left;">

<img src="RIP_SlideDeck_2013Oct28-figure/movie_final.gif" style="float:right;" height=350 width=350 alt="Spinning floating brain">

---

## CT is NOT MRI (specifically not T1/T2)

<!-- html table generated in R 3.0.1 by xtable 1.7-1 package -->
<!-- Mon Oct 28 13:55:06 2013 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> CT </TH> <TH> MRI </TH>  </TR>
  <TR> <TD align="right"> Domain </TD> <TD> Diagnostic </TD> <TD> Diagnostic/Research </TD> </TR>
  <TR> <TD align="right"> Units </TD> <TD> Houndsfield Units </TD> <TD> Arbitrary </TD> </TR>
  <TR> <TD align="right"> Template </TD> <TD> One exists </TD> <TD> MNI Standard </TD> </TR>
  <TR> <TD align="right"> Measures </TD> <TD> Measures humans/rooms/beds </TD> <TD> Measures Humans </TD> </TR>
  <TR> <TD align="right"> Methods </TD> <TD> ? </TD> <TD> Many </TD> </TR>
   </TABLE>


---

## Skull Stripping

* Many applications we want to work with brain only 
* Skull, and other objects are picked up by CT
  * Biological - nasal cavity, eyes
  * Not biological - cushions, the table
* Try standard MRI software (with some modifications)

---

## Human + Room

<img src="RIP_SlideDeck_2013Oct28-figure/the_room.png" style="width:1000px; height:600px; display: block; margin: auto;" alt="Blood Clot">

---

## I just want your brain!

* 19 Scans manually segmented and automatically using BET

<img src="RIP_SlideDeck_2013Oct28-figure/Original.png" style="width:550px; height:550px; display: block; margin: auto;" alt="ZOmbies" >

---

## I just want your brain!

* 19 Scans manually segmented and automatically using BET

<img src="RIP_SlideDeck_2013Oct28-figure/Skull_Stripped.png" style="width:550px; height:550px; display: block; margin: auto;" alt="ZOmbies" >

---

## Results from 19 Scans

<img src="RIP_SlideDeck_2013Oct28-figure/box1.png" style="width:550px; height:550px; display: block; margin: auto;" alt="Zombies" >

---


## Results from 19 Scans

<img src="RIP_SlideDeck_2013Oct28-figure/box2.png" style="width:550px; height:550px; display: block; margin: auto;" alt="ZOmbies" >

---


## Clot Prediction - data

* 6 scans (pilot run) from 6 different subjects
* Blood clots are manually segmented
  * Think of tracing a lot of pictures with a mouse
* Skull Stripped images are used to limit only to brain tissue

---


## Predicting Clot

* Run a model (logistic regression) with 10% of the brain with covariates:
  * Raw intensity
  * Z-scores in all 3 planes with whole image
  * Z-scores in all 3 planes with only brain image
* Predict on the 90% not fit using the model
* One hold out subject completely

---

## Results

<img src="RIP_SlideDeck_2013Oct28-figure/All_Images_NoDropScan.png" style="width:550px; height:550px; display: block; margin: auto;" alt="ZOmbies">

---

## Individual Results

<img src="RIP_SlideDeck_2013Oct28-figure/All_Images_PerScan_ROC.png" style="width:550px; height:550px; display: block; margin: auto;" alt="ZOmbies">

---


## Conclusions

* Strokes are bad - treatment seems to help
* Volume of blood matters
    * It takes time to estimate
    * Has potential to be done automatically
    * Is related to outcome
* Methods development for CT imaging is open
    * Not as clean as MRI - but not uncommon for diagnostic tools

---



## Thanks

* Dan Hanley and BIOS
* Ciprian Crainiceanu
* Elizabeth Sweeney
* Brian Caffo
* 

---


## Extra Slides

---



<img src="RIP_SlideDeck_2013Oct28-figure/demog_table.png" style="width:400px; height:600px; display: block; margin: auto;" alt="Demog">

---



## Ventricular System


<img src="RIP_SlideDeck_2013Oct28-figure/Blausen_0896_Ventricles_Brain.png" style="width:660px; height:390px; display: block; margin: auto;" alt="Rankin_Scale">
<font size="2">Figure from [http://en.wikipedia.org/wiki/Ventricular_system](http://en.wikipedia.org/wiki/Ventricular_system)</font><br>

---

## An Example CLEAR Patient

<img src="RIP_SlideDeck_2013Oct28-figure/clearpt.png" style="width:1000px; height:600px; display: block; margin: auto;" alt="Blood Clot">

---
