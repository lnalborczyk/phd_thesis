# (PART) Discussion and conclusions {-}

# Discussion and perspectives {#chap8}



\initial{S}everal lines of research have suggested that inner speech may involve speech motor processes. This work includes introspective and phenomenological studies, mental chronometry studies, motor interference studies, modelling work as well as neurophysiological and psychophysiological studies (see our short historical review in Chapter \@ref(intro)). However, the involvement of motor processes during inner speech is highly variable between individuals, tasks, and studies. Therefore, it seems reasonable to assume that inner speech comes in different *varieties* that may involve motor processes to a variable degree. We examined this idea by studying the involvement of the speech motor system during induced rumination, a negative and repetitive form of inner speech. In addition to shedding light upon the nature of inner speech, this work may offer new theoretical and experimental tools to assess the presence and persistence of ruminative thoughts.

<!--
More precisely, we used surface electromyography and articulatory suppression to quantify the involvement of the speech motor system during verbal and non-verbal induced rumination.
-->

## Summary of the results

...

## Theoretical implications of the results

### Epistemological interlude

In order to fully apprehend the theoretical implications of these results, it might be useful to first clearly articulate the logical argument elaborated throughout the present work. In the first part of the present work (the EMG studies presented in Chapter \@ref(chap3) and \@ref(chap4)), the logical argument was as follows: *if* verbal rumination is a form of inner speech, *then* rumination should be accompanied by peripheral muscular activity in the speech muscles. However, going from the substantive hypothesis (verbal rumination is a form of inner speech) to the conclusion (i.e., connecting theory to observations) actually requires the use of *auxiliary hypotheses* or *assumptions*. Elucidating these auxiliary assumptions, the actual logical argument from the first part can be restated as follows^[We recognise that this formulation may still be incomplete as some additional auxiliary or instrumental hypotheses may still be incorporated in order to draw a more exhaustive picture of the argument.]:

- *Theoretical assumption ($T$)*: Verbal rumination is a form of inner speech

  - *Auxiliary hypothesis 1 ($A_{1}$)*: Some forms of inner speech involve the motor simulation of speech production
  - *Auxiliary hypothesis 2 ($A_{2}$)*: The simulation mechanism recruits neural networks engaged in (overt) execution
  - *Auxiliary hypothesis 3 ($A_{3}$)*: The motor commands generated during simulation are only partially inhibited
  - *Instrumental hypothesis 1 ($I_{1}$)*: Surface electromyography is a reliable tool to peripherally record partially inhibited motor commands
  - *Ceteris paribus clause ($C$)*: We assume there is no other factor exerting an appreciable influence that could obfuscate the main effect of interest

- *Conclusion*: Therefore, rumination should be accompanied by peripheral muscular activity (EMG traces) in the speech muscles

In other words, we say that if the ensemble of premises $p$ is true, it should follow that $q$ is true. Therefore, stating $p$ suffices to conclude $q$ (modus ponens).

\[
  \begin{array}{ r l }
               & p \rightarrow q \\
               & p \\
    \cline{2-2}
    \therefore & q
  \end{array}
\]

From there, observing $q$ does not allow to infer $p$ (affirming the consequent fallacy) but not observing $p$ ($\lnot p$) allows inferring not $p$ ($\lnot p$) via the modus tollens. However, not observing $q$ does not permit to refute the substantive hypothesis $T$. Rather, not observing $q$ only allows for the refutation of $p$, the *conjunction* of all premises described in the above argument (i.e., $T \land A_{1} \land A_{2} \land A_{3} \land I_{1} \land C$). Put formally, negating the conjunction of premises is logically equivalent to stating a disjunction of the conjuncts [i.e., either one or the other of the premises is false; @meehl_appraising_1990]. Therefore, not observing $q$ only allows for a refutation of $p$ to an extent that is function of the (im)plausibility of the other conjuncts in $p$ (i.e., $A_{1}$, $A_{2}$, $A_{3}$, $I_{1}$, and $C$).

Similarly, the logical argument from the second part (i.e., the relaxation experiments presented in Chapter \@ref(chap3) and \@ref(chap4) as well as the articulatory suppression studies presented in Chapter \@ref(chap6) and \@ref(chap7)) was of the following form: *if* verbal rumination is a form of inner speech, *then*, a disruption of the speech motor system should disrupt rumination. Again, this argument may be restated in a more detailed form as follows:

- *Theoretical assumption ($T$)*: Verbal rumination is a form of inner speech

  - *Auxiliary hypothesis 1 ($A_{1}$)*: Some forms of inner speech involve the motor simulation of speech production
  - *Auxiliary hypothesis 2 ($A_{2}$)*: The simulation mechanism recruits neural networks engaged in (overt) execution
  - *Ceteris paribus clause ($C$)*: We assume there is no other factor exerting an appreciable influence that could obfuscate the main effect of interest

- *Conclusion*: Therefore, a disruption of the speech motor system should disrupt rumination

In other words, using the same reasoning as before, we say that not observing the conclusion $q$ only counts as a refutation of $p$ to an extent that is function of the (im)plausibility of the other conjuncts $p$. The question remains to know how we could assess the plausibility of each conjunct to examine the validaity of the substantive hypothesis. Interestingly, @strevens_bayesian_2001 suggested a way to numerically assess the plausibility of auxiliary hypotheses in order to quantify the plausibility in core theoretical assumptions and conclusions. Reformulating the problem os one of assigning "credit or blame to central hypotheses vs. auxiliary hypotheses" [@gershman_how_2019], @strevens_bayesian_2001 suggests a Bayesian framework for induction. Let $h$ denotes the substantive hypothesis, $a$ denotes the auxiliary hypothesis, and $d$ denote the data. After observing the data $d$, the prior probability of the conjunct $ha$ ($p(ha)$) is updated to the posterior distribution $p(ha|d)$ according to Bayes' rule:

$$
P(h a | d) = \frac{P(d | h a) P(h a)}{P(d | h a) P(h a)+P(d | \neg(h a)) P(\neg(h a))},
$$

where $p(d|ha)$ is the *likelihood* of the data under $ha$, and $\lnot (ha)$ denotes the negation of $ha$. From there, marginalising over all possible auxiliary hypotheses, the sum rule of probability allows us to obtain the updated belief about the substantive hypothesis:

$$P(h | d) = P(h a | d) + P(h \neg a | d).$$
Similarly, the marginal posterior over the auxiliary is given by:

$$P(a | d) = P(h a | d) + P(\neg h a | d).$$
...[for more details, see @gershman_how_2019;@strevens_bayesian_2001].



### Implication of these results for inner speech theories

...

### Implication of these results for rumination theories

...

<!--

A revised verson of @mackay_constraints_1992 constraints...

Condensation in rumination, look into think-aloud protocols (e.g. Lyubomirsky et al., 1999) ?

Différence entre petit effet homogène (dominant) et > effet hétéogène, réf aux travaux de haaf et rouder, further work should probably explore the domnancy of the effect

From Friston (2011): there is no need for separate inverse and forward models in motor control because the inverse model can be replaced by (Bayesian) inversion of the forward model […] page 491/ Active inference eschews the hard inverse problem by replacing optimal control signals that specify muscle movements (in an intrinsic frame) with prior beliefs about limb trajectories (in an extrinsic frame)  

From Pickering & clarke, IFM replace the need for an inversme model (AFM) ?

See also wlikinson & fernyough (2017)

Computational modelling ? For instance, model of motor imagery duration (in relation to execution duration), maybe find some inspiration in Tversky & Kahneman (1992) model of probability of winning a gamble vs subjective probability ? Cf. description of the model in Farell & Lewandowsky (2018, p. 252-253).

Clarify the logical chain derivation chain from inner speech to EMG correlates (i.e., inner speech = motor simulation = rehearsal of the neuro-motor networks implicated in speech production = incomplete inhibition = EMG traces)

Posterior prob of central hypo and auxiliary hypo ? Computing them via Bayes theorem ? See Gershman (2018; p.15)

How to overcome (bad) mental habits ? From Hertel (2004, page 209): In short, the best antidote to maladaptive habits is a new set of habits—not the opposite sort of habits recommended by Pollyanna and the teachings of Norman Vincent Peale (1956) and not the habits of suppression as recommended by certain grandmothers but the habits of thought control.

Describe model of van vugt... suractivation of neagtive memory chunks ? Alternatively, rumination can be seen in a Bayesian framework as overdetermined priors… or lack of flexibility.

Mental habit = low control (automaticity). Habits become habits through learning and association, in the same way a poem can be learned by heart… both can be more and more strongly internalised in a similar way…

See fitzgerald et al. (2014): how habits are created ? Through model comparison and model averaging, simpler model (habits models) are favoured over time

From Dolan & Doyan (2014): Model-free control is computationally efficient, since it replaces computation (i.e., the burdensome simulation of future states) with memory (i.e., stored discounted values of expected future reward); however, the forward-looking nature of the pre- diction error makes it statistically inefficient (Daw et al., 2005).

>> More automatic inner speech relies more on associate memory-based processes while less automatic (more intentional / deliberate) relies more on deliberate simulation mechanisms. Why ? Because habitual motor action relies on memory-based stored association (mappings) between motor command and sensory consequences. 

In contrast, new (unusual) motor commands, to be imagined, needs to go through the simulation/emulation 
mechanism. This could be tested by creating habits (via learning) of differents words and comparing their EMG traces and / or suppression by articulatory suppression… For instance, mental multiplication ? Learned arithmetic table ? Poems ? Also see: https://link.springer.com/content/pdf/10.3758%2Fs13421-013-0320-y.pdf

The condensation dimension might not be related to “embodiment” (e.g., EMG traces) as automatic thoughts vary along that axis… (e.g., an earworm).

Perspectives: AFM ou IFM ? Ouverture vers post-doc et mécanismes inhibiteurs

-->

## Limitations and ways forward

...

## Conclusion

...
