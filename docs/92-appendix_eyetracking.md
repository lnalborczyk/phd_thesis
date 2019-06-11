# Eye-tracking control experiment {#appendix-eyetracking}



The purpose of this control experiment was to check whether the two motor tasks used in the main experiment presented in CHapter 6, namely, finger tapping and articulatory suppression (mouthing) were equivalent in terms of task difficulty or general dual-task demand [@emerson_role_2003]. Participants performed a computer-based visual search task (i.e., finding a T among an array of Ls), adapted from @treisman_feature-integration_1980 paradigm (see below for details).

## Sample

Twenty-four participants (Mean age = 19.46, SD = 1.18, Min-Max = 18-21, 21 females, 21 right-handed), drawn from the same population (i.e., undergraduate psychology students at Univ. Grenoble Alpes) as the main experiment took part in this eye-tracking pretest.

## Sample size

As we aimed to compare four conditions (i.e., visual search (VS) task alone, VS + finger tapping, VS + foot tapping and VS + mouth movements), we recruited 24 participants in order to have at least one participant per order in our random counter-balanced repeated measures design ($n = k!$ where $n$ is the number of possible orders of conditions for $k$ conditions, then $n =4 != 24$).

## Material

Experiment took place individually in a dark room. Participants had to seat in front of a 22 inches, Iyama Vision Master Pro 513-MA203DT CRT Monitor (resolution: 1024x768 pixels, refresh rate: 85 Hz) with a NVIDIA GeForce 9800 GTX+ graphic processor. A camera-based eye-tracker (EyeLink\textregistered\ 1000 from SR Research) with a sampling rate of 250 Hz and a minimum accuracy of 0.5° was used, in the pupil-corneal reflection tracking mode. Participants were positioned on a seat so as to keep distance from the camera to the forehead target between 50 and 60 cm. A five-point calibration was completed before presenting stimuli, at the beginning of each condition.

## Procedure

The target (the letter "T") was presented at each trial, either on the right or on the left of the central vertical axis of the grid. The grid was an array of 6*6 items. Each stimulus was displayed until the participant response (maximum duration in case of no response: 5 seconds). Each grid of letters was preceded by a central fixation circle, that was displayed for 500ms after the participant moved his/her gaze towards it. In order to give their response ("left" or "right"), participants had to gaze towards a large filled gray circle, situated either on the left or on the right side of the grid. Each participant went through each condition, in a random order. A first general training session was proposed, at the beginning of the experiment, using ten items that were not used subsequently in the four conditions. Each condition was composed of 90 trials (45 left and 45 right), knowing that the first ten trials of each condition were considered as training trials and thus not included in analysis. All participants were filmed in order to ensure that they effectively performed the motor activity. 
Our measure of interest was the delay between the apparition of the grid and the participant's response (the time at which his/her gaze reached the response circle), below referred to as "response time" (RT).

## Data preprocessing

Raw data from EyeLink\textregistered\ includes gaze on screen spatial coordinates, pupil diameter and forehead target spatial coordinates, with its distance from the camera. For this experiment, since only RTs (in ms) of correct trials are interesting, invalid trials (when no response has been given) and wrong responses were removed from the analysis.

## Data analysis

Data were analysed using *Condition* (4 modalities) as a within-subject predictor and the RT as a dependent variable in a generalised MLM with a lognormal distribution for the response. This model included a varying intercept for both *participant* and *item* and was fitted using weakly informative priors and the `brms` package [@R-brms].

## Results



<caption>(\#tab:RTestimates)</caption>

<caption>*Mean and 95\% CrI of the posterior distribution on the difference between each pair of condition.*</caption>



Contrast            Estimate     Lower     Upper  
-----------------  ----------  ---------  --------
Mouth - Foot         15.573     -16.181    46.382 
Mouth - Finger      -11.051     -43.890    19.655 
Foot - Finger       -26.624     -58.330    4.608  
Mouth - Control      50.274     17.100     80.315 
Foot - Control       34.701      4.699     65.730 
Finger - Control     61.325     31.707     95.112 

Results of the MLM are reported in Table \@ref(tab:RTestimates) and Figure \@ref(fig:eyetrack), that report the estimated average RT (and it 95% CrI) by condition and for the difference between each pair of conditions. This analysis revealed that all dual tasks induced longer RTs in comparison with the control condition, with the finger-tapping condition inducing the greatest discrepancy as compared to the control condition ($\beta$ = 61.325, 95% CrI [31.707, 95.112]), followed by the mouthing condition ($\beta$ = 50.274, 95% CrI [17.1, 80.315]) and the foot-tapping condition ($\beta$ = 34.701, 95% CrI [4.699, 65.73]). Pairwise comparisons between dual-task conditions revealed that the difference between the mouthing and the finger-tapping conditions was in the opposite direction and slightly smaller ($\beta$ = -11.051, 95% CrI [-43.89, 19.655]) than the difference between the mouthing and the foot-tapping conditions ($\beta$ = 15.573, 95% CrI [-16.181, 46.382]).

![(\#fig:eyetrack)Left panel: average RT by condition predicted by the model along with 95\% CrIs. Underlying dots represent the average raw RT by participant. Right panel: posterior distribution of the difference between each pair of conditions, along with its mean and 90\% and 95\% CrI.](92-appendix_eyetracking_files/figure-docx/eyetrack-1.png)

## Discussion

This control experiment shows that there is no apparent difference (or a negligible one) in terms of attentional demand between the two motor tasks used in the main experiment (i.e., finger-tapping and mouthing), although performing a dual motor task (of any type) does seem costly, because of the observed difference between the control condition and the mean of the three others conditions. These results are in line with the results obtained by @cefidekhanie_interaction_2014 in their control experiment.