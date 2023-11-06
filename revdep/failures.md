# atSNP

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/atSNP
* Number of recursive dependencies: 160

Run `revdepcheck::cloud_details(, "atSNP")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# BindingSiteFinder

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/BindingSiteFinder
* Number of recursive dependencies: 213

Run `revdepcheck::cloud_details(, "BindingSiteFinder")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# biodb

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/biodb
* Number of recursive dependencies: 124

Run `revdepcheck::cloud_details(, "biodb")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# biodbKegg

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/biodbKegg
* Number of recursive dependencies: 126

Run `revdepcheck::cloud_details(, "biodbKegg")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# biodbLipidmaps

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/biodbLipidmaps
* Number of recursive dependencies: 125

Run `revdepcheck::cloud_details(, "biodbLipidmaps")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# hermes

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/hermes
* Number of recursive dependencies: 164

Run `revdepcheck::cloud_details(, "hermes")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# ISAnalytics

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/ISAnalytics
* Number of recursive dependencies: 173

Run `revdepcheck::cloud_details(, "ISAnalytics")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# ngsReports

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/ngsReports
* Number of recursive dependencies: 122

Run `revdepcheck::cloud_details(, "ngsReports")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# OpenMx

<details>

* Version: 2.21.8
* GitHub: https://github.com/OpenMx/OpenMx
* Source code: https://github.com/cran/OpenMx
* Date/Publication: 2023-04-05 20:43:20 UTC
* Number of recursive dependencies: 147

Run `revdepcheck::cloud_details(, "OpenMx")` for more info

</details>

## In both

*   checking whether package ‘OpenMx’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/OpenMx/new/OpenMx.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘OpenMx’ ...
** package ‘OpenMx’ successfully unpacked and MD5 sums checked
** using staged installation
NOTE: ./configure is not an autoconf generated script.
Change default C/C++ compiler and default compile flags by editing ~/.R/Makevars
** libs
using C compiler: ‘gcc (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0’
using Fortran compiler: ‘GNU Fortran (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0’
using C++ compiler: ‘g++ (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0’
using C++17
...
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:714:32:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Product<Eigen::Product<Eigen::Product<Eigen::Product<Eigen::Product<Eigen::Product<Eigen::SelfAdjointView<Eigen::Matrix<double, -1, -1>, 1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::SelfAdjointView<Eigen::Matrix<double, -1, -1>, 1>, 0>; Derived = Eigen::Matrix<double, -1, -1>]’
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:225:24:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Product<Eigen::Product<Eigen::Product<Eigen::Product<Eigen::Product<Eigen::Product<Eigen::SelfAdjointView<Eigen::Matrix<double, -1, -1>, 1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::SelfAdjointView<Eigen::Matrix<double, -1, -1>, 1>, 0>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
Compute.cpp:3869:73:   required from here
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/GeneralBlockPanelKernel.h:1847:33: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__vector(2) double’} [-Wignored-attributes]
 1847 |             PacketBlock<Packet> kernel;
      |                                 ^~~~~~
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/GeneralBlockPanelKernel.h:1847:33: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__vector(2) double’} [-Wignored-attributes]
make: *** [/opt/R/4.3.1/lib/R/etc/Makeconf:200: Compute.o] Error 1
ERROR: compilation failed for package ‘OpenMx’
* removing ‘/tmp/workdir/OpenMx/new/OpenMx.Rcheck/OpenMx’


```
### CRAN

```
* installing *source* package ‘OpenMx’ ...
** package ‘OpenMx’ successfully unpacked and MD5 sums checked
** using staged installation
NOTE: ./configure is not an autoconf generated script.
Change default C/C++ compiler and default compile flags by editing ~/.R/Makevars
** libs
using C compiler: ‘gcc (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0’
using Fortran compiler: ‘GNU Fortran (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0’
using C++ compiler: ‘g++ (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0’
using C++17
...
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:714:32:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Product<Eigen::Product<Eigen::Product<Eigen::Product<Eigen::Product<Eigen::Product<Eigen::SelfAdjointView<Eigen::Matrix<double, -1, -1>, 1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::SelfAdjointView<Eigen::Matrix<double, -1, -1>, 1>, 0>; Derived = Eigen::Matrix<double, -1, -1>]’
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:225:24:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Product<Eigen::Product<Eigen::Product<Eigen::Product<Eigen::Product<Eigen::Product<Eigen::SelfAdjointView<Eigen::Matrix<double, -1, -1>, 1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, -1>, 0>, Eigen::SelfAdjointView<Eigen::Matrix<double, -1, -1>, 1>, 0>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
Compute.cpp:3869:73:   required from here
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/GeneralBlockPanelKernel.h:1847:33: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__vector(2) double’} [-Wignored-attributes]
 1847 |             PacketBlock<Packet> kernel;
      |                                 ^~~~~~
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/GeneralBlockPanelKernel.h:1847:33: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__vector(2) double’} [-Wignored-attributes]
make: *** [/opt/R/4.3.1/lib/R/etc/Makeconf:200: Compute.o] Error 1
ERROR: compilation failed for package ‘OpenMx’
* removing ‘/tmp/workdir/OpenMx/old/OpenMx.Rcheck/OpenMx’


```
# ppcseq

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/ppcseq
* Number of recursive dependencies: 116

Run `revdepcheck::cloud_details(, "ppcseq")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# sccomp

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/sccomp
* Number of recursive dependencies: 201

Run `revdepcheck::cloud_details(, "sccomp")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# tidybulk

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/tidybulk
* Number of recursive dependencies: 355

Run `revdepcheck::cloud_details(, "tidybulk")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# tidySingleCellExperiment

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/tidySingleCellExperiment
* Number of recursive dependencies: 213

Run `revdepcheck::cloud_details(, "tidySingleCellExperiment")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# tidySummarizedExperiment

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/tidySummarizedExperiment
* Number of recursive dependencies: 110

Run `revdepcheck::cloud_details(, "tidySummarizedExperiment")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# Voyager

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/Voyager
* Number of recursive dependencies: 228

Run `revdepcheck::cloud_details(, "Voyager")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
