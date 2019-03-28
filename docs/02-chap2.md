# Methodological framework



This chapter aims to provide the key concepts related to the methods we used in our work. More precisely, in this chapter we cover the technical concepts related to either electromyography and the statistical approach we followed in our work. Finally, we will give an overview of the following chapters.

## Speech production mechanisms

### Speech production muscles

...

### Muscles of interest

In the current work, we were especially interested in the activity of the orofacial muscles (i.e., the muscles situated around the mouth). More precisely, we were particulary interested in the *orbicularis oris inferior* and *orbicularis oris superior* muscles. As can be seen from Figure XX, these two muscles are actually parts of a broad sphyncter muscle that permis the contraction and aperture of the mouth...

For sesors placement, we follow guidelines from... 

- *Orbicularis oris inferior*: inferior portion of the *orbicularis oris* (mouth sphincter), serves to contract the lips and to compress them eogether and forward...

- *Zygomaticus major*: ...

- *Lateral frontalis*: ...

- *Flexor carpi radialis*: serves to raise the outer and middle brow... the elelectrode is place on a vertical line tha travers the pupil of the eye (during centrred gaze)...

## A brief introduction to electromyography

<!--
Muscular activity can be studied at different levels. At the cellular level, electrophysiological measures via micro-electrodes implanted in the cell allow direct measures of **action potential**. At the segmental level, biomechanics study muscular activity using surface sensors, positionned on the skin...
-->

Technically speaking, electromyography (EMG) is an experimental technique concerned with the recording and analysis of myoelectric signals (i.e., signals that are the result of physiological variations in the state of muscle fibers membranes). Broadly speaking, EMG is a measure of the electrical activity generated during muscle contraction. It is used both as a basic tool in (for instance) biomechanical and psychophysiology studies and as an evaluation tool in applied research (e.g., physiotherapy, rehabilitation, human-computer interfaces). To facilitate the interpretation of the EMG signal, it is useful to detail briefly the meaning of its physiological components. 

### The nature of the EMG signal

#### Muscular anatomy

A muscle is a collection of fibers that can vary in length, orientation, diameter, and architectural characteristics (see Figure XX). For instance, deeper muscle fibers seem to be composed of a greater proportion of slow-twitch fibers (type I muscle fibers) whereas more superficial muscle fibers comprise a greater poportion of larger and fast-twitch fibers [type II muscles fibers, @kamen_essentials_2010]. Another important factor affecting the interpetation of the EMG signal is *muscle partitioning*, that is, the fact that many muscles are particioned, with each portion having a specific role in the muscle function. In addition, there is no one-to-one mapping between population of motor neurons and muscle compartments.

<!-- Insert an illustration of muscle fibers here... -->

#### The action potential

The musce is a tissue, surrounded by a member, the *sarcolemna*. Under resting conditions... Muscle fibers are excitable tissues. When a muscular fiber is depolarised, the *membrane potential* produces a response called the *muscle fiber ation potential* or *motor action potential* (MAP). The generated action potential proceeds along the muscle fiber in both directions from the neuromuscular junction [@kamen_essentials_2010], as illustrated in Figure \@ref(fig:mfap).

\begin{figure}[H]

{\centering \includegraphics[width=0.75\linewidth]{assets/mfap} 

}

\caption{Time course of the muscle fiber action potential (from Kamen \& Gabriel, 2010).}(\#fig:mfap)
\end{figure}

The MAP is followed by a *refractory period*, during which there is a decrease in membrane excitability. This refractory period can be further decoposed in an *absolute* refrctory period durinf which all $\text{Na}^{+}$ channels are closed, and a *relative* refractory period where some $\text{Na}^{+}$ channels are opent (but to a lesser extent thant before the musular impulse). Interestingly, this after-impule hyperpolarisation limis the frequency of MFAPs [@kamen_essentials_2010]. 

#### The motor unit

The *motor unit* is the smallest controllable muscular unit. It consists of a single $\alpha$-motoneuron, its neurosmuscular junction, and all the muscle fibers it innervates. The number of motor units and their *innervation ratio* (i.e., the number of muscle fibers per motor unit) can vary by muscle. For instance, large muscles have hundreds of motor units and an invervation of a few thousands whereas small muscles have thousands of motor units bu can have an innervation ratio of 10 to 20 per motor unit.

#### Motor unit action potential

Since multiple fibers can be innervated by a single motoneuron, the firing of a single motoneuron results in the simultaneous discharge of many muscle fibers. The **motor unit action potential** (MUAP) is the electric field resulting from the sum of the electric fiels emitted by each fiber of the motor unit. In other words, it represents the spatiotemporal summation of individual MAPs originating from muscle fibers that are sufficiently close to a given electrode. This generates a *train* of MUAPs, called **motor unit action potential trains** (MUAPTs). The electric potential generated by this field is highly dependent of parameters such as the number of fibers, their length, the speed of conduction and position of the neuromuscular junction.

\begin{figure}[H]

{\centering \includegraphics[width=0.75\linewidth]{assets/muap} 

}

\caption{Motor unit action potential representation.}(\#fig:muap)
\end{figure}

In brief, the EMG signal results from a mixture of recruited motor units. It is composed of the sum of all MUAPs.

### EMG instrumentation

For an historical perspective, see also https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1455479/pdf/bpo_v8_p11_m115.pdf

Many factors can affect the recorded EMG signals, such as: the size and shape of the electrode, the inter-electrode distance... Throughout the current work, we used a standardised equipment...

Factors that influence the EMG signal: causative (extrinsic, intrinsic), intermediate and deterministic [@de_luca_use_1997]...

@fridlund_guidelines_1986 emphasise the importance of six factors determining the quality of the recorded surface EMg signals. these factors are i) the proximity of the electrode to the underlying muscle mass, ii) the position of the elctrode relative to muscule fibers size, location, and orientation...

(External) factors influencing the EMG signal: i) tissue characteristics (thickness, physiological changes and temperature), nb: vary greatly from subject to subject, ii) physiological cross-talk produced by neighbouring muscles but ECG spies can also interfer with the EMG recording (especially in the upper trunk or shoulder muscles), iii) external noise in noisy electrical environments (e.g., electrical power), iv) electrodes and amplifiers...

See van Boxtel 2001...

...*crosstalk* phenomenon [@de_luca_use_1997]. In reason of the important... of facial muscles, the EMG activity of one recorded muscle generally does not represent the activity of a single muscle but rather a mixture of... @Rapin2011...

Skin: preparation...removing the hair and cleaning the skin. The skin should have  alight red color, which indicates a proper cleaning and a good skin impedance condition.

Different types of electrodes: surface lectrodes, active electrodes, indwelling electrodes, needle eectrodes, wire electrodes...

Fine-Wire and Needle electrodes are modstly used in rehabiilitation for diagnostis of muscle function and nerve conduction [@fridlund_guidelines_1986]...

Placement of EMG sensors: we follow the atlas provided by @fridlund_guidelines_1986...

Advantages of surface electrodes... they broadly detect the firing of aggregates of MUAPs that ... hwoever, they are nonselective (i.e., they cannot be nterpreted as reflecting the activity of a single muscle), in comaprison to instrted needle electrodes. As a results, it is usually inapproparite, when using surface EMG, to attribute the results to a single muscle [@fridlund_guidelines_1986]. Whereas for the sake of simplicity/clarity we designate sensors by the name of the underlying muscle (e.g., "FRO" for the *frontalis* site), it should be kept in mind that these sensors reflect the activity of "sites", rather than single muscles.

Disadvantages: can only record surface muscles (and not deep muscles)...

### EMG signal processing

The raw (or filtered) EMG signal is a stochastic train of MUAPs. When heard through a speaker, the raw EMG signal sounds like popcorn popping [@fridlund_guidelines_1986]. Therefore, it is usually unsuitable for immediate quantification. In order to illustrate what the EMG signal looks like, we simulated EMG data based on a standard algorithm implemented in the `biosignalEMG` package [@R-biosignalEMG], which is represented in Figure \@ref(fig:emgplot1).

\begin{figure}[H]

{\centering \includegraphics[width=1\linewidth]{02-chap2_files/figure-latex/emgplot1-1} 

}

\caption{Simulated EMG signal.}(\#fig:emgplot1)
\end{figure}

We usually rectify the EMG signal by taking its absolute value and substracting the mean in order to correct for any offset (bias) present in the raw data. This operation is represented in Figure \@ref(fig:emgplot2).

\begin{figure}[H]

{\centering \includegraphics[width=1\linewidth]{02-chap2_files/figure-latex/emgplot2-1} 

}

\caption{Rectified EMG signal.}(\#fig:emgplot2)
\end{figure}

From there, two main measures can be used to represent the magnitude of a muscle activity^[But see for instance @phinyomark_feature_2012 for a brief overview of other features that can be extracted from the surface EMG signals.]. The first one is the *mean absolute value* (MAV), which is computed over a specific interval and where $|x_{n}|$ is the absolute value of a datum of EMG in the data window.

<!--
These measures reflect two main categories know either as signal *integration* or signal *smoothing*. Whereas the *integration* is simply the temporal summation (or accumulation) of EMG activity, the *smoothing* is simply a form a low-pass filtering, enveloppe detection, ar a type of averaging of the signal...
-->

$$MAV = \frac{1}{N} \sum_{n=1}^{N} | x_{n} |$$

The unit of measurement is $mV$ or $\mu V$, and the MAV calculation is generally similar to the numerical formula for integration [@kamen_essentials_2010]. The second one is the *root-mean-square* (RMS) amplitude:

$$RMS = \sqrt \frac{1}{N} \sum_{n=1}^{N} | x^{2}_{n} |$$

where $| x^{2}_{n} |$ is the squared value of each EMG datum and has both physical and physiological meanings. Put broadly, the RMS it taken to reflect the level of the physiological activities in the motor unit during contraction. Both the MAV and the RMS are illustrated in Figure Figure \@ref(fig:emgplot3).

\begin{figure}[H]

{\centering \includegraphics[width=1\linewidth]{02-chap2_files/figure-latex/emgplot3-1} 

}

\caption{Illustration of the MAV (in orange) and RMS (in green) values.}(\#fig:emgplot3)
\end{figure}

For facial EMG studies, it is also recommend to filter... Studes have generally show that the primary energy of surface EMg signals lie between 10 and 200Hz [@fridlund_guidelines_1986]. For facial surface EMG stdies more specifically...

Transition toward the statistical modelling approach...

## Statistical modelling and statistical inference

### Limitations of the standard statistical approach in Psychology

Numerous authors have highlighted the limitations inherent to the Null-Hypothesis Significance Testing (NHST) approach and the (exclusive) reliance on *p*-values and significance testing [e.g.,@bakan_test_1966;@Gigerenzer2004;@Kline2004;@Lambdin2012;@meehl_theory-testing_1967;@trafimow_manipulating_2018]. Considering these limitations, some authors have recommended to push away significance testing and to develop the use of effect size estimates and confidence intervals in order to favour accumulation of evidence and a meta-analytical mode of thinking [e.g.,@Cumming2012;@cumming_new_2014].

However, the apparent superiority of confidence intervals over *p*-values is an illusion. Indeed, as noted by many observers, confidence intervals are simply inverted significance tests. In other words, the confidence interval represents the range of values that are significant at some $\alpha$ level. Therefore, compared to a *p*-value, a confidence interval does not bring *any* new inferential value. Morevoer, its interpretation might be as hard as the interpretation of *p*-values. For instance, contrary to a widely shared belief, confidence intervals do not contain the $(1 - \alpha) \cdot 100$% most probable values of the parameter [e.g.,@morey_fallacy_2015;@nalborczyk_pragmatism_2019].

That being said, it is fair to acknowledge that using confidence intervals (instead of or in addition to single *p*-values) do shift the emphasis from a mechanical (mindless) point-hypothesis testing procedure to a more careful consideration of the range of values that are *compatible* with some hypothesis. More importantly, it emphasises the uncertainty that accompanies every statistical procedure. Indeed, we think that most of the caveats that are attributed to a specific statistical procedure (e.g., to NHST) are really caveats of the way it is used. Namely, the fact that is used in a categorical and absolute way. This tendency has been coined as *dichotomania* (i.e., the tendency to consider that results are either present --if significant-- or absent --if non-significant--), or *trichotomania* (e.g., when considering evidence ratios thresholds).

These biases have been highlighted by many statisticians in the past [e.g.,@wasserstein_asas_2016]. Very recently, *The American Statistician* published a special issue on *Moving to a Wold Beyond "p<.05"*, with the intention to provide new recommendations for users of statistics (e.g., researchers, policy makers, journalists). This issue comprises 43 original papers aiming to provide new guidelines and practical alternatives to the mindless use of statistics. In the accompanying editorial, @wasserstein_moving_2019 summarise these recommendations in the form of the ATOM guidelines: "**A**ccept uncertainty. Be **t**houghtful, **o**pen, and **m**odest." We describe below how our statistical approach might be understood in the light of these core principles.

- **Accept uncertainty**: we try to represent and to acknowledge uncertainty in our analyses and conclusions. For instance, we do not conclude and/or infer that an effect is either "present" or "absent", but we report the *estimated* magnitude of the effect and the uncertainty that comes with this estimation. Additionally, when relevant, we report probabilistic statements based on the posterior distribution.

- **Be thoughtful**: for each analysis opportunity (i.e., for each dataset to analyse), we consider what would be the most appropriate modelling strategy but we also acknowledge that there is no unique best way. In most empirical chapters, we clearly distinguish between confirmatory (preregistered) and exploratory (non-preregistered) statistical analyses. We routinely evaluate the *validity* of the statistical model (and of its assumptions) and we are suspicious of statistical *defaults*. We try to consider the *practical* significance of the results, rather than their *statistical* significance. We use a variety of statistics (e.g., effect sizes, interval estimates, information criteria) to obtain a more diverse picture of the meaning of the results.

- **Be open**: the soundness of a statistical procedure (and more generally, of an inferential procedure) can only be evaluated if it is made transparent to peers and readers for critical examination. Therefore, we take some space in the next section (but also in each experimental chapter) to motivate our statistical modelling decisions. We also make all `R` scripts available to ensure the reproducibility of the analyses. We try to be exhaustive in the way we report our analyses and we beware of shortcuts than can hinder important information for the reader.

- **Be modest**: we recognise that there is no unique "true statistical model" and we discuss the limitations of our analyses and of our conclusions. We also recognise that scientific inference is much broader than statistical inference (e.g., a degenerative research program is much more informative than a non-significant *p*-value). We try not to conclude anything from a single study without the warranted uncertainty.

To sum up, we try to acknowledge the uncertainty that accompanies every (statistical) inference. In the next section, we present in more details what our approach does entail and we introduce some key technical concepts.

### Current statistical approach

In brief, we tried to move from the point-hypothesis mechanical testing to an approach that emphasises parameter estimation, model comparison, and continuous model expansion [e.g.,@Cumming2012;@cumming_new_2014;@gelman_data_2006;@gelman_bayesian_2013;@R-rethinking;@kruschke_doing_2015;@kruschke_bayesian_2018;@kruschke_bayesian_2018-1]. In other words, our approach can be defined as a *statistical modelling* approach rather than a *statistical testing* approach. It means that we try to *model* the data (or rather the process that generated the data), rather than to "test" it. We carefully consider what could be the process that generated the data and we try to model it appropriately. For instance, we do not fit reaction time data, likert data, or electromyographic data using the same model (e.g., an ANOVA), as this practice would lead to high rates of erroneous inferences.

Throughout this work, we use Bayesian statistical modelling, not by dogmatism, but because we think the Bayesian approach provides richer inferences than the frequentist one (while the later can be subsumed under the first under particular assumptions). The main advantage of the Bayesian aproach is the explicit use of probability to model the uncertainty (see Box \ref{logic}). By doing so, the Bayesian approach permits to evaluate the probability of a parameter (or a vector of parameters) $\theta$, given a set of data $y$:

$$p(\theta|y) = \frac{p(y|\theta)p(\theta)}{p(y)}$$

Using this equation (known as Bayes' theorem), a probability distribution $p(\theta|y)$ can be derived (called the *posterior distribution*), that reflects knowledge about the parameter, given the data and the prior information. This distribution is the goal of any Bayesian analysis and contains all the information needed for inference.

The term $p(\theta)$ corresponds to the *prior distribution*, which specifies the prior information about the parameters (i.e., what is known about $\theta$ before observing the data) as a probability distribution. The left hand of the numerator $p(y|\theta)$ represents the *likelihood*, also called the *sampling distribution* or *generative model*, and is the function through which the data affect the posterior distribution. The likelihood function indicates how likely the data are to appear, for each possible value of $\theta$. Finally, $p(y)$ is called the *marginal likelihood*. It is meant to normalise the posterior distribution, that is, to scale it in the "probability world". It gives the "probability of the data", summing over all values of $\theta$ and is described by $p(y) = \sum_{\theta} p(\theta) p(y|\theta)$ for discrete parameters, and by $p(y) = \int p(\theta) p(y|\theta) d\theta$ in the case of continuous parameters.

All this pieced together shows that the result of a Bayesian analysis, namely the posterior distribution $p(\theta|y)$, is given by the product of the information contained in the data (i.e., the likelihood) and the information available before observing the data (i.e., the prior). This constitutes the crucial principle of Bayesian inference, which can be seen as an updating mechanism. To sum up, Bayes' theorem allows a prior state of knowledge to be updated to a posterior state of knowledge, which represents a compromise between the prior knowledge and the empirical evidence.

\vspace{2mm}

\begin{mybox}[label = logic]{Probability theory as extended logic}

Probability theory has been argued to be nothing more than \textit{extended logic}. In other words, it generalises the rules of logic that apply to discrete events (e.g., TRUE of FALSE events) to continuous cases. By doing this move, probability theory gives a way to represent and to quantify the \textit{uncertainty}. Importantly, the rules of probability have the same status as the rules of logic: these rules can be used to derive statements (conclusions) that are guaranteed to be correct given that some premises are correct.\\

Bayesian statistics can simply be presented as an application of probability theory to statistical analysis. Whereas the dependence of the inferential conclusions on prior assumptions is usually presented as a downside of this type of analysis, it is precisely what makes them \textit{optimal} or \textit{coherent} (in the sense of respecting the rules of probability). As put by Vandekerckhove (2018), the claim that Bayesian methods would be invalidated by their reliance on prior assumptions would be akin to conclude that logical deductions are somehow invalidated because they depend on premises.\\

\end{mybox}

We also use *multilevel models* (also known as *mixed-models*) to handle complex dependency structures and to obtain more precise estimates. A more accurate description of Bayesian multilevel models is outside the scope of this introductory section but the interested reader is redirected toward several existing tutorial papers [e.g.,@nalborczyk_introduction_2019;@nicenboim_statistical_2016;@sorensen_bayesian_2016]. Throughout this work, we also make us of several tools with very distinct properties and uses. For instance, we use Bayes factors (BFs) to quantify the relative evidence for a statistical hypothesis (see Box \ref{BF}), we use information criteria to assess the predictive abilities of our models (see Box \ref{IC}), we use posterior predictive checks as well as a diagnostics tools (e.g., convergence indexes, trace plots) to assess the validity of our models, and we use summary statistics when appropriate to convey the meaning of the main results.

\vspace{2mm}

\begin{mybox}[label = BF]{What is a Bayes factor ?}

It is a rule in statistics that every statistics has already been suggested as the \textit{new statistics}. Confidence intervals have been suggested as a replacement to p-values, being purpotedly more informative and less difficult to interpret. Credible intervals have been suggested as a replacement to confidence intervals, for roughly the same reasons. Bayesian hypothesis testing through Bayes factors (BFs) has also been suggested as a replacement for frequentist hypothesis testing. It has been argued that they permit a richer inference and that they come with a more straightforward interpretation. Whereas this might be true, they nonetheless come with their lot of misinterpretations.\\

To highlight what BFs are and what they are not, it might be useful to write down the formula used to compute them. To this end, it is useful to write the Bayes rule in its \textit{odds form}, making the BF explicitly visible:

$$\underbrace{\dfrac{p(H_{0}|D)}{p(H_{1}|D)}}_{posterior\ odds} = \underbrace{\dfrac{p(D|H_{0})}{p(D|H_{1})}}_{Bayes\ factor} \times \underbrace{\dfrac{p(H_{0})}{p(H_{1})}}_{prior\ odds}$$

This equation reveals that the \textit{posterior odds}, the ratio of the posterior probability (i.e., how much more probable is hypothesis 1 ($H_{1}$) as compared to hypothesis 2 ($H_{2}$), after seeing the data $D$), is equal to the ratio of the probability of the data given the first hypothesis and the probability of the data given the second hypothesis, multiplied by the \textit{prior odds} (i.e., how much more probable was hypothesis 1 ($H_{1}$) as compared to hypothesis 2 ($H_{2}$), before seeing the data $D$).\\ 

Importantly, what we condider as \textit{evidence} in the Bayesian framework is also known as a \textit{marginal likelihood} and represents the information contained in the data, weighted by the prior information. It is a sum when parameters are discrete or an integral when paramaters are continuous.

$$\text{evidence}\ = p(D|H) = \int p(\theta|H) p(D|\theta,H) \text{d}\theta$$

Therefore, the BF does not indicate how much "probable" a hypothesis is, or how much more probable a hypothesis is, compared to another one (this would be to conflate the BF with the posterior odds). Instead, the BF can be (should be) interpreted either i) as a ratio of two \textit{marginal likelihoods} (i.e., a ratio of \textit{evidence}) or ii) as an updating factor, that indicates how we should reallocate credibility from prior knowledge (what we knew before seeing the data) to posterior knowledge (what we know after seeing the data).

\end{mybox}

Bayes factors are often said to have desirable asymptotic (when the number of observations is very large) properties. Indeed, they are *consistent* for model identification. It means that if a *true* statistical model is in the set of models that are compared, using a BF will usually lead to selecting this *true* model with a probability approaching 1 with increasing sample size. Whereas this seems an appealing property, it also poses a challenge to the underlying statistical philosophy. Indeed, one could question whether it is sensible to assume a "true model" (an oxymoron) in real life, especially in the social sciences [e.g.,@burnham_model_2002;@burnham_multimodel_2004]. As @findley_unbiasedness_1985 notes: *"[...] consistency can be an undesirable property in the context of selecting a model"*. A more realistic question is then not to look for the *true* model, but for the *best* model from some practical purpose.

The usefulness of information criteria comes from their being approximations of the *out-of-sample deviance* of a model (see Box \ref{IC}). In the current PhD work, we used generalisations of the AIC (especially the WAIC and LOOIC) that also approximate the out-of-sample deviance and as such give an indication of how good/bad a model is to predict future (i.e., non-observed) data.

\vspace{2mm}

\begin{mybox}[label = IC]{Information criteria}

Hirotugu Akaike noticed that the negative log-likehood of a model + 2 times its number of parameters was approximately equal to the \textbf{out-of-sample deviance} of a model, which lead to what is nowadays known as the \textit{Akaike information criterion} (AIC):

$$\text{AIC} = \underbrace{\underbrace{-2\log(\mathcal{L}(\hat{\theta}|\text{data}))}_{\text{in-sample deviance}} + 2K}_{\approx\ \text{out-of-sample deviance}}$$

Where $K$ is the number of parameters of the model and the \textit{deviance} is a measure of discrepancy between the data and the model. Interestingly, we can make a distinction between two types of deviances.\\

First, the \textbf{in-sample deviance} indicates how bad a model is to explain the current dataset (the dataset used to fit the model). Second, and more importantly, the \textbf{out-of-sample deviance} indicates how bad a model is to explain a \textbf{future} dataset issued from the same data generation process (the same population).

\end{mybox}

In brief, in the present work, we used various methods but coherently with a few (nuanced) guiding principles. Namely, we favoured a *model comparison* approach [e.g.,@burnham_model_2002;@burnham_multimodel_2004;@judd_data_2009], we used several statistics when they provide complementary information (e.g., using both posterior probabilities, information criteria or BFs), we assessed the validity of our models (e.g., via posterior predictive checks), we reported these analyses transparently and we tried to convey uncertainty in our conclusions.

## Overview of the following chapters

The experiment ran during this PhD will be presented as five empirical chapters that can be grouped under two main axes. In the first couple of experiments, we used surface electromyography and muscle-specific relaxation to investigate the involvement of the speech motor system during induced verbal and non-verbal rumination (Chapter 3 & 4). In Chapter 5, we used surface electromyography and machine learning algorithms to decode the musle-specific EMG correlates of inner speech production. In the last couple of experiments, we switched strategy from the "correlates strategy" to the "interference strategy", where the goal was to directly interfere with the activity of the speech motor system. More precisely, we used articulatory suppression to disrupt induced rumination in Chapter 6, and we used articulatory suppression to disrupt either induced rumination or problem-solving in Chapter 7. Finally, in Chapter 8, we summarise the main findings, discuss their implications and suggest ways forward from both a theoretical and an experimental perspective.
