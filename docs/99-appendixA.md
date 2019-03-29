# Appendix A. Multivariate Bayesian model{-}

To model the effect of our manipulations (e.g., rumination induction) on the EMG amplitude, we used a multivariate (i.e., with multiple outcomes) multilevel Bayesian model. This model can we written as follows.

$$
\begin{aligned}
\text{EMG}_{i} &\sim \mathrm{Normal}(\mu_{i}, \sigma_{e}) \\
\mu_{i} &= \alpha + \alpha_{participant[i]} + (\beta + \beta_{participant[i]}) \times \text{condition}_{i} \\
\begin{bmatrix}
\alpha_{\text{participant}} \\
\beta_{\text{participant}} \\
\end{bmatrix}
&\sim \mathrm{MVNormal}\bigg(\begin{bmatrix} 0 \\ 0 \end{bmatrix}, \textbf{S}\bigg) \\
\textbf{S} &=
\begin{pmatrix}
\sigma_{\alpha_{participant}}^{2} & \sigma_{\alpha_{participant}}\sigma_{\beta{participant}} \rho \\
\sigma_{\alpha_{participant}}\sigma_{\beta{participant}} \rho & \sigma_{\beta_{participant}}^{2} \\
\end{pmatrix} \\
\alpha &\sim \mathrm{Normal}(0, 10) \\
\beta &\sim \mathrm{Normal}(0, 10) \\
\alpha_{participant} &\sim \mathrm{Normal}(0, \sigma_{participant}) \\
\beta_{participant} &\sim \mathrm{Normal}(0, \sigma_{participant}) \\
\sigma_{\alpha_{participant}} &\sim \mathrm{HalfCauchy}(10) \\
\sigma_{\beta_{participant}} &\sim \mathrm{HalfCauchy}(10) \\
\sigma_{e} &\sim \mathrm{HalfCauchy}(10) \\
\textbf{R} &\sim \mathrm{LKJcorr}(2) \\
\end{aligned}
$$

\newpage
