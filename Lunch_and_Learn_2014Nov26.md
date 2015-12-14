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









## Goals: Project Replace RC

Create a CT image processing pipeline with (at least) these components:
* Brain Extraction
* ICH Localization
* ICH Segmentation
* Longitudinal Registration
* Population-based Statistics

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

## CT is NOT MRI (specifically not T1/T2)
<br>
<br>

<!-- html table generated in R 3.1.1 by xtable 1.7-4 package -->
<!-- Wed Dec 10 11:49:02 2014 -->
<table border=1>
<tr> <th>  </th> <th> CT </th> <th> MRI </th>  </tr>
  <tr> <td align="right"> Domain </td> <td> Diagnostic </td> <td> Diagnostic/Research </td> </tr>
  <tr> <td align="right"> Units </td> <td> Houndsfield Units </td> <td> Arbitrary </td> </tr>
  <tr> <td align="right"> Templates </td> <td> One Publicly Available </td> <td> MNI Standard (Many Exist) </td> </tr>
  <tr> <td align="right"> Measures </td> <td> Measures humans/rooms/beds </td> <td> Measures Humans </td> </tr>
  <tr> <td align="right"> Methods </td> <td> ? </td> <td> Many </td> </tr>
   </table>

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

Smooth with 1mm Gaussian
<img src="figure/Thresh_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

*** {name: right}
Result:
<img src="figure/Smooth_Thresh_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

--- &twocol w1:50% w2:50%

## CT Skull Stripping: Step 3 - Run BET

*** {name: left}

Run BET from FSL:
<img src="figure/Smooth_Thresh_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

*** {name: right}
Result (Skull Stripped Image):
<img src="figure/SS_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

--- &twocol w1:50% w2:50% bg:#d3d3d3

## 22 Scans: BET vs. Manual Segmentation (aka Natalie)

<img src="figure/Smoothed_Figure2_Sens.png" style="width:55%;  display: block; margin: auto;" alt="MISTIE LOGO">

---

## We ran on 1062 scans (N = 133): MISTIE/ICES

<img src="figure/Intraclass_Correlation_no_crani_check_day10_black.png" style="width:55%;  display: block; margin: auto;" alt="MISTIE LOGO">

--- 

## Give me some "statistics"

* Intraclass correlation estimate: 0.93, (95%CI : 0.91, 0.95).
* 115 scans for craniotomy or skull stripping failure (9.8%)

--- 




## ICH Prediction - data

* ICH are manually traced (**gold standard**)

<img src="figure/SS_Image_PrePredict_ROI.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">

---

## ICH Prediction - data

* ICH are manually traced (**gold standard**)
  * Time-consuming (Andrew looks tired)
  * Within and across-rater variability (think "interns" tracing)
* Can't do for large databases
  * Important for some processes, such as image registration
  * VISTA-ICH Images

--- 


## Proposed Solution

<font size="20" style='text-align:center;'><center>Primary Intracerebral Hemorrhage Prediction Employing Regression and Features Extracted from CT:</center></font>



<font size="40" style='text-align:center;color:black'><strong>PItcHPERFECT</strong></font>

---

## PItcHPERFECT

* Create predictor variables:
  * Raw intensity
  * Z-scores in all 3 planes with only brain image (skull stripped)
  * Z-score compared to a template image

What is a z-score:
  If $\mu$ is a mean, and $\sigma$ is a standard deviation, then a z-score is:

$$
z = \frac{x - \mu}{\sigma}
$$

---


## PItcHPERFECT

* Create predictor variables:
  * Raw intensity
  * Z-scores in all 3 planes with only brain image (skull stripped)
  * Z-score compared to a template image
  * Indicator if intensity **$\geq 40$** (established threshold) & $\leq 80$ HU
  * Local moments (mean, sd, skew, kurtosis)
  * Large smoothers

---

## PItcHPERFECT

* Run a **logistic regression** with these predictors
* Model built on 10 subjects
* All on **SKULL STRIPPED DATA**

---

## Example Output: Start with Skull Stripped Image
 
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

## Prediction Result: 51 "Validation" Patients
 
 
<img src="figure/Modeling_Test_AccPlot_Rigid_zval2.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">

---

## Prediction Result: 51 "Validation" Patients
 
 
<img src="figure/Modeling_Training_AUC_Rigid_zval2_Final.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">

---

## Prediction Result: 51 "Validation" Patients
 
 
<img src="figure/Modeling_Training_VolDiff_Rigid_zval2_Final.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">

---


## Conclusions and Extensions
 
* Skull stripping can be done
  * Important in many analyses (e.g. image registration)
  * May use intracranial volume to standardize ICH volume

---

## Conclusions and Extensions
 
* ICH Segmentation has high specificity
  * Good for Localization
  * OK for volume estimates
  * Good enough for adaptive randomization

---


## Conclusions and Extensions
 
* Many new problems open and available
  * Can use these methods for **large datasets**
* Use for other diseases with CT imaging

---


## Conclusions and Extensions

* Virtual International Stroke Trials Archive (VISTA)

> "The purpose is to create an international consortium of investigators and a repository of source MRI and CT images toward the objectives of standardization and validation of acquisition, analytic, and clinical research methods of image-based stroke research."

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



