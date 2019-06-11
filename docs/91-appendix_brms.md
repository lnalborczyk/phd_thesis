# An Introduction to Bayesian Multilevel Models Using brms: A Case Study of Gender Effects on Vowel Variability in Standard Indonesian {#appendix-brms}



<!-- NB: You can add comments using these tags -->

## Abstract

Bayesian multilevel models are increasingly used to overcome the limitations of frequentist approaches in the analysis of complex structured data. This paper introduces Bayesian multilevel modelling for the specific analysis of speech data, using the brms package developed in `R`. In this tutorial, we provide a practical introduction to Bayesian multilevel modelling, by reanalysing a phonetic dataset containing formant (F1 and F2) values for five vowels of Standard Indonesian (ISO 639-3:ind), as spoken by eight speakers (four females), with several repetitions of each vowel. We first give an introductory overview of the Bayesian framework and multilevel modelling. We then show how Bayesian multilevel models can be fitted using the probabilistic programming language `Stan` and the `R` package `brms`, which provides an intuitive formula syntax. Through this tutorial, we demonstrate some of the advantages of the Bayesian framework for statistical modelling and provide a detailed case study, with complete source code for full reproducibility of the analyses (https://osf.io/dpzcb/).^[This chapter is a published paper reformatted for the need of this thesis. Source: Nalborczyk, L., Batailler, C., L\oe venbruck, H., Vilain, A., & Bürkner, P.-C. (2019). An Introduction to Bayesian Multilevel Models Using brms: A Case Study of Gender Effects on Vowel Variability in Standard Indonesian. *Journal of Speech, Language, and Hearing Research, 62*(5), 1225-1242. https://doi.org/10.1044/2018_JSLHR-S-18-0006.]

## Introduction

The last decade has witnessed noticeable changes in the way experimental data are analysed in phonetics, psycholinguistics, and speech sciences in general. In particular, there has been a shift from analysis of variance (ANOVA) to *linear mixed models*, also known as *hierarchical models* or *multilevel models* (MLMs), spurred by the spreading use of data-oriented programming languages such as `R` [@R-base], and by the enthusiasm of its active and ever growing community. This shift has been further sustained by the current transition in data analysis in social sciences, with researchers evolving from a widely criticised point-hypothesis mechanical testing [e.g.,@bakan_test_1966;@Gigerenzer2004;@Kline2004;@Lambdin2012;@trafimow_manipulating_2018] to an approach that emphasises parameter estimation, model comparison, and continuous model expansion [e.g.,@Cumming2012;@cumming_new_2014;@gelman_data_2006;@gelman_bayesian_2013;@kruschke_doing_2015;@kruschke_bayesian_2018-1;@kruschke_bayesian_2018;@mcelreath_statistical_2016].

MLMs offer great flexibility in the sense that they can model statistical phenomena that occur on different levels. This is done by fitting models that include both constant and varying effects (sometimes referred to as *fixed* and *random* effects). Among other advantages, this makes it possible to generalise the results to unobserved levels of the *groups* existing in the data [e.g., stimulus or participant, @janssen_twice_2012]. The multilevel strategy can be especially useful when dealing with repeated measurements (e.g., when measurements are nested into participants) or with unequal sample sizes, and more generally, when handling complex dependency structures in the data. Such complexities are frequently found in the kind of experimental designs used in speech science studies, for which MLMs are therefore particularly well suited.

The standard MLM is usually fitted in a frequentist framework, with the `lme4` package [@R-lme4] in R [@R-base]. However, when one tries to include the maximal varying effect structure, this kind of model tends either not to converge, or to give aberrant estimations of the correlation between varying effects [e.g.,@bates_parsimonious_2015]^[In this context, the *maximal varying effect structure* means that any potential source of systematic influence should be explicitly modelled, by adding appropriate varying effects.]. Yet, fitting the maximal varying effect structure has been explicitly recommended [e.g.,@barr_random_2013-1]. In contrast, the maximal varying effect structure can generally be fitted in a Bayesian framework [@bates_parsimonious_2015;@sorensen_bayesian_2016;@nicenboim_statistical_2016;@eager_mixed_2017].

Another advantage of Bayesian statistical modelling is that it fits the way researchers intuitively understand statistical results. Widespread misinterpretations of frequentist statistics (like p-values and confidence intervals) are often attributable to the wrong interpretation of these statistics as resulting from a Bayesian analysis [e.g.,@dienes_bayesian_2011;@Hoekstra2014;@Gigerenzer2004;@kruschke_bayesian_2018;@morey_fallacy_2015]. However, the intuitive nature of the Bayesian approach might arguably be hidden by the predominance of frequentist teaching in undergraduate statistical courses.

Moreover, the Bayesian approach offers a natural solution to the problem of multiple comparisons, when the situation is adequately modelled in a multilevel framework [@scott_bayes_2010;@gelman_why_2012], and allows *a priori* knowledge to be incorporated in data analysis via the prior distribution. The latter feature is particularily relevant when dealing with contraint parameters or for the purpose of incorporating expert knowledge.

The aim of the current paper is to introduce Bayesian multilevel models, and to provide an accessible and illustrated hands-on tutorial for analysing typical phonetic data. This paper will be structured in two main parts. First, we will briefly introduce the Bayesian approach to data analysis and the multilevel modelling strategy. Second, we will illustrate how Bayesian MLMs can be implemented in R by using the `brms` package [@R-brms] to reanalyse a dataset from @mccloy_phonetic_2014 available in the `phonR` package [@R-phonR]. We will fit Bayesian MLMs of increasing complexity, going step by step, providing explanatory figures and making use of the tools available in the `brms` package for model checking and model comparison. We will then compare the results obtained in a Bayesian framework using `brms` with the results obtained using frequentist MLMs fitted with `lme4`. Throughout the paper, we will also provide comments and recommendations about the feasability and the relevance of such analysis for the researcher in speech sciences.

### Bayesian data analysis

The Bayesian approach to data analysis differs from the frequentist one in that each parameter of the model is considered as a random variable (contrary to the frequentist approach which considers parameter values as unknown and fixed quantities), and by the explicit use of probability to model the uncertainty [@gelman_bayesian_2013]. The two approaches also differ in their conception of what *probability* is. In the Bayesian framework, probability refers to the experience of uncertainty, while in the frequentist framework it refers to the limit of a relative frequency (i.e., the relative frequency of an event when the number of trials approaches infinity). A direct consequence of these two differences is that Bayesian data analysis allows researchers to discuss the probability of a parameter (or a vector of parameters) $\theta$, given a set of data $y$:

$$p(\theta|y) = \frac{p(y|\theta)p(\theta)}{p(y)}$$

\vspace{5mm}

Using this equation (known as Bayes' theorem), a probability distribution $p(\theta|y)$ can be derived (called the *posterior distribution*), that reflects knowledge about the parameter, given the data and the prior information. This distribution is the goal of any Bayesian analysis and contains all the information needed for inference.

The term $p(\theta)$ corresponds to the *prior distribution*, which specifies the prior information about the parameters (i.e., what is known about $\theta$ before observing the data) as a probability distribution. The left hand of the numerator $p(y|\theta)$ represents the *likelihood*, also called the *sampling distribution* or *generative model*, and is the function through which the data affect the posterior distribution. The likelihood function indicates how likely the data are to appear, for each possible value of $\theta$.

Finally, $p(y)$ is called the *marginal likelihood*. It is meant to normalise the posterior distribution, that is, to scale it in the "probability world". It gives the "probability of the data", summing over all values of $\theta$ and is described by $p(y) = \sum_{\theta} p(\theta) p(y|\theta)$ for discrete parameters, and by $p(y) = \int p(\theta) p(y|\theta) d\theta$ in the case of continuous parameters.

All this pieced together shows that the result of a Bayesian analysis, namely the posterior distribution $p(\theta|y)$, is given by the product of the information contained in the data (i.e., the likelihood) and the information available before observing the data (i.e., the prior). This constitutes the crucial principle of Bayesian inference, which can be seen as an updating mechanism [as detailed for instance in @kruschke_bayesian_2018-1]. To sum up, Bayes' theorem allows a prior state of knowledge to be updated to a posterior state of knowledge, which represents a compromise between the prior knowledge and the empirical evidence.

The process of Bayesian analysis usually involves three steps that begin with setting up a probability model for all the entities at hand, then computing the posterior distribution, and finally evaluating the fit and the relevance of the model [@gelman_bayesian_2013]. In the context of linear regression, for instance, the first step would require to specify a likelihood function for the data and a prior distribution for each parameter of interest (e.g., the intercept or the slope). We will go through these three steps in more details in the application section, but we will first give a brief overview of the multilevel modelling strategy.

### Multilevel modelling {#MLM}

MLMs can be considered as "multilevel" for at least two reasons. First, an MLM can generally be conceived as a regression model in which the parameters are themselves modelled as outcomes of another regression model. The parameters of this second-level regression are known as *hyperparameters*, and are also estimated from the data [@gelman_data_2006]. Second, the multilevel structure can arise from the data itself, for instance when one tries to model the second-language speech intelligibility of a child, who is considered within a particular class, itself considered within a particular school. In such cases, the hierarchical structure of the data itself calls for hierarchical modelling. In both conceptions, the number of levels that can be handled by MLMs is virtually unlimited [@mcelreath_statistical_2016]. When we use the term *multilevel* in the following, we will refer to the structure of the model, rather than to the structure of the data, as non-nested data can also be modelled in a multilevel framework.

As briefly mentioned earlier, MLMs offer several advantages compared to single-level regression models, as they can handle the dependency between units of analysis from the same group (e.g., several observations from the same participant). In other words, they can account for the fact that, for instance, several observations are not independent, as they relate to the same participant. This is achieved by partitioning the total variance into variation due to the groups (level-2) and to the individual (level-1). As a result, such models provide an estimation of the variance component for the second level (i.e., the variability of the participant-specific estimates) or higher levels, which can inform us about the generalisability of the findings [@janssen_twice_2012;@mcelreath_statistical_2016].

Multilevel modelling allows both *fixed* and *random* effects to be incorporated. However, as pointed out by @gelman_analysis_2005, we can find at least five different (and sometimes contradictory) ways of defining the meaning of the terms *fixed* and *random* effects. Moreover, @gelman_data_2006 remarked that what is usually called a *fixed* effect can generally be conceived as a *random* effect with a null variance. In order to use a consistent vocabulary, we follow the recommendations of @gelman_data_2006 and avoid these terms. We instead use the more explicit terms *constant* and *varying* to designate effects that are constant, or that vary by groups^[Note that MLMs are sometimes called *mixed models*, as models that comprise both *fixed* and *random* effects.].

A question one is frequently faced with in multilevel modelling is to know which parameters should be considered as varying, and which parameters should be considered as constant. A practical answer is provided by @mcelreath_statistical_2016, who states that "any batch of parameters with *exchangeable* index values can be and probably should be pooled". For instance, if we are interested in the categorisation of native versus non-native phonemes and if for each phoneme in each category there are multiple audio stimuli (e.g., multiple repetitions of the same phoneme), and if we do not have any reason to think that, for each phoneme, audio stimuli may differ in intelligibility in any systematic way, then repetitions of the same phoneme should be pooled together. The essential feature of this strategy is that *exchangeability* of the lower units (i.e., the multiple repetitions of the same phoneme) is achieved by conditioning on indicator variables (i.e., the phonemes) that represent groupings in the population [@gelman_bayesian_2013].

To sum up, multilevel models are useful as soon as there are predictors at different levels of variation [@gelman_bayesian_2013]. One important aspect is that this varying-coefficients approach allows each subgroup to have a different mean outcome level, while still estimating the global mean outcome level. In an MLM, these two estimations inform each other in a way that leads to the phenomenon of *shrinkage*, that will be discussed in more detail below (see section \@ref(shrink)).

As an illustration, we will build an MLM starting from the ordinary linear regression model, and trying to predict an outcome $y_{i}$ (e.g., second-language (L2) speech-intelligibility) by a linear combination of an intercept $\alpha$ and a slope $\beta$ that quantifies the influence of a predictor $x_{i}$ (e.g., the number of lessons received in this second language):

$$
\begin{aligned}
y_{i} &\sim \mathrm{Normal}(\mu_{i}, \sigma_{e}) \\
\mu_{i} &= \alpha + \beta x_{i} \\
\end{aligned}
$$

\vspace{5mm}

This notation is strictly equivalent to the (maybe more usual) following notation:

$$
\begin{aligned}
y_{i} &= \alpha + \beta x_{i} + \epsilon_{i} \\
\epsilon_{i} &\sim \mathrm{Normal}(0,\sigma_e)
\end{aligned}
$$

\vspace{5mm}

We prefer to use the first notation as it generalises better to more complex models, as we will see later. In Bayesian terms, these two lines describe the *likelihood* of the model, which is the assumption made about the generative process from which the data is issued. We make the assumption that the outcomes $y_{i}$ are normally distributed around a mean $\mu_{i}$ with some error $\sigma_{e}$. This is equivalent to saying that the errors are normally distributed around $0$, as illustrated by the above equivalence. Then, we can extend this model to the following multilevel model, adding a varying intercept:

$$
\begin{aligned}
y_{i} &\sim \mathrm{Normal}(\mu_{i}, \sigma_{e}) \\
\mu_{i} &= \alpha_{j[i]} + \beta x_{i} \\
\alpha_{j} &\sim \mathrm{Normal}(\alpha, \sigma_{\alpha}) \\
\end{aligned}
$$

\vspace{5mm}

where we use the notation $\alpha_{j[i]}$ to indicate that each group $j$ (e.g., class) is given a unique intercept, issued from a Gaussian distribution centered on $\alpha$, the grand intercept^[Acknowledging that these individual intercepts can also be seen as adjustments to the grand intercept $\alpha$, that are specific to group $j$.], meaning that there might be different mean scores for each class. From this notation we can see that in addition to the residual standard deviation $\sigma_{e}$, we are now estimating one more variance component $\sigma_{\alpha}$, which is the standard deviation of the distribution of varying intercepts. We can interpret the variation of the parameter $\alpha$ between groups $j$ by considering the *intra-class correlation* (ICC) $\sigma_{\alpha}^{2} / (\sigma_{\alpha}^{2} + \sigma_{e}^{2})$, which goes to $0$, if the grouping conveys no information, and to $1$, if all observations in a group are identical [@gelman_data_2006, page 258].

The third line is called a *prior* distribution in the Bayesian framework. This prior distribution describes the population of intercepts, thus modelling the dependency between these parameters.

Following the same strategy, we can add a varying slope, allowed to vary according to the group $j$:

$$
\begin{aligned}
y_{i} &\sim \mathrm{Normal}(\mu_{i}, \sigma_{e}) \\
\mu_{i} &= \alpha_{j[i]} + \beta_{j[i]} x_{i} \\
\alpha_{j} &\sim \mathrm{Normal}(\alpha, \sigma_{\alpha}) \\
\beta_{j} &\sim \mathrm{Normal}(\beta, \sigma_{\beta}) \\
\end{aligned}
$$

\vspace{5mm}

Indicating that the effect of the number of lessons on L2 speech intelligibility is allowed to differ from one class to another (i.e., the effect of the number of lessons might be more beneficial to some classes than others). These varying slopes are assigned a prior distribution centered on the grand slope $\beta$, and with standard deviation $\sigma_{\beta}$.

In this introductory section, we have presented the foundations of Bayesian analysis and multilevel modelling. Bayes' theorem allows prior knowledge about parameters to be updated according to the information conveyed by the data, while MLMs allow complex dependency structures to be modelled. We now move to a detailed case study in order to illustrate these concepts.

\begin{tcolorbox}[title = Box 1. Where are my random effects ?]

In the Bayesian framework, every unknown quantity is considered as a random variable that we can describe using probability distributions. As a consequence, there is no such thing as a "fixed effect" or a "random effects distribution" in a Bayesian framework. However, these semantic quarrels disappear when we write down the model.

Suppose we have a dependent continuous variable $y$ and a dichotomic categorical predictor $x$ (assumed to be contrast-coded). Let $y_{ij}$ denote the score of the $i^{th}$ participant in the $j^{th}$ condition. We can write a "mixed effects" model (as containing both fixed and random effects) as follows:

$$
y_{ij} = \alpha + \alpha_{i} + \beta x_{j} + e_{ij},\ e_{ij} \sim \mathrm{Normal}(0, \sigma_{e}^{2}),\ \alpha_{i} \sim \mathrm{Normal}(0, \sigma_{a}^{2})
$$

\vspace{5mm}

Where the terms $\alpha$ and $\beta$ represent the "fixed effects" and denote the overall mean response and the condition difference in response, respectively. In addition, $e_{ij}$ are random errors assumed to be normally distributed with unknown variance $\sigma_{e}^{2}$, and $\alpha_{i}$’s are individual specific random effects normally distributed in the population with unknown variance $\sigma_{a}^{2}$.

We can rewrite this model to make apparent that the so-called "random effects distribution" can actually be considered a prior distribution (from a Bayesian standpoint), since by definition, distributions on unknown quantities are considered as priors:

$$
\begin{aligned}
y_{ij} &\sim \mathrm{Normal}(\mu_{ij}, \sigma_{e}^{2}) \\
\mu_{ij} &= \alpha_{i} + \beta x_{j} \\
\alpha_{i} &\sim \mathrm{Normal}(\alpha, \sigma_{\alpha}^{2}) \\
\end{aligned}
$$

\vspace{5mm}

where the parameters of this prior are learned from the data. As we have seen, the same mathematical entity can be conceived either as a "random effects distribution" or as a prior distribution, depending on the framework.

\end{tcolorbox}

### Software programs

@sorensen_bayesian_2016 provided a detailed and accessible introduction to Bayesian MLMs (BMLMs) applied to linguistics, using the probabilistic language `Stan` [@carpenter_stan:_2017]. However, discovering BMLMs and the `Stan` language all at once might seem a little overwhelming, as `Stan` can be difficult to learn for users that are not experienced with programming languages. As an alternative, we introduce the `brms` package [@R-brms], that implements BMLMs in `R`, using `Stan` under the hood, with an `lme4`-like syntax. Hence, the syntax required by `brms` will not surprise the researcher familiar with `lme4`, as models of the following form:

$$
\begin{aligned}
y_{i} &\sim \mathrm{Normal}(\mu_{i}, \sigma_{e}) \\
\mu_{i} &= \alpha + \alpha_{subject[i]} + \beta x_{i} \\
\end{aligned}
$$

\vspace{5mm}

are specified in `brms` (as in `lme4`) with: `y ~ 1 + x + (1|subject)`. In addition to linear regression models, `brms` allows generalised linear and non-linear multilevel models to be fitted, and comes with a great variety of distribution and link functions. For instance, `brms` allows fitting robust linear regression models, or modelling dichotomous and categorical outcomes using logistic and ordinal regression models. The flexibility of `brms` also allows for distributional models (i.e., models that include simultaneous predictions of all response parameters), Gaussian processes or non-linear models to be fitted, among others. More information about the diversity of models that can be fitted with `brms` and their implementation is provided in @R-brms and @burkner_advanced_2018.

## Application example



To illustrate the use of BMLMs, we reanalysed a dataset from @mccloy_phonetic_2014, available in the `phonR` package [@R-phonR]. This dataset contains formant (F1 and F2) values for five vowels of Standard Indonesian (ISO 639-3:ind), as spoken by eight speakers (four females), with approximately 45 repetitions of each vowel. The research question we investigated here is the effect of gender on vowel production variability.

### Data pre-processing

Our research question was about the different amount of variability in the respective vowel productions of male and female speakers, due to cognitive or social differences. To answer this question, we first needed to get rid of the differences in vowel production that are due to physiological differences between males and females (e.g., shorter vocal tract length for females). More generally, we needed to eliminate the inter-individual differences due to physiological characteristics in our groups of participants. For that purpose, we first applied the Watt & Fabricius formant normalisation technique [@watt_evaluation_2002]. The principle of this method is to calculate for each speaker a "centre of gravity" $S$ in the F1/F2 plane, from the formant values of point vowels [i, a , u], and to express the formant values of each observation as ratios of the value of $S$ for that formant.

![(\#fig:vowelplot-ref)Euclidean distances between each observation and the centres of gravity corresponding to each vowel across all participants, by gender (top row: female, bottom row: male) and by vowel (in column), in the normalised F1-F2 plane. The grey background plots represent the individual data collapsed for all individuals (male and female) and all vowels. Note that, for the sake of clarity, this figure represents a unique center of gravity for each vowel for all participants, whereas in the analysis, one center of gravity was used for each vowel and each participant.](91-appendix_brms_files/figure-docx/vowelplot-ref-1.pdf)

Then, for each vowel and participant, we computed the Euclidean distance between each observation and the centre of gravity of the whole set of observations in the F1-F2 plane for that participant and that vowel. The data obtained by this process are illustrated in Figure \@ref(fig:vowelplot-ref), and a sample of the final dataset can be found in Table \@ref(tab:datavis).

<caption>(\#tab:datavis)</caption>

<caption>*Ten randomly picked rows from the data.*</caption>



 subj    gender    vowel    f1      f2     f1norm    f2norm    distance    repetition 
------  --------  -------  -----  ------  --------  --------  ----------  ------------
 M04       m        /a/     608    1285    1.444     0.851      0.132          12     
 F02       f        /o/     832    1132    1.522     0.608      0.283          21     
 M03       m        /u/     430    1198    1.032     0.800      0.250          10     
 M04       m        /u/     395    1307    0.938     0.865      0.286          15     
 M03       m        /o/     467    1014    1.121     0.677      0.146          11     
 F04       f        /i/     338    2576    0.625     1.465      0.141          3      
 M04       m        /i/     274    2292    0.651     1.517      0.175          34     
 F09       f        /e/     654    1772    1.318     1.068      0.247          22     
 F04       f        /o/     657    1146    1.215     0.652      0.066          42     
 M02       m        /i/     331    2374    0.708     1.532      0.113          5      

### Constant effect of gender on vowel production variability

We then built a first model with constant effects only and vague priors on $\alpha$ and $\beta$, the intercept and the slope. We contrast-coded `gender` (f = -0.5, m = 0.5). Our dependent variable was therefore the distance from each individual vowel centre of gravity, which we will refer to as *formant distance* in the following. The formal model can be expressed as:

$$
\begin{aligned}
\text{distance}_{i} &\sim \mathrm{Normal}(\mu_{i}, \sigma_{e}) \\
\mu_{i} &= \alpha + \beta \times \text{gender}_{i} \\
\alpha &\sim \mathrm{Normal}(0, 10) \\
\beta &\sim \mathrm{Normal}(0, 10) \\
\sigma_{e} &\sim \mathrm{HalfCauchy}(10) \\
\end{aligned}
$$

\vspace{5mm}

where the first two lines of the model describe the likelihood and the linear model^[Note that --for the sake of simplicity-- throughout this tutorial we use a Normal likelihood, but other (better) alternatives would include using skew-normal or log-normal models, which are implemented in `brms` with the `skew_normal` and `lognormal` families. We provide examples in the [supplementary materials](#suppApp).]. The next three lines define the prior distribution for each parameter of the model, where $\alpha$ and $\beta$ are given a vague (weakly informative) Gaussian prior centered on $0$, and the residual variation is given a Half-Cauchy prior [@gelman_prior_2006;@polson_half-cauchy_2012], thus restricting the range of possible values to positive ones. As depicted in Figure \@ref(fig:priorsbmod1), the $\mathrm{Normal}(0,10)$ prior is weakly informative in the sense that it grants a relative high weight to $\alpha$ and $\beta$ values, between -25 and 25. This corresponds to very large (given the scale of our data) values for, respectively, the mean distance value $\alpha$, and the mean difference between males and females $\beta$. The $\mathrm{HalfCauchy}(10)$ prior placed on $\sigma_{e}$ also allows very large values of $\sigma_{e}$, as represented in the right panel of Figure \@ref(fig:priorsbmod1).

![(\#fig:priorsbmod1)Prior distributions used in the first model, for $\alpha$ and $\beta$ (left panel) and for the residual variation $\sigma_{e}$ (right panel).](91-appendix_brms_files/figure-docx/priorsbmod1-1.pdf)

These priors can be specified in numerous ways (see `?set_prior` for more details), among which the following:


```r
prior1 <- c(
    prior(normal(0, 10), class = Intercept),
    prior(normal(0, 10), class = b, coef = gender),
    prior(cauchy(0, 10), class = sigma)
    )
```

where a prior can be defined over a class of parameters (e.g., for all variance components, using the `sd` class) or for a specific one, for instance as above by specifying the coefficient (`coef`) to which the prior corresponds (here the slope of the constant effect of gender).

The model can be fitted with `brms` with the following command:


```r
library(brms)

bmod1 <- brm(
        distance ~ gender,
        data = indo, family = gaussian(),
        prior = prior1,
        warmup = 2000, iter = 5000
    )
```

where `distance` is the distance from the centre of gravity. The `iter` argument serves to specify the total number of iterations of the Markov Chain Monte Carlo (MCMC) algorithm, and the `warmup` argument specifies the number of iterations that are run at the beginning of the process to "calibrate" the MCMC, so that only `iter - warmup` iterations are retained in the end to approximate the shape of the posterior distribution [for more details, see @mcelreath_statistical_2016].





Figure \@ref(fig:plotbmod1) depicts the estimations of this first model for the intercept $\alpha$, the slope $\beta$, and the residual standard deviation $\sigma_{e}$. The left part of the plot shows histograms of draws taken from the posterior distribution, and from which several summaries can be computed (e.g., mean, mode, quantiles). The right part of Figure \@ref(fig:plotbmod1) shows the behaviour of the two simulations (i.e., the two chains) used to approximate the posterior distribution, where the x-axis represents the number of iterations and the y-axis the value of the parameter. This plot reveals one important aspect of the simulations that should be checked, known as *mixing*. A chain is considered well mixed if it explores many different values for the target parameters and does not stay in the same region of the parameter space. This feature can be evaluated by checking that these plots, usually referred to as *trace plots*, show random scatter around a mean value (they look like a "fat hairy caterpillar").


```r
library(tidyverse)

bmod1 %>%
    plot(
        combo = c("hist", "trace"), widths = c(1, 1.5),
        theme = theme_bw(base_size = 10)
        )
```

![(\#fig:plotbmod1)Histograms of posterior samples and trace plots of the intercept, the slope for gender and the standard deviation of the residuals of the constant effects model.](91-appendix_brms_files/figure-docx/plotbmod1-1.pdf)

The estimations obtained for this first model are summarised in Table \@ref(tab:sumbmod1), which includes the mean, the standard error (SE), and the lower and upper bounds of the 95% credible interval (CrI)^[Where a credible interval is the Bayesian analogue of a classical confidence interval, except that probability statements can be made based upon it (e.g., "given the data and our prior assumptions, there is a 0.95 probability that this interval encompasses the population value $\theta$").] of the posterior distribution for each parameter. As `gender` was contrast-coded before the analysis (f = -0.5, m = 0.5), the intercept $\alpha$ corresponds to the grand mean of the formant distance over all participants and has its mean around 0.1633088. The estimate of the slope ($\beta =$ -0.0422485) suggests that females are more variable than males in the way they pronounce vowels, while the 95% CrI can be interpreted in a way that there is a $0.95$ probability that the value of the intercept lies in the [-0.0513305, -0.0329269] interval.

<caption>(\#tab:sumbmod1)</caption>

<caption>*Posterior mean, standard error, 95\% credible interval and $\hat{R}$
    statistic for each parameter of the constant effect model bmod1.*</caption>



  parameter       mean      SE      lower bound    upper bound    Rhat  
--------------  --------  -------  -------------  -------------  -------
   $\alpha$      0.163     0.002       0.159          0.168       1.000 
   $\beta$       -0.042    0.005      -0.051         -0.033       1.000 
 $\sigma_{e}$    0.098     0.002       0.095          0.102       1.001 

The `Rhat` value corresponds to the *potential scale reduction factor* $\hat{R}$ [@gelman_inference_1992], that provides information about the convergence of the algorithm. This index can be conceived as equivalent to the F-ratio in ANOVA. It compares the between-chains variability (i.e., the extent to which different chains differ one from each other) to the within-chain variability (i.e., how widely a chain explores the parameter space), and, as such, gives an index of the convergence of the chains. An overly large between-chains variance (as compared to the within-chain variability) would be a sign that chain-specific characteristics, like the starting value of the algorithm, have a strong influence on the final result. Ideally, the value of `Rhat` should be close to 1, and should not exceed 1.1. Otherwise, one might consider running more iterations or defining stronger priors [@R-brms;@gelman_bayesian_2013].



### Varying intercept model {#shrink}

The first model can be improved by taking into account the dependency between vowel formant measures for each participant. This is handled in MLMs by specifying unique intercepts $\alpha_{subject[i]}$ and by assigning them a common prior distribution. This strategy corresponds to the following by-subject varying-intercept model, `bmod2`:

$$
\begin{aligned}
\text{distance}_{i} &\sim \mathrm{Normal}(\mu_{i}, \sigma_{e}) \\
\mu_{i} &= \alpha + \alpha_{subject[i]} + \beta \times \text{gender}_{i} \\
\alpha_{subject} &\sim \mathrm{Normal}(0, \sigma_{subject}) \\
\alpha &\sim \mathrm{Normal}(0, 10) \\
\beta &\sim \mathrm{Normal}(0, 10) \\
\sigma_{subject} &\sim \mathrm{HalfCauchy}(10) \\
\sigma_{e} &\sim \mathrm{HalfCauchy}(10) \\
\end{aligned}
$$

\vspace{5mm}

This model can be fitted with `brms` with the following command (where we specify the HalfCauchy prior on $\sigma_{subject}$ by applying it on parameters of class `sd`):


```r
prior2 <- c(
    prior(normal(0, 10), class = Intercept),
    prior(normal(0, 10), class = b, coef = gender),
    prior(cauchy(0, 10), class = sd),
    prior(cauchy(0, 10), class = sigma)
    )

bmod2 <- brm(
    distance ~ gender + (1|subj),
    data = indo, family = gaussian(),
    prior = prior2,
    warmup = 2000, iter = 10000
    )
```



As described in the first part of the present paper, we now have two sources of variation in the model: the standard deviation of the residuals $\sigma_{e}$ and the standard deviation of the by-subject varying intercepts $\sigma_{subject}$. The latter represents the standard deviation of the population of varying intercepts, and is also learned from the data. It means that the estimation of each unique intercept will inform the estimation of the population of intercepts, which, in return, will inform the estimation of the other intercepts. We call this sharing of information between groups the *partial pooling* strategy, in comparison with the *no pooling* strategy, where each intercept is estimated independently, and with the *complete pooling* strategy, in which all intercepts are given the same value [@gelman_data_2006;@gelman_bayesian_2013;@mcelreath_statistical_2016]. This is one of the most essential features of MLMs, and what leads to better estimations than single-level regression models for repeated measurements or unbalanced sample sizes. This pooling of information is made apparent through the phenomenon of *shrinkage*, which is illustrated in Figure \@ref(fig:ranefplotbmod2), and later on, in Figure \@ref(fig:shrinkageplot).

Figure \@ref(fig:ranefplotbmod2) shows the posterior distribution as estimated by this second model for each participant, in relation to the raw mean of its category (i.e., females or males), represented by the vertical dashed lines. We can see for instance that participants `M02` and `F09` have smaller average distance than the means of their groups, while participants `M03` and `F08` have larger ones. The arrows represent the amount of *shrinkage*, that is, the deviation between the mean in the raw data (represented by a cross underneath each density) and the estimated mean of the posterior distribution (represented by the peak of the arrow). As shown in Figure \@ref(fig:ranefplotbmod2), this *shrinkage* is always directed toward the mean of the considered group (i.e., females or males) and the amount of *shrinkage* is determined by the deviation of the individual mean from its group mean. This mechanism acts like a safeguard against overfitting, preventing the model from overly trusting each individual datum.

![(\#fig:ranefplotbmod2)Posterior distributions by subject, as estimated by the `bmod2` model. The vertical dashed lines represent the means of the formant distances for the female and male groups. Crosses represent the mean of the raw data, for each participant. Arrows represent the amount of shrinkage, between the raw mean and the estimation of the model (the mean of the posterior distribution).](91-appendix_brms_files/figure-docx/ranefplotbmod2-1.pdf)

The marginal posterior distribution of each parameter obtained with `bmod2` is summarised in Table \@ref(tab:sumbmod2), where the `Rhat` values close to $1$ suggest that the model has converged. We see that the estimates of $\alpha$ and $\beta$ are similar to the estimates of the first model, except that the SE is now slightly larger. This result might seem surprising at first sight, as we expected to improve the first model by adding a by-subject varying intercept. In fact, it reveals an underestimation of the SE when using the first model. Indeed, the first model assumes independence of observations, which is violated in our case. This highlights the general need for careful consideration of the model's assumptions when interpreting its estimations. The first model seemingly gives highly certain estimates, but these estimations are only valid in the "independence of observations" world [see also the distinction between the *small world* and the *large world* in @mcelreath_statistical_2016]. Moreover, estimating an intercept by subject (as in the second model) increases the precision of estimation, but it also makes the average estimation less certain, thus resulting in a larger SE.

<caption>(\#tab:sumbmod2)</caption>

<caption>*Posterior mean, standard error, 95\% credible interval and $\hat{R}$
    statistic for each parameter of model bmod2 with a varying intercept by subject.*</caption>

     parameter          mean      SE      lower bound    upper bound    Rhat  
--------------------  --------  -------  -------------  -------------  -------
      $\alpha$         0.163     0.007       0.149          0.176       1.001 
      $\beta$          -0.042    0.013      -0.069         -0.016       1.000 
 $\sigma_{subject}$    0.016     0.008       0.006          0.036       1.001 
    $\sigma_{e}$       0.098     0.002       0.095          0.101       1.000 

This model (`bmod2`), however, is still not adequate to describe the data, as the dependency between repetitions of each vowel is not taken into account. In `bmod3`, we added a by-vowel varying intercept, thus also allowing each vowel to have a different general level of variability.

$$
\begin{aligned}
\text{distance}_{i} &\sim \mathrm{Normal}(\mu_{i}, \sigma_{e}) \\
\mu_{i} &= \alpha + \alpha_{subject[i]} + \alpha_{vowel[i]} + \beta \times \text{gender}_{i} \\
\alpha_{subj} &\sim \mathrm{Normal}(0, \sigma_{subject}) \\
\alpha_{vowel} &\sim \mathrm{Normal}(0, \sigma_{vowel}) \\
\alpha &\sim \mathrm{Normal}(0, 10) \\
\beta &\sim \mathrm{Normal}(0, 10) \\
\sigma_{e} &\sim \mathrm{HalfCauchy}(10) \\
\sigma_{subject} &\sim \mathrm{HalfCauchy}(10) \\
\sigma_{vowel} &\sim \mathrm{HalfCauchy}(10) \\
\end{aligned}
$$

\vspace{5mm}

This model can be fitted with `brms` with the following command:


```r
prior3 <- c(
    prior(normal(0, 10), class = Intercept),
    prior(normal(0, 10), class = b, coef = gender),
    prior(cauchy(0, 10), class = sd),
    prior(cauchy(0, 10), class = sigma)
    )

bmod3 <- brm(
    distance ~ gender + (1|subj) + (1|vowel),
    data = indo, family = gaussian(),
    prior = prior3,
    warmup = 2000, iter = 10000
    )
```



where the same Half-Cauchy is specified for the two varying intercepts, by applying it directly to the `sd` class.

<caption>(\#tab:sumbmod3)</caption>

<caption>*Posterior mean, standard error, 95\% credible interval and $\hat{R}$
    statistic for each parameter of model bmod3 with a varying intercept by subject and by vowel.*</caption>

     parameter          mean      SE      lower bound    upper bound    Rhat  
--------------------  --------  -------  -------------  -------------  -------
      $\alpha$         0.164     0.039       0.086          0.241       1.001 
      $\beta$          -0.042    0.013      -0.068         -0.014       1.001 
 $\sigma_{subject}$    0.016     0.008       0.007          0.036       1.001 
  $\sigma_{vowel}$     0.076     0.048       0.031          0.197       1.000 
    $\sigma_{e}$       0.088     0.002       0.085          0.091       1.000 

The marginal posterior distribution of each parameter is summarised in Table \@ref(tab:sumbmod3). We can compute the intra-class correlation (ICC, see section \@ref(MLM)) to estimate the relative variability associated with each varying effect: $ICC_{subject}$ is equal to 0.0336199 and $ICC_{vowel}$ is equal to 0.4246206. The rather high ICC for vowels suggests that observations are highly correlated within each vowel, thus stressing the relevance of allocating a unique intercept by vowel^[But please note that we do not mean to suggest that the varying intercept for subjects should be removed because its ICC is low.].

### Including a correlation between varying intercept and varying slope

One can legitimately question the assumption that the differences between male and female productions are identical for each vowel. To explore this issue, we thus added a varying slope for the effect of gender, allowing it to vary by vowel. Moreover, we can exploit the correlation between the baseline level of variability by vowel, and the amplitude of the difference between males and females in pronouncing them. For instance, we can observe that the pronunciation of /a/ is more variable in general. We might want to know whether females tend to pronounce vowels that are situated at a specific location in the F1-F2 plane with less variability than males. In other words, we might be interested in knowing whether the effect of `gender` is correlated with the baseline level of variability. This is equivalent to investigating the *dependency*, or the correlation between the varying intercepts and the varying slopes. We thus estimated this correlation by modelling $\alpha_{vowel}$ and $\beta_{vowel}$ as issued from the same multivariate normal distribution (a multivariate normal distribution is a generalisation of the usual normal distribution to more than one dimension), centered on $0$ and with some covariance matrix $\textbf{S}$, as specified on the third line of the following model:

$$
\begin{aligned}
\text{distance}_{i} &\sim \mathrm{Normal}(\mu_{i}, \sigma_{e}) \\
\mu_{i} &= \alpha + \alpha_{subject[i]} + \alpha_{vowel[i]} + (\beta + \beta_{vowel[i]}) \times \text{gender}_{i} \\
\begin{bmatrix}
\alpha_{\text{vowel}} \\
\beta_{\text{vowel}} \\
\end{bmatrix}
&\sim \mathrm{MVNormal}\bigg(\begin{bmatrix} 0 \\ 0 \end{bmatrix}, \textbf{S}\bigg) \\
\textbf{S} &=
\begin{pmatrix}
\sigma_{\alpha_{vowel}}^{2} & \sigma_{\alpha_{vowel}}\sigma_{\beta{vowel}} \rho \\
\sigma_{\alpha_{vowel}}\sigma_{\beta{vowel}} \rho & \sigma_{\beta_{vowel}}^{2} \\
\end{pmatrix} \\
\alpha_{subject} &\sim \mathrm{Normal}(0, \sigma_{subject}) \\
\alpha &\sim \mathrm{Normal}(0, 10) \\
\beta &\sim \mathrm{Normal}(0, 10) \\
\sigma_{e} &\sim \mathrm{HalfCauchy}(10) \\
\sigma_{\alpha_{vowel}} &\sim \mathrm{HalfCauchy}(10) \\
\sigma_{\beta_{vowel}} &\sim \mathrm{HalfCauchy}(10) \\
\sigma_{subject} &\sim \mathrm{HalfCauchy}(10) \\
\textbf{R} &\sim \mathrm{LKJcorr}(2) \\
\end{aligned}
$$

\vspace{5mm}

where $\textbf{R}$ is the correlation matrix $\textbf{R} = \begin{pmatrix} 1 & \rho \\ \rho & 1 \end{pmatrix}$ and $\rho$ is the correlation between intercepts and slopes, used in the computation of $\textbf{S}$. This matrix is given the LKJ-Correlation prior [@lewandowski_generating_2009] with a parameter $\zeta$ (zeta) that controls the strength of the correlation^[The LKJ prior is the default prior for correlation matrices in `brms`.]. When $\zeta = 1$, the prior distribution on the correlation is uniform between $-1$ and $1$. When $\zeta > 1$, the prior distribution is peaked around a zero correlation, while lower values of $\zeta$ ($0 < \zeta < 1$) allocate more weight to extreme values (i.e., close to -1 and 1) of $\rho$ (see Figure \@ref(fig:lkj)).

![(\#fig:lkj)Visualisation of the LKJ prior for different values of the shape parameter $\zeta$.](91-appendix_brms_files/figure-docx/lkj-1.pdf)


```r
prior4 <- c(
    prior(normal(0, 10), class = Intercept),
    prior(normal(0, 10), class = b, coef = gender),
    prior(cauchy(0, 10), class = sd),
    prior(cauchy(0, 10), class = sigma),
    prior(lkj(2), class = cor)
    )

bmod4 <- brm(
    distance ~ gender + (1|subj) + (1 + gender|vowel),
    data = indo, family = gaussian(),
    prior = prior4,
    warmup = 2000, iter = 10000
    )
```



Estimates of this model are summarised in Table \@ref(tab:sumbmod4). This summary reveals a negative correlation between the intercepts and slopes for vowels, meaning that vowels with a large "baseline level of variability" (i.e., with a large average `distance` value) tend to be pronounced with more variability by females than by males. However, we notice that this model's estimation of $\beta$ is even more uncertain than that of the previous models, as shown by the associated standard error and the width of the credible interval.

<caption>(\#tab:sumbmod4)</caption>

<caption>*Posterior mean, standard error, 95\% credible interval and $\hat{R}$
    statistic for each parameter of model bmod4 with a varying intercept and varying slope by vowel.*</caption>

         parameter             mean      SE      lower bound    upper bound    Rhat  
---------------------------  --------  -------  -------------  -------------  -------
         $\alpha$             0.163     0.036       0.096          0.234       1.000 
          $\beta$             -0.042    0.032      -0.103          0.020       1.000 
    $\sigma_{subject}$        0.017     0.008       0.007          0.037       1.000 
 $\sigma_{\alpha_{vowel}}$    0.067     0.041       0.030          0.173       1.001 
 $\sigma_{\beta_{vowel}}$     0.054     0.035       0.022          0.142       1.001 
          $\rho$              -0.489    0.362      -0.948          0.384       1.000 
       $\sigma_{e}$           0.086     0.001       0.084          0.089       1.000 

Figure \@ref(fig:shrinkageplot) illustrates the negative correlation between the by-vowel intercepts and the by-vowel slopes, meaning that vowels that tend to have higher "baseline variability" (i.e., /e/, /o/, /a/), tend to show a stronger effect of `gender`. This figure also illustrates the amount of shrinkage, here in the parameter space. We can see that the *partial pooling* estimate is shrunk somewhere between the *no pooling* estimate and the *complete pooling* estimate (i.e., the grand mean). This illustrates again the mechanism by which MLMs balance the risk of overfitting and underfitting [@mcelreath_statistical_2016].



![(\#fig:shrinkageplot)Shrinkage of estimates in the parameter space, due to the pooling of information between clusters (based on the `bmod4` model). The ellipses represent the contours of the bivariate distribution, at different degrees of confidence 0.1, 0.3, 0.5 and 0.7.](91-appendix_brms_files/figure-docx/shrinkageplot-1.pdf)

### Varying intercept and varying slope model, interaction between subject and vowel

So far, we modelled varying effects of subjects and vowels. In this study, these varying factors were crossed, meaning that every subject had to pronounce every vowel. Let us now imagine a situation in which Subject 4 systematically mispronounced the /i/ vowel. This would be a source of systematic variation over replicates which is not considered in the model (`bmod4`), because this model can only adjust parameters for either vowel or participant, but not for a specific vowel for a specific participant.

In building the next model, we added a varying intercept for the interaction between subject and vowel, that is, we created an index variable that allocates a unique value at each crossing of the two variables (e.g., Subject1-vowel/a/, Subject1-vowel/i/, etc.), resulting in $8 \times 5 = 40$ intercepts to be estimated [for a review of multilevel modeling in various experimental designs, see @judd_experiments_2017]. This varying intercept for the interaction between subject and vowel represents the systematic variation associated with a specific subject pronouncing a specific vowel. This model can be written as follows, for any observation $i$:

$$
\begin{aligned}
\text{distance}_{i} &\sim \mathrm{Normal}(\mu_{i}, \sigma_{e}) \\
\mu_{i} &= \alpha + \alpha_{subject[i]} + \alpha_{vowel[i]} + \alpha_{subject:vowel[i]} + (\beta + \beta_{vowel[i]}) \times \text{gender}_{i} \\
\begin{bmatrix}
\alpha_{\text{vowel}} \\
\beta_{\text{vowel}} \\
\end{bmatrix}
&\sim \mathrm{MVNormal}\bigg(\begin{bmatrix} 0 \\ 0 \end{bmatrix}, \textbf{S}\bigg) \\
\textbf{S} &=
\begin{pmatrix}
\sigma_{\alpha_{vowel}}^{2} & \sigma_{\alpha_{vowel}}\sigma_{\beta{vowel}} \rho \\
\sigma_{\alpha_{vowel}}\sigma_{\beta{vowel}} \rho & \sigma_{\beta_{vowel}}^{2} \\
\end{pmatrix} \\
\alpha_{subject} &\sim \mathrm{Normal}(0, \sigma_{subject}) \\
\alpha_{subject:vowel} &\sim \mathrm{Normal}(0, \sigma_{subject:vowel}) \\
\alpha &\sim \mathrm{Normal}(0, 10) \\
\beta &\sim \mathrm{Normal}(0, 10) \\
\sigma_{e} &\sim \mathrm{HalfCauchy}(10) \\
\sigma_{subject} &\sim \mathrm{HalfCauchy}(10) \\
\sigma_{subject:vowel} &\sim \mathrm{HalfCauchy}(10) \\
\sigma_{\alpha_{vowel}} &\sim \mathrm{HalfCauchy}(10) \\
\sigma_{\beta_{vowel}} &\sim \mathrm{HalfCauchy}(10) \\
\textbf{R} &\sim \mathrm{LKJcorr}(2) \\
\end{aligned}
$$
\vspace{5mm}

This model can be fitted with the following command:


```r
prior5 <- c(
    prior(normal(0, 10), class = Intercept),
    prior(normal(0, 10), class = b, coef = gender),
    prior(cauchy(0, 10), class = sd),
    prior(cauchy(0, 10), class = sigma),
    prior(lkj(2), class = cor)
    )

bmod5 <- brm(
    distance ~ gender + (1|subj) + (1 + gender|vowel) + (1|subj:vowel),
    data = indo, family = gaussian(),
    prior = prior5,
    warmup = 2000, iter = 10000
    )
```



Estimates of this model are summarised in Table \@ref(tab:sumbmod5). From this table, we first notice that the more varying effects we add, the more the model is uncertain about the estimation of $\alpha$ and $\beta$, which can be explained in the same way as in section 2.2. Second, we see the opposite pattern for $\sigma_{e}$, the residuals standard deviation, which has decreased by a considerable amount compared to the first model, indicating a better fit.

<caption>(\#tab:sumbmod5)</caption>

<caption>*Posterior mean, standard error, 95\% credible interval and $\hat{R}$
    statistic for each parameter of model bmod5 with a varying intercept and a
    varying slope by vowel and a varying intercept for the interaction between subject and vowel.*</caption>

         parameter             mean      SE      lower bound    upper bound    Rhat  
---------------------------  --------  -------  -------------  -------------  -------
         $\alpha$             0.164     0.038       0.093          0.237       1.000 
          $\beta$             -0.042    0.030      -0.100          0.017       1.000 
    $\sigma_{subject}$        0.012     0.009       0.001          0.033       1.001 
 $\sigma_{subject:vowel}$     0.024     0.004       0.016          0.034       1.000 
 $\sigma_{\alpha_{vowel}}$    0.069     0.045       0.028          0.185       1.000 
 $\sigma_{\beta_{vowel}}$     0.050     0.035       0.013          0.137       1.000 
          $\rho$              -0.427    0.377      -0.941          0.430       1.000 
       $\sigma_{e}$           0.085     0.001       0.082          0.088       1.000 

## Model comparison

Once we have built a set of models, we need to know which model is the more accurate and should be used to draw conclusions. It might be a little tricky to select the model that has the better absolute fit on the actual data (using for instance $R^{2}$), as this model will not necessarily perform as well on new data. Instead, we might want to choose the model that has the best predictive abilities, that is, the model that performs the best when it comes to predicting data that have not yet been observed. We call this ability the out-of-sample predictive performance of the model [@mcelreath_statistical_2016]. When additional data is not available, cross-validation techniques can be used to obtain an approximation of the model's predictive abilities, among which the Bayesian leave-one-out-cross-validation [LOO-CV,@vehtari_practical_2017]. Another useful tool, and asymptotically equivalent to the LOO-CV, is the Watanabe Akaike Information Criterion [WAIC,@watanabe_asymptotic_2010], which can be conceived as a generalisation of the Akaike Information Criterion [AIC,@akaike_new_1974]^[More details on model comparison using cross-validation techniques can be found in @nicenboim_statistical_2016. See also @gelman_understanding_2014 for a complete comparison of information criteria.].

Both WAIC and LOO-CV indexes are easily computed in `brms` with the `WAIC` and the `LOO` functions, where $n$ models can be compared with the following call: `LOO(model1, model2, ..., modeln)`. These functions also provide an estimate of the uncertainty associated with these indexes (in the form of a SE), as well as a difference score $\Delta \text{LOOIC}$, which is computed by taking the difference between each pair of information criteria. The `WAIC` and the `LOO` functions also provide a SE for these delta values ($\Delta \text{SE}$). A comparison of the five models we fitted can be found in Table \@ref(tab:modelcomparison).



We see from Table \@ref(tab:modelcomparison) that `bmod5` (i.e., the last model) is performing much better than the other models, as it has the lower LOOIC. We then based our conclusions (see last section) on the estimations of this model. We also notice that each addition to the initial model brought improvement in terms of predictive accuracy, as the set of models is ordered from the first to the last model. This should not be taken as a general rule though, as successive additions made to an original model could also lead to *overfitting*, corresponding to a situation in which the model is over-specified in regards to the data, which makes the model good to explain the data at hand, but very bad to predict non-observed data. In such cases, information criteria and indexes that rely exclusively on goodness-of-fit (such as $R^{2}$) would point to different conclusions.

## Comparison of `brms` and `lme4` estimations

Figure \@ref(fig:compestim) illustrates the comparison of `brms` (Bayesian approach) and `lme4` (frequentist approach) estimates for the last model (`bmod5`), fitted in `lme4` with the following command.


```r
lmer_model <- lmer(
    distance ~ gender + (1|subj) + (1 + gender|vowel) + (1|subj:vowel),
    REML = FALSE, data = indo
    )
```

Densities represent the posterior distribution as estimated by `brms` along with 95% credible intervals, while the crosses underneath represent the *maximum likelihood estimate* (MLE) from `lme4` along with 95% confidence intervals, obtained with parametric bootstrapping.



![(\#fig:compestim)Comparison of estimations from `brms` and `lme4`. Dots represent means of posterior distribution along with 95\% CrIs, as estimated by the `bmod5` model. Crosses represent estimations of `lme4` along with bootstrapped 95\% CIs.](91-appendix_brms_files/figure-docx/compestim-1.pdf)

We can see that the estimations of `brms` and `lme4` are for the most part very similar. The differences we observe for $\sigma_{\alpha_{vowel}}$ and $\sigma_{\beta_{vowel}}$ might be explained by the skewness of the posterior distribution. Indeed, in these cases (i.e., when the distribution is not symmetric), the mode of the distribution would better coincide with the `lme4` estimate. This figure also illustrates a limitation of frequentist MLMs that we discussed in the first part of the current paper. If we look closely at the estimates of `lme4`, we can notice that the MLE for the correlation $\rho$ is at its boundary, as $\rho = -1$. This might be interpreted in (at least) two ways. The first interpretation is what @eager_mixed_2017 call the *parsimonious convergence hypothesis* (PCH) and consists in saying that this aberrant estimation is caused by the over-specification of the random structure [e.g.,@bates_parsimonious_2015]. In other words, this would correspond to a model that contains too many varying effects to be "supported" by a certain dataset (but this does not mean that with more data, this model would not be a correct model). However, the PCH has been questioned by @eager_mixed_2017, who have shown that under conditions of unbalanced datasets, non-linear models fitted with `lme4` provided more prediction errors than Bayesian models fitted with `Stan`. The second interpretation considers failures of convergence as a problem of frequentist MLMs *per se*, which is resolved in the Bayesian framework by using weakly informative priors (i.e., the LKJ prior) for the correlation between varying effects [e.g.,@eager_mixed_2017;@nicenboim_statistical_2016], and by using the full posterior for inference.

One feature of the Bayesian MLM in this kind of situation is to provide an estimate of the correlation that incorporates the uncertainty caused by the weak amount of data (i.e., by widening the posterior distribution). Thus, the `brms` estimate of the correlation coefficient has its posterior mean at $\rho = -0.433$, but this estimate comes with a huge uncertainty, as expressed by the width of the credible interval ($95\% \ \text{CrI} = [-0.946,0.454]$).

## Inference and conclusions

Regarding our initial question, which was to know whether there is a gender effect on vowel production variability in standard Indonesian, we can base our conclusions on several parameters and indices. However, the discrepancies between the different models we fitted deserve some discussion first. As already pointed out previously, if we had based our conclusions on the results of the first model (i.e., the model with constant effects only), we would have confidently concluded on a positive effect of gender. However, when we included the appropriate error terms in the model to account for repeated measurements by subject and by vowel, as well as for the by-vowel specific effect of gender, the large variability of this effect among vowels lead the model to adjust its estimation of $\beta$, resulting in more uncertainty about it. The last model then estimated a value of $\beta =$ -0.0419857 with quite a large uncertainty ($95 \% \ \text{CrI} =$ [-0.1004022, 0.0168433]), and considering $0$ as well as some positive values as credible. This result alone makes it difficult to reach any definitive conclusion concerning the presence or absence of a gender effect on the variability of vowels pronunciation in Indonesian, and should be considered (at best) as suggestive.

Nevertheless, it is useful to recall that in the Bayesian framework, the results of our analysis is a (posterior) probability distribution which can be, as such, summarised in multiple ways. This distribution is plotted in Figure \@ref(fig:postsamples), which also shows the mean and the 95% CrI, as well as the proportion of the distribution below and above a particular value^[We compare the distribution with $0$ here, but it should be noted that this comparison could be made with whatever value.]. This figure reveals that $94.1\%$ of the distribution is below $0$, which can be interpreted as suggesting that there is a $0.94$ probability that males have a lower mean formant distance than females (recall that female was coded as -0.5 and male as 0.5), given the data at hand, and the model.

![(\#fig:postsamples)Histogram of posterior samples of the slope for gender, as estimated by the last model.](91-appendix_brms_files/figure-docx/postsamples-1.pdf)

This quantity can be easily computed from the posterior samples:


```r
post <- posterior_samples(bmod5) # extracting posterior samples
mean(post$b_gender < 0) # computing p(beta<0)
```

```
## [1] 0.940125
```

Of course, this estimate can (and should) be refined using more data from several experiments, with more speakers. In this line, it should be pointed out that `brms` can easily be used to extend the multilevel strategy to meta-analyses [e.g.,@burkner_intranasal_2017;@williams_effects_2017]. Its flexibility makes it possible to fit multilevel hierarchical Bayesian models at two, three, or more levels, enabling researchers to model the heterogeneity between studies as well as dependencies between experiments of the same study, or between studies carried out by the same research team. Such a modelling strategy is usually equivalent to the ordinary frequentist random-effect meta-analysis models, while offering all the benefits inherent to the Bayesian approach.

Another useful source of information comes from the examination of effects sizes. One of the most used criteria is Cohen's $d$ standardized effect size, that expresses the difference between two groups in terms of their pooled standard deviation:

$$
\text{Cohen's d} = \frac{\mu_{1}-\mu_{2}}{\sigma_{pooled}}=\frac{\mu_{1}-\mu_{2}}{\sqrt{\frac{\sigma_{1}^{2}+\sigma_{2}^{2}}{2}}}
$$

\vspace{5mm}

However, as the total variance is partitioned into multiple sources of variation in MLMs, there is no unique way of computing a standardised effect size. While several approaches have been suggested (e.g., dividing the mean difference by the standard deviation of the residuals), the more consensual one involves taking into account all of the variance sources of the model [@hedges_effect_2007]. One such index is called the $\delta_{t}$ (where the $t$ stands for "total"), and is given by the estimated difference between group means, divided by the square root of the sum of all variance components:

$$\delta_{t} = \frac{\beta}{\sqrt{\sigma_{subject}^{2} + \sigma_{subject:vowel}^{2} + \sigma_{\alpha_{vowel}}^{2} + \sigma_{\beta_{vowel}}^{2} + \sigma^{2}}}$$

\vspace{5mm}

As this effect size is dependent on the parameters estimated by the model, one can derive a probability distribution for this index as well. This is easily done in `R`, computing it from the posterior samples:


```r
delta_t <-
    # extracting posterior samples from bmod5
    posterior_samples(bmod5, pars = c("^b_", "sd_", "sigma") ) %>%
    # taking the square of each variance component
    mutate_at(.vars = 3:7, .funs = funs(.^2) ) %>%
    # dividing the slope estimate by the square root of the sum of
    # all variance components
    mutate(delta = b_gender / sqrt(rowSums(.[3:7]) ) )
```

This distribution is plotted in Figure \@ref(fig:postdhist), and reveals the large uncertainty associated with the estimation of $\delta_{t}$.

![(\#fig:postdhist)Posterior distribution of $\delta_{t}$.](91-appendix_brms_files/figure-docx/postdhist-1.pdf)

In the same fashion, undirected effect sizes (e.g., $R^{2}$) can be computed directly from the posterior samples, or included in the model specification as a parameter of the model, in a way that at each iteration of the MCMC, a value of the effect size is sampled, resulting in an estimation of its full posterior distribution [see for instance @gelman_bayesian_2006 for measures of explained variance in MLMs and @marsman_bayesian_2019 for calculations in ANOVA designs]. A Bayesian version of the $R^{2}$ is also available in `brms` using the `bayes_R2` method, for which the calculations are based on @gelman_r-squared_2018.


```r
bayes_R2(bmod5)
```

```
##     Estimate  Est.Error      Q2.5     Q97.5
## R2 0.2958565 0.01582852 0.2642942 0.3263874
```

In brief, we found a weak effect of gender on vowel production variability in Indonesian ($\beta =$ -0.0419857, $\ 95 \% \ \text{CrI} =$ [-0.1004022, 0.0168433], $\ \delta_{t} =$ -0.3431054, $\ 95 \% \ \text{CrI} = [-0.78, 0.11]$), this effect being associated with a large uncertainty (as expressed by the width of the credible interval). This result seems to show that females tend to pronounce vowels with more variability than males, while the variation observed across vowels (as suggested by $\sigma_{\beta_{vowel}}$) suggests that there might exist substantial inter-vowel variability, that should be subsequently properly studied. A follow-up analysis specifically designed to test the effect of gender on each vowel should help better describe inter-vowel variability (we give an example of such an analysis in the [supplementary materials](#suppApp)). 

To sum up, we hope that this introductive tutorial has helped the reader to understand the foundational ideas of Bayesian MLMs, and to appreciate how straightforward the interpretation of the results is. Moreover, we hope to have demonstrated that although Bayesian data analysis may still sometimes (wrongfully) sound difficult to grasp and to use, the development of recent tools like `brms` helps to build and fit Bayesian MLMs in an intuitive way. We believe that this shift in practice will allow more reliable statistical inferences to be drawn from empirical research.

## Supplementary materials {#suppApp}

Supplementary materials, reproducible code and figures are available at: [https://osf.io/dpzcb](https://osf.io/dpzcb). A lot of useful packages have been used for the writing of this paper, among which the `papaja` and `knitr` packages for writing and formatting [@R-papaja;@R-knitr], the `ggplot2`, `viridis`, `ellipse`, `BEST`, and `ggridges` packages for plotting [@R-ggplot2;@R-viridis;@R-ellipse;@R-BEST;@R-ggridges], as well as the `tidyverse` and `broom` packages for code writing and formatting [@R-tidyverse;@R-broom].