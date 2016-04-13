# Computational Methods for Neuroimaging in R: Stroke Hemorrhages and X-ray Computed Tomography Scanning
John Muschelli, PhD - Johns Hopkins Bloomberg School of Public Health<br/> http://johnmuschelli.com/Genentech_Talk.html  
April 13, 2016  


<script type="text/x-mathjax-config">
MathJax.Hub.Config({ TeX: { extensions: ["color.js"] }});
</script>











## Overview of Work/Research

<div style='font-size: 28pt;'>
- Segmentation/Classification of Computed Tomography (CT) scans
    - Brain segmentation
    - Hemorrhage segmentation
- Quantitative hemorrhage localization
- Neuroimaging and R
</div>

## Overview of Work/Research

<div style='font-size: 28pt;'>
- Segmentation/Classification of Computed Tomography (CT) scans
    - Brain segmentation
    - Hemorrhage segmentation
- **Quantitative hemorrhage localization**
- Neuroimaging and R
</div>


# Neuroimaging Analysis in Stroke

## The MISTIE Stroke Trial 

* Minimally Invasive Surgery plus r-tPA for Intracerebral Hemorrhage Evacuation (<strong>MISTIE</strong>) 
    - Multi-center, multi-national Phase II clinical trial
    - Alteplase (donated by Genentech)
* Patients with intracerebral hemorrhages (≥ 20 millilters)

<img src="figure/MISTIE3-LOGO.png" style="width:200px; height:100px; display: block; margin: auto;" alt="MISTIE LOGO">

* http://braininjuryoutcomes.com/mistie-about


## When I stroke I don't mean ischemic

<div class="container">
<div id="left_col">
<img src="figure/ischemic_stroke_edema_700w.jpg" alt="Ischemic" style="display: block; margin: auto; width: 80%">
</div>
<div id="right_col">

- Ischemic stroke - clot blocks oxygen/nutrients
- Tissue dies

<p style = "font-size:10.5px;">
Image from <a href = "http://www.strokecenter.org/patients/about-stroke/ischemic-stroke/
" style ="word-wrap: break-word;" >http://www.strokecenter.org/patients/about-stroke/ischemic-stroke/
</a>
</p>
</div>
</div>


## When I stroke I don't mean ischemic

<div class="container">
<div id="left_col">
<img src="figure/ischemic_stroke_edema_700w_not.jpg" alt="Ischemic" style="display: block; margin: auto; width: 80%">
</div>
<div id="right_col">

- Ischemic stroke - clot blocks oxygen/nutrients
- Tissue dies

<p style = "font-size:10.5px;">
Image from <a href = "http://www.strokecenter.org/patients/about-stroke/ischemic-stroke/
" style ="word-wrap: break-word;" >http://www.strokecenter.org/patients/about-stroke/ischemic-stroke/
</a>
</p>
</div>
</div>




## What is Intracranial/Intracerebral hemorrhage?

<div class="columns-2" style='font-size: 28pt;'>
- When a blood vessel ruptures into:
    + **Tissue ⇒ intracerebral hemorrhage (ICH)**
- ≈ 13% of strokes

![](figure/stroke_hem_web.jpg)

<p style = "font-size:10.5px; ">
<a href = "http://www.heartandstroke.com/site/c.ikIQLcMWJtE/b.3484153/k.7675/Stroke__Hemorrhagic_stroke.htm" style ="word-wrap: break-word;" >http://www.heartandstroke.com/site/c.ikIQLcMWJtE/b.3484153/k.7675/Stroke__Hemorrhagic_stroke.htm</a>
</p>

</div>


## X-ray Computed Tomography (CT) Scans
<div class="notes">
Images are acquired from an X-ray scanner.  
x-ray goes around object and detector the other side of the object determines how many x-rays are recovered 
- fancy transform
- Image!
</div>
<div style="width:48%;float:left;">
<sub><sup><sub><sup>Image from http://www.cyberphysics.co.uk/topics/medical/CTScanner.htm</sup></sub></sup></sub>
![inline fill](figure/CT_diagram2.gif)
<br>
</div>
<div style="margin-left:48%;">
<img src="figure/Original_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
</div>


## Terminology: Neuroimaging to Data/Statistics

<div style="font-size: 26pt">
* Segmentation ⇔ classification 
* Image ⇔ 3-dimensional array
* Mask/Region of Interest ⇔ binary (0/1) image 
* Registration ⇔  Spatial Normalization/Standarization
    - "Lining up" Brains
</div>


# Brain Segmentation of CT Scans

## Problem: CT Scans Capture **Everything**

<img src="figure/the_room.png" style="width:100%; display: block; margin: auto;" alt="The room">


## Brain Segmentation of CT Scans


<div class="columns-2">
Want to go from an image:
<img src="figure/Original_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
<br/>
<img src="figure/White_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
</div>

## Brain Segmentation of CT Scans


<div class="columns-2">
Want to go from an image:
<img src="figure/Original_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
<br/>
To a brain-extracted image:
<img src="figure/SS_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
</div>

## Publicly Available code

* Muschelli, John, et al. "Validated automatic brain extraction of head CT images." NeuroImage 114 (2015): 379-385. 
* R code: http://bit.ly/CTBET_RCODE - based on **fslr** 
* bash code: http://bit.ly/CTBET_BASH

<img src="figure/Normal_SS.png" style="width:38%;  display: block; margin: auto;" alt="SS">


# Larger ICH Volume ⇒ Worse Outcome




## ICH Segmentation, Volume/Location Estimation 

<div class="columns-2">
Want to go from a brain image:
<img src="figure/SS_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
<br/>
To a binary hemorrhage mask:
<img src="figure/SS_Image_PrePredict_ROI_Mask.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
</div>


## Subject Data used: 111 scans (1 per patient)
<div id="wrap">
<div id="left_col">


------------------------------------------
&nbsp;                             Overall
------------------------------ -----------
Age in Years: Mean (SD)        60.8 (11.2)

Male: N (%)                     76 (68.5%)

Reader-Based Clot Location (%)            

&nbsp;&nbsp;&nbsp;Putamen        68 (61.3)

&nbsp;&nbsp;&nbsp;Lobar          33 (29.7)

&nbsp;&nbsp;&nbsp;Globus          6 ( 5.4)
Pallidus                                  

&nbsp;&nbsp;&nbsp;Thalamus        4 ( 3.6)

ICH Volume in mL: Mean (SD)    37.4 (20.1)
------------------------------------------

</div>
<div id="right_col"  style='font-size: 24pt;'>


- Adults (inclusion criteria 18-80 years old)
- Mostly males
- Reader-classified Location of Hemorrhage

</div>

</div>

## Image Representation: voxels (3D pixels)
<div class="columns-2">
<img src="figure/Zoom_No_ICH.png"  style="width:100%;  display: block; margin: auto;">
<br>
<img src="figure/movie_final.gif" style="width:80%;  inline; display: block; margin: auto;" loop=infinite>

<p style='font-size: 10pt;'>Muschelli, John, Elizabeth Sweeney, and Ciprian Crainiceanu. "brainR: Interactive 3 and 4D Images of High Resolution Neuroimage Data." R JOURNAL 6.1 (2014): 42-48.</p>
</div>

## Step 1: Create Predictors of ICH <img src="figure/Just_The_Covariates2.png" style="width:48%; display: block; margin: auto;" alt="Preds">  

## Data Structure for One Patient <br/> <img src="figure/voxel_stacking.png" style="width:70%;  display: block; margin: auto;" alt="MISTIE LOGO">  

---

<div class="container"> 
<div id="left_col2"> 
  <h2>Step 2: Aggregate Data</h2>
  Training Data Structure
  
  * Stack together 10 randomly selected patients
  * Train model/classifier on this design matrix

  
  </div>    
  <div id="right_col2">
  <img src="figure/Large_Design_Matrix_small.jpg" style="width:45%;  display: block; margin: auto;" alt="MISTIE LOGO">  
  </div> 
</div>


## Step 3: Fit Models / Classifier

Let $y_{i}(v)$ be the presence / absence of ICH for voxel $v$ from person $i$.  

General model form: 
$$
 P(Y_{i}(v) = 1)  \propto f(X_{i}(v))
$$

## Models Fit on the Training Data

- Logistic Regression: \(f(X_{i}(v)) = \text{expit} \left\{ \beta_0 + \sum_{k= 1}^{p} x_{i, k}(v)\beta_{k}\right\}  \)
- Generalized Additive Model (Hastie, et al., 1990) 
    - fit using thin plate splines
- LASSO (Tibshirani, 1996; Friedman, et al., 2010): 
$$ \mathcal{L}\left(\left.Y_{i}(v) \right|\, f(X_i(v))\right) \propto \beta_0 + \sum_{k= 1}^{p} x_{i, k}(v) \beta_{k} + \lambda \sum_{k= 1}^{p} \left|\beta_{k}\right|
$$
- Random Forests (Liaw, et al., 2002; Breiman, 2001)
<div class="centerer">
\(f(X_{i}(v)) \propto\) <img src="Random_Forest.png" style="width:40%;inline;" alt="MISTIE LOGO">
</div>

## Predicted Volume Estimates True Volume <img src="figure/Reseg_Volume_Logistic.png" style="width:55%;  display: block; margin: auto;" alt="Reseg">

## Predicted Volume Estimates True Volume <img src="figure/Reseg_Volume_Comparison.png" style="width:55%;  display: block; margin: auto;" alt="Reseg">

## Patient with Median Overlap in Validation Set

<img src="figure/Reseg_Figure_DSI_Quantile_050_No_DSI.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO"> 

## Shiny Application <img src="Shiny_prediction.png" style="width:105%; display: block; margin: auto;" alt="shiny orig">

# Quantitative Hemorrhage Localization


## Localization Goals

<div style="font-size: 24pt">

1. Quantify of hemorrhage engagement of regions in the brain
2. Create a 3-dimensional (3D) density map of hemorrhages in MISTIE population
3. Determine if differences in location relate to stroke severity
4. Generate a stroke region of engagement using within-sample validation
</div>


## Register CT Image to Template

<div class="container">
   <div class="left-half">
   Original Image with Hemorrhage:
   <img src="figure/native_100-362_20100126_1926_CT_2_CT_ROUTINE.png" style="width:100%;" alt="Native">
   </div>
   <div class="right-half">
   Template Image:   
<img src="figure/Template.png" style="width:100%; float:left;" alt="template">   
   </div>
</div>

## Transformed Masks in Template Space 

<div class="container">
   <div class="left-half">
   Registered Image with Hemorrhage:
   <img src="figure/raw_spm_100-362_20100126_1926_CT_2_CT_ROUTINE.png" style="width:100%;" alt="Native">
   </div>
   <div class="right-half">
   Registered Hemorrhage Mask:   
<img src="figure/roi_spm_100-362_20100126_1926_CT_2_CT_ROUTINE.png" style="width:100%; float:left;" alt="template">   
   </div>
</div>


## Hemorrhage Engagement of Brain Regions 


We can compare the area to the "Eve" segmentation map (Oishi, et al., 2008) which outlines structures:
<img src="figure/Eve_Atlas_Comparison.png" style="width:100%;" alt="Native">


## Hemorrhage Engagement of Brain Regions 
From this, we can calculate region-level engagement:
$$
\text{Engagement}_r = \frac{ \sum\limits_{\text{Voxels in region r}} \text{Hemorrhage Mask} } {\sum \text{Hemorrhage Mask}} \times 100\% \nonumber
$$




-------------------------------------
          Area            Engagement 
------------------------ ------------
   Postcentral gyrus         16.7    

  Supramarginal gyrus        10.8    

Superior parietal lobule     10.4    

Postcentral white matter     10.2    

    Precentral gyrus         8.2     
-------------------------------------

- Can also give region engagement (e.g. 10\% of putamen engaged)
    - putamen, caudate, and globus pallidus not engaged 


# Population ICH Distribution


## Aggregating Multiple Hemorrhage Masks

N - number of patients, V - number of voxels

<img src="figure/hemorrhage_stacking.png" style="width:100%; display: block; margin: auto;" alt="pipeline">

## Creating a Population-level ICH Distribution
<img src="figure/3d_hist.png" style="width:45%; display: block; margin: auto;" alt="pipeline">


## Population ICH Distribution

<img src="figure/Figure4_Proportion_Final.png" style="width:50%; display: block; margin: auto;" alt="The room">








# What Areas Affect Stroke Severity

## Measuring Stroke Severity

* Stroke-related impairment measured by NIH Stroke Scale (NIHSS) (Brott, et al., 1989)
    * Multiple sub-domains
    * Higher is worse (higher stroke severity)




---------------------------------------
 NIHSS Score       Stroke Severity     
------------- -------------------------
      0          No Stroke Symptoms    

     1-4            Minor Stroke       

    5-15           Moderate Stroke     

    16-20     Moderate to Severe Stroke

    21-42           Severe Stroke      
---------------------------------------

## Voxel-wise Regression/T-tests

<div class="container">
   <div id="left_col2">
  Let $v$ be voxel
  
  * $\mu_{1}(v)$: mean NIHSS score in patients where $ICH(v){=}1$
  * Similarly for $\mu_{0}(v)$. 
  * At each voxel, ran a t-test: $H_{0}(v):\mu_{1}(v)=\mu_{0}(v)$ 
  * Only voxels where $>10$ subjects had ICH $(V=166202)$
    </div>
   <div id="right_col2">
<img src="figure/Pvalue_Figure.png" alt="Data structure" style="display: block; margin: auto; width: 100%">
    </div>
</div>    

## Voxel-wise P-value Map

<img src="figure/Regression_Map_heatcol1_t1.png" alt="Data structure" style="display: block; margin: auto; width: 55%">

## High Predictive Regions
Due to a large number of tests, a Bonferroni correction (or FDR) did not result in singificant p-values.  

- Create a High Predictive Region (HPR) based on a threshold: 
    - For example, $p < 0.01$    

<br>
<p style='font-size: 40pt; text-align: center;'>
WARNING: EXPLORATORY ANALYSIS AHEAD!
</p>

## Threshold P-value Map at $0.01$ ⇒ HPR

<div style="width:49%;float:left;">
<img src="figure/Regression_Map_heatcol1_t1.png" alt="Data structure" style="width: 100%">
</div>
<div style="margin-left:48%;">
![inline fill](figure/Top_19047_pvalues.png)
</div>


## HPR Coverage
Calculate the overlap of the HPR for each scan $i$
$$
\text{HPR Coverage}_i = \frac{\text{# Voxels classified ICH in HPR for scan } i}{\text{# Voxels in HPR}} \times 100\% \nonumber
$$
<img src="figure/hpr_blob.png" style="width:35%; display: block; margin: auto;" alt="hpr blob">


## HPR Coverage
Calculate the overlap of the HPR for each scan $i$
$$
\text{HPR Coverage}_i = \frac{\text{# Voxels classified ICH in HPR for scan } i}{\text{# Voxels in HPR}} \times 100\% \nonumber
$$
<img src="figure/ich_blob.png" style="width:35%; display: block; margin: auto;" alt="hpr blob">

## HPR Coverage
Calculate the overlap of the HPR for each scan $i$
$$
\text{HPR Coverage}_i = \frac{\text{# Voxels classified ICH in HPR for scan } i}{\text{# Voxels in HPR}} \times 100\% \nonumber
$$
<img src="figure/both_blob.png" style="width:35%; display: block; margin: auto;" alt="hpr blob">


## Coverage is 2000/20000 * 100 = 10%: <img src="figure/both_blob.png" style="width:50%; display: block; margin: auto;" alt="hpr blob">



## HPR Coverage Relationship with NIHSS

<div style="width:48%;float:left;">
![inline fill](figure/Top_19047_pvalues.png)
</div>
<div style="margin-left:48%;">
<img src="figure/Regress_ROI_NIHSS_Best_Model.png" style="width:100%;  display: block; margin: auto;" alt="Regline">
</div>

## Standard Description of Location: Reader-Based


------------------------------------------
&nbsp;                             Overall
------------------------------ -----------
Age in Years: Mean (SD)        60.8 (11.2)

Male: N (%)                     76 (68.5%)

**Reader-Based Clot Location              
(%)**                                     

&nbsp;&nbsp;&nbsp;**Putamen**    68 (61.3)

&nbsp;&nbsp;&nbsp;**Lobar**      33 (29.7)

&nbsp;&nbsp;&nbsp;**Globus        6 ( 5.4)
Pallidus**                                

&nbsp;&nbsp;&nbsp;**Thalamus**    4 ( 3.6)

ICH Volume in mL: Mean (SD)    37.4 (20.1)
------------------------------------------

## Known predictors of NIHSS

* Age
* ICH Volume (ICHVol)
* Sex

Null Model:

$$\begin{eqnarray} 
{\rm NIHSS}_i &=& \beta_0 + \gamma_1{\rm Age}_i  +\gamma_2{\rm Sex}_i +\gamma_3{\rm ICHVol}_i + \epsilon_{i}
\end{eqnarray}$$


## Compare HPR to using Reader-Based Locations

Using the adjusted $R^2$, we compared the **HPR model**:

$$\begin{eqnarray} 
{\rm NIHSS}_i &=& \beta_0 + \beta_1 {\rm Coverage}_i \\
&+& \gamma_1{\rm Age}_i  +\gamma_2{\rm Sex}_i +\gamma_3{\rm ICHVol}_i + \epsilon_{i}\\
\end{eqnarray}$$
to the **reader-based model**:
$$\begin{eqnarray} 
{\rm NIHSS}_i &=& \beta_0 + \beta_1 I({\rm Lobar}_i) + \beta_2 I({\rm Globus\,Pallidus }_i) + \beta_3 I({\rm Thalamus}_i) \\
&+& \gamma_1{\rm Age}_i  +\gamma_2{\rm Sex}_i +\gamma_3{\rm ICHVol}_i + \epsilon_{i}
\end{eqnarray}$$
where $I(k)$ represents the indicator that ICH location was $k$

## Testing if HPR is more Predictive than Reader


* Likelihood ratio test (LRT) comparing HPR coverage model to null model: $p < 0.001$

* LRT: Reader model vs. null model: $p = 0.1844$

* Adjusted $R^2$, Reader model: 0.129 vs. HPR coverage Model: 0.254 

Nested Model Comparison:

* LRT: Reader+HPR model vs. Reader-only model: $p < 0.001$

* Reader+HPR model:
$$\begin{eqnarray} 
{\rm NIHSS}_i &=& \beta_0 + \beta_1 I({\rm Lobar}_i) + \beta_2 I({\rm Globus\,Pallidus }_i) + \beta_3 I({\rm Thalamus}_i) \\
&+& \beta_4 {\rm Coverage}_i \\
&+& \gamma_1{\rm Age}_i  +\gamma_2{\rm Sex}_i +\gamma_3{\rm ICHVol}_i + \epsilon_{i}
\end{eqnarray}$$


## Does HPR coverage perform better than chance?

Procedure (P):

1. Fit voxel-wise models
2. Collect the most predictive voxels
3. Produce subject-level predictors by coalescing voxels

Problems:

- Multiplicity
- Double-dipping: Using the data twice
    - Violates separation of exploratory and confirmatory analyses



## Conclusions of Stroke Analyses

<div style="font-size: 24pt">

- We can segment ICH volume from CT scans <br><br>
- We can create population-level ICH distributions <br/><br/>
- Voxel-wise regression can show regions associated with severity <br/><br/>

</div>


## Conclusions of Stroke Analyses

<div style="font-size: 24pt">

- We can segment ICH volume from CT scans
    - **Incorporate variability of estimated volume**
- We can create population-level ICH distributions
    - **Uncertainty measures of this**
- Voxel-wise regression can show regions associated with severity
    - **Validate these regions (MISTIE III)**
    - **Scalar on image regression** 

</div>

# Neuroimaging and R

## Authored R Packages:

<div id="wrap">
<div id="left_col">

- **fslr** <p style='font-size: 12pt;'>(Muschelli, John, et al. "fslr: Connecting the FSL Software with R." R JOURNAL 7.1 (2015): 163-175.)</p>
- brainR <p style='font-size: 12pt;'>(Muschelli, John, Elizabeth Sweeney, and Ciprian Crainiceanu. "brainR: Interactive 3 and 4D Images of High Resolution Neuroimage Data." R JOURNAL 6.1 (2014): 42-48.)</p>
- extrantsr
- ichseg
- dcm2niir
- matlabr
- spm12r


</div>
<div id="right_col">

- drammsr
- itksnapr
- papayar
- WhiteStripe
- oasis
- SuBLIME
- googleCite
- diffr
- rscopus

</div>
</div>




## Number of Downloads (CRAN packages)

From the `cranlogs` R package:








<!--html_preserve--><div id="htmlwidget-683" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-683">{"x":{"data":[["brainR","fslr","matlabr","diffr","WhiteStripe","oasis","spm12r","rscopus"],[7672,6927,1616,1123,4046,713,1035,1069],[72,59,58,52,47,43,37,35]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>Package\u003c/th>\n      <th>All Time\u003c/th>\n      <th>Last Week\u003c/th>\n    \u003c/tr>\n  \u003c/thead>\n\u003c/table>","options":{"dom":"t","autoWidth":true,"columnDefs":[{"className":"dt-center","targets":0},{"className":"dt-right","targets":[1,2]}],"order":[],"orderClasses":false},"callback":null,"filter":"none"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->




# Thank You
