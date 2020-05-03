# Monitoring Reproduction Number for Coronavirus Outbreaks

 R-code to implement the estimation of time-varying reproduction rates
 as in Thompson et.al. (2019)"Improved inference of time-varying reproduction numbers during infectious
 disease outbreaks" Epidemics (29) 2019.

 The underlying tools of the EpiEstim package are is described 
 Anne Cori, Neil M. Ferguson, Christophe Fraser and Simon Cauchemez  (2013).
 "A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics" 
 American Journal of Epidemiology, Volume 178, Issue 9.

Estimates for the mean and standard deviation of the serial interval were obtained from:

 Hiroshi Nishiura, Natalie M. Linton, Andrei R. Akhmetzhanov (2020) 
 "Serial interval of novel coronavirus (COVID-19) infections",
 International Journal of Infectious Diseases, Volume 93.


### Libraries used

The only required package is the EpiEstim package. 

```
install.packages(EpiEstim)
```

Thompson RN, Stockwin JE, van Gaalen RD, Polonsky JA, et al. Improved inference of time-varying reproduction numbers during infectious disease outbreaks. Epidemics (2019).[https://www.sciencedirect.com/science/article/pii/S1755436519300350](https://www.sciencedirect.com/science/article/pii/S1755436519300350)

Check [https://github.com/jstockwin/EpiEstimApp/wiki/Example:-EpiEstim-R-package](https://github.com/jstockwin/EpiEstimApp/wiki/Example:-EpiEstim-R-package) for detailed installation instructions and troubleshooting. 


## Data sources

* [https://en.wikipedia.org/wiki/2020_coronavirus_pandemic_in_Bolivia](http://www.dropwizard.io/1.0.2/docs/ttps://en.wikipedia.org/wiki/2020_coronavirus_pandemic_in_Bolivia) - Incidence data for Bolivian Departments. 
* [Maven https://github.com/CSSEGISandData/COVID-19.
](https://maven.apache.org/ https://github.com/CSSEGISandData/COVID-19) - Incidence data by country from the Johns Hopkins University Center for Systems Science and Engineering (JHU CSSE) Coronavirus Project. 

## Authors

* **Pablo Cuba Borda** - *April 29, 2020* 


## Disclaimer

* The views expressed in this article are solely the responsibility of the authors and should not be interpreted as reflecting the views of the Board of Governors of the Federal Reserve System or of anyone else associated with the Federal Reserve System.

* Las opiniones acá presentadas son totalmente personales y no implican ni representan ninguna de las instituciones con las que estoy o estuve afiliado.
