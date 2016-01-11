# Computational Methods for Neuroimaging in R: Stroke Hemorrhage in X-ray Computed Tomography Scanning
John Muschelli<br/> http://bit.ly/JOBTALK  
January 14, 2016  


<script type="text/x-mathjax-config">
MathJax.Hub.Config({ TeX: { extensions: ["color.js"] }});
</script>











## Overview of Work/Research

<div style='font-size: 28pt;'>
- Neuroimaging and R
- Segmentation of Computed Tomography (CT) scans
    - Brain segmentation
    - Hemorrhage segmentation
- Quantitative hemorrhage localization
</div>

## Overview of Work/Research

<div style='font-size: 28pt;'>
- Neuroimaging and R
- Segmentation of Computed Tomography (CT) scans
    - Brain segmentation
    - Hemorrhage segmentation
- **Quantitative hemorrhage localization**
</div>

# Neuroimaging and R: <br/> <br/> Creating Tools I Would Use 

## Authored R Packages:

<div id="wrap">
<div id="left_col">

- **fslr** <p style='font-size: 12pt;'>(Muschelli, John, et al. "fslr: Connecting the FSL Software with R." R JOURNAL 7.1 (2015): 163-175.)</p>
- brainR <p style='font-size: 12pt;'>(Muschelli, John, Elizabeth Sweeney, and Ciprian Crainiceanu. "brainR: Interactive 3 and 4D Images of High Resolution Neuroimage Data." R JOURNAL 6.1 (2014): 42-48.)</p>
- extrantsr
- cttools
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

</div>
</div>


## fslr: Connecting FSL and R

fslr

- Ports most of FSL functionality into R 
- https://cran.r-project.org/web/packages/fslr/index.html

FSL 

- Full neuroimaging suite of analysis and preprocessing tools
- Actively developed (first release in 2000) (Jenkinson, et al., 2012)
- Popular: 13.9% of published neuroimaging studies used FSL (Carp, 2012).
- Open source and free (for academics)





## Number of Downloads (CRAN packages)

From the `cranlogs` R package:








<!--html_preserve--><div id="htmlwidget-6855" style="width:100%;height:auto;" class="datatables"></div>
<script type="application/json" data-for="htmlwidget-6855">{"x":{"data":[["brainR","fslr","WhiteStripe","matlabr","spm12r","diffr","oasis"],[6807,5975,3442,726,459,376,89],[67,80,52,57,51,60,61]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>Package</th>\n      <th>All Time</th>\n      <th>Last Week</th>\n    </tr>\n  </thead>\n</table>","options":{"dom":"t","autoWidth":true,"columnDefs":[{"className":"dt-center","targets":0},{"className":"dt-right","targets":[1,2]}],"order":[],"orderClasses":false},"callback":null,"filter":"none"},"evals":[]}</script><!--/html_preserve-->



# Neuroimaging Analysis in Stroke

## The MISTIE Stroke Trial 

* Minimally Invasive Surgery plus r-tPA for Intracerebral Hemorrhage Evacuation (<strong>MISTIE</strong>) 
    - Multi-center, multi-national Phase II clinical trial
* Hemorrhages with volume ≥ 20 millilters (mL or cc)

<img src="figure/MISTIE3-LOGO.png" style="width:200px; height:100px; display: block; margin: auto;" alt="MISTIE LOGO">

* http://braininjuryoutcomes.com/mistie-about


## What is Intracranial/Intracerebral hemorrhage?

<div class="columns-2" style='font-size: 28pt;'>
- When a blood vessel ruptures into:
    + **Tissue ⇒ intracerebral hemorrhage (ICH)**
    + Ventricles ⇒ intraventricular hemorrhage (IVH)
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



# Brain Segmentation of CT Scans

## Terminology: Neuroimaging to Data/Statistics

<div style="font-size: 26pt">
* Segmentation ⇔ classification 
* Image ⇔ 3-dimensional array
* Mask/Region of Interest ⇔ binary (0/1) image 
* Registration ⇔  Spatial Normalization/Standarization
</div>

## Problem: CT Scans Capture **Everything**

<img src="figure/the_room.png" style="width:100%; display: block; margin: auto;" alt="The room">


## Brain Segmentation of CT Scans


<div class="columns-2">
Want to go from an image:
<img src="figure/Original_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
<br/>
<img src="figure/White_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
</div>

## Brain Segmentation of (CT) scans


<div class="columns-2">
Want to go from an image:
<img src="figure/Original_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
<br/>
To a brain-extracted image:
<img src="figure/SS_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
</div>

## Publicly Available code

* Muschelli, John, et al. "Validated automatic brain extraction of head CT images." NeuroImage 114 (2015): 379-385. 
* R code: http://bit.ly/CTBET_RCODE
    * Based on **fslr** 
* bash code: http://bit.ly/CTBET_BASH



# ICH Segmentation and ICH Volume Estimation: <br/> <br/> Larger ICH Volume ⇒ Worse Outcome




## Subject Data used: 111 scans (1 per patient)
<div id="wrap">
<div id="left_col">


----------------------------------------
&nbsp;                           Overall
---------------------------- -----------
Age in Years: Mean (SD)      60.8 (11.2)

Male: N (%)                   76 (68.5%)

Clot Location RC (%)                    

&nbsp;&nbsp;&nbsp;Putamen      68 (61.3)

&nbsp;&nbsp;&nbsp;Lobar        33 (29.7)

&nbsp;&nbsp;&nbsp;Globus        6 ( 5.4)
Palidus                                 

&nbsp;&nbsp;&nbsp;Thalamus      4 ( 3.6)

Diagnostic ICH Volume in mL: 37.4 (20.1)
Mean (SD)                               
----------------------------------------

</div>
<div id="right_col"  style='font-size: 24pt;'>


- Adults (inclusion criteria 18-80 years old)
- Large ICH areas
- Small Intraventricular Hemorrhages (IVH)
</div>

</div>

## ICH Segmentation, Volume/Location Estimation 

<div class="columns-2">
Want to go from a brain image:
<img src="figure/SS_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
<br/>
To a hemorrhage mask:
<img src="figure/SS_Image_PrePredict_ROI_Mask.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
</div>


## Image Representation: voxels (3D pixels)
<div class="columns-2">
<img src="figure/Zoom_No_ICH.png"  style="width:100%;  display: block; margin: auto;">
<br>
<img src="figure/movie_final.gif" style="width:80%;  inline; display: block; margin: auto;" loop=infinite>

<p style='font-size: 10pt;'>Muschelli, John, Elizabeth Sweeney, and Ciprian Crainiceanu. "brainR: Interactive 3 and 4D Images of High Resolution Neuroimage Data." R JOURNAL 6.1 (2014): 42-48.</p>
</div>


## Step 1: Create Predictors of ICH <img src="figure/Just_The_Covariates.png" style="width:550px;  display: block; margin: auto;" alt="MISTIE LOGO">  

## Data Structure for One Patient <br/> <img src="figure/voxel_stacking.png" style="width:70%;  display: block; margin: auto;" alt="MISTIE LOGO">  


## Step 2: Fit Models 

Let $y_{i}(v)$ be the presence / absence of ICH for voxel $v$ from person $i$.  

General model form: 
$$
P(y_{i}(v) = 1) = f(X_i(v))
$$
where $X_i(v) = (x_{i, 1}(v) \dots x_{i, 21}(v))$ are the predictors.  

* For models, we'll use the $\text{logit}$ link function.


## Models Fit on the Training Data

- Logistic Regression: \(f(X) = \beta_0 + \sum_{k= 1}^{p} x_{i, k}(v)\beta_{k}\)
- Generalized Additive Models (Hastie, et al., 1990)
- LASSO (Tibshirani, 1996; Friedman, et al., 2010): 
$$ L(f(X)) \propto \beta_0 + \sum_{k= 1}^{p} x_{i, k}(v) \beta_{k} + \lambda \sum_{k= 1}^{p} \left|\beta_{k}\right|
$$
- Random Forests (Liaw, et al., 2002; Breiman, 2001)
<div class="centerer">
\(f(X) \propto\) <img src="Random_Forest.png" style="width:40%;inline;" alt="MISTIE LOGO">
</div>

 

## Compare Estimated to True Volume <img src="figure/Reseg_Volume_Logistic.png" style="width:55%;  display: block; margin: auto;" alt="Reseg">

## Compare Estimated to True Volume <img src="figure/Reseg_Volume_Comparison.png" style="width:55%;  display: block; margin: auto;" alt="MISTIE LOGO">

## Patient with Median Overlap in 102 Patients

<img src="figure/Figure_DSI_Quantile_050.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO"> 

## Shiny Application: http://bit.ly/ICH_SEG <img src="Shiny_prediction.png" style="width:100%; display: block; margin: auto;" alt="shiny orig">



# Quantitative Hemorrhage Localization


## Localization Goals

<div style="font-size: 24pt">

2. Create a 3-dimensional (3D) density map of hemorrhages in MISTIE population
3. Quantify of hemorrhage engagement of regions in the brain
4. Determine if differences in location relate to stroke severity
5. Generate a stroke region of engagement using within-sample validation.
</div>

## Registered Images and Masks/Regions of Interest

<div class="container">
   <div class="column-left">
   Raw Image:
   <img src="figure/native_100-362_20100126_1926_CT_2_CT_ROUTINE.png" style="width:300px; float:left;" alt="Native">
   </div>
   <div class="column-center">
   Registered Image:   
<img src="figure/raw_spm_100-362_20100126_1926_CT_2_CT_ROUTINE.png" style="width:300px; float:left;" alt="Raw">   
   </div>
   <div class="column-right">
   Registered ROI:
   <img src="figure/roi_spm_100-362_20100126_1926_CT_2_CT_ROUTINE.png" style="width:300px; float:left;" alt="ROI">
   </div>
</div>

## Aggregating Multiple Hemorrhage Masks

N - number of patients, V - number of voxels

<img src="figure/hemorrhage_stacking.png" style="width:100%; display: block; margin: auto;" alt="pipeline">

## Creating a Population-level ICH Distribution
<img src="figure/3d_hist.png" style="width:45%; display: block; margin: auto;" alt="pipeline">


## Population ICH Distribution

<img src="figure/Figure4_Proportion_Final.png" style="width:50%; display: block; margin: auto;" alt="The room">


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
    - Calculate the overlap of the HPR for each scan $i$
$$
\text{HPR Coverage}_i = \frac{\text{# Voxels classified ICH in HPR for scan } i}{\text{# Voxels in HPR}} \times 100\% \nonumber
$$

## HPR <img src="figure/hpr_blob.png" style="width:50%; display: block; margin: auto;" alt="hpr blob">

## Patient ICH <img src="figure/ich_blob.png" style="width:50%; display: block; margin: auto;" alt="hpr blob">


## Coverage is 10%: <img src="figure/both_blob.png" style="width:50%; display: block; margin: auto;" alt="hpr blob">



## Mask using P-value Threshold of $0.01$

<div style="width:49%;float:left;">
<img src="figure/Regression_Map_heatcol1_t1.png" alt="Data structure" style="width: 100%">
</div>
<div style="margin-left:48%;">
![inline fill](figure/Top_19047_pvalues.png)
</div>


## HPR Coverage Relationship with NIHSS

<div style="width:48%;float:left;">
![inline fill](figure/Top_19047_pvalues.png)
</div>
<div style="margin-left:48%;">
<img src="figure/Regress_ROI_NIHSS_Best_Model.png" style="width:100%;  display: block; margin: auto;" alt="Regline">
</div>

## Compare HPR to using Reader-Based Locations

Using the adjusted $R^2$, we compared the models:

$$\begin{eqnarray} 
{\rm NIHSS}_i &=& \beta_0 + \beta_1 {\rm Coverage}_i \\
&+& \gamma_1{\rm Age}_i  +\gamma_2{\rm Sex}_i +\gamma_3{\rm ICHVol}_i + \epsilon_{i}\\
\end{eqnarray}$$
to that of the categorical indicator of location:
$$\begin{eqnarray} 
{\rm NIHSS}_i &=& \beta_0 + \beta_1 I({\rm Lobar}_i) + \beta_2 I({\rm Globus{ }Pallidus }_i) + \beta_3 I({\rm Thalamus}_i) \\
&+& \gamma_1{\rm Age}_i  +\gamma_2{\rm Sex}_i +\gamma_3{\rm ICHVol}_i + \epsilon_{i}
\end{eqnarray}$$
where $I(k)$ represents the indicator that ICH location was $k$

## Testing if HPR is more Predictive than Location

* Adjusted $R^2$, Location model: 0.129 vs. HPR coverage Model: 0.254 

Null Model
$$\begin{eqnarray} 
{\rm Y}_i &=& \beta_0 + \gamma_1{\rm Age}_i  +\gamma_2{\rm Sex}_i +\gamma_3{\rm ICHVol}_i + \epsilon_{i}
\end{eqnarray}$$

* Likelihood ratio test (LRT) comparing HPR coverage model to null model: p < 0.001
* LRT: Location model vs. null model: p = 0.1844


* LRT: Location+HPR model vs. Location-only model: p < 0.001

## Test whether HPR coverage performs better than chance?

- Recall: data-based algorithm for defining the HPR

Procedure (P):

- Fit voxel-wise models
- Collect the most predictive voxels
- Produce subject-level predictors by coalescing voxels

Problems:

- Multiplicity
- Double-dipping


## Using the outcome twice! Double Dipping


<div style="font-size: 24pt">
- Dip: look at the data, construct predictors
- Double-dip: are the new predictors predictive?
- This violates one of the basic principles of Statistics: the separation between the exploratory and confirmatory phases of the analysis
</div>

## One Possible Solution: Permutation Testing 

Permutation procedure:

1.  Permute outcomes
2.  Apply selection procedure P and obtain HPR
3.  Calculate adjusted $R^2$

Compare adjusted $R^2$ from the original data with its permutation distribution

Null hypothesis: the prediction performance of HPR coverage is the same with the prediction performance of HPR coverage when there is no association between location and outcome 

Result: Permutation test p-value $<0.01$



## Conclusions of Stroke Analyses
<div style="font-size: 24pt">
- We can segment ICH volume from CT scans <br/><br/>
- Voxel-wise regression can show regions associated with severity <br/><br/>

</div>


## Future Work of Stroke Analyses

<div style="font-size: 24pt">

- We can segment ICH volume from CT scans
    - **Incorporate variability of estimated volume**
- Voxel-wise regression can show regions associated with severity
    - **Validate these regions (MISTIE III)**
    - **Scalar on image regression**

</div>

## Other Work

<div style="font-size: 24pt">

- Segmentation of Gadolinium-Enhancing Lesions in Patients with MS on MRI (T1w, T2w, FLAIR, PD)
- Catheter scoring with pre/post-op registration for ICH 
- Creating Department-level indices of publication
- Teaching Neuroimaging and R 
    - Mathematical and Statistical Challenges in Neuroimaging Data Analysis 
    - JSM 2016


</div>


# Thank You






## Global Head Information: Smoothed Images

Smoothing the original image using large Gaussian kernels ($\sigma = 5mm^3,10mm^3, 20mm^3$) can capture any potential homogeneity throughout the scan.  

<div class="container">
   <div class="column-center">
   $\sigma = 10$
<img src="figure/161-413_20110710_1619_CT_2_HEAD_Head_smooth10.png" style="width:100%; display: block; margin: auto;" alt="MISTIE LOGO">
</div>
   <div class="column-left">
   $\sigma = 5$
<img src="figure/161-413_20110710_1619_CT_2_HEAD_Head_smooth5.png" style="width:100%; display: block; margin: auto;" alt="MISTIE LOGO">
</div>
   <div class="column-right">
   $\sigma = 20$
<img src="figure/161-413_20110710_1619_CT_2_HEAD_Head_smooth20.png" style="width:100%; display: block; margin: auto;" alt="MISTIE LOGO">
   </div>
</div>



## Larger ICH ⇒ Worse Outcome
<div style="font-size: 14pt; color:black;">
<br>
J. P. Broderick, T. G. Brott, J. E. Duldner, et al. **"Volume of intracerebral hemorrhage. A powerful and easy-to-use predictor of 30-day mortality."** In: _Stroke_ 24.7 (1993), pp. 987-993.

S. Davis, J. Broderick, M. Hennerici, et al. **"Hematoma growth is a determinant of mortality and poor outcome after intracerebral hemorrhage"**. In: _Neurology_ 66.8 (2006), pp. 1175-1181.

L. C. Jordan, J. T. Kleinman and A. E. Hillis. **"Intracerebral hemorrhage volume predicts poor neurologic outcome in children"**. In:
_Stroke_ 40.5 (2009), pp. 1666-1671.

S. Tuhrim, D. R. Horowitz, M. Sacher, et al. **"Volume of ventricular blood is an important determinant of outcome in supratentorial intracerebral hemorrhage"**. In: _Critical care medicine_ 27.3 (1999),
pp. 617-621.
</div>

# NIHSS 
# One panel
