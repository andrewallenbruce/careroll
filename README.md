
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

# Yearly

## National

### Total

``` r
total_yr <- levels(period = "year", level = "national", group = "total")

total_yr |> 
  dplyr::filter(year == 2017 | year == 2021) |> 
  change_year(bene_tot)
```

    #> # A tibble: 2 × 4
    #>    year bene_tot change_abs change_pct
    #>   <int>    <dbl>      <dbl>      <dbl>
    #> 1  2017 58457244         NA    NA     
    #> 2  2021 63905513    5448269     0.0932

``` r
total_yr |> 
  dplyr::mutate(rolling_mean = slider::slide_mean(bene_tot, before = 1)) |> 
  change_year(bene_tot)
```

    #> # A tibble: 5 × 5
    #>    year bene_tot rolling_mean change_abs change_pct
    #>   <int>    <dbl>        <dbl>      <dbl>      <dbl>
    #> 1  2017 58457244    58457244          NA    NA     
    #> 2  2018 59989883    59223564.    1532639     0.0262
    #> 3  2019 61514510    60752196.    1524627     0.0254
    #> 4  2020 62840267    62177388.    1325757     0.0216
    #> 5  2021 63905513    63372890     1065246     0.0170

### Orig & MA

``` r
origMA_yr <- levels(period = "year", level = "national", group = "origMA")

origMA_yr |> 
  dplyr::mutate(pct_orig = bene_orig / (bene_orig + bene_ma_oth),
                pct_ma = bene_ma_oth / (bene_orig + bene_ma_oth)) |> 
  change_year(bene_orig) |> 
  dplyr::rename(orig_change = change_abs, orig_pct_change = change_pct) |> 
  change_year(bene_ma_oth) |> 
  dplyr::rename(ma_change = change_abs, ma_pct_change = change_pct)
```

    #> # A tibble: 5 × 9
    #>    year bene_orig bene_ma_oth pct_orig pct_ma orig_change orig_pct_change
    #>   <int>     <dbl>       <dbl>    <dbl>  <dbl>       <dbl>           <dbl>
    #> 1  2017  38667830    19789414    0.661  0.339          NA      NA        
    #> 2  2018  38665082    21324800    0.645  0.355       -2748      -0.0000711
    #> 3  2019  38577012    22937498    0.627  0.373      -88070      -0.00228  
    #> 4  2020  37776345    25063922    0.601  0.399     -800667      -0.0208   
    #> 5  2021  36369426    27536087    0.569  0.431    -1406919      -0.0372   
    #> # ℹ 2 more variables: ma_change <dbl>, ma_pct_change <dbl>

### Aged

``` r
aged_yr <- levels(period = "year", level = "national", group = "aged")

aged_yr |> 
  dplyr::mutate(pct_aged = bene_aged_tot / bene_tot,
                pct_esrd = bene_aged_esrd / bene_aged_tot,
                pct_no_esrd = bene_aged_no_esrd / bene_aged_tot) |> 
  change_year(bene_aged_tot) |> 
  dplyr::rename(aged_change = change_abs, aged_pct_change = change_pct)
```

    #> # A tibble: 5 × 10
    #>    year bene_tot bene_aged_tot bene_aged_esrd bene_aged_no_esrd pct_aged
    #>   <int>    <dbl>         <dbl>          <dbl>             <dbl>    <dbl>
    #> 1  2017 58457244      49678033         278642          49399391    0.850
    #> 2  2018 59989883      51303898         290243          51013655    0.855
    #> 3  2019 61514510      52991455         301798          52689658    0.861
    #> 4  2020 62840267      54531919         305080          54226839    0.868
    #> 5  2021 63905513      55858782         305788          55552994    0.874
    #> # ℹ 4 more variables: pct_esrd <dbl>, pct_no_esrd <dbl>, aged_change <dbl>,
    #> #   aged_pct_change <dbl>

### Disabled

``` r
dsb_yr <- levels(period = "year", level = "national", group = "disabled")

dsb_yr |> 
  dplyr::mutate(pct_dsb = bene_dsb_tot / bene_tot,
                pct_dsb_esrd = bene_dsb_esrd_and_only_esrd / bene_dsb_tot,
                pct_dsb_no_esrd = bene_dsb_no_esrd / bene_dsb_tot) |> 
  change_year(bene_dsb_tot) |> 
  dplyr::rename(dsb_change = change_abs, dsb_pct_change = change_pct)
```

    #> # A tibble: 5 × 10
    #>    year bene_tot bene_dsb_tot bene_dsb_esrd_and_only_…¹ bene_dsb_no_esrd pct_dsb
    #>   <int>    <dbl>        <dbl>                     <dbl>            <dbl>   <dbl>
    #> 1  2017 58457244      8779211                    258366          8520845   0.150
    #> 2  2018 59989883      8685985                    261246          8424739   0.145
    #> 3  2019 61514510      8523055                    262179          8260876   0.139
    #> 4  2020 62840267      8308348                    255949          8052399   0.132
    #> 5  2021 63905513      8046731                    249670          7797061   0.126
    #> # ℹ abbreviated name: ¹​bene_dsb_esrd_and_only_esrd
    #> # ℹ 4 more variables: pct_dsb_esrd <dbl>, pct_dsb_no_esrd <dbl>,
    #> #   dsb_change <dbl>, dsb_pct_change <dbl>

### Part A & B

``` r
# Beneficiaries with Hospital (Part A) and Supplementary (Part B)
partAB_yr <- levels(period = "year", level = "national", group = "partAB")

partAB_yr |> 
  dplyr::mutate(pct_ab = bene_ab_total / bene_tot,
                pct_ab_orig = bene_ab_orig / bene_ab_total,
                pct_ab_ma_oth = bene_ab_ma_oth / bene_ab_total) |> 
  change_year(bene_ab_total) |> 
  dplyr::rename(ab_change = change_abs, ab_pct_change = change_pct)
```

    #> # A tibble: 5 × 10
    #>    year bene_tot bene_ab_total bene_ab_orig bene_ab_ma_oth pct_ab pct_ab_orig
    #>   <int>    <dbl>         <dbl>        <dbl>          <dbl>  <dbl>       <dbl>
    #> 1  2017 58457244      53008234     33242085       19766149  0.907       0.627
    #> 2  2018 59989883      54349822     33052639       21297184  0.906       0.608
    #> 3  2019 61514510      55653848     32758741       22895108  0.905       0.589
    #> 4  2020 62840267      56966865     31934411       25032454  0.907       0.561
    #> 5  2021 63905513      58043480     30540086       27503394  0.908       0.526
    #> # ℹ 3 more variables: pct_ab_ma_oth <dbl>, ab_change <dbl>, ab_pct_change <dbl>

### Part D

``` r
# Prescription Drug (Part D) Beneficiaries
partD_yr <- levels(period = "year", level = "national", group = "partD")

partD_yr |> 
  dplyr::mutate(pct_rx = bene_rx_tot / bene_tot,
                pct_rx_pdp = bene_rx_pdp / bene_rx_tot,
                pct_rx_mapd = bene_rx_mapd / bene_rx_tot) |> 
  change_year(bene_rx_tot) |> 
  dplyr::rename(rx_change = change_abs, rx_pct_change = change_pct)
```

    #> # A tibble: 5 × 10
    #>    year bene_tot bene_rx_tot bene_rx_pdp bene_rx_mapd pct_rx pct_rx_pdp
    #>   <int>    <dbl>       <dbl>       <dbl>        <dbl>  <dbl>      <dbl>
    #> 1  2017 58457244    42728443    25243684     17484759  0.731      0.591
    #> 2  2018 59989883    44249461    25563945     18685516  0.738      0.578
    #> 3  2019 61514510    45827091    25583137     20243954  0.745      0.558
    #> 4  2020 62840267    47413121    25171949     22241173  0.755      0.531
    #> 5  2021 63905513    48823714    24169759     24653955  0.764      0.495
    #> # ℹ 3 more variables: pct_rx_mapd <dbl>, rx_change <dbl>, rx_pct_change <dbl>

<br>

## State

``` r
# Medicare Beneficiaries
total_state_yr <- levels(period = "year", level = "state", group = "total")
```

``` r
# Aged Beneficiaries
aged_state_yr <- levels(period = "year", level = "state", group = "aged")
```

``` r
# Disabled Beneficiaries
dsb_state_yr <- levels(period = "year", level = "state", group = "disabled")
```

``` r
# Beneficiaries with Hospital (Part A) and Supplementary (Part B)
partAB_state_yr <- levels(period = "year", level = "state", group = "partAB")
```

``` r
# Prescription Drug (Part D) Beneficiaries
partD_state_yr <- levels(period = "year", level = "state", group = "partD")
```

<br>

## County

``` r
# Medicare Beneficiaries
total_county_yr <- levels(period = "year", level = "county", group = "total")
```

``` r
# Aged Beneficiaries
aged_county_yr <- levels(period = "year", level = "county", group = "aged")
```

``` r
# Disabled Beneficiaries
dsb_county_yr <- levels(period = "year", level = "county", group = "disabled")
```

``` r
# Beneficiaries with Hospital (Part A) and Supplementary (Part B)
partAB_county_yr <- levels(period = "year", level = "county", group = "partAB")
```

``` r
# Prescription Drug (Part D) Beneficiaries
partD_county_yr <- levels(period = "year", level = "county", group = "partD")
```

# Month

## National

``` r
# Medicare Beneficiaries
levels(period = "month", level = "national", group = "total")
```

    #> # A tibble: 12 × 5
    #>     year month     bene_tot bene_orig bene_ma_oth
    #>    <int> <chr>        <dbl>     <dbl>       <dbl>
    #>  1  2021 August    64092708  36362083    27730625
    #>  2  2021 September 64205181  36367940    27837241
    #>  3  2021 October   64301080  36379987    27921093
    #>  4  2021 November  64381367  36420411    27960956
    #>  5  2021 December  64473547  36487945    27985602
    #>  6  2022 January   64522277  35173593    29348684
    #>  7  2022 February  64492482  35098135    29394347
    #>  8  2022 March     64543413  35079288    29464125
    #>  9  2022 April     64598907  35034846    29564061
    #> 10  2022 May       64673459  35015438    29658021
    #> 11  2022 June      64744497  34993661    29750836
    #> 12  2022 July      64831706  34919687    29912019

``` r
# Aged Beneficiaries
levels(period = "month", level = "national", group = "aged")
```

    #> # A tibble: 12 × 6
    #>     year month     bene_tot bene_aged_tot bene_aged_esrd bene_aged_no_esrd
    #>    <int> <chr>        <dbl>         <dbl>          <dbl>             <dbl>
    #>  1  2021 August    64092708      56012739         297799          55714940
    #>  2  2021 September 64205181      56100172         291991          55808181
    #>  3  2021 October   64301080      56180436         285857          55894579
    #>  4  2021 November  64381367      56241208         279835          55961373
    #>  5  2021 December  64473547      56301890         273823          56028067
    #>  6  2022 January   64522277      56723513         308349          56415164
    #>  7  2022 February  64492482      56683511         300452          56383059
    #>  8  2022 March     64543413      56715692         294317          56421375
    #>  9  2022 April     64598907      56754505         288444          56466061
    #> 10  2022 May       64673459      56815359         283239          56532120
    #> 11  2022 June      64744497      56864729         277732          56586997
    #> 12  2022 July      64831706      56936772         272490          56664282

``` r
# Disabled Beneficiaries
levels(period = "month", level = "national", group = "disabled")
```

    #> # A tibble: 12 × 6
    #>     year month     bene_tot bene_dsb_tot bene_dsb_esrd_and_on…¹ bene_dsb_no_esrd
    #>    <int> <chr>        <dbl>        <dbl>                  <dbl>            <dbl>
    #>  1  2021 August    64092708      8079969                 249523          7830446
    #>  2  2021 September 64205181      8105009                 249214          7855795
    #>  3  2021 October   64301080      8120644                 248105          7872539
    #>  4  2021 November  64381367      8140159                 247153          7893006
    #>  5  2021 December  64473547      8171657                 246130          7925527
    #>  6  2022 January   64522277      7798764                 241340          7557424
    #>  7  2022 February  64492482      7808971                 239101          7569870
    #>  8  2022 March     64543413      7827721                 237900          7589821
    #>  9  2022 April     64598907      7844402                 236881          7607521
    #> 10  2022 May       64673459      7858100                 236028          7622072
    #> 11  2022 June      64744497      7879768                 234518          7645250
    #> 12  2022 July      64831706      7894934                 232535          7662399
    #> # ℹ abbreviated name: ¹​bene_dsb_esrd_and_only_esrd

``` r
# Beneficiaries with Hospital (Part A) and Supplementary (Part B)
levels(period = "month", level = "national", group = "partAB")
```

    #> # A tibble: 12 × 6
    #>     year month     bene_tot bene_ab_total bene_ab_orig bene_ab_ma_oth
    #>    <int> <chr>        <dbl>         <dbl>        <dbl>          <dbl>
    #>  1  2021 August    64092708      58278351     30580561       27697790
    #>  2  2021 September 64205181      58369224     30564716       27804508
    #>  3  2021 October   64301080      58435733     30547392       27888341
    #>  4  2021 November  64381367      58492520     30564326       27928194
    #>  5  2021 December  64473547      58563216     30610174       27953042
    #>  6  2022 January   64522277      58697772     29381915       29315857
    #>  7  2022 February  64492482      58672279     29310704       29361575
    #>  8  2022 March     64543413      58715155     29283810       29431345
    #>  9  2022 April     64598907      58779906     29248613       29531293
    #> 10  2022 May       64673459      58855192     29229980       29625212
    #> 11  2022 June      64744497      58935892     29217909       29717983
    #> 12  2022 July      64831706      59220817     29341694       29879123

``` r
# Prescription Drug (Part D) Beneficiaries
levels(period = "month", level = "national", group = "partD")
```

    #> # A tibble: 12 × 6
    #>     year month     bene_tot bene_rx_tot bene_rx_pdp bene_rx_mapd
    #>    <int> <chr>        <dbl>       <dbl>       <dbl>        <dbl>
    #>  1  2021 August    64092708    48997548    24156115     24841433
    #>  2  2021 September 64205181    49083048    24142036     24941012
    #>  3  2021 October   64301080    49153500    24131966     25021534
    #>  4  2021 November  64381367    49203219    24141304     25061915
    #>  5  2021 December  64473547    49241505    24154044     25087461
    #>  6  2022 January   64522277    49889544    23463857     26425687
    #>  7  2022 February  64492482    49907031    23428283     26478748
    #>  8  2022 March     64543413    49960110    23410551     26549559
    #>  9  2022 April     64598907    50013873    23367036     26646837
    #> 10  2022 May       64673459    50097946    23361943     26736003
    #> 11  2022 June      64744497    50190877    23365123     26825754
    #> 12  2022 July      64831706    50343344    23365035     26978309

## State

``` r
# Medicare Beneficiaries
levels(period = "month", level = "state", group = "total")
```

    #> # A tibble: 684 × 7
    #>     year month  state state_name           bene_tot bene_orig bene_ma_oth
    #>    <int> <chr>  <chr> <chr>                   <dbl>     <dbl>       <dbl>
    #>  1  2021 August AL    Alabama               1072505    527115      545390
    #>  2  2021 August AK    Alaska                 108856    106598        2258
    #>  3  2021 August AZ    Arizona               1404230    767775      636455
    #>  4  2021 August AR    Arkansas               654414    430169      224245
    #>  5  2021 August CA    California            6523853   3442959     3080894
    #>  6  2021 August CO    Colorado               965609    519995      445614
    #>  7  2021 August CT    Connecticut            704756    362700      342056
    #>  8  2021 August DE    Delaware               223611    171416       52195
    #>  9  2021 August DC    District of Columbia    94288     70143       24145
    #> 10  2021 August FL    Florida               4818048   2358735     2459313
    #> # ℹ 674 more rows

``` r
# Aged Beneficiaries
levels(period = "month", level = "state", group = "aged")
```

    #> # A tibble: 684 × 8
    #>     year month  state state_name           bene_tot bene_aged_tot bene_aged_esrd
    #>    <int> <chr>  <chr> <chr>                   <dbl>         <dbl>          <dbl>
    #>  1  2021 August AL    Alabama               1072505        867759           5344
    #>  2  2021 August AK    Alaska                 108856         97029            365
    #>  3  2021 August AZ    Arizona               1404230       1260141           5733
    #>  4  2021 August AR    Arkansas               654414        528256           2671
    #>  5  2021 August CA    California            6523853       5918013          39105
    #>  6  2021 August CO    Colorado               965609        875251           2894
    #>  7  2021 August CT    Connecticut            704756        628541           2721
    #>  8  2021 August DE    Delaware               223611        198195           1072
    #>  9  2021 August DC    District of Columbia    94288         81190            923
    #> 10  2021 August FL    Florida               4818048       4302487          20296
    #> # ℹ 674 more rows
    #> # ℹ 1 more variable: bene_aged_no_esrd <dbl>

``` r
# Disabled Beneficiaries
levels(period = "month", level = "state", group = "disabled")
```

    #> # A tibble: 684 × 8
    #>     year month  state state_name    bene_tot bene_dsb_tot bene_dsb_esrd_and_on…¹
    #>    <int> <chr>  <chr> <chr>            <dbl>        <dbl>                  <dbl>
    #>  1  2021 August AL    Alabama        1072505       204746                   5319
    #>  2  2021 August AK    Alaska          108856        11827                    395
    #>  3  2021 August AZ    Arizona        1404230       144089                   4933
    #>  4  2021 August AR    Arkansas        654414       126158                   2778
    #>  5  2021 August CA    California     6523853       605840                  26935
    #>  6  2021 August CO    Colorado        965609        90358                   2347
    #>  7  2021 August CT    Connecticut     704756        76215                   1944
    #>  8  2021 August DE    Delaware        223611        25416                    828
    #>  9  2021 August DC    District of …    94288        13098                    753
    #> 10  2021 August FL    Florida        4818048       515561                  15521
    #> # ℹ 674 more rows
    #> # ℹ abbreviated name: ¹​bene_dsb_esrd_and_only_esrd
    #> # ℹ 1 more variable: bene_dsb_no_esrd <dbl>

``` r
# Beneficiaries with Hospital (Part A) and Supplementary (Part B)
levels(period = "month", level = "state", group = "partAB")
```

    #> # A tibble: 684 × 8
    #>     year month  state state_name           bene_tot bene_ab_total bene_ab_orig
    #>    <int> <chr>  <chr> <chr>                   <dbl>         <dbl>        <dbl>
    #>  1  2021 August AL    Alabama               1072505        994211       448914
    #>  2  2021 August AK    Alaska                 108856         95922        93665
    #>  3  2021 August AZ    Arizona               1404230       1290697       654471
    #>  4  2021 August AR    Arkansas               654414        607064       382855
    #>  5  2021 August CA    California            6523853       5839500      2763487
    #>  6  2021 August CO    Colorado               965609        876124       433972
    #>  7  2021 August CT    Connecticut            704756        637618       295639
    #>  8  2021 August DE    Delaware               223611        206672       154494
    #>  9  2021 August DC    District of Columbia    94288         78484        54378
    #> 10  2021 August FL    Florida               4818048       4517960      2059475
    #> # ℹ 674 more rows
    #> # ℹ 1 more variable: bene_ab_ma_oth <dbl>

``` r
# Prescription Drug (Part D) Beneficiaries
levels(period = "month", level = "state", group = "partD")
```

    #> # A tibble: 684 × 8
    #>     year month  state state_name   bene_tot bene_rx_tot bene_rx_pdp bene_rx_mapd
    #>    <int> <chr>  <chr> <chr>           <dbl>       <dbl>       <dbl>        <dbl>
    #>  1  2021 August AL    Alabama       1072505      807899      288725       519174
    #>  2  2021 August AK    Alaska         108856       70147       68960         1187
    #>  3  2021 August AZ    Arizona       1404230     1072451      467916       604535
    #>  4  2021 August AR    Arkansas       654414      483197      273471       209726
    #>  5  2021 August CA    California    6523853     5255973     2277980      2977993
    #>  6  2021 August CO    Colorado       965609      730984      343406       387578
    #>  7  2021 August CT    Connecticut    704756      570887      265543       305344
    #>  8  2021 August DE    Delaware       223611      171440      129099        42341
    #>  9  2021 August DC    District of…    94288       59714       36399        23315
    #> 10  2021 August FL    Florida       4818048     3799169     1465730      2333439
    #> # ℹ 674 more rows

## County

``` r
# Medicare Beneficiaries
levels(period = "month", level = "county", group = "total")
```

    #> # A tibble: 38,688 × 8
    #>     year month  state state_name county   bene_tot bene_orig bene_ma_oth
    #>    <int> <chr>  <chr> <chr>      <chr>       <dbl>     <dbl>       <dbl>
    #>  1  2021 August AL    Alabama    Autauga     11417      5323        6094
    #>  2  2021 August AL    Alabama    Baldwin     57663     28236       29427
    #>  3  2021 August AL    Alabama    Barbour      6203      2639        3564
    #>  4  2021 August AL    Alabama    Bibb         4716      1846        2870
    #>  5  2021 August AL    Alabama    Blount      13252      5243        8009
    #>  6  2021 August AL    Alabama    Bullock      2302       931        1371
    #>  7  2021 August AL    Alabama    Butler       4959      2709        2250
    #>  8  2021 August AL    Alabama    Calhoun     27080     15531       11549
    #>  9  2021 August AL    Alabama    Chambers     8777      4421        4356
    #> 10  2021 August AL    Alabama    Cherokee     7467      3899        3568
    #> # ℹ 38,678 more rows

``` r
# Aged Beneficiaries
levels(period = "month", level = "county", group = "aged")
```

    #> # A tibble: 38,688 × 9
    #>     year month  state state_name county   bene_tot bene_aged_tot bene_aged_esrd
    #>    <int> <chr>  <chr> <chr>      <chr>       <dbl>         <dbl>          <dbl>
    #>  1  2021 August AL    Alabama    Autauga     11417          9039             54
    #>  2  2021 August AL    Alabama    Baldwin     57663         50646            191
    #>  3  2021 August AL    Alabama    Barbour      6203          4812             53
    #>  4  2021 August AL    Alabama    Bibb         4716          3499             30
    #>  5  2021 August AL    Alabama    Blount      13252         10715             40
    #>  6  2021 August AL    Alabama    Bullock      2302          1738             18
    #>  7  2021 August AL    Alabama    Butler       4959          3898             28
    #>  8  2021 August AL    Alabama    Calhoun     27080         21097            123
    #>  9  2021 August AL    Alabama    Chambers     8777          6680             75
    #> 10  2021 August AL    Alabama    Cherokee     7467          5863             37
    #> # ℹ 38,678 more rows
    #> # ℹ 1 more variable: bene_aged_no_esrd <dbl>

``` r
# Disabled Beneficiaries
levels(period = "month", level = "county", group = "disabled")
```

    #> # A tibble: 38,688 × 9
    #>     year month  state state_name county   bene_tot bene_dsb_tot
    #>    <int> <chr>  <chr> <chr>      <chr>       <dbl>        <dbl>
    #>  1  2021 August AL    Alabama    Autauga     11417         2378
    #>  2  2021 August AL    Alabama    Baldwin     57663         7017
    #>  3  2021 August AL    Alabama    Barbour      6203         1391
    #>  4  2021 August AL    Alabama    Bibb         4716         1217
    #>  5  2021 August AL    Alabama    Blount      13252         2537
    #>  6  2021 August AL    Alabama    Bullock      2302          564
    #>  7  2021 August AL    Alabama    Butler       4959         1061
    #>  8  2021 August AL    Alabama    Calhoun     27080         5983
    #>  9  2021 August AL    Alabama    Chambers     8777         2097
    #> 10  2021 August AL    Alabama    Cherokee     7467         1604
    #> # ℹ 38,678 more rows
    #> # ℹ 2 more variables: bene_dsb_esrd_and_only_esrd <dbl>, bene_dsb_no_esrd <dbl>

``` r
# Beneficiaries with Hospital (Part A) and Supplementary (Part B)
levels(period = "month", level = "county", group = "partAB")
```

    #> # A tibble: 38,688 × 9
    #>     year month  state state_name county   bene_tot bene_ab_total bene_ab_orig
    #>    <int> <chr>  <chr> <chr>      <chr>       <dbl>         <dbl>        <dbl>
    #>  1  2021 August AL    Alabama    Autauga     11417         10583         4491
    #>  2  2021 August AL    Alabama    Baldwin     57663         53990        24574
    #>  3  2021 August AL    Alabama    Barbour      6203          5868         2305
    #>  4  2021 August AL    Alabama    Bibb         4716          4417         1547
    #>  5  2021 August AL    Alabama    Blount      13252         12466         4457
    #>  6  2021 August AL    Alabama    Bullock      2302          2127          756
    #>  7  2021 August AL    Alabama    Butler       4959          4647         2397
    #>  8  2021 August AL    Alabama    Calhoun     27080         24984        13435
    #>  9  2021 August AL    Alabama    Chambers     8777          8197         3841
    #> 10  2021 August AL    Alabama    Cherokee     7467          7106         3538
    #> # ℹ 38,678 more rows
    #> # ℹ 1 more variable: bene_ab_ma_oth <dbl>

``` r
# Prescription Drug (Part D) Beneficiaries
levels(period = "month", level = "county", group = "partD")
```

    #> # A tibble: 38,688 × 9
    #>     year month  state state_name county   bene_tot bene_rx_tot bene_rx_pdp
    #>    <int> <chr>  <chr> <chr>      <chr>       <dbl>       <dbl>       <dbl>
    #>  1  2021 August AL    Alabama    Autauga     11417        7871        1928
    #>  2  2021 August AL    Alabama    Baldwin     57663       43444       15409
    #>  3  2021 August AL    Alabama    Barbour      6203        4949        1526
    #>  4  2021 August AL    Alabama    Bibb         4716        3640         978
    #>  5  2021 August AL    Alabama    Blount      13252       10695        2891
    #>  6  2021 August AL    Alabama    Bullock      2302        1868         545
    #>  7  2021 August AL    Alabama    Butler       4959        3897        1761
    #>  8  2021 August AL    Alabama    Calhoun     27080       17909        7039
    #>  9  2021 August AL    Alabama    Chambers     8777        6842        2614
    #> 10  2021 August AL    Alabama    Cherokee     7467        5913        2619
    #> # ℹ 38,678 more rows
    #> # ℹ 1 more variable: bene_rx_mapd <dbl>
