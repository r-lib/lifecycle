# boral

<details>

* Version: 1.9
* GitHub: NA
* Source code: https://github.com/cran/boral
* Date/Publication: 2020-07-17 09:20:12 UTC
* Number of recursive dependencies: 25

Run `cloud_details(, "boral")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘boral-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘calc.condlogLik.Rd’, ‘calc.logLik.lv0.Rd’, ‘tidyboral.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
    ```

# chk

<details>

* Version: 0.5.1
* GitHub: https://github.com/poissonconsulting/chk
* Source code: https://github.com/cran/chk
* Date/Publication: 2020-07-24 09:40:14 UTC
* Number of recursive dependencies: 54

Run `cloud_details(, "chk")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘chk-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    problem found in ‘chk_deprecated.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
    ```

# cSEM

<details>

* Version: 0.3.0
* GitHub: https://github.com/M-E-Rademaker/cSEM
* Source code: https://github.com/cran/cSEM
* Date/Publication: 2020-10-12 16:40:03 UTC
* Number of recursive dependencies: 124

Run `cloud_details(, "cSEM")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘cSEM-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

## In both

*   checking whether package ‘cSEM’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: replacing previous import ‘cli::num_ansi_colors’ by ‘crayon::num_ansi_colors’ when loading ‘cSEM’
    See ‘/tmp/workdir/cSEM/new/cSEM.Rcheck/00install.out’ for details.
    ```

*   checking Rd files ... WARNING
    ```
    prepare_Rd: replacing previous import ‘cli::num_ansi_colors’ by ‘crayon::num_ansi_colors’ when loading ‘cSEM’
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘assess.Rd’, ‘doIPMA.Rd’, ‘doNonlinearEffectsAnalysis.Rd’, ‘predict.Rd’, ‘testOMF.Rd’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

# cvms

<details>

* Version: 1.2.0
* GitHub: https://github.com/ludvigolsen/cvms
* Source code: https://github.com/cran/cvms
* Date/Publication: 2020-10-18 21:50:05 UTC
* Number of recursive dependencies: 129

Run `cloud_details(, "cvms")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘cvms-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘baseline.Rd’, ‘baseline_binomial.Rd’, ‘baseline_gaussian.Rd’, ‘baseline_multinomial.Rd’, ‘combine_predictors.Rd’, ‘evaluate.Rd’, ‘multiclass_probability_tibble.Rd’, ‘reconstruct_formulas.Rd’, ‘select_metrics.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      y[3]: "double"
      
      x[4]: "logical"
      y[4]: "double"
      
      x[5]: "logical"
      y[5]: "double"
      ── Failure (test_validate_fn.R:4894:3): testing nested tibbles in gaussian validate_fn() ──
      dim(output_19148) not equal to 4:5.
      1/2 mismatches
      [1] 2 - 4 == -2
      
      [ FAIL 33 | WARN 300 | SKIP 61 | PASS 3910 ]
      Error: Test failures
      Execution halted
    ```

# distributional

<details>

* Version: 0.2.2
* GitHub: https://github.com/mitchelloharawild/distributional
* Source code: https://github.com/cran/distributional
* Date/Publication: 2021-02-02 13:10:02 UTC
* Number of recursive dependencies: 91

Run `cloud_details(, "distributional")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘distributional-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘dist_beta.Rd’, ‘dist_cauchy.Rd’, ‘dist_inflated.Rd’, ‘dist_multinomial.Rd’, ‘dist_multivariate_normal.Rd’, ‘dist_percentile.Rd’, ‘geom_hilo_ribbon.Rd’, ‘hilo.distribution.Rd’, ‘likelihood.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

# dplyr

<details>

* Version: 1.0.4
* GitHub: https://github.com/tidyverse/dplyr
* Source code: https://github.com/cran/dplyr
* Date/Publication: 2021-02-02 17:10:03 UTC
* Number of recursive dependencies: 81

Run `cloud_details(, "dplyr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘dplyr-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problem found in ‘defunct.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# fabletools

<details>

* Version: 0.3.0
* GitHub: https://github.com/tidyverts/fabletools
* Source code: https://github.com/cran/fabletools
* Date/Publication: 2021-01-19 07:20:05 UTC
* Number of recursive dependencies: 98

Run `cloud_details(, "fabletools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘fabletools-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problem found in ‘agg_vec.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

# flobr

<details>

* Version: 0.2.1
* GitHub: https://github.com/poissonconsulting/flobr
* Source code: https://github.com/cran/flobr
* Date/Publication: 2020-05-15 17:20:10 UTC
* Number of recursive dependencies: 57

Run `cloud_details(, "flobr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘flobr-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    problem found in ‘pkgtemplate_deprecated.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
    ```

# gghighlight

<details>

* Version: 0.3.1
* GitHub: https://github.com/yutannihilation/gghighlight
* Source code: https://github.com/cran/gghighlight
* Date/Publication: 2020-12-12 06:10:02 UTC
* Number of recursive dependencies: 127

Run `cloud_details(, "gghighlight")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘gghighlight-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘gghighlight-old.Rd’, ‘gghighlight.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

# groupdata2

<details>

* Version: 1.3.0
* GitHub: https://github.com/ludvigolsen/groupdata2
* Source code: https://github.com/cran/groupdata2
* Date/Publication: 2020-06-15 15:50:02 UTC
* Number of recursive dependencies: 106

Run `cloud_details(, "groupdata2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘groupdata2-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘all_groups_identical.Rd’, ‘balance.Rd’, ‘differs_from_previous.Rd’, ‘downsample.Rd’, ‘find_missing_starts.Rd’, ‘find_starts.Rd’, ‘upsample.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

# gwsem

<details>

* Version: 2.0.9
* GitHub: https://github.com/jpritikin/gwsem
* Source code: https://github.com/cran/gwsem
* Date/Publication: 2021-01-12 10:20:02 UTC
* Number of recursive dependencies: 68

Run `cloud_details(, "gwsem")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘gwsem-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘GWAS.Rd’, ‘buildItem.Rd’, ‘buildOneFac.Rd’, ‘buildOneFacRes.Rd’, ‘buildTwoFac.Rd’, ‘isSuspicious.Rd’, ‘loadResults.Rd’, ‘prepareComputePlan.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.3Mb
      sub-directories of 1Mb or more:
        libs  12.1Mb
    ```

# mcmcr

<details>

* Version: 0.5.0
* GitHub: https://github.com/poissonconsulting/mcmcr
* Source code: https://github.com/cran/mcmcr
* Date/Publication: 2021-02-11 16:10:02 UTC
* Number of recursive dependencies: 54

Run `cloud_details(, "mcmcr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘mcmcr-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    problems found in ‘check_mcmcarray.Rd’, ‘check_mcmcr.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘generics’
      All declared Imports should be used.
    ```

# nanny

<details>

* Version: 0.1.8
* GitHub: NA
* Source code: https://github.com/cran/nanny
* Date/Publication: 2020-06-13 13:50:03 UTC
* Number of recursive dependencies: 167

Run `cloud_details(, "nanny")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘nanny-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘cluster_elements-methods.Rd’, ‘combine_nest-methods.Rd’, ‘fill_missing-methods.Rd’, ‘impute_missing-methods.Rd’, ‘keep_variable-methods.Rd’, ‘lower_triangular-methods.Rd’, ‘nest_subset-methods.Rd’, ‘permute_nest-methods.Rd’, ‘reduce_dimensions-methods.Rd’, ‘remove_redundancy-methods.Rd’, ‘rotate_dimensions-methods.Rd’, ‘subset-methods.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘knitr’ ‘lifecycle’ ‘lme4’ ‘methods’
      All declared Imports should be used.
    ```

# nlist

<details>

* Version: 0.3.1
* GitHub: https://github.com/poissonconsulting/nlist
* Source code: https://github.com/cran/nlist
* Date/Publication: 2021-02-06 22:00:03 UTC
* Number of recursive dependencies: 53

Run `cloud_details(, "nlist")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘nlist-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    problem found in ‘deprecated.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
    ```

# OpenMx

<details>

* Version: 2.18.1
* GitHub: https://github.com/OpenMx/OpenMx
* Source code: https://github.com/cran/OpenMx
* Date/Publication: 2020-08-28 07:50:12 UTC
* Number of recursive dependencies: 75

Run `cloud_details(, "OpenMx")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘OpenMx-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘mxData.Rd’, ‘mxPearsonSelCov.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 339.8Mb
      sub-directories of 1Mb or more:
        R         2.5Mb
        libs    329.6Mb
        models    4.7Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘ifaTools’, ‘umx’
    ```

# rFIA

<details>

* Version: 0.3.1
* GitHub: NA
* Source code: https://github.com/cran/rFIA
* Date/Publication: 2021-01-15 05:30:03 UTC
* Number of recursive dependencies: 90

Run `cloud_details(, "rFIA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘rFIA-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘biomass.Rd’, ‘clipFIA.Rd’, ‘diversity.Rd’, ‘findEVALID.Rd’, ‘fsi.Rd’, ‘makeClasses.Rd’, ‘plotFIA.Rd’, ‘volume.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lifecycle’
      All declared Imports should be used.
    ```

# rpdo

<details>

* Version: 0.3.1
* GitHub: https://github.com/poissonconsulting/rpdo
* Source code: https://github.com/cran/rpdo
* Date/Publication: 2020-07-09 23:00:16 UTC
* Number of recursive dependencies: 60

Run `cloud_details(, "rpdo")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘rpdo-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    problem found in ‘pdo_download.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘rsoi’
    ```

# rRofex

<details>

* Version: 2.0.3
* GitHub: https://github.com/matbarofex/rRofex
* Source code: https://github.com/cran/rRofex
* Date/Publication: 2020-08-01 00:20:02 UTC
* Number of recursive dependencies: 46

Run `cloud_details(, "rRofex")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘rRofex-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘trading_account.Rd’, ‘trading_account_report.Rd’, ‘trading_cancel_order.Rd’, ‘trading_new_order.Rd’, ‘trading_ws_close.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

# santoku

<details>

* Version: 0.5.0
* GitHub: https://github.com/hughjonesd/santoku
* Source code: https://github.com/cran/santoku
* Date/Publication: 2020-08-27 11:30:09 UTC
* Number of recursive dependencies: 66

Run `cloud_details(, "santoku")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘santoku-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    problem found in ‘knife.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Did you mean "deprecated"?
    Execution halted
    ```

# scales

<details>

* Version: 1.1.1
* GitHub: https://github.com/r-lib/scales
* Source code: https://github.com/cran/scales
* Date/Publication: 2020-05-11 23:20:05 UTC
* Number of recursive dependencies: 62

Run `cloud_details(, "scales")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘scales-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘cbreaks.Rd’, ‘date_breaks.Rd’, ‘format_format.Rd’, ‘number_bytes_format.Rd’, ‘trans_breaks.Rd’, ‘trans_format.Rd’, ‘unit_format.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘plyr’
    ```

# term

<details>

* Version: 0.3.1
* GitHub: https://github.com/poissonconsulting/term
* Source code: https://github.com/cran/term
* Date/Publication: 2021-02-06 21:50:02 UTC
* Number of recursive dependencies: 48

Run `cloud_details(, "term")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘term-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘npdims.term.Rd’, ‘pars_terms.Rd’, ‘subset.term.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

# tidygate

<details>

* Version: 0.4.0
* GitHub: NA
* Source code: https://github.com/cran/tidygate
* Date/Publication: 2021-01-18 16:30:03 UTC
* Number of recursive dependencies: 72

Run `cloud_details(, "tidygate")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘tidygate-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(tidygate)
      > 
      > test_check("tidygate")
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-methods.R:75:5): gate DEPRECATED ──────────────────────────────
      `\.` does not match "is deprecated as of tidygate 0.3.0.".
      Actual value: "`gate\(\)` was deprecated in tidygate 0\.3\.0\.\\nPlease use `gate_chr\(\)` instead\.\\nThis warning is displayed once every 8 hours\.\\nCall `lifecycle::last_warnings\(\)` to see where this warning was generated\."
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 3 ]
      Error: Test failures
      Execution halted
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘gate-methods.Rd’, ‘gate_chr-methods.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘lme4’ ‘methods’ ‘stats’ ‘tidyselect’
      All declared Imports should be used.
    ```

# tidyHeatmap

<details>

* Version: 1.1.5
* GitHub: https://github.com/stemangiola/tidyHeatmap
* Source code: https://github.com/cran/tidyHeatmap
* Date/Publication: 2020-09-11 05:50:02 UTC
* Number of recursive dependencies: 140

Run `cloud_details(, "tidyHeatmap")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘tidyHeatmap-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘add_bar.Rd’, ‘add_line.Rd’, ‘add_point-methods.Rd’, ‘add_tile-methods.Rd’, ‘heatmap-methods.Rd’, ‘save_pdf-methods.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

# tidyr

<details>

* Version: 1.1.2
* GitHub: https://github.com/tidyverse/tidyr
* Source code: https://github.com/cran/tidyr
* Date/Publication: 2020-08-27 12:20:02 UTC
* Number of recursive dependencies: 64

Run `cloud_details(, "tidyr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘tidyr-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘chop.Rd’, ‘gather.Rd’, ‘hoist.Rd’, ‘nest_legacy.Rd’, ‘pack.Rd’, ‘pivot_longer.Rd’, ‘pivot_wider.Rd’, ‘spread.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
    ```

# tidyseurat

<details>

* Version: 0.1.17
* GitHub: NA
* Source code: https://github.com/cran/tidyseurat
* Date/Publication: 2020-11-23 10:50:02 UTC
* Number of recursive dependencies: 153

Run `cloud_details(, "tidyseurat")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘tidyseurat-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problem found in ‘pivot_longer.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

# tongfen

<details>

* Version: 0.3
* GitHub: https://github.com/mountainMath/tongfen
* Source code: https://github.com/cran/tongfen
* Date/Publication: 2020-11-04 11:00:02 UTC
* Number of recursive dependencies: 109

Run `cloud_details(, "tongfen")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘tongfen-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘add_census_ca_base_variables.Rd’, ‘aggregate_data_with_meta.Rd’, ‘check_tongfen_areas.Rd’, ‘estimate_tongfen_correspondence.Rd’, ‘estimate_tongfen_single_correspondence.Rd’, ‘get_single_correspondence_ca_census_for.Rd’, ‘get_tongfen_ca_census.Rd’, ‘get_tongfen_correspondence_ca_census.Rd’, ‘get_tongfen_us_census.Rd’, ‘meta_for_additive_variables.Rd’, ‘meta_for_ca_census_vectors.Rd’, ‘proportional_reaggregate.Rd’, ‘tongfen_aggregate.Rd’, ‘tongfen_estimate.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘geojsonsf’ ‘lwgeom’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 160 marked UTF-8 strings
    ```

# tsibble

<details>

* Version: 0.9.3
* GitHub: https://github.com/tidyverts/tsibble
* Source code: https://github.com/cran/tsibble
* Date/Publication: 2020-10-06 21:30:02 UTC
* Number of recursive dependencies: 92

Run `cloud_details(, "tsibble")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘tsibble-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘deprecated.Rd’, ‘slide.Rd’, ‘slide2.Rd’, ‘stretch.Rd’, ‘stretch2.Rd’, ‘tile.Rd’, ‘tile2.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

# zipangu

<details>

* Version: 0.2.3
* GitHub: https://github.com/uribo/zipangu
* Source code: https://github.com/cran/zipangu
* Date/Publication: 2021-02-07 20:10:03 UTC
* Number of recursive dependencies: 60

Run `cloud_details(, "zipangu")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running massageExamples to create ‘zipangu-Ex.R’ failed
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
     NONE
    ```

*   checking Rd files ... WARNING
    ```
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
     `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    problems found in ‘convert_jdate.Rd’, ‘convert_jyear.Rd’, ‘dl_zipcode_file.Rd’, ‘zipcode_spacer.Rd’
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error:  `stage` must be one of "experimental", "stable", "questioning", "superseded", or "deprecated".
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 47 marked UTF-8 strings
    ```

