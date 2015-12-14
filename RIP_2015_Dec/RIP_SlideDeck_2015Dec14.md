# Computational Methods for Neuroimaging in R: Stroke Hemorrhage in X-ray Computed Tomography Scanning
John Muschelli, in collaboration with Elizabeth Sweeney, Daniel Hanley, and Ciprian Crainiceanu  
December 14, 2015  




<script type="text/x-mathjax-config">
MathJax.Hub.Config({ TeX: { extensions: ["color.js"] }});
</script>










## What is Intracranial/Intracerebral hemorrhage?

<div class="columns-2" style='font-size: 28pt;'>
- When a blood vessel ruptures into:
+ Tissue ⇒ intracerebral hemorrhage (ICH)
+ Ventricles ⇒ intraventricular hemorrhage (IVH)
- ≈ 13% of strokes

![](figure/stroke_hem_web.jpg)

<a href = "http://www.heartandstroke.com/site/c.ikIQLcMWJtE/b.3484153/k.7675/Stroke__Hemorrhagic_stroke.htm" style ="font-size:10.5px" >http://www.heartandstroke.com/site/c.ikIQLcMWJtE/b.3484153/k.7675/Stroke__Hemorrhagic_stroke.htm</a>

</div>

## Overall Goal of Clinical Research in Stroke

<div style='font-size: 30pt;'>
Determine the prognosis of a patient with a hemorrhage:

- Which treatment is most effective
- The likelihood of a good outcome in a patient
- Which factors are most relevant for prognosis
</div>

## Overall Goal of Clinical Research in Stroke

<div style='font-size: 30pt;'>
Determine the prognosis of a patient with a hemorrhage:

- Which treatment is most effective
- The likelihood of a good outcome in a patient
- **Which factors are most relevant for prognosis**
</div>

## Overall Goal of My Work

<div style='font-size: 30pt;'>

- **Build tools** for analysis and visualization
    - Software (R packages)
- Estimate **known** factors for prognosis 
    - ICH volume)
- Evaluate **unknown** factors for prognosis 
    - ICH location
</div>

# Building Tools: <br/>"Vision Without Execution <br/> is Delusion" <br/>  - Thomas Edison <br/> <br/> Build Tools You Would Use 

## Authored R Packages:

<div id="wrap">
<div id="left_col">


- **fslr** <p style='font-size: 12pt;'>(Muschelli, John, et al. "fslr: Connecting the FSL Software with R." R JOURNAL 7.1 (2015): 163-175.)</p>
- **brainR** <p style='font-size: 12pt;'>(Muschelli, John, Elizabeth Sweeney, and Ciprian Crainiceanu. "brainR: Interactive 3 and 4D Images of High Resolution Neuroimage Data." R JOURNAL 6.1 (2014): 42-48.)</p>
- **extrantsr**
- **cttools**
- **dcm2niir**
- **matlabr**
- **spm12r**


</div>
<div id="right_col">

- drammsr
- itksnapr
- papayar
- WhiteStripe
- oasis
- SuBLIME
- googleCite

</div>
</div>


## Why do things need to be written in R?



- Statistical methods
- State-of-the-art reporting and reproducibility tools
- Open source
- Large community
- **Statisticians** use R more than Python  

## fslr: Overview 

<img src="fslr.png" style="width:100%; display: block; margin: auto; vertical-align: middle" alt="fslr">

<br/>
<div style='font-size: 30pt;'>
- **Seamless integration** is important
</div>

## Why FSL (other choices: AFNI/SPM)?

- Command-line based - no GUI needed
- Actively developed (first release in 2000)
- Popular: 13.9% of published neuroimaging studies (mainly fMRI) used FSL (Carp, 2012).
- **Previous experience with the software**
- Open source and free (for academics)
- Community-standard methods/tools



## Software use: Number of Downloads (as reported by RStudio CRAN)








<!--html_preserve--><div id="htmlwidget-8099" style="width:100%;height:auto;" class="datatables"></div>
<script type="application/json" data-for="htmlwidget-8099">{"x":{"data":[["brainR","fslr","matlabr","spm12r","WhiteStripe"],[6583,5703,504,302,3290],[66,89,74,58,52]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>Package</th>\n      <th>All_Time</th>\n      <th>Last_Week</th>\n    </tr>\n  </thead>\n</table>","options":{"dom":"t","autoWidth":true,"columnDefs":[{"className":"dt-center","targets":0},{"className":"dt-right","targets":[1,2]}],"order":[],"orderClasses":false},"callback":null,"filter":"none"},"evals":[]}</script><!--/html_preserve-->



## Segment ICH Volume for Prognostic Models

<div class="columns-2">

Want to go from this
<img src="figure/Original_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

To this:
<img src="figure/SS_Image_PrePredict_ROI_Mask.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
</div>

# Larger ICH Volume ⇒ Worse Outcome



<!-- NEED ABC/2 data-->

## Easy Alternatives Exist (ABC/2)

* ABC/2 - an ellipsoid approximation based on 3 measurements
    - Use largest cross section of ICH - measure long axis (A)
    - Measure axis orthogonal to it (B)
    - Count in the up/down direction how many slices ICH (C)
* Has large errors when not contiguous
    - Also high inter- and intra-reader variability 

## Stroke Trial Data

* Intracerebral (bleeds mainly in tissue, <strong>ICH</strong>) or Intraventricular (bleeds into ventricles, <strong>IVH</strong>) Hemorrhage trials

* Minimally Invasive Surgery plus rt-PA for ICH Evacuation (<strong>MISTIE</strong>) 

- Multi-center, multi-national Phase II clinical trial

<img src="figure/MISTIE3-LOGO.png" style="width:200px; height:100px; display: block; margin: auto;" alt="MISTIE LOGO">

* http://braininjuryoutcomes.com/mistie-about



## Measure ICH using Computed Tomography (CT)
<div class="notes">
Images are acquired from an X-ray scanner.  
x-ray goes around object and detector the other side of the object determines how many x-rays are recovered 
- fancy transform
- Image!
</div>
<div style="width:48%;float:left;">
![inline fill](figure/CT_diagram2.gif)
<br>
<sub><sup><sub><sup>Image from http://www.cyberphysics.co.uk/topics/medical/CTScanner.htm</sup></sub></sup></sub>
</div>
<div style="margin-left:48%;">
<img src="figure/Original_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
</div>


## Image Representation: voxels (3D pixels)
<div class="columns-2">
<img src="figure/Zoom_No_ICH.png"  style="width:100%;  display: block; margin: auto;">
<br>
<img src="figure/movie_final.gif" style="width:80%;  inline; display: block; margin: auto;">

<p style='font-size: 10pt;'>Muschelli, John, Elizabeth Sweeney, and Ciprian Crainiceanu. "brainR: Interactive 3 and 4D Images of High Resolution Neuroimage Data." R JOURNAL 6.1 (2014): 42-48.</p>
</div>


## CT scan Characteristics
<div class="notes">
- This is an example of a CT scan of a brain with no pathology
- Note the bone
An attenuation coefficient characterizes how easily the X-ray beam penetrated that area of the brain.
</div>

<div class="columns-2"  style='font-size: 22pt;'>
<img src="figure/Original_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">


* Voxel intensities are in Hounsfield Units (HU), which are "standardized"
$$
HU(v) = 1000 \times \frac{\mu(v) - \mu_{\text{water}}}{ \mu_{\text{water}}- \mu_{\text{air}}}
$$
- $\mu$ is the linear attenuation coefficient and $v$ denotes voxel.
* $\mu_{\text{water}}$ and $\mu_{\text{air}}$ are calibrated from each scanner.
</div>


## CT scan Characteristics 
<div class="notes">
- Here are the HU ranges for stuff
</div>

<div class="columns-2" style='font-size: 22pt;'>
<img src="figure/Original_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

Standard HU Ranges:

* Bone – high intensity (1000 HU)
* Air – low intensity (-1000 HU)
* Water - 0 HU
* Blood 30-80 HU
* White/Gray Matter ≈ 0 - 100 HU
</div>


## CT scan Characteristics: Measures Human + Room + FOV

<img src="figure/the_room.png" style="width:100%; display: block; margin: auto;" alt="The room">


## CT is NOT MRI (specifically not T1/T2)


-------------------------------------------------------------
    &nbsp;                 CT                     MRI        
-------------- -------------------------- -------------------
  **Domain**           Diagnostic         Diagnostic/Research

  **Units**        Houndsfield Units           Arbitrary     

 **Template**         *One* exists           MNI Standard    

 **Measures**  Measures humans/rooms/beds   Measures Humans  

 **Methods**             Sparse                  Many        
-------------------------------------------------------------



## ICH Prediction - Training data

* ICH are manually traced (**gold standard**)

<img src="figure/SS_Image_PrePredict_ROI.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">

## Problems with Manual Segmentation

* ICH are manually traced (**gold standard**)
* Time-consuming
* Within and across-rater variability
* Not feasible for for large databases
* Hard to use for enrollment criteria (adaptive randomization)




## Preprocessing: CT Skull Stripping

Muschelli, John, et al. "Validated automatic brain extraction of head CT images." NeuroImage 114 (2015): 379-385. [R Code to Run It!](bit.ly/CTBET_RCODE)

<div class="columns-2">
<img src="figure/Original_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">

<img src="figure/SS_Image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
</div>


# Imaging Predictors

## Local Moment Information: Neighborhoods

<div class="columns-2">
<img src="figure/centered_voxel.png"  style="width:100%;  display: block; margin: auto;">
<br>
<img src="figure/voxel_figure.gif" loop=infinite style="width:100%;  inline; display: block; margin: auto;">

## Local Moment Information: Mean

For each voxel,  neighborhood $N(v)$, of all adjacent neighboring voxels in $3$ dimensions.  Let $x_k(v)$ denote the voxel intensity in HU for voxel neighbor $k$, where $k = 1, \dots, 27$. 
$$
\begin{equation}
\bar{x}(v) = \frac{1}{N(v)} \sum_{k \in N(v)} x_k(v) \label{eq:mean}
\end{equation}
$$
<img src="figure/161-413_20110710_1619_CT_2_HEAD_Head_moment1.png" style="width:30%;  display: block; margin: auto;" alt="MISTIE LOGO">

## Local Moment Information: Higher Moments
<img src="figure/moments.png" style="width:60%;  display: block; margin: auto;" alt="MISTIE LOGO">


## Population Voxel-wise Mean/SD Image
From $32$ CT images from Dr. Rorden (personal communication), we created a voxel-wise mean image $M$ and voxel-wise standard deviation $S$ image, after registering to a CT template (Rorden, Bonilha, Fridriksson, et al., 2012).  

<img src="figure/Z_template.png" style="width:50%;  display: block; margin: auto;" alt="MISTIE LOGO">

## Standardized-to-template Intensity
We created a standardized voxel intensity with respect to the template ($z_{i,\text{template}}$) using the following equation:
<div id="wrap">
<div id="left_col2">
<br>
<br>

$$
z_{i,\text{template}}(v) = \frac{x_{i}(v) - M(v)}{S(v)}
$$
</div>

<div id="right_col2">

<img src="figure/Z_image.png" style="width:100%;  display: block; margin: auto;" alt="MISTIE LOGO">
</div>
</div>



## Covariates <img src="figure/Covariates2.png" style="width:550px;  display: block; margin: auto;" alt="MISTIE LOGO">  


## Model Fitting 

* Case-control sample voxels for a fixed percentage (25%) of outcome
<img src="figure/Breakdown.png" style="width:650px;height:250px;display: block; margin: auto;">


Let $y_{i}(v)$ be the presence / absence of ICH for voxel $v$ from person $i$.  

General model form: 
$$
\text{logit}\left(y_{i}(v)\right) = f(X)
$$

## Models Fit on the Training Data

- Logistic Regression: \(f(X) = \beta_0 + \sum_{k= 1}^{p} x_{i, k}(v)\beta_{k}\)
- Generalized Additive Models (Hastie and Tibshirani, 1990)
- LASSO (Tibshirani, 1996; Friedman, Hastie, and Tibshirani, 2010): 
$$ L(f(X)) \propto \beta_0 + \sum_{k= 1}^{p} x_{i, k}(v) \beta_{k} + \lambda \sum_{k= 1}^{p}
$$
- Random Forests (Liaw and Wiener, 2002; Breiman, 2001)
<div class="centerer">
\(f(X) \propto\) <img src="Random_Forest.png" style="width:40%;inline;" alt="MISTIE LOGO">
</div>




## Assessing Performance 
For each validation scan we can calculate the following 2-by-2 table, where the cells represent number of voxels and a corresponding Venn diagram:

<div style="width:45%;float: left;">


<table class = 'rmdtable' style='font-size: 26px;'>
<tr class = "header"><td></td><td></td><td colspan="2">Manual</td></tr>
<tr class = "header"><td></td><td></td><td>0</td><td>1</td></tr>
<tr><td rowspan="2"> PitCH</td><td>0</td><td style='font-size: 40px;'>TN</td><td style="color:blue">FN</td></tr>
<tr><td>1</td><td style="color:red">FP</td><td style="color:purple">TP</td></tr>
</table>
</div>

<div style="margin-left:48%;">
<img src="figure/Venn_Diagram_labeled.png" style="width:325px;height:325px;display: block; margin: auto;border:5px solid black"">
</div>

## Dice Similarity

<div style="width:48%;float:left;">
We calculate the Dice Similarity Index (DSI):
$$
\definecolor{red}{RGB}{255,0,0}
\definecolor{blue}{RGB}{0,0,255}
\definecolor{purple}{RGB}{128,0,128}
\definecolor{blac,}{RGB}{0,0,0}
\frac{ \color{purple} 2 \times \#  \text{TP} }{ \color{purple}  2 \times \#\text{TP} \color{black} + \color{red} \text{FN} \color{black} + \color{blue} \text{FP}} 
$$

- 0 indicates no overlap
- 1 means perfect agreement  
</div>

<div style="margin-left:48%;">

<img src="figure/Fraction_Figure.png" style="width:400px;height:460px;display: block; margin: auto;">

</div>

## <img src="figure/Reseg_Dice_Comparison.png" style="width:600px;  display: block; margin: auto;" alt="DICE">

## Patient with High Dice: Manual Segmentation

<img src="figure/SS_Image_PrePredict_ROI.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">

## Patient with High Dice: Automatic Segmentation

<img src="figure/SS_Image_PrePredict_Auto.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">


## Patient with High Dice: DSI = 0.90



<img src="figure/Prediction_Figure.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">

## Patient with Median Dice Overlap 

<img src="figure/Figure_DSI_Quantile_050.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO">  


## <img src="figure/Reseg_Volume_Comparison.png" style="width:600px;  display: block; margin: auto;" alt="MISTIE LOGO">

## <img src="Shiny_Original.png" style="width:100%; display: block; margin: auto;" alt="shiny orig">

## <img src="Shiny_SS.png" style="width:100%; display: block; margin: auto;" alt="shiny orig">

## <img src="Shiny_Registration.png" style="width:100%; display: block; margin: auto;" alt="shiny orig">

## <img src="Shiny_Predictors.png" style="width:100%; display: block; margin: auto;" alt="shiny orig">

## ICH Segmentation Conclusions

<div style="font-size: 24pt">

- Large ICH can be segmented using CT
- Simple methods can be used for voxel-wise segmentation
- A small training set can be used
- Feature selection is important
- All the analysis can be done in R

</div>


## Population-level Distribution of ICH

<img src="figure/Figure4_Proportion_Final.png" style="width:50%;  display: block; margin: auto;" alt="MISTIE LOGO">

## Regress ROIs against stroke severity scores 

<img src="figure/Figure2.tiff" style="width:50%;  display: block; margin: auto;" alt="MISTIE LOGO">

## Breakdown of Severity Areas Engaged 

<div style="font-size: 12pt">
<!--html_preserve--><div id="htmlwidget-1819" style="width:100%;height:auto;" class="datatables"></div>
<script type="application/json" data-for="htmlwidget-1819">{"x":{"data":[["CSF (ventricular &amp; subarachnoid spaces)","Insula","Superior temporal gyrus","Putamen left","Insular right","External capsule left","Superior corona radiata left","Superior temporal wm left","Superior corona radiata right","Putamen right","Posterior limb of internal capsule left","Thalamus left","Caudate nucleus left","Superior longitudinal fasciculus left","Globus pallidus left","Anterior limb of internal capsule left","Outside brain mask","Anterior limb of internal capsule right","Postcentral wm left","Posterior corona radiata left","Precentral wm left","Supramarginal wm left"],["7.9","4.7","3.8","3.0","2.9","2.3","1.9","1.9","1.8","1.8","","","","","","","","","","","",""],["10.0","","","","","","11.8","","","","10.1","7.6","5.4","4.9","3.7","3.6","3.5","3.0","","","",""],["4.2","","","","","","27.9","","","","3.9","33.9","9.6","5.9","","","","","6.7","3.1","1.3","1.1"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>Area</th>\n      <th>Population Prevalence</th>\n      <th>NIHSS HPR</th>\n      <th>GCS HPR</th>\n    </tr>\n  </thead>\n</table>","options":{"dom":"t","autoWidth":true,"columnDefs":[{"className":"dt-center","targets":[0,1,2,3]},{"width":"200px","targets":1},{"width":"150px","targets":[2,3]}],"order":[],"orderClasses":false},"callback":null,"filter":"none"},"evals":[]}</script><!--/html_preserve-->
</div>



## ICH Segmentation Conclusions

<div style="font-size: 24pt">

- Large ICH can be segmented using CT
- Simple methods can be used for voxel-wise segmentation
- A small training set can be used
- Feature selection is important
- All the analysis can be done in R

</div>




# Thank You




## Subject Data used: 111 scans (1 per patient)
<div id="wrap">
<div id="left_col">


|                    &nbsp;                    |   Overall   |
|:--------------------------------------------:|:-----------:|
|         **Age in Years: Mean (SD)**          | 60.7 (11.2) |
|               **Male: N (%)**                | 77 (68.8%)  |
|  **Diagnostic ICH Volume in mL: Mean (SD)**  | 37.7 (20.2) |
|  **Diagnostic IVH Volume in mL: Mean (SD)**  |  3.2 (6.3)  |

</div>
<div id="right_col"  style='font-size: 24pt;'>


- Adults (inclusion criteria 18-80 years old)
- Large ICH areas
- Small Intraventricular Hemorrhages (IVH)
</div>

</div>


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
