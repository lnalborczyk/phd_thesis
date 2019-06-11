# Muscle-specific electromyographic correlates of inner speech production

\initial{S}ummary of the research...^[This experimental chapter is a submitted manuscript reformatted for the need of this thesis. Pre-registered protocol, preprint, data, as well as reproducible code and figures are available at: [https://osf.io/czer4/](https://osf.io/czer4/).]



<!-- NB: You can add comments using these tags -->

## Abstract

Although having a long history of scrutiny in experimental psychology, it is still controversial whether inner speech (covert speech) production is accompanied by peripheral muscular activity in the speech muscles. We address this question by briefly reviewing previous findings related to the phenomenon of inner speech and to the broader phenomenon of motor imagery. We then present the results of a preregistered experiment looking at the electromyographic correlates of both overt speech and inner speech production of two classes of nonwords. An automatic classification approach was undertaken to discriminate these signals according to the class of nonword to be uttered. Although this approach lead to reasonable accuracy rates during overt speech production, it failed to discriminate inner speech content based on surface electromyography signals. We discuss these results in relation to other recent results and suggest alternative ways to test the engagement of the speech motor system during inner speech production. Pre-registered protocol, preprint, data, as well as reproducible code and figures are available at: https://osf.io/czer4/.

## Introduction

As you read these words, you are likely experiencing the presence of a familiar speechlike companion. This inner voice usually accompanies daily activities such as reading or writing and is estimated to be present at least one quarter of our awaken life [@heavey_phenomena_2008]. By deliberately paying attention to this voice, one can examine its phenomenological properties such as identity (whose voice is it ?) or other high-level characteristics (e.g., is it gendered ?). It is also possible to examine lower-level features like the tone of the voice, its pitch or its tempo.

This first set of basic observations leads to some important insights about the nature of inner speech. First, if we can think about inner speech, then it should be something different from thinking itself. Second, the simple fact that we can make sensory judgements about our inner voice tautologically reveals that inner speech is accompanied by sensory percepts (e.g., speech sounds, kinaesthetic feelings). This leads to other fundamental questions: where do these percepts come from ? Why do they look like the one we experience when we *actually* (overtly) speak ?

Two main classes of explanatory models have been suggested to answer these questions. A first class of theories is described under the umbrella term of *motor simulation view*. These theories broadly suggest that inner speech can be conceived as a kind of action on its own [@Jones2007;@Martinez-Manrique2015] in the same way as overt speech is, except that speech percepts (e.g., speech sounds) are simulated. Most theories under this view share the postulate that the speech motor system is involved (to some extent) during inner speech production. In contrast, a second class of theories, that we describe as the *abstraction view*, suggest that inner speech results from the activation of abstract linguistic representations [e.g.,@oppenheim_inner_2008] that do not involve lower-level features (e.g., articulatory representations).

Previous research have demonstrated that it is possible to record muscle-specific electromyographic correlates of inner speech [e.g.,@mcguigan_patterns_1989;@mcguigan_discriminative_1974]. However, these studies mostly focused on small samples of children and sometimes used invasive intramuscular electromyography. In contrast, more recent research using surface electromyography in adult samples lead to mixed results [e.g.,@meltzner_speech_2008]. Building upon previous work, we describe an experimental set-up using surface electromyography with the aim of testing the involvement of the speech motor system during inner speech production.

## Inner speech as motor imagery of speech

Speech production is an incredibly complex motor action, involving the fine-grained coordination of more than 100 muscles in the upper part of the body [@simonyan_laryngeal_2011]. In adult humans, its covert counterpart (i.e., *inner speech* or *verbal imagery*) has developed to support a myriad of different functions. In the same way as visual imagery permits to mentally examine visual scenes, *verbal imagery* can be used as an internal tool, allowing --amongst other things-- to rehearse or to prepare past and future conversations [for review, see @alderson-day_inner_2015;@Perrone-Bertolotti2014]. Because speech production results from sequences of motor commands which are assembled to reach a given goal, it belongs to the broader category of motor actions [@jeannerod_motor_2006]. Therefore, a parallel can be drawn between verbal imagery and other forms of motor imagery (e.g., imagined walking or imagined writing). Accordingly, studies on the nature of inner speech might benefit from insights gained from the study of motor imagery and the field of motor cognition [e.g.,@haggard_conscious_2005;@jeannerod_motor_2006]. 

Motor imagery can be defined as the mental process by which one rehearses a given action, without engaging in the physical movements involved in this particular action. One of the most influential theoretical explanation of this broad phenomenon is the *motor simulation theory* [MST; @jeannerod_representing_1994;@jeannerod_neural_2001;@jeannerod_motor_2006]. In this framework, the concept of simulation refers to the "offline rehearsal of neural networks involved in specific operations such as perceiving or acting" [@jeannerod_motor_2006,pp.29] and motor imagery is conceptualised as a simulation of the covert stage of the same executed action [@oshea_does_2017]. The MST shares some similarities with the theories of embodied and grounded cognition [@Barsalou2008] in that both account for the phenomenon of motor imagery by appealing to a simulation mechanism. However, the concept of simulation in grounded theories is assumed to operate in order to achieve a particular abstract knowledge [@oshea_does_2017], which is not the concern of the MST. In other words, we should make a distinction between *embodiment of content*, which concerns the conceptual content of language, and *embodiment of form*, which concerns "the vehicle of thought", that is, proper speech production [@pickering_integrated_2013].

<!--
The MST contains the three following postulates at its core: i) there exists a continuum between the covert (the mental representation) and the overt execution of an action, ii) action representations can operate off-line, via a *simulation* mechanism, and iii) covert actions rely on the same set of mechanisms as the overt actions they simulate, except that execution is inhibited [@oshea_does_2017]. The MST is supported by a wealth a findings, going from mental chronometry studies showing that the time taken to perform an action is often found to be similar to the time needed to imagine the corresponding action [though not always, see @glover_motor-cognitive_2017, for a review of controversial findings and for an alternative conceptualisation of motor imagery], to neuroimaging and neurostimulation studies showing that both motor imagery and overt actions tend to recruit similar frontal, parietal and sub-cortical regions [e.g.,@hetu_neural_2013;@jeannerod_neural_2001]. The involvement of the motor system during motor imagery is also supported by repeated observations of autonomic responses and peripheral muscular activity during motor imagery [for review, see @guillot_electromyographic_2010;@collet_autonomic_2010].
-->

A second class of explanatory models of motor imagery are concerned with the phenomenon of *emulation* and with *internal models* [see @gentsch_towards_2016, for a review of the similarities and dissimilarities between simulation and emulation models]. Internal model theories share the postulate that action control uses internal models, that is, systems that simulate the behaviour of the motor apparatus [@kawato_hierarchical_1987;@jordan_forward_1992]. The function of internal models is to estimate and anticipate the outcome of a motor command. Among the internal model theories, motor control models based on robotic principles [e.g.,@kawato_internal_1999;@wolpert_internal_1995] assume two kinds of internal models (that are supposed to be coupled and regulated): a forward model (or simulator) that predicts the sensory consequences of motor commands from efference copies of the issued motor commands, and an inverse model (or controller) that calculates the feedforward motor commands from the desired sensory states [@gentsch_towards_2016;@loevenbruck_cognitive_2018].

Emulation theories [e.g.,@grush_emulation_2004;@moulton_imagining_2009] borrow from both simulation theories and internal model theories to posit a specific kind of simulation. In the emulation model proposed by @grush_emulation_2004, the *emulator* is a device that implements the same input-output function as the body (i.e., the musculoskeletal system and relevant proprioceptive/kinaesthetic systems)^[In Grush's terminology, *emulator* is used as a synonym for *forward model* [see @grush_emulation_2004, pages 378-379].]. When the emulator receives a copy of the control signal (which is also sent to the body), it produces an output signal (the emulator feedback), identical or similar to the feedback signal produced by the body, yielding mock sensory percepts (e.g., visual, auditory, kinaesthetic) during motor imagery.

<!--
Inner speech, defined as the experience of silently talking to oneself, can be conceived either as the product of the recruitment of abstract linguistic representations (the *format view* or the *abstraction view*), or as as a proper speaking activity [the *activity view* or *motor simulation view*;@Martinez-Manrique2015]. This inner voice can be used intentionnaly or not (e.g., during mind wandering), can  This acticity expresses itself in various ways, depending on the degress of intentionnality, its...
-->

By building upon models of speech motor control [e.g.,@houde_speech_2011;@wolpert_internal_1995], a recent model describes wilful (voluntary) expanded inner speech as "multi-modal acts with multi-sensory percepts stemming from coarse multi-sensory goals" [@loevenbruck_cognitive_2018]. In other words, in this model the auditory and kinaesthetic sensations perceived during inner speech are assumed to be the predicted sensory consequences of speech motor acts, emulated by internal forward models that use the efference copies issued from an inverse model [this proposal shares similarities with the emulation model of motor imagery, @grush_emulation_2004]. It should be noted that both simulation, emulation, and motor control frameworks can be grouped under the *motor simulation view* and altogether predict that the motor system should be involved to some extent during motor imagery, and by extension, during inner speech production. We turn now to a discussion of findings related to peripheral muscular activity during motor imagery and inner speech.

<!--

While the MST postulates that during simulation the motor system is guided exclusively by internal motor representations, the emulation theories suggest that both motor and sensory systems are emulated in parallel [@grush_emulation_2004;@oshea_does_2017].

One important difference between the emulation theory of motor imagery and the MST though, is that according to @grush_emulation_2004 the latter takes the mere activation of efferent motor centres as being sufficient for explaining motor imagery, while the emulation theory postulates that an emulator of the musculoskeletal system is needed [@grush_emulation_2004, pages 384-385]. @grush_emulation_2004 suggested an analogy to illustrate this difference: "The emulation theory claims that motor imagery is like a pilot sitting in a flight simulator, and the pilot’s efferent commands (hand and foot movements, etc.) are translated into faux “sensory” information (instrument readings, mock visual display) by the flight simulator which is essentially an emulator of an aircraft. The simulation theory claims that just a pilot, moving her hands and feet around but driving neither a real aircraft nor a flight simulation, is sufficient for mock sensory information". Alternatively, in the words of @moulton_imagining_2009, instrumental simulations (à la Jeannerod) can be thought of as *first-order* simulations that imitate the content of the simulated action, while emulative simulations can be thought of as *second-order* simulations that imitate both the content and the processes that change the content.

### Explanations for the presence of muscular activity during motor imagery

-->

## Electromyographic correlates of covert actions

Across both simulationist and emulationist frameworks, motor imagery has consistently been defined as the mental rehearsal of a motor action without any overt movement. One consequence of this claim is that, in order to prevent execution, the neural commands for muscular contractions should be blocked at some level of the motor system by active inhibitory mechanisms [for a review, see @guillot_imagining_2012]. Despite these inhibitory mechanisms, there is now abundant evidence for peripheral muscular activation during motor imagery [for a review, see @guillot_contribution_2005;@guillot_electromyographic_2010;@guillot_imagining_2012]. As suggested by @jeannerod_representing_1994, the incomplete inhibition of the motor commands would provide a valid explanation to account for the peripheral muscular activity observed during motor imagery. This idea has been corroborated by studies of changes in the excitability of the motor pathways during motor imagery tasks [for a review, see @stinear_corticospinal_2010]. For instance, @bonnet_mental_1997 measured spinal reflexes while participants were instructed to either press a pedal with the foot or to simulate the same action mentally. They observed that both H-reflexes and T-reflexes increased during motor imagery, and that these increases correlated with the force of the simulated pressure. Using transcranial magnetic stimulation and motor evoked potentials (MEPs), several investigators observed muscle-specific increases of MEPs during various motor imagery tasks, whereas no such increase could be observed in antagonist muscles [e.g.,@fadiga_corticospinal_1999;@rossini_corticospinal_1999]^[As a side note, we should remark that these findings are consistent with both the simulation and the emulation views on motor imagery.].

<!--
Interestingly, the dominant interpretation of the muscular correlates of motor imagery at the beginning of the last century was that the peripheral muscular activity observed during imagined actions was the *source* of the mental content. However, as explained by @jeannerod_motor_2006, this interpretation of mental processes as a consequence of peripheral feedback is now disproved, for instance by the simple fact that many people can experiment motor imagery, without any observable muscular activity^[The *peripheralist* interpretation has also been disproved by the heroic experiment carried out by @smith_lack_1947. Smith used d-tubocurarine (curare) to paralyse his own facial muscles in order to test this interpretation. He later reported that, while being paralysed, he was still able to think in words and to solve mathematical problems.]. In the most recent theoretical explanations of motor imagery (e.g., MST, emulation or internal models theories), the peripheral activity is rather assumed to be a consequence of an incomplete inhibition of motor output during the mental states involving motor simulation/emulation (i.e., these views adhere to a *centralist* interpretation of the physiological correlates of inner speech).

Although there are many observations of a peripheral muscular activity during motor imagery, there are also many studies failing to observe muscle activity, or reporting surprisingly high levels of inter-subject variability, with some participants showing no muscular activity at all [for a review, see @guillot_electromyographic_2010]. Putting aside the discussion on the exact nature and location of the inhibitory mechanisms during motor imagery [see @guillot_imagining_2012], two main explanations have been put forward to resolve these discrepancies. First, the electromyographic activity recorded during motor imagery could be moderated by the perspective taken in motor imagery. A distinction is made between first-person perspective or *internal imagery* (i.e., imagining an action as we would execute it) and third-person perspective or *external imagery* (i.e., imagining an action as an observer of this action), that seem to involve different neural and cognitive processes. It has been shown that a first-person perspective generally results in greater EMG activity than motor imagery in a third-person perspective [@hale_effects_1982;@harris_effects_1986]. Second, some authors have claimed that the intensity of the EMG activity recorded during motor imagery might be related to the individual ability to form an accurate mental representation of the motor skill (i.e., the vividness of the mental image). However, after reviewing the available evidence, @guillot_brain_2009 concluded that this is unlikely to be the case. Alternatively, discrepancies in experimental design and methodological choices (e.g., use of intramuscular versus surface electromyography) could also explain these different results [@guillot_electromyographic_2010].

In the next section, we turn to a discussion of inner speech conceptualised as a kind of motor (and sensory) imagery of speech, and discuss the theoretical underpinnings of this proposition as well as the available empirical evidence in its support.

## What is that little voice inside my head ?

### Inner speech as multimodal verbal imagery

While grasping the concept of a visual image appears as relatively straightforward, it seems more difficult at first to grasp the concept of a motor image, especially when it comes to verbal imagery. The subjective experience of the tension that results from a given position of the articulators and the covert production of an incompatible speech sound permits to substantiate what a motor image is. For instance, it is generally impossible to generate the image of the pronunciation of the sound "b" while keeping the mouth wide opened [e.g.,@binet_psychologie_1886;@stricker_studien_1880]. This simple experiment allows defining imagined speech as the simulation of the corresponding overt verbal content, where *simulation* is meant to be understood either as the off-line rehearsal of neural motor networks involved in the overt action [@jeannerod_motor_2006], or in the terms of the emulation theories discussed previously^[Translated to speech, the MST is similar to previous proposals such as the *motor theory of voluntary thinking* [@cohen_motor_1986] or the hierarchical model of mental practice [@mackay_problem_1981].].
-->

When considered as a form of motor imagery, inner speech production is also expected to be accompanied with peripheral muscular activity in the speech muscles. This idea is supported by many studies showing peripheral muscular activation during inner speech production [e.g.,@livesay_covert_1996;@locke_subvocal_1970-1;@locke_subvocal_1970;@mcguigan_patterns_1989;@mcguigan_discriminative_1974;@sokolov_inner_1972], during auditory verbal hallucinations in patients with schizophrenia [@rapin_emg_2013], or during induced mental rumination [@nalborczyk_orofacial_2017]. Some authors also recently demonstrated that it is possible to discriminate inner speech content based on surface electromyography signals with a median 92% accuracy [@kapur_alterego:_2018]. However, other teams failed to obtain such results [e.g.,@meltzner_speech_2008].

Many of these EMG studies concluded on the involvement of the speech motor system based on a difference in EMG amplitude when contrasting a period of inner speech production with a period of rest. However, as highlighted by @garrity_electromyography:_1977, it is usually not enough to show an increase of speech muscle activity during inner speech to conclude that this activation is related to inner speech production. Three sorts of inference can be made through electromyographic studies of inner speech production, depending on the stringency of the control procedure. The stronger sort of inference is permitted by highlighting a discriminative pattern during covert speech production, as for instance when demonstrating a dissociation between different speech muscles during the production of speech sounds of different phonemic class (e.g, contrasting labial versus non-labial words). According to @garrity_electromyography:_1977, other (weaker) types of control procedures include i) comparing the EMG activity during covert speech production to a baseline period (without contrasting phonemic classes in covert speech utterances), or ii) comparing the activity of speech-related and non-speech related (e.g., forearm) muscle activity. Ideally, these controls can be combined by recording and contrasting speech and non-speech related muscles in different conditions (e.g., rest, covert speech, overt speech) of pronunciation of different speech sounds classes (e.g., labial versus non-labial).

Previous research carried out using the preferred procedure recommended by @garrity_electromyography:_1977 suggest a discriminative patterns of electromyographic correlates according to the phonemic class of the words being covertly uttered [e.g.,@mcguigan_patterns_1989;@mcguigan_discriminative_1974], which would corroborate the *motor simulation view* of inner speech. However, these studies used limited sample sizes (often less than ten participants), worked mostly with children participants and used signal processing methods that are now outdated. These factors limit the generalisability of the above findings because i) low-powered experiments provide biased estimates of effects, ii) following the natural internalisation process, inner speech muscular correlates are expected to weaken with age and iii) a higher sensitivity could be attained by using modern sensors and signal processing methods.

The present study then aims to decide between the *motor simulation view* and the *abstraction view* of inner speech, and can be seen as a conceptual replication and extension of previous works carried out by McGuigan and collaborators [e.g.,@mcguigan_patterns_1989;@mcguigan_discriminative_1974]. We aimed to examine whether it is possible to demonstrate similar dissociations by using surface electromyography recorded over the lip (*orbicularis oris inferior*) and the *zygomaticus major* muscles. More precisely, if the *motor simulation view* is correct, we should observe a higher average EMG amplitude recorded over the OOI during both the overt and inner production of rounded nonwords in comparison to spread nonwords. Conversely, we would expect a lower average EMG amplitude recorded over the ZYG during both the inner and overt production of rounded nonwords in comparison to spread nonwords. In addition, we would not expect to observe content-specific differences in EMG amplitude concerning the non speech-related muscles (i.e., forehead and forearm muscles).



## Methods

In the *Methods* and *Data analysis* sections, we report how we determined our sample size, all data exclusions, all manipulations, and all measures in the study [@simmons_21_2012]. A pre-registered version of our protocol can be found on OSF: [https://osf.io/czer4/](https://osf.io/czer4/).

### Participants

As previous studies of the electromyographic correlates of inner speech were mostly carried out with samples of children or young adults, used different kinds of EMG measures (surface EMG or needle EMG), and different kinds of signal processing methods, it was impractical how to determine the effect size of interest for the current study. Therefore, we used sequential testing as our sampling procedure, based on the method described in @schonbrodt_bayes_2018 and @schonbrodt_sequential_2017. We fixed a statistical threshold to $BF_{10} = 10$ and $BF_{10} = \dfrac{1}{10}$ (i.e., $BF_{01} = 10$), testing the difference between the inner production of labial items versus the inner production of non-labial items on the standardised EMG activity of the lower lip (*orbicularis oris inferior*). In order to prevent potential experimenter and demand biases during sequential testing, the experimenter was blind to BFs computed on previous participants (Beffara, Bret, & Nalborczyk, 2018). All statistical analyses have been automatised and a single instruction was returned to the experimenter (i.e., "keep recruiting participants" or "stop the recruitment"). We fixed the maximum sample size to 100 participants.

As a result of the above sampling procedure, a total of 26 French-speaking undergraduate students in Psychology from the Univ. Grenoble Alpes took part in this experiment, in exchange for course credits^[NB: this procedure did not work optimally because we later spotted a mistake in the EMG signal processing workflow. Thus, the sequential testing stopped earlier than it should have.]. They were recruited via mailing list, online student groups, and posters. Each participant provided a written consent and the present study was approved by the local ethics committee.

### Material

#### EMG recordings

EMG activity was recorded using TrignoTM Mini sensors (Delsys Inc.) at a sampling rate of 1926 samples/s with a band pass of 20 Hz (12 dB/ oct) to 450 Hz (24 dB/oct) and were amplified by a TrignoTM 16-channel wireless EMG system (Delsys Inc.). These sensors consist of two 5 mm long, 1 mm wide parallel bars, spaced by 10 mm, which were attached to the skin using double-sided adhesive interfaces. The skin was cleaned by scrubbing it with 70% isopropynol alcohol. EMG signals were synchronised using the PowerLab 16/35 (ADInstrument, PL3516). Raw data from the EMG sensors were then resampled at a rate of 1 kHz and stored in digital format using Labchart 8 software (ADInstrument, MLU60/8). EMG sensors were positioned over five muscles: the *corrugator supercilii* (COR), the *frontalis* (FRO), the *zygomaticus major* (ZYG), the *orbicularis oris inferior* (OOI), and the *flexor carpi radialis* (FCR). The two speech-related muscles (OOI and ZYG) were chosen to show content-specific EMG correlates, whereas the two non-speech related facial muscles (ZYG and FRO) were chosen to control for higher overall facial muscular activity. We also recorded the activity of the FCR of the non-dominant forearm to control for overall (whole body) higher muscular activity.

We recorded the activity of control and emotion-linked muscles (i.e., COR and FRO) that were positioned on the non-dominant side of the face (i.e., the left side for right-handed participants), while sensors recording the activity of the speech muscles (i.e., ZYG and OOI) were positioned on the dominant side of the face. As reviewed in @everdell_gaze_2007, the dominant side of the face displays larger movements than the left side during speech production, whereas the non-dominant side is more emotionally expressive.

The experiment was video-monitored using a Sony HDR-CX240E video camera to track any visible facial movements. A microphone was placed 20–30 cm away from the participant’s lips to record any faint vocal production during rumination. Stimuli were displayed using the OpenSesame software [@mathot_opensesame:_2012] on a 19-inch colour monitor.

#### Linguistic material {#nonwords}

We selected ten rounded and ten spread bi-syllabic nonwords (see Table \@ref(tab:words)). Each class of nonwords was specifically designed to either induce a greater activation of the lip muscle (rounded items) or a greater activation of the zygomaticus muscle (spread items). Rounded items consisted in the repetition of a syllable containing a bilabial consonant followed by a rounded vowel, whereas spread items consisted in the repetition of a syllable containing a lingual consonant followed by a spread vowel.

<caption>(\#tab:words)</caption>

<caption>*List of bisyllabic nonwords used in the test session.*</caption>



 rounded items    spread items 
---------------  --------------
    /mumu/           /gigi/    
    /pupu/           /sese/    
    /fofo/           /lele/    
    /mymy/           /sisi     
    /pypy/           /didi/    
    /byby/           /nini/    
    /vøvø/          /ʒiʒi/*    
    /pøpø/           /lili/    
    /bøbø/           /ʁiʁi/    
    /mɔ̃mɔ̃/           /gege/    

<center>*Note.* *Because the production of /ʒiʒi/ requires a protrusion of the lips, this item theoretically slightly deviates from other items of this class.</center>

### Procedure

Participants were seated in front of a computer screen while audio stimuli (when applicable) were presented through speakers on both sides of the screen. A video camera was positioned on one side of the screen to monitor facial movements. After positioning of the EMG sensors, each participant underwent a relaxation session aiming to minimise pre-existing inter-individual variability on facial muscle contraction (approximate duration was 330s). This relaxation session was recorded by a trained professional sophrology therapist. Baseline EMG measurements were performed during the last minute of this relaxation period, resulting in 60s of EMG signals at baseline. Subsequently, participants went through a training session, during which they could get familiar with the main task. They trained with 8 stimuli in total (4 rounded nonwords and 4 spread nonwords)^[The training list can be found in the [supplementary materials](#suppCh5).]. Each training stimulus appeared in three conditions (for all participants): overt speech, inner speech and listening. Nonwords to be produced (covertly or overtly) were visually presented on the screen. Then, a central fixation appeared on the screen and the participant overtly or covertly uttered the nonword. This aimed to ensure that participants were actually producing a nonword, not just simply visually scanning it. In the listening condition, the order of these two screens was reversed. A blank screen was first presented, followed by a fixation dot. The audio stimulus was presented when the fixation dot appeared, aiming to ensure that participants did not start by reading the nonword before listening to it, which could induce covert speech production. After the training, participants moved to the experimental part, that included a novel list of 20 nonwords (cf. Table \@ref(tab:words)). Each nonword was presented 6 times in each condition for each participant. The EMG activity was recorded during one second, after each stimulus presentation and during either production or listening. This resulted in 60 observations (60 periods of 1 second) for both classes of nonword in each test condition. The total duration of the experiment ranged between 30 min and 40 min.

### EMG signal processing

EMG signal pre-processing was carried out using Matlab r2014a (Version 8.3.0.532, www.mathworks.fr). The EMG data were high-pass filtered at a cut-off of 20 Hz. Then, output of this first filter was sent to a low-pass filter at a cut-off of 450 Hz, in order to focus on the 20–450 Hz frequency band, following current recommendations for facial EMG studies [@boxtel_optimal_2001;@de_luca_use_1997].

Although participants were explicitly asked to remain still during inner speech production or listening, small facial movements (such as swallowing movements) sometimes occurred. Such periods were excluded from the final sample of EMG signals. To remove these signals, we first divided the EMG signals in periods of 1 second. Then, we visually inspected audio and EMG signals recorded during each trial (a trial corresponds to one second of EMG signal). For the trials during which unwanted activity appeared, we excluded the entire 1-second trial (i.e., we did not include this trial in the final analysis, for any of the recorded muscles). This procedure lead to an average rejection rate of 16.02% (SD = 4.91) in the baseline condition and 13.85% (SD = 7.54) in the other conditions.

After pre-processing and artefact rejection, we computed the by-trial average amplitude of the centred and rectified EMG signal. This provided a score for each muscle of interest (OOI, ZYG, FRO, COR, FCR) in each condition (Baseline, Overt Speech, Inner Speech, Listening) and for each participant. Absolute EMG values are not meaningful as muscle activation is never null, even in resting conditions, due in part to physiological noise. In addition, there are inter-individual variations in the amount of EMG activity in the baseline. To normalise and standardise for baseline activity across participants, we thus expressed the EMG amplitude as a z-score from baseline activity (i.e., we subtracted the mean amplitude of the centred and rectified baseline signal and divided the result by the standard deviation of the centred and rectified baseline signal), thereafter referred to as $\delta$.

### Data analysis

Statistical analyses were conducted using `R` version 3.5.0 [@R-base], and are reported with the `papaja` [@R-papaja] and `knitr` [@R-knitr] packages. We analysed data using *Condition* (3 modalities: speech, inner speech, and listening) and *Class* of nonwords (2 modalities, rounded and spread, contrast-coded) as within-subject categorical predictors, and the standardised EMG amplitude as a dependent variable in a multivariate (i.e., with multiple outcomes) Bayesian multilevel linear model (BMLM)^[An introduction to Bayesian statistics is outside the scope of this paper. However, the interested reader is referred to @nalborczyk_introduction_2019, for an introduction to Bayesian multilevel modelling using the `brms` package.]. In order to take into account the dependencies between repeated observations by participant, we also included in this model a varying intercept by participant. Contrary to what we pre-registered, we used a multivariate model (instead of separate models by muscle). This allowed us to estimate the correlation between each pair of muscles. Models were fitted with the `brms` package [@R-brms] and using weakly informative priors (see the [supplementary materials](#suppCh5) for code details). Two Markov Chain Monte-Carlo (MCMC) chains were run for each model to approximate the posterior distribution, including each 5.000 iterations and a warmup of 2.000 iterations. Posterior convergence was assessed examining trace plots as well as the Gelman-Rubin statistic $\hat{R}$. Constant effect estimates were summarised via their posterior mean and 95% credible interval (CrI), where a credible interval can be considered as the Bayesian analogue of a classical confidence interval. When applicable, we also report Bayes Factors (BFs), computed using the Savage-Dickey method, which consists in taking the ratio of the posterior density at the point of interest divided by the prior density at that point. These BFs can be interpreted as an updating factor, from prior knowledge (what we knew before seeing the data) to posterior knowledge (what we know after seeing the data).

## Results

The *Results* section is divided into two parts. First, we present results from confirmatory (preregistered) analyses, aiming to test whether it is possible to dissociate the activity of the OOI and the ZYG during inner speech production, according to the content of inner speech (here, the class of nonword to be produced). More precisely, we expected an increased EMG activity of the OOI during the inner production of rounded nonwords in comparison to spread nonwords. Conversely, we expected elevated EMG activity of the ZYG during the inner production of spread nonwords in comparison to rounded nonwords. Second, we present results from exploratory (non-preregistered) analyses.

To foreshadow the results, we did not observe such a clear dissociation between the EMG activity of the OOI and the ZYG muscles, neither in the inner speech condition nor in the overt speech condition. Contrary to theoretical expectations based on phonetics and speech production theory **(e.g., Fromkin, 1966; Ladefoged & Johnson, 2006, Lieberman & Blumstein, 1989; Zemlin, 1968)**, the activity of both muscles was of higher amplitude for the pronunciation of rounded nonwords (as compared to spread nonwords) during overt speech production. Additionally, the EMG amplitude on both muscles of interest was similar during the inner production (or listening) of the two classes of nonwords. However, in the *exploratory analyses* section, we report results from supervised machine learning algorithms (classification using random forests), showing a reasonable accuracy to classify EMG signals according to the class of nonwords during overt speech production. This strategy was however unsuccessful for the inner speech and the listening conditions.

Before to move to the statistical results, we represent the distribution of the whole dataset, by class, by condition and by muscle for the two main muscles of interest (OOI and ZYG) in Figure \@ref(fig:generalplot). More precisely, the first row of this figure represents the distribution of the standardised EMG scores in the inner speech condition, the second row depicts the distribution of these scores in the listening condition, whereas the third row depicts the distribution of the standardised EMG scores in the overt speech condition. The first column depicts the distribution of the standardised EMG scores recorded over the OOI muscle whereas the second one represents the distribution of the standardised EMG scores recorded over the ZYG muscle. Each individual data point is represented as a vertical bar along the x-axis of each panel whereas the vertical coloured line represents the class-specific median. Additionally, a vertical dashed line is plotted at zero, which represents the baseline level. Thus, a positive value on the x-axis represents EMG standardised scores that are higher than baseline^[We also created a `shiny` application [@R-shiny] allowing for further visual exploration of the data by muscle, by condition, and by participant, in the 3D space formed by three (to be chosen) muscles. This application is available online (https://barelysignificant.shinyapps.io/3d_plotly/) and the associated code is available in the OSF repository ([https://osf.io/czer4](https://osf.io/czer4)).].

![(\#fig:generalplot)Distribution of standardised EMG scores by class and by muscle. The first row corresponds to the inner speech condition, the second one to the listening condition, and the third one to the overt speech condition. The first column depicts the EMG amplitude recorded over the OOI muscle while the second column represents the EMG amplitude recorded over the ZYG muscle. Each individual data point is represented as a vertical bar along the x-axis. The vertical coloured line represents the by-class median.](05-chap5_files/figure-docx/generalplot-1.png)

### Confirmatory (preregistered) analyses

#### Bayesian multivariate multilevel Gaussian model

We then compared the standardised EMG amplitude $\delta$ for each muscle in each condition (Overt Speech, Inner Speech, Listening) by fitting a multivariate multilevel Gaussian model (as detailed previously in the Methods section). We predicted an higher increase of OOI activity during the production of rounded items in comparison to spread items and conversely, a higher increase of ZYG activity during the inner production of rounded items in comparison to spread items. These predictions should also apply to the overt speech condition (and to the listening condition). We should not observe any by-class differences of FRO and COR activity in any condition.



<caption>(\#tab:outputbmod1)</caption>

<caption>*Estimates from the Gaussian BMLM concerning the OOI and the ZYG.*</caption>



Response   Term                   Estimate   SE     Lower   Upper   Rhat   BF01   
---------  ---------------------  ---------  -----  ------  ------  -----  -------
OOI        Inner Speech           1.87       0.42   1.02    2.66    1.00   0.02   
OOI        Listening              1.73       0.37   1.03    2.48    1.00   0.00   
OOI        Overt Speech           16.19      1.96   12.38   19.95   1.00   0.00   
OOI        Inner Speech x Class   0.11       0.19   -0.28   0.47    1.00   43.73  
OOI        Listening x Class      -0.14      0.27   -0.67   0.38    1.00   32.53  
OOI        Overt Speech x Class   0.70       0.27   0.18    1.22    1.00   1.29   
ZYG        Inner Speech           0.01       0.04   -0.07   0.10    1.00   237.72 
ZYG        Listening              0.02       0.04   -0.06   0.10    1.00   218.90 
ZYG        Overt Speech           1.77       0.22   1.32    2.23    1.00   0.00   
ZYG        Inner Speech x Class   0.01       0.03   -0.05   0.06    1.00   360.68 
ZYG        Listening x Class      0.00       0.04   -0.08   0.08    1.00   263.36 
ZYG        Overt Speech x Class   1.35       0.04   1.27    1.42    1.00   0.00   

<center>*Note.* For each muscle (response), the first three lines represent the estimated average
amplitude in each condition, and its standard error (SE).
The three subsequent rows represent the estimated average difference between the two classes
of nonwords in each condition (i.e., the interaction effect). The 'Lower' and 'Upper' columns
    contain the lower and upper bounds of the 95\% CrI, while the 'Rhat' column reports the Gelman-Rubin statistic.
    The last column reports the Bayes factor in favour of the null hypothesis (BF01).</center>

The results of this model are summarised in Table \@ref(tab:outputbmod1). This table reports the estimated average EMG amplitude in each condition and the corresponding BF^[As they are not the main focus of interest here and for the sake of clarity, descriptive results for the other two facial muscles and for the forearm muscle are reported in the supplementary materials.]. This analysis revealed that the EMG amplitude of the OOI was higher than baseline (the standardised score was above zero) in every condition whereas it was only the case in the overt speech condition for the ZYG. Crucially, we did not observe the hypothesised difference according to the class of nonwords on the OOI during inner speech production ($\beta$ = 0.108, 95% CrI [-0.281, 0.466], BF~01~ = 43.727) nor on the ZYG ($\beta$ = 0.007, 95% CrI [-0.047, 0.057], BF~01~ = 360.677).

Figure \@ref(fig:predbmod1) depicts these results by representing the distribution of the raw data (coloured dots) along with the predictions from this model. The black dots and vertical intervals represent the predicted mean and associated 95% credible interval for each class of non-word, each condition and for the OOI and the ZYG. Coherently with Table \@ref(tab:outputbmod1), this figure shows that the fitted model predicts no noticeable differences between the two classes of non-words in any condition for the OOI muscle. However, it predicts a higher average EMG amplitude associated with the rounded item as compared to the spread items in the overt speech condition for the ZYG muscle.

![(\#fig:predbmod1)Raw data along with posterior predictions of the first model for the OOI and the ZYG muscles. Dots represent the mean prediction of this model by condition, while the vertical error bars represent the 95\% credible intervals around the mean.](05-chap5_files/figure-docx/predbmod1-1.png)

Before proceeding further with the interpretation of the results, it is essential to check the quality of this first model. A useful diagnostic of the model's predictive abilities is known as *posterior predictive checking* (PPC) and consists in comparing observed data to data simulated from the posterior distribution [e.g.,@gelman_bayesian_2013]. The idea behind PPC is that a good model should be able to generate data that resemble the observed data [@gabry_visualization_2019]. In this vein, Figure \@ref(fig:ppcbmod1) represents the distribution of the whole dataset (across all participants and conditions) by muscle (the dark blue line) along with the distribution of hypothetical datasets generated from the posterior distribution of the model (the light blue lines). As can be seen from this Figure, the distributions of the data generated from the model differ considerably from the distribution of the observed data. Therefore, in the next section, we turn to a more appropriate model for these data.

![(\#fig:ppcbmod1)Posterior predictive checking for the first model concerning the OOI and ZYG muscles. The dark blue line represents the distribution of the raw data (across all conditions) while light blue lines are dataset generated from the posterior distribution.](05-chap5_files/figure-docx/ppcbmod1-1.png)

<!--
### Bayesian multivariate multilevel Skew-Normal model

The previous figure reveals an important failure of the first model, as it fails to generate data that look like the data we have collected. More precisely, the data we collected looks highly right-skewed (as we observed in previous experiments). To improve on the Gaussian model, we then assume in the following a Skew-normal distribution for the likelihood. The Skew-normal distribution is a generalisation of the Gaussian distribution with three parameters $\xi$ (xi), $\omega$ (omega), and $\alpha$ (alpha) for location, scale, and shape (skewness), respectively^[NB: the Gaussian distribution can be considered a special case of the Skew-normal distribution when $\alpha = 1$.]. As can been seen in Figure \@ref(fig:ppcbmod2), this model is better than the first model at predicting the observed data, although this is still not perfect.



![(\#fig:ppcbmod2)Posterior predictive checking for the second model concerning the OOI and ZYG muscles. The dark blue line represents the distribution of the raw data while light blue lines are dataset generated from the posterior distribution.](05-chap5_files/figure-docx/ppcbmod2-1.png)

The results of this second model are summarised in Table \@ref(tab:outputbmod2) and Figure \@ref(fig:predbmod2).

<caption>(\#tab:outputbmod2)</caption>

<caption>*Estimates from the Skew-normal BMLM concerning the OOI and the ZYG.*</caption>



Response   Term                   Estimate   SE     Lower   Upper   Rhat   BF01   
---------  ---------------------  ---------  -----  ------  ------  -----  -------
OOI        Inner Speech           7.80       0.14   7.53    8.09    1.00   0.00   
OOI        Listening              7.75       0.14   7.46    8.01    1.00   0.00   
OOI        Overt Speech           12.14      0.11   11.93   12.36   1.00   0.00   
OOI        Inner Speech x Class   0.05       0.15   -0.25   0.33    1.00   64.33  
OOI        Listening x Class      -0.04      0.21   -0.45   0.38    1.00   45.52  
OOI        Overt Speech x Class   1.65       0.19   1.27    2.03    1.00   0.00   
ZYG        Inner Speech           0.61       0.02   0.58    0.64    1.00   0.00   
ZYG        Listening              0.60       0.02   0.58    0.64    1.00   0.00   
ZYG        Overt Speech           1.33       0.01   1.31    1.36    1.00   0.00   
ZYG        Inner Speech x Class   0.01       0.02   -0.04   0.05    1.00   431.60 
ZYG        Listening x Class      0.00       0.03   -0.06   0.06    1.00   325.28 
ZYG        Overt Speech x Class   0.71       0.03   0.65    0.76    1.00   0.00   

<center>*Note.* For each muscle (response), the first three lines represent the estimated average
amplitude in each condition, and its standard error (SE).
The three subsequent rows represent the estimated average difference between the two classes
of nonwords in each condition (i.e., the interaction effect). The 'Lower' and 'Upper' columns
    contain the lower and upper bounds of the 95\% CrI, while the 'Rhat' column reports the Gelman-Rubin statistic.</center>

According to this second model, the EMG amplitude of the OOI was higher than baseline (the standardised score was above zero) in every condition whereas it was only the case in the overt speech condition for the ZYG. We did not observed the hypothesised difference according to the class of nonwords on the OOI during inner speech production ($\beta$ = 0.046, 95% CrI [-0.25, 0.329], BF~01~ = 64.331) nor on the ZYG ($\beta$ = 0.007, 95% CrI [-0.035, 0.048], BF~01~ = 431.595).

![(\#fig:predbmod2)Raw data along with posterior predictions of the second model for the OOI and the ZYG muscles. Dots represent the mean prediction of this model by condition (concerning the location parameter) whereas the vertical error bars represent the 95\% credible intervals.](05-chap5_files/figure-docx/predbmod2-1.png)

-->

#### Bayesian multivariate multilevel distributional Skew-Normal model

The previous figure reveals an important failure of the first model, as it fails to generate data that look like the data we have collected. More precisely, the collected data look right-skewed, as it usually happens with physiological measurements. To improve on the Gaussian model, we then assume a Skew-normal distribution for the response variable (the standardised EMG amplitude $\delta$). The Skew-normal distribution is a generalisation of the Gaussian distribution with three parameters $\xi$ (xi), $\omega$ (omega), and $\alpha$ (alpha) for location, scale, and shape (skewness), respectively^[NB: the Gaussian distribution can be considered a special case of the Skew-normal distribution when $\alpha = 1$.]. In addition, we also improve the first model by turning it into a *distributional model*, that is, a model in which we can specify predictor terms for all parameters of the assumed response distribution [@R-brms]. More precisely, we use this approach to predict both the location, the scale, and the skewness of the Skew-Normal distribution (whereas the first model only allowed predicting the mean of a Gaussian distribution). As can been seen in Figure \@ref(fig:ppcbmod3), this second model seems better than the first one at generating data that look like the observed data.



![(\#fig:ppcbmod3)Posterior predictive checking for the Skew-Normal model concerning the OOI and ZYG muscles. The dark blue line represents the distribution of the raw data while light blue lines are dataset generated from the posterior distribution.](05-chap5_files/figure-docx/ppcbmod3-1.png)

<caption>(\#tab:outputbmod3)</caption>

<caption>*Estimates from the distributional Skew-Normal model concerning the OOI and the ZYG.*</caption>



Response   Term                   Estimate   SE     Lower   Upper   Rhat   BF01     
---------  ---------------------  ---------  -----  ------  ------  -----  ---------
OOI        Inner Speech           2.35       0.04   2.28    2.44    1.00   0.00     
OOI        Listening              2.12       0.04   2.04    2.19    1.00   0.00     
OOI        Overt Speech           17.38      0.21   16.97   17.78   1.00   0.00     
OOI        Inner Speech x Class   0.04       0.03   -0.02   0.10    1.00   118.39   
OOI        Listening x Class      -0.02      0.04   -0.09   0.06    1.00   237.23   
OOI        Overt Speech x Class   1.64       0.18   1.28    1.99    1.00   0.00     
ZYG        Inner Speech           0.04       0.00   0.02    0.04    1.00   0.00     
ZYG        Listening              0.04       0.01   0.03    0.05    1.00   0.00     
ZYG        Overt Speech           1.91       0.02   1.86    1.95    1.00   0.00     
ZYG        Inner Speech x Class   0.00       0.01   -0.01   0.02    1.00   1,089.34 
ZYG        Listening x Class      0.00       0.01   -0.02   0.02    1.00   856.03   
ZYG        Overt Speech x Class   0.64       0.03   0.58    0.70    1.00   0.00     

<center>*Note.* For each muscle (response), the first three lines represent the estimated average
amplitude in each condition, and its standard error (SE).
The three subsequent rows represent the estimated average difference between the two classes
of nonwords in each condition (i.e., the interaction effect). The 'Lower' and 'Upper' columns
    contain the lower and upper bounds of the 95\% CrI, while the 'Rhat' column reports the Gelman-Rubin statistic.
    The last column reports the Bayes factor in favour of the null hypothesis (BF01).</center>

The estimates of this second model are summarised in Table \@ref(tab:outputbmod3) and Figure \@ref(fig:predbmod3). According to this model, the EMG amplitude of the OOI was higher than baseline (the estimated standardised score was above zero) in every condition whereas it was only the case in the overt speech condition for the ZYG. We did not observe the hypothesised difference according to the class of nonwords during inner speech production, neither on the OOI  ($\beta$ = 0.043, 95% CrI [-0.015, 0.103], BF~01~ = 118.391) nor on the ZYG ($\beta$ = 0.005, 95% CrI [-0.011, 0.021], BF~01~ = 1089.341).

![(\#fig:predbmod3)Raw data along with posterior predictions of the third model for the OOI and the ZYG muscles. Dots represent the mean prediction of this model by condition (concerning the location parameter) whereas the vertical error bars represent the 95\% credible intervals.](05-chap5_files/figure-docx/predbmod3-1.png)

Predictions from this model are visually represented in Figure \@ref(fig:predbmod3). This figure differs from Figure \@ref(fig:predbmod1) (showing the predictions of the Gaussian model) in that the second model (the Skew-normal model) predicts shifts in location for both the OOI and the ZYG muscles according the class of non-word in overt speech prediction. In contrast, the first model (the Gaussian model) predicted a by-class difference only for the ZYG muscle.

### Exploratory (non-preregistered) analyses

In the previous section, we tried to predict the average EMG amplitude by condition on each single muscle. Although this approach was appropriate to tackle our initial research question (i.e., can we distinguish muscle-specific EMG correlates of inner speech production?), it is not optimal to answer more general questions such as "can we predict the content of inner speech based on the available EMG data?". In Figure \@ref(fig:2Demg), we depict the distribution of the by-word averaged EMG scores in the 2D space formed by the OOI and the ZYG muscles. This figure reveals that although different nonwords produced in overt speech seem difficult to discriminate on the basis of a single muscle (cf. Figure \@ref(fig:generalplot)), it seems easier to discriminate them in the space formed by two muscles (here OOI and ZYG). More precisely, the two classes of nonwords seem to form two separate clusters in the overt speech condition, but these clusters do not seem discriminable in the inner speech or in the listening condition.

![(\#fig:2Demg)Average EMG activity for each nonword in each condition, in the 2D space formed by the OOI and the ZYG.](05-chap5_files/figure-docx/2Demg-1.pdf)

In other words, it is easier to discriminate these signals in the multidimensional space of all speech muscles, rather than by considering each muscle independently. Thus, we used a supervised machine learning algorithm aiming to classify speech signals according to the class of nonwords. Broadly, the machine learning approach seeks to find a relationship between an input $X$ (e.g., EMG recordings over the four facial muscles) and an output $Y$ (e.g., the class of nonwords). Once trained, it allows predicting a value of the output based on some input values, whose prediction can be evaluated against new observations.

We used a random forest algorithm, as implemented in the `caret` package [@R-caret]. Random forests (RFs) represent an ensemble of many decision trees (a forest), which allow predictions to be made based on a series of decision rules (e.g., is the score on predictor $x_{1}$ higher or lower than $z$ ? If yes, then ..., if not, then ...). The specificity of RFs is to combine a large number of trees (usually above 100 trees), and to base the final conclusion on the average of these trees, thus preventing overfitting. We used three separate RFs to classify EMG signals in each condition (Overt Speech, Inner Speech, and Listening).

To evaluate the performance of this approach, we report the raw accuracy (along with its resampling-based 95% confidence interval), or the proportion of data points in the test dataset for which the RF algorithm predicted the correct class of nonwords. First, we randomly split the entire dataset into a training (80%) and a test set (20%). The training set was used for the learning while the test set was used to evaluate the predictions of the algorithm. To prevent overfitting, we used repeated 10-fold cross-validation during the learning phase.

#### Predicting the class of nonwords during overt speech production

We first tried to predict the class of nonwords produced in overt speech, based on the activity of the four facial muscles (OOI, ZYG, COR, FRO). Each predictor was centred to its mean and standardised before the analysis.



<caption>(\#tab:CMovert)</caption>

<caption>*Confusion matrix with by-class error for the overt speech condition.*</caption>



 Prediction    rounded    spread    class.error 
------------  ---------  --------  -------------
  rounded        971       165         0.145    
   spread        204       956         0.176    

This analysis revealed an overall classification accuracy of 0.841, 95% CI [0.809, 0.87]. The relative importance of each feature (i.e., each muscle) for prediction is represented in Figure \@ref(fig:VarImpOvert).

![(\#fig:VarImpOvert)Scaled variable importance for overt speech classification.](05-chap5_files/figure-docx/VarImpOvert-1.png)

This figure reveals that the muscles containing most information to discriminate the two classes of nonwords are the ZYG and the OOI, whereas, as predicted, forehead muscles do not seem to strongly contribute to predictive accuracy during overt speech production.

#### Predicting the class of nonwords during inner speech production and listening

We then applied the same strategy (the same algorithm) to the signals recorded in the inner speech and listening conditions. The results of these analyses are reported in Table \@ref(tab:CMinner) and Table \@ref(tab:CMlistening).



<caption>(\#tab:CMinner)</caption>

<caption>*Confusion matrix with by-class classification error for the inner speech condition.*</caption>



 Prediction    rounded    spread    class.error 
------------  ---------  --------  -------------
  rounded        460       550         0.545    
   spread        517       532         0.493    

This analysis revealed an overall classification accuracy of 0.508, 95% CI [0.464, 0.552] in the inner speech condition, which indicates that the RF algorithm did not allow discriminating the two classes of nonwords better than random guessing.



<caption>(\#tab:CMlistening)</caption>

<caption>*Confusion matrix with by-class classification error for the listening condition.*</caption>



 Prediction    rounded    spread    class.error 
------------  ---------  --------  -------------
  rounded        512       517         0.502    
   spread        525       490         0.517    

This analysis similarly revealed an overall classification accuracy of 0.488, 95% CI [0.444, 0.533] in the listening condition.

## Discussion

With this study we aimed to replicate and extend previous findings showing that facial electromyography can be used to discriminate inner speech content [e.g.,@mcguigan_patterns_1989; @mcguigan_discriminative_1974]. As these studies used small samples of children, our study aimed to examine whether such results can be reproduced using surface electromyography and modern signal processing methods in an adult sample.

To this end, it was crucial to first show that the EMG correlates of our two classes of nonwords were discriminable during overt speech production. Surprisingly, the data we collected during overt speech production do not corroborate the hypothesis according to which the average EMG amplitude of the OOI should be higher during the production of "rounded" nonwords as compared to "spread" nonwords. For both orofacial speech muscles (OOI and ZYG), the average EMG amplitude was higher for rounded nonwords than for spread nonwords during overt speech production. Moreover, while the average EMG amplitude recorded over speech muscles was higher than baseline in both the inner speech and listening conditions, we did not find differences of activation according to the content of the material (the class of nonword). An automatic classification approach, using the four facial muscles, revealed that although it was possible to discriminate EMG signals related to the two classes of nonwords with a reasonable accuracy during overt speech production, this approach failed in discriminating these two classes during inner speech production or during listening. We also observed a higher EMG amplitude recorded over the facial (both orofacial and non-orofacial) muscles during inner speech production and during the listening of speech production than during rest. However, as pinpointed by @garrity_electromyography:_1977, this observation is not sufficient to conclude that these activations were actually related to inner speech production, because i) both orofacial speech-related muscles and forehead non-speech related muscles showed similar EMG amplitude changes from baseline and ii) we did not observe different changes in EMG amplitude depending on the content of inner speech (i.e., depending on the class of nonword to be uttered).

Before discussing the theoretical implications of these results, two main issues are worth discussing. First, how can we explain that rounded nonwords were associated with higher EMG amplitude during overt speech on both OOI and ZYG muscles? Second, how can we explain the indiscriminability of inner speech content, which seems to contradict classic as well as recent findings in the field [e.g.,@kapur_alterego:_2018]? We turn to each of these questions in the following.

To answer the first question, we began by comparing our results to results obtained by another group [@eskes_predicting_2017]. The authors of this study recorded surface EMG activity from five participants while they were producing seven facial expressions and five isolated vowel sounds (/a/, /e/, /i/, /o/, /u/). They recorded EMG activity over eight facial muscles (the zygomaticus major (ZYG), the risorius (RIS), the orbicularis oris superior (OOS) and inferior (OOI), the mentalis (MEN), the depressor anguli oris (DAO), the levator labii superioris (LLS) muscles, and the digastric muscle (DIG)). We divided these vowels in two classes to fit our own classes of nonwords. More precisely, we have created the following two classes: a *rounded* class, composed of the vowels /o/ and /u/, and a *spread* class, composed of the vowels /e/ and /i/^[We did not include the vowel /a/ because it theoretically does not fit in one of these two categories.]. We present the average EMG amplitude recorded over the OOI and the ZYG according to the vowel class in Table \@ref(tab:eskes).



<caption>(\#tab:eskes)</caption>

<caption>*Standardised EMG amplitude recorded over the OOI and the ZYG during overt speech production of rounded versus spread vowels in Eskes et al. (2017).*</caption>



 Muscle     Item      Observations    Mean      SD      Median    Histogram 
--------  ---------  --------------  -------  -------  --------  -----------
  OOI      rounded         50         59.7     60.09    42.03     ▇▃▂▁▁▁▁▁  
  OOI      spread          50         22.15    11.92    20.65     ▇▆▇▂▂▂▁▁  
  ZYG      rounded         50         7.39     3.78      6.27     ▇▅▃▁▁▁▁▁  
  ZYG      spread          50         10.15     6.2      7.99     ▇▆▂▂▁▁▁▁  

<center>*Note.* The number of observations is given by the number of vowels to be pronunced in each category (2) times the number of repetitions (5) times the number of participants (5), for a total of 50 observations per cell. </center>

We notice that @eskes_predicting_2017 have indeed observed the dissociation we initially predicted, that is, that the EMG amplitude recorded over the OOI was higher during the pronunciation of rounded vowels than during pronunciation of spread vowels, while the reverse pattern was observed concerning the ZYG^[Paired-samples Wilcoxon signed rank tests revealed a significant shift in location (pseudomedian) between rounded and spread items for the OOI ($\beta$ = 24.12, 95% CI [15.19, 40.77], V = 1184, p < .001) with rounded items being associated with a higher location than spread items. This analysis revealed a significant shift in the inverse direction concerning the ZYG ($\beta$ = -1.51, 95% CI [-2.94, -0.48], V = 275, p < .001).]. However, one crucial difference between @eskes_predicting_2017 design and ours is the complexity of the linguistic material. Whereas @eskes_predicting_2017 used single phonemes, we chose to use bisyllabic nonwords to increase the ecological validity of the paradigm. Although these nonwords were specifically created to theoretically increase the engagement of either the OOI or the ZYG (see section \@ref(nonwords)), it is reasonable to expect differences in the average EMG amplitude between the phoneme and the (non)word level. More precisely, we expect the *average* EMG amplitude associated with the production of a given phoneme (e.g., /y/) to be impacted by the production of the consonant (e.g., /b/) it is paired with, due to coarticulation. More generally, we could hypothesise that the difference between the *average* EMG amplitude recorded during the production of the phoneme /i/ and during the production of the phoneme /y/ could be reduced when these phonemes are coarticulated in CV or CVCV sequences like /byby/ or /didi/. In other words, we might expect an interaction effect between the structure of the to-be produced speech sequence (either a single vowel or a CV/CVCV sequence) and the class of the vowel. This is coherent with previous findings showing that the muscular activity associated with vowels production is strongly influenced by the surrounding consonants in CVC sequences [e.g.,@fromkin_neuro-muscular_1966]. Thus, further investigations should focus on how the average EMG amplitude is impacted by coarticulation during the production of CVCV sequences.

With regards to inner speech, our results do not support theoretical predictions of the *motor simulation view*, according to which it should be possible to discriminate classes of nonwords produced in inner speech based on EMG signals. Whereas this outcome is consistent with some recent results [@meltzner_speech_2008]^[The authors of this study were able to obtain high classification accuracies during both overt and mouthed speech but not during covert speech, despite the fact that they used eleven sensors on the neck and the lower face. However, words were only repeated three times, which might have lead to poor sensitivity. Interestingly and despite the lack of peripheral muscular activation during covert speech, they have observed similar respiratory activity between overt and covert speech, echoing previous findings [e.g.,@conrad_speech_1979].], it also stands in sharp contrast with classical results in the field [e.g.,@mcguigan_patterns_1989;@mcguigan_discriminative_1974] as well as more recent developments. For instance, @kapur_alterego:_2018 developed a wearable device composed of seven surface EMG sensors that can attain a 92% median classification accuracy in discriminating internally vocalised digits. There are a few crucial differences between @kapur_alterego:_2018's work and ours that stand as good candidates to explain the discrepancies between our results. First, the strategy adopted to position the sensors was radically different. Following guidelines from the field of psychophysiology, our strategy was to position sensors precisely over the facial muscles of interest, aligned with the direction of the muscle fibers and in theoretically optimal positions to record activity of this muscle while reducing cross-talk. However, precisely because of pervasive cross-talk in facial surface EMG recordings, this strategy, whereas maximising the probability of recording activity from a given single muscle, was also (as a result) reducing the probability of recording activity from potentially speech-relevant neighbour muscles. Therefore, this strategy might work sub-optimally when the goal of the experiment is to extract the maximum amount of (relevant) EMG information to discriminate inner speech content. However, this problem might be mitigated by using more sensors and a more lenient sensor-positioning approach. Whereas we recorded the EMG amplitude over only two lower facial muscles (OOI and ZIG), @kapur_alterego:_2018 analysed EMG data from seven different sensors, whose position and number was defined iteratively in order to maximise the classification accuracy. In other words, the parameters of the experiment were iteratively optimised to maximise a certain outcome (classification accuracy). This strategy is radically different from the classical approach in experimental and cognitive psychology where experimental conditions are defined to test theoretically derived hypotheses. Whereas the first approach is arguably more efficient at solving a particular problem at hand, the second approach might be more efficient in tackling theoretical questions. For instance, a recent study reported a greater EMG amplitude of laryngeal and lip muscles during auditory verbal tasks (covert singing) than during visual imagery tasks [@pruitt_covert_2018]. By coupling EMG recording with demographic and psychological measures, they were able to show that these correlates were related to the level of accuracy in singing, thus shedding light upon the nature and functions of peripheral muscular activity during covert singing.

Putting aside considerations related to methodological aspects of the present study, these results do not corroborate the *motor simulation view* of inner speech production. Instead, it seems to support the *abstraction view*, which postulates that inner speech results from the activation of abstract linguistic representations. However, individual differences in discriminability highlight that the abstractness of inner speech might be flexible [@oppenheim_motor_2010]. Indeed, although for most participants it was not possible to discriminate the content of inner speech, it was possible to discriminate the content of inner speech for two of them (S_15 and S_17). This suggests either that the extent to which inner speech production recruits the speech motor system might vary between individuals or that it might vary within individual depending on the properties of the ongoing task (these two suggestions are not mutually exclusive). For instance, we know from early research on the EMG correlates of inner speech that the average amplitude of these correlates tend to be higher when the task is more difficult [i.e., requires more effort, @sokolov_inner_1972]. As such, the extent to which inner speech production recruits the speech motor system could be moderated by manipulating the difficulty of the ongoing task. In addition, we know that the electromyographic activity recorded during motor imagery could be moderated by the perspective taken in motor imagery. A distinction is made between first-person perspective or *internal imagery* (i.e., imagining an action as we would execute it) and third-person perspective or *external imagery* (i.e., imagining an action as an observer of this action), that seem to involve different neural and cognitive processes. It has been shown that a first-person perspective generally results in greater EMG activity than motor imagery in a third-person perspective [@hale_effects_1982;@harris_effects_1986]. Moreover, the first-person perspective tends to be associated with more kinaesthetic feelings than the third-person one (which relies more heavily on visual percepts). While the perspective issue does not apply to inner speech production, we hypothesise that involvement of the speech motor system during inner speech production may be moderated by the specific instructions given to the participants. For instance, by instructing participants to focus on *inner speaking* (imagining speaking), instead of *inner hearing* (imagining hearing), and by asking them to focus on the kinaesthetic feelings related to speech acts (rather than on auditory percepts), we would expect to find a higher average EMG amplitude recorded over the speech muscles.

Of course, the current study and the above discussion should be interpreted with a few words of caution in mind. Although the number of observations reported in the present study is reasonable^[For each class of nonwords, we collected around 6 x 10 = 60 observations by condition and by participant. For 26 participants and two classes of nonwords, this results in 26 (participants) x 120 (individual trials) x 3 (conditions) = 9360 observations. However, after rejecting trials with movement artefacts, we had 7997 observations in total.], the sensibility of the experiment could be improved by increasing the number of observations and/or by reducing two important sources of variation. More precisely, one could reduce the variance related to the item (the specific nonword being uttered) by selecting nonwords that are more similar to each other in the way they are uttered, by selecting less items or simpler items. Similarly, particular attention should be devoted to reducing inter-participant variability, which could be done by using more guided and specific instructions, as well as a longer training phase to familiarise the participant with the task.

In summary, we have demonstrated that while surface electromyography may lead to reasonable accuracy in discriminating classes of nonwords during overt speech production (using signals recorded over only two speech-related muscles), it did not permit to discriminate these two classes during inner speech production. These results, in comparison with results obtained by other teams [e.g.,@kapur_alterego:_2018], highlight that depending on the aim of the research, different strategies might be more or less successfully pursued. More precisely, if the goal is to attain high classification accuracy (problem-solving approach), then the parameters of the experiment (e.g., number of repetitions, number of sensors, position of the sensors, parameters of the signal processing workflow) should be optimised based on the desired outcome (i.e., classification accuracy). However, the classical laboratory strategy used in experimental and cognitive psychology, aiming to compare specific conditions (or muscles) to each other in a controlled environment, is deemed to be more appropriate when the aim of the research is to sharpen our understanding of the psychological phenomenon under study.

## Supplementary materials {#suppCh5}

Pre-registered protocol, open data, as well as reproducible code and figures are available at [https://osf.io/czer4](https://osf.io/czer4).

Aside from previously cited packages, several other packages have been used for the writing of this paper, among which the `ggrepel` and `ggplot2` packages for plotting [@R-ggrepel;@R-ggplot2] as well as the `tidyverse`, `sjstats`, `here`, `skimr`, and `glue` packages for code writing and formatting [@R-tidyverse;@R-sjstats;@R-glue;@R-here;@R-skimr].

## Acknowledgements

This project was funded by the ANR project INNERSPEECH (grant number ANR-13-BSH2-0003-01). The first author of this manuscript is funded by a fellowship from Univ. Grenoble Alpes.

<!-- create a new page for the summary -->
\newpage

<!-- center the box vertically, with a parameter to specify the ratio of space above to space below -->
\begin{vplace}[1]

\begin{summary}{Summary of Chapter\getcurrentref{chapter}}

Blah blah...

\end{summary}

\end{vplace}
