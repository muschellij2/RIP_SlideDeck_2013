# Segmentation of Stroke Hemorrhages in X-ray Computed Tomography Scanning
John Muschelli - Johns Hopkins Bloomberg School of Public Health<br/> http://johnmuschelli.com/jnj_talk.html  
February 24, 2016  

<script type="text/x-mathjax-config">
MathJax.Hub.Config({ TeX: { extensions: ["color.js"] }});
</script>










## The MISTIE Stroke Trial 

* Minimally Invasive Surgery plus r-tPA for Intracerebral Hemorrhage Evacuation (<strong>MISTIE</strong>) 
    - Multi-center, multi-national Phase II clinical trial
* Patients with intracerebral hemorrhages (≥ 20 millilters)

<img src="figure/MISTIE3-LOGO.png" style="width:200px; height:100px; display: block; margin: auto;" alt="MISTIE LOGO">

* http://braininjuryoutcomes.com/mistie-about


## What is Intracranial/Intracerebral hemorrhage?

<div class="columns-2" style='font-size: 28pt;'>
- When a blood vessel ruptures into:
    + **Tissue ⇒ intracerebral hemorrhage (ICH)**
- ≈ 13% of strokes
- Larger ICH Volume ⇒ Worse Outcome

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


----------------------------------------
&nbsp;                           Overall
---------------------------- -----------
Age in Years: Mean (SD)      60.8 (11.2)

Male: N (%)                   76 (68.5%)

Clot Location RC (%)                    

&nbsp;&nbsp;&nbsp;Putamen      68 (61.3)

&nbsp;&nbsp;&nbsp;Lobar        33 (29.7)

&nbsp;&nbsp;&nbsp;Globus        6 ( 5.4)
Pallidus                                

&nbsp;&nbsp;&nbsp;Thalamus      4 ( 3.6)

Diagnostic ICH Volume in mL: 37.4 (20.1)
Mean (SD)                               
----------------------------------------

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

## Data Structure for One Patient <br/> <img src="figure/voxel_stacking.png" style="width:70%;  display: block; margin: auto;" alt="stacking">  

---
<div class="container"> 
  <div id="left_col2"> 
  Training Data Structure
  
  * Stack together 10 randomly selected patients
  * Train model/classifier on this design matrix

  
  </div>    
  <div id="right_col2">
  <img src="figure/Large_Design_Matrix.png" style="width:20%;  display: block; margin: auto;" alt="MISTIE LOGO">  
  </div> 
</div>

## Step 2: Fit Models 

Let $Y_{i}(v)$ be the presence / absence of ICH for voxel $v$ from person $i$.  

$$
\text{logit}\left(P(Y_{i}(v) = 1)\right) = \beta_0 + \sum_{k= 1}^{p} x_{i, k}(v)\beta_{k}
$$
where $x_{i, 1}(v) \dots x_{i, 21}(v)$ are the predictors.  

## Predicted Volume Estimates True Volume <img src="figure/Reseg_Volume_Logistic.png" style="width:55%;  display: block; margin: auto;" alt="Reseg">

## Patient with Median Overlap in Validation Set

<img src="figure/Reseg_Figure_DSI_Quantile_050_No_DSI.png" style="width:500px;  display: block; margin: auto;" alt="MISTIE LOGO"> 

## Shiny Application: http://bit.ly/ICH_SEG <img src="Shiny_prediction.png" style="width:105%; display: block; margin: auto;" alt="shiny orig">

# Thank You



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
From $32$ CT images from Dr. Rorden (personal communication), we created a voxel-wise mean image $M$ and voxel-wise standard deviation $S$ image, after registering to a CT template (Rorden, et al., 2012).  

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
