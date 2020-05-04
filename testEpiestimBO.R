# R-code to implement the estimation of time-varying reproduction rates
# as in Thompson et.al. (2019)"Improved inference of time-varying reproduction numbers during infectious
# disease outbreaks" Epidemics (29) 2019.
#
# The underlying tools of the EpiEstim package are is described 
# Anne Cori, Neil M. Ferguson, Christophe Fraser and Simon Cauchemez  (2013).
# "A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics" 
# American Journal of Epidemiology, Volume 178, Issue 9.
#
# Estimates for the mean and standard deviation of the serial interval were obtained from:
# 
# Hiroshi Nishiura, Natalie M. Linton, Andrei R. Akhmetzhanov (2020) 
# "Serial interval of novel coronavirus (COVID-19) infections",
# International Journal of Infectious Diseases, Volume 93.
#
# The data related to Bolivia was obtained from:https://en.wikipedia.org/wiki/2020_coronavirus_pandemic_in_Bolivia
# The data related to other countres was obtained from  Johns Hopkins University Center for Systems Science and Engineering (JHU CSSE)
# https://github.com/CSSEGISandData/COVID-19.
#
# Written by: Pablo Cuba-Borda
# Last modified: April-29-2020
#==========================================================================================

library(EpiEstim)

disease_incidence_data <- read.csv("IncidenceBolivia.csv", header = TRUE)
disease_incidence_data$dates <- as.Date(disease_incidence_data$dates, "%d/%m/%y")

# Estimate model for Bolivia. Data starts on 21/03/20 (obs 60), ends on 29/04/20 (obs 99)
# Serial interval window = 8 days

res_bo <- estimate_R(incid = disease_incidence_data$bolivia[60:99], method = "uncertain_si",
                     config = make_config(list(
                       t_start = seq(2, 32), t_end = seq(10, 40),
                       mean_si = 4.0, std_mean_si = 0.5,
                       min_mean_si = 3.0, max_mean_si = 5,
                       std_si = 2.9, std_std_si = 0.5,
                       min_std_si = 1.9, max_std_si = 3.9,
                       n1 = 1000, n2 = 1000)))


# Estimate model for La Paz. Data starts on 21/03/20 (obs 60), ends on 29/04/20 (obs 99)
# Serial interval window = 8 days

res_lp <- estimate_R(incid = disease_incidence_data$lpz[60:99], method = "uncertain_si",
                     config = make_config(list(
                       t_start = seq(2, 32), t_end = seq(10, 40),
                       mean_si = 4.0, std_mean_si = 0.5,
                       min_mean_si = 3.0, max_mean_si = 5,
                       std_si = 2.9, std_std_si = 0.5,
                       min_std_si = 1.9, max_std_si = 3.9,
                       n1 = 1000, n2 = 1000)))

# Estimate model for Santa Cruz. Data starts on 21/03/20 (obs 60), ends on 29/04/20 (obs 99)
# Serial interval window = 8 days

res_sc <- estimate_R(incid = disease_incidence_data$scz[60:99], method = "uncertain_si",
                     config = make_config(list(
                       t_start = seq(2, 32), t_end = seq(10, 40),
                       mean_si = 4.0, std_mean_si = 0.5,
                       min_mean_si = 3.0, max_mean_si = 5,
                       std_si = 2.9, std_std_si = 0.5,
                       min_std_si = 1.9, max_std_si = 3.9,
                       n1 = 1000, n2 = 1000)))

# Estimate model for Cochabamba. Data starts on 21/03/20 (obs 60), ends on 29/04/20 (obs 99)
# Serial interval window = 8 days

res_cb <- estimate_R(incid = disease_incidence_data$cbb[60:99], method = "uncertain_si",
                     config = make_config(list(
                       t_start = seq(2, 32), t_end = seq(10, 40),
                       mean_si = 4.0, std_mean_si = 0.5,
                       min_mean_si = 3.0, max_mean_si = 5,
                       std_si = 2.9, std_std_si = 0.5,
                       min_std_si = 1.9, max_std_si = 3.9,
                       n1 = 1000, n2 = 1000)))


# Estimate model for South Kore. Data starts on 22/02/20 (obs 32), ends on 29/04/20 (obs 99)
# Serial interval window = 6 days

res_sk <- estimate_R(incid = disease_incidence_data$southkorea[32:99], method = "uncertain_si",
                     config = make_config(list(
                       t_start = seq(2, 62), t_end = seq(8, 68),
                       mean_si = 4.0, std_mean_si = 0.5,
                       min_mean_si = 3.0, max_mean_si = 5,
                       std_si = 2.9, std_std_si = 0.5,
                       min_std_si = 1.9, max_std_si = 3.9,
                       n1 = 1000, n2 = 1000)))

# Estimate model for Chile. Data starts on 11/03/20 (obs 50), ends on 29/04/20 (obs 99)
# Serial interval window = 8 days

res_ch <- estimate_R(incid = disease_incidence_data$chile[50:99], method = "uncertain_si",
                     config = make_config(list(
                       t_start = seq(2, 42), t_end = seq(10, 50),
                       mean_si = 4.0, std_mean_si = 0.5,
                       min_mean_si = 3.0, max_mean_si = 5,
                       std_si = 2.9, std_std_si = 0.5,
                       min_std_si = 1.9, max_std_si = 3.9,
                       n1 = 1000, n2 = 1000)))


## Visualize R estimates on the same plot
# Need to map dates as in estimation

res_sc$dates <-disease_incidence_data$dates[60:99]
res_cb$dates <-disease_incidence_data$dates[60:99]
res_lp$dates <-disease_incidence_data$dates[60:99]

res_bo$dates <-disease_incidence_data$dates[60:99]
res_sk$dates <-disease_incidence_data$dates[32:99]
res_ch$dates <-disease_incidence_data$dates[50:99]


# Collect plots
# Set ylim wide enough to avoid plot trimming.

p_sc <-plot(res_sc, what = "R",  options_R = list(col = c("blue"),ylim=c(0,4), ylab = "Santa Cruz"),legend=FALSE) 
p_lp <-plot(res_lp, what = "R",  options_R = list(col = c("blue"),ylim=c(0,4), ylab = "La Paz"),legend=FALSE) 
p_cb <-plot(res_cb, what = "R",  options_R = list(col = c("blue"),ylim=c(0,4), ylab = "Cochabamba"),legend=FALSE) 
p_bo <-plot(res_bo, what = "R",  options_R = list(col = c("blue"),ylim=c(0,4), ylab = "Bolivia"),legend=FALSE) 
p_sk <-plot(res_sk, what = "R",  options_R = list(col = c("blue"),ylim=c(0,4), ylab = "Corea del Sur"),legend=FALSE)
p_ch <-plot(res_ch, what = "R",  options_R = list(col = c("blue"),ylim=c(0,4), ylab = "Chile"),legend=FALSE) 

# Plot panel with Bolivian departments
gridExtra::grid.arrange(p_sc,p_lp,p_cb,ncol=2,nrow=2)

# Plot panel with countries
gridExtra::grid.arrange(p_sk,p_ch,p_bo,ncol=2,nrow=2)
