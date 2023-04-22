
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {careroll}

<!-- badges: start -->
<!-- badges: end -->

## Installation

You can install the development version of careroll from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("andrewallenbruce/careroll", build_vignettes = TRUE)
```

``` r
# install.packages("remotes")
remotes::install_github("andrewallenbruce/careroll", build_vignettes = TRUE)
```

``` r
library(careroll)
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
cr <- careroll()
```

National totals by Year

``` r
cr |> dplyr::filter(month == "Year", 
                    level == "National")
```

    #> # A tibble: 5 × 22
    #>    year month level state state_name county fips  bene_tot bene_orig bene_ma_oth
    #>   <int> <chr> <chr> <chr> <chr>      <chr>  <chr>    <dbl>     <dbl>       <dbl>
    #> 1  2017 Year  Nati… US    National   Total  <NA>  58457244  38667830    19789414
    #> 2  2018 Year  Nati… US    National   Total  <NA>  59989883  38665082    21324800
    #> 3  2019 Year  Nati… US    National   Total  <NA>  61514510  38577012    22937498
    #> 4  2020 Year  Nati… US    National   Total  <NA>  62840267  37776345    25063922
    #> 5  2021 Year  Nati… US    National   Total  <NA>  63905513  36369426    27536087
    #> # ℹ 12 more variables: bene_aged_tot <dbl>, bene_aged_esrd <dbl>,
    #> #   bene_aged_no_esrd <dbl>, bene_dsb_tot <dbl>,
    #> #   bene_dsb_esrd_and_only_esrd <dbl>, bene_dsb_no_esrd <dbl>,
    #> #   bene_ab_total <dbl>, bene_ab_orig <dbl>, bene_ab_ma_oth <dbl>,
    #> #   bene_rx_tot <dbl>, bene_rx_pdp <dbl>, bene_rx_mapd <dbl>

State totals by Year

``` r
cr |> dplyr::filter(month == "Year", 
                    level == "State")
```

    #> # A tibble: 290 × 22
    #>     year month level state state_name           county fips  bene_tot bene_orig
    #>    <int> <chr> <chr> <chr> <chr>                <chr>  <chr>    <dbl>     <dbl>
    #>  1  2017 Year  State AL    Alabama              Total  01     1007423    640531
    #>  2  2017 Year  State AK    Alaska               Total  02       91879     90549
    #>  3  2017 Year  State AZ    Arizona              Total  04     1226671    753929
    #>  4  2017 Year  State AR    Arkansas             Total  05      616231    480223
    #>  5  2017 Year  State CA    California           Total  06     5965489   3473379
    #>  6  2017 Year  State CO    Colorado             Total  08      847702    530148
    #>  7  2017 Year  State CT    Connecticut          Total  09      654718    469847
    #>  8  2017 Year  State DE    Delaware             Total  10      193585    171150
    #>  9  2017 Year  State DC    District of Columbia Total  11       91051     76569
    #> 10  2017 Year  State FL    Florida              Total  12     4295216   2468028
    #> # ℹ 280 more rows
    #> # ℹ 13 more variables: bene_ma_oth <dbl>, bene_aged_tot <dbl>,
    #> #   bene_aged_esrd <dbl>, bene_aged_no_esrd <dbl>, bene_dsb_tot <dbl>,
    #> #   bene_dsb_esrd_and_only_esrd <dbl>, bene_dsb_no_esrd <dbl>,
    #> #   bene_ab_total <dbl>, bene_ab_orig <dbl>, bene_ab_ma_oth <dbl>,
    #> #   bene_rx_tot <dbl>, bene_rx_pdp <dbl>, bene_rx_mapd <dbl>

County totals by Year

``` r
cr |> dplyr::filter(month == "Year", 
                    level == "County")
```

    #> # A tibble: 16,378 × 22
    #>     year month level  state state_name county   fips  bene_tot bene_orig
    #>    <int> <chr> <chr>  <chr> <chr>      <chr>    <chr>    <dbl>     <dbl>
    #>  1  2017 Year  County AL    Alabama    Autauga  01001    10510      5784
    #>  2  2017 Year  County AL    Alabama    Baldwin  01003    48910     28388
    #>  3  2017 Year  County AL    Alabama    Barbour  01005     6275      4372
    #>  4  2017 Year  County AL    Alabama    Bibb     01007     4840      2480
    #>  5  2017 Year  County AL    Alabama    Blount   01009    12286      6070
    #>  6  2017 Year  County AL    Alabama    Bullock  01011     2008      1259
    #>  7  2017 Year  County AL    Alabama    Butler   01013     4755      3748
    #>  8  2017 Year  County AL    Alabama    Calhoun  01015    27024     20110
    #>  9  2017 Year  County AL    Alabama    Chambers 01017     8722      6492
    #> 10  2017 Year  County AL    Alabama    Cherokee 01019     6943      4701
    #> # ℹ 16,368 more rows
    #> # ℹ 13 more variables: bene_ma_oth <dbl>, bene_aged_tot <dbl>,
    #> #   bene_aged_esrd <dbl>, bene_aged_no_esrd <dbl>, bene_dsb_tot <dbl>,
    #> #   bene_dsb_esrd_and_only_esrd <dbl>, bene_dsb_no_esrd <dbl>,
    #> #   bene_ab_total <dbl>, bene_ab_orig <dbl>, bene_ab_ma_oth <dbl>,
    #> #   bene_rx_tot <dbl>, bene_rx_pdp <dbl>, bene_rx_mapd <dbl>

National totals by Month

``` r
cr |> dplyr::filter(month != "Year", 
                    level == "National")
```

    #> # A tibble: 12 × 22
    #>     year month     level    state state_name county fips  bene_tot bene_orig
    #>    <int> <chr>     <chr>    <chr> <chr>      <chr>  <chr>    <dbl>     <dbl>
    #>  1  2021 August    National US    National   Total  <NA>  64092708  36362083
    #>  2  2021 September National US    National   Total  <NA>  64205181  36367940
    #>  3  2021 October   National US    National   Total  <NA>  64301080  36379987
    #>  4  2021 November  National US    National   Total  <NA>  64381367  36420411
    #>  5  2021 December  National US    National   Total  <NA>  64473547  36487945
    #>  6  2022 January   National US    National   Total  <NA>  64522277  35173593
    #>  7  2022 February  National US    National   Total  <NA>  64492482  35098135
    #>  8  2022 March     National US    National   Total  <NA>  64543413  35079288
    #>  9  2022 April     National US    National   Total  <NA>  64598907  35034846
    #> 10  2022 May       National US    National   Total  <NA>  64673459  35015438
    #> 11  2022 June      National US    National   Total  <NA>  64744497  34993661
    #> 12  2022 July      National US    National   Total  <NA>  64831706  34919687
    #> # ℹ 13 more variables: bene_ma_oth <dbl>, bene_aged_tot <dbl>,
    #> #   bene_aged_esrd <dbl>, bene_aged_no_esrd <dbl>, bene_dsb_tot <dbl>,
    #> #   bene_dsb_esrd_and_only_esrd <dbl>, bene_dsb_no_esrd <dbl>,
    #> #   bene_ab_total <dbl>, bene_ab_orig <dbl>, bene_ab_ma_oth <dbl>,
    #> #   bene_rx_tot <dbl>, bene_rx_pdp <dbl>, bene_rx_mapd <dbl>

State totals by Month

``` r
cr |> dplyr::filter(month != "Year", 
                    level == "State")
```

    #> # A tibble: 696 × 22
    #>     year month  level state state_name           county fips  bene_tot bene_orig
    #>    <int> <chr>  <chr> <chr> <chr>                <chr>  <chr>    <dbl>     <dbl>
    #>  1  2021 August State AL    Alabama              Total  01     1072505    527115
    #>  2  2021 August State AK    Alaska               Total  02      108856    106598
    #>  3  2021 August State AZ    Arizona              Total  04     1404230    767775
    #>  4  2021 August State AR    Arkansas             Total  05      654414    430169
    #>  5  2021 August State CA    California           Total  06     6523853   3442959
    #>  6  2021 August State CO    Colorado             Total  08      965609    519995
    #>  7  2021 August State CT    Connecticut          Total  09      704756    362700
    #>  8  2021 August State DE    Delaware             Total  10      223611    171416
    #>  9  2021 August State DC    District of Columbia Total  11       94288     70143
    #> 10  2021 August State FL    Florida              Total  12     4818048   2358735
    #> # ℹ 686 more rows
    #> # ℹ 13 more variables: bene_ma_oth <dbl>, bene_aged_tot <dbl>,
    #> #   bene_aged_esrd <dbl>, bene_aged_no_esrd <dbl>, bene_dsb_tot <dbl>,
    #> #   bene_dsb_esrd_and_only_esrd <dbl>, bene_dsb_no_esrd <dbl>,
    #> #   bene_ab_total <dbl>, bene_ab_orig <dbl>, bene_ab_ma_oth <dbl>,
    #> #   bene_rx_tot <dbl>, bene_rx_pdp <dbl>, bene_rx_mapd <dbl>

County totals by Month

``` r
cr |> dplyr::filter(month != "Year", 
                    level == "County")
```

    #> # A tibble: 39,324 × 22
    #>     year month  level  state state_name county   fips  bene_tot bene_orig
    #>    <int> <chr>  <chr>  <chr> <chr>      <chr>    <chr>    <dbl>     <dbl>
    #>  1  2021 August County AL    Alabama    Autauga  01001    11417      5323
    #>  2  2021 August County AL    Alabama    Baldwin  01003    57663     28236
    #>  3  2021 August County AL    Alabama    Barbour  01005     6203      2639
    #>  4  2021 August County AL    Alabama    Bibb     01007     4716      1846
    #>  5  2021 August County AL    Alabama    Blount   01009    13252      5243
    #>  6  2021 August County AL    Alabama    Bullock  01011     2302       931
    #>  7  2021 August County AL    Alabama    Butler   01013     4959      2709
    #>  8  2021 August County AL    Alabama    Calhoun  01015    27080     15531
    #>  9  2021 August County AL    Alabama    Chambers 01017     8777      4421
    #> 10  2021 August County AL    Alabama    Cherokee 01019     7467      3899
    #> # ℹ 39,314 more rows
    #> # ℹ 13 more variables: bene_ma_oth <dbl>, bene_aged_tot <dbl>,
    #> #   bene_aged_esrd <dbl>, bene_aged_no_esrd <dbl>, bene_dsb_tot <dbl>,
    #> #   bene_dsb_esrd_and_only_esrd <dbl>, bene_dsb_no_esrd <dbl>,
    #> #   bene_ab_total <dbl>, bene_ab_orig <dbl>, bene_ab_ma_oth <dbl>,
    #> #   bene_rx_tot <dbl>, bene_rx_pdp <dbl>, bene_rx_mapd <dbl>
