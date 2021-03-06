---
title       : "Advances in CT imaging processing and application"
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
}
</style>








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

## Stroke Trial Data I'm using 

* Intracerebral (bleeds mainly in tissue, <strong>ICH</strong>) or Intraventricular (bleeds into ventricles, <strong>IVH</strong>) Hemorrhage trials

* Minimally Invasive Surgery plus rt-PA for ICH Evacuation (<strong>MISTIE</strong>) 

<img src="RIP_SlideDeck_2013Oct28-figure/MISTIE3-LOGO.png" style="width:200px; height:100px; display: block; margin: auto;" alt="MISTIE LOGO">

* http://braininjuryoutcomes.com/mistie-about

---



## CT is NOT MRI (specifically not T1/T2)
<br>
<br>

<!-- html table generated in R 3.1.1 by xtable 1.7-4 package -->
<!-- Mon Nov 10 14:08:58 2014 -->
<table border=1>
<tr> <th>  </th> <th> CT </th> <th> MRI </th>  </tr>
  <tr> <td align="right"> Domain </td> <td> Diagnostic </td> <td> Diagnostic/Research </td> </tr>
  <tr> <td align="right"> Units </td> <td> Houndsfield Units </td> <td> Arbitrary </td> </tr>
  <tr> <td align="right"> Template </td> <td> One exists </td> <td> MNI Standard </td> </tr>
  <tr> <td align="right"> Measures </td> <td> Measures humans/rooms/beds </td> <td> Measures Humans </td> </tr>
  <tr> <td align="right"> Methods </td> <td> ? </td> <td> Many </td> </tr>
   </table>

--- &twocol w1:50% w2:50%

## CT Scan Characteristics

*** {name: left}

<img src="figure/Original_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

*** {name: right}

* Data are in Hounsfield Units (HU), which are "standardized"
* Bone – high intensity (1000 HU)
* Air – low intensity (-1000 HU)
* Water - 0 HU
* Tissue ≈ 0 - 100 HU

---

## Neuroimaging Data - voxels = 3D pixels

<img src="RIP_SlideDeck_2013Oct28-figure/clear_zoom.png" height=308 width=600 alt="Data structure", style="float:left;">

<img src="RIP_SlideDeck_2013Oct28-figure/movie_final.gif" style="float:right;" height=350 width=350 alt="Spinning floating brain">

---



## Problem: Human + Room + FOV

All "objects" captured

<img src="RIP_SlideDeck_2013Oct28-figure/the_room.png" style="width:100%; display: block; margin: auto;" alt="The room">


--- &twocol w1:50% w2:50%

## CT Skull Stripping: Goal 

*** {name: left}

Want to go from this
<img src="figure/Original_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

*** {name: right}
To This:
<img src="figure/SS_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

--- &twocol w1:50% w2:50%

## CT Skull Stripping: Step 1 - Threshold

*** {name: left}

Threshold 0- 100 HU:
<img src="figure/Original_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

*** {name: right}
Result:
<img src="figure/Thresh_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

--- &twocol w1:50% w2:50%

## CT Skull Stripping: Step 2 - Smooth

*** {name: left}

Smooth Image with 1mm Gaussian
<img src="figure/Thresh_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

*** {name: right}
Result:
<img src="figure/Smooth_Thresh_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

--- &twocol w1:50% w2:50%

## CT Skull Stripping: Step 3 - Run BET

*** {name: left}

Run BET (Brain Extraction Tool) from FSL:
<img src="figure/Smooth_Thresh_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

*** {name: right}
Result (Skull Stripped Image):
<img src="figure/SS_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

--- &twocol w1:50% w2:50% bg:#d3d3d3


## 22 Scans: manual vs automatic skull stripping
 
*** {name: left}

<img src="figure/Unsmoothed_Figure2.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

*** {name: right}
<img src="figure/Smoothed_Figure2.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

--- &twocol w1:50% w2:50% bg:#d3d3d3

## Validation: Choosing one pipeline to rule them all
 
*** {name: left}

Note change of y-axis
<img src="figure/Smoothed_Figure2_2.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

*** {name: right}
Sensitivity/Specificity
<img src="figure/Smoothed_Figure2_Sens.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

--- &twocol w1:50% w2:50%

## Validation: Smoothing Matters
 
*** {name: left}

<img src="figure/101-307_20061110_1638_CT_5_RM_Head_SS_0.01_nopresmooth_Mask.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

*** {name: right}
<img src="figure/101-307_20061110_1638_CT_5_RM_Head_SS_0.01_Mask.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

--- 

## "But that was only 20 scans"

1062 images from 133 patients, excluding 115 scans for craniotomy or skull stripping failure (9.8%).  Intraclass correlation estimate: 0.93, (95%CI : 0.91, 0.95). 

<img src="figure/Intraclass_Correlation_no_crani_check_day10_black.png" style="width:45%;  display: block; margin: auto;" alt="MISTIE LOGO">

--- &twocol w1:50% w2:50%


## What about those "failures"

<img src="figure/SS_Fail.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

--- 

## Code to do this

* R code: http://bit.ly/CTBET_RCODE
  * Based on fslr - R package to interface with FSL
  * Paper submitted
* bash code: http://bit.ly/CTBET_BASH

---

## ICH Prediction - data

* ICH are manually traced (**gold standard**)

<img src="figure/SS_Image_PrePredict_ROI.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">

---

## ICH Prediction - data

* ICH are manually traced (**gold standard**)
  * Time-consuming
  * Within and across-rater variability
* Can't do for large databases
  * Important for some processes, such as image registration

---


## **Primary Intracerebral Hemorrhage Prediction Employing Regression and Features Extracted from CT (PItcHPERFECT)** 

* Creating predictor variables:
  * Raw intensity
  * Z-scores in all 3 planes with only brain image (skull stripped)
  * Indicator if intensity **$\geq 40$** (established threshold) & $\leq 80$ HU
  * Local moments (mean, sd, skew, kurtosis)
  * Large smoothers
* Run a **logistic regression** with these
* Model built on 10 subjects

---


## Example Output: Skull Stripped Image
 
<img src="figure/SS_Image_PrePredict.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">

---

## Example Output: Manual Segmentation
 
<img src="figure/SS_Image_PrePredict_ROI.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">

---

## Example Output: Automatic Segmentation
 
<img src="figure/SS_Image_PrePredict_Auto.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">

---

## Prediction Comparison
 
<img src="figure/Prediction_Figure.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">

---

## Prediction Result: Population
 
<img src="figure/Modeling_Training_AUC_Rigid_sinc_zval2_Final.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">

---

## Conclusions and Extensions
 
* Skull stripping can be done
  * Important in many analyses (e.g. image registration)
  * May use intracranial volume to standardize ICH volume


---

## Conclusions and Extensions
 
* Skull stripping can be done
  * Important in many analyses (e.g. image registration)
  * May use intracranial volume to standardize ICH volume
* ICH Segmentation has high specificity
  * Good for Localization
  * OK for volume estimates
  * Good enough for adaptive randomization

---


## Conclusions and Extensions
 
* Skull stripping can be done
  * Important in many analyses (e.g. image registration)
  * May use intracranial volume to standardize ICH volume
* ICH Segmentation has high specificity
  * Good for Localization
  * OK for volume estimates
  * Good enough for adaptive randomization
* Many new problems open and available
  * Can use these methods for **large datasets**
* Use for other diseases with CT imaging

---


## Conclusions and Extensions

* Virtual International Stroke Trials Archive (VISTA)

> "The purpose is to create an international consortium of investigators and a repository of source MRI and CT images toward the objectives of standardization and validation of acquisition, analytic, and clinical research methods of image-based stroke research."

---

## Conclusions and Extensions
 
* Skull stripping can be done
  * Important in many analyses (e.g. image registration)
  * May use intracranial volume to standardize ICH volume
* ICH Segmentation has high specificity
  * Good for Localization
  * OK for volume estimates
  * Good enough for adaptive randomization
* Many new problems open and available
  * Can use these methods for large datasets
* Use for other diseases with CT imaging

--- &twocol w1:50% w2:50%

## Thanks

*** {name: left}

* Main Collaborators


<center><table>
<tr>
<td><img src="Hanley.jpg" style="width:150px; height:100px;" alt="Demog"></td>
<td><img src="Ciprian.jpg" style="width:100px; height:125px;" alt="Demog"></td>
</tr>
</table></center>


<center><table>
<tr>
<img src="Ullman.jpg" style="width:125px; height:125px;" alt="Demog">
<img src="Sweeney.jpg" style="width:125px; height:125px;" alt="Demog">
</tr> 
</table></center>




*** {name: right}

* Groups

<center><table>
<tr> <td><img src="SMART.png" style="width:200px; height:100px;" alt="Demog"></td> <td> <img src="BIOS.png" style="width:200px; height:100px;" alt="Demog"></td>
</tr>
</table></center>

* Funding

<center><table>
<tr> <td>T32AG000247</td><td> NIA </td></tr>
<tr> <td>RO1EB012547</td><td> NIBIB</td> </tr>
<tr> <td>R01NS046309, RO1NS060910, RO1NS085211, R01NS046309, U01NS080824 and U01NS062851</td> <td>NINDS</td> </tr>
<tr><td>RO1MH095836</td> <td> NIMH </td></tr>
</table></center>




---


## MISTIE Trial - Intracerebral Hemorrhage

* Number of patients: **N = 123**, number randomized: **N = 96**

* Inclusion criteria: age **18-80** years old 

<img src="RIP_SlideDeck_2013Oct28-figure/demog_table_short.png" style="width:500px; height:225px; display: block; margin: auto;" alt="Demog">

* **Over 65 years old**: 36 (37.5%), Surgical: 18 (33.3%), Medical: 18 (42.9%)

--- &twocol w1:50% w2:50%



## An "Ideal" MISTIE Patient: ICH Formed

<img src="RIP_SlideDeck_2013Oct28-figure/bloodclot.png" style="width:1000px; height:600px; display: block; margin: auto;" alt="Blood Clot">

---

## An "Ideal"" MISTIE Patient: Catheter Placed

<img src="RIP_SlideDeck_2013Oct28-figure/catheter.png" style="width:1000px; height:600px; display: block; margin: auto;" alt="Blood Clot">

---

## An "Ideal" MISTIE Patient: Clearance!

<img src="RIP_SlideDeck_2013Oct28-figure/clearance.png" style="width:1000px; height:600px; display: block; margin: auto;" alt="Blood Clot">



