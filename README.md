
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

## Year

### National

``` r
# Medicare Beneficiaries
levels(period = "year", level = "national", group = "total") |> 
  dplyr::mutate(pct_orig = round((bene_orig / bene_tot) * 100, digits = 2),
                pct_ma = round((bene_ma_oth / bene_tot) * 100, digits = 2),
                change_ab_tot = bene_tot - dplyr::lag(bene_tot, order_by = year),
                change_rel_tot = round(change_ab_tot / dplyr::lag(bene_tot, order_by = year) * 100, 
                                       digits = 2)) |> 
  dplyr::relocate(c("change_ab_tot", "change_rel_tot"), .after = bene_tot)
```

    #> # A tibble: 5 × 8
    #>    year bene_tot change_ab_tot change_rel_tot bene_orig bene_ma_oth pct_orig
    #>   <int>    <dbl>         <dbl>          <dbl>     <dbl>       <dbl>    <dbl>
    #> 1  2017 58457244            NA          NA     38667830    19789414     66.2
    #> 2  2018 59989883       1532639           2.62  38665082    21324800     64.4
    #> 3  2019 61514510       1524627           2.54  38577012    22937498     62.7
    #> 4  2020 62840267       1325757           2.16  37776345    25063922     60.1
    #> 5  2021 63905513       1065246           1.7   36369426    27536087     56.9
    #> # ℹ 1 more variable: pct_ma <dbl>

``` r
# Aged Beneficiaries
levels(period = "year", level = "national", group = "aged")
```

    #> # A tibble: 5 × 5
    #>    year bene_tot bene_aged_tot bene_aged_esrd bene_aged_no_esrd
    #>   <int>    <dbl>         <dbl>          <dbl>             <dbl>
    #> 1  2017 58457244      49678033         278642          49399391
    #> 2  2018 59989883      51303898         290243          51013655
    #> 3  2019 61514510      52991455         301798          52689658
    #> 4  2020 62840267      54531919         305080          54226839
    #> 5  2021 63905513      55858782         305788          55552994

``` r
# Disabled Beneficiaries
levels(period = "year", level = "national", group = "disabled")
```

    #> # A tibble: 5 × 5
    #>    year bene_tot bene_dsb_tot bene_dsb_esrd_and_only_esrd bene_dsb_no_esrd
    #>   <int>    <dbl>        <dbl>                       <dbl>            <dbl>
    #> 1  2017 58457244      8779211                      258366          8520845
    #> 2  2018 59989883      8685985                      261246          8424739
    #> 3  2019 61514510      8523055                      262179          8260876
    #> 4  2020 62840267      8308348                      255949          8052399
    #> 5  2021 63905513      8046731                      249670          7797061

``` r
# Beneficiaries with Hospital (Part A) and Supplementary (Part B)
levels(period = "year", level = "national", group = "partAB")
```

    #> # A tibble: 5 × 5
    #>    year bene_tot bene_ab_total bene_ab_orig bene_ab_ma_oth
    #>   <int>    <dbl>         <dbl>        <dbl>          <dbl>
    #> 1  2017 58457244      53008234     33242085       19766149
    #> 2  2018 59989883      54349822     33052639       21297184
    #> 3  2019 61514510      55653848     32758741       22895108
    #> 4  2020 62840267      56966865     31934411       25032454
    #> 5  2021 63905513      58043480     30540086       27503394

``` r
# Prescription Drug (Part D) Beneficiaries
levels(period = "year", level = "national", group = "partD")
```

    #> # A tibble: 5 × 5
    #>    year bene_tot bene_rx_tot bene_rx_pdp bene_rx_mapd
    #>   <int>    <dbl>       <dbl>       <dbl>        <dbl>
    #> 1  2017 58457244    42728443    25243684     17484759
    #> 2  2018 59989883    44249461    25563945     18685516
    #> 3  2019 61514510    45827091    25583137     20243954
    #> 4  2020 62840267    47413121    25171949     22241173
    #> 5  2021 63905513    48823714    24169759     24653955

<br>

### State

``` r
# Medicare Beneficiaries
levels(period = "year", level = "state", group = "total")
```

    #> # A tibble: 285 × 6
    #>     year state state_name           bene_tot bene_orig bene_ma_oth
    #>    <int> <chr> <chr>                   <dbl>     <dbl>       <dbl>
    #>  1  2017 AL    Alabama               1007423    640531      366892
    #>  2  2017 AK    Alaska                  91879     90549        1330
    #>  3  2017 AZ    Arizona               1226671    753929      472743
    #>  4  2017 AR    Arkansas               616231    480223      136008
    #>  5  2017 CA    California            5965489   3473379     2492111
    #>  6  2017 CO    Colorado               847702    530148      317554
    #>  7  2017 CT    Connecticut            654718    469847      184871
    #>  8  2017 DE    Delaware               193585    171150       22435
    #>  9  2017 DC    District of Columbia    91051     76569       14481
    #> 10  2017 FL    Florida               4295216   2468028     1827188
    #> # ℹ 275 more rows

``` r
# Aged Beneficiaries
levels(period = "year", level = "state", group = "aged")
```

    #> # A tibble: 285 × 7
    #>     year state state_name           bene_tot bene_aged_tot bene_aged_esrd
    #>    <int> <chr> <chr>                   <dbl>         <dbl>          <dbl>
    #>  1  2017 AL    Alabama               1007423        781833           4987
    #>  2  2017 AK    Alaska                  91879         79278            293
    #>  3  2017 AZ    Arizona               1226671       1072328           5361
    #>  4  2017 AR    Arkansas               616231        480992           2377
    #>  5  2017 CA    California            5965489       5268082          36785
    #>  6  2017 CO    Colorado               847702        745182           2593
    #>  7  2017 CT    Connecticut            654718        572564           2546
    #>  8  2017 DE    Delaware               193585        166603            949
    #>  9  2017 DC    District of Columbia    91051         76007            979
    #> 10  2017 FL    Florida               4295216       3747063          18045
    #> # ℹ 275 more rows
    #> # ℹ 1 more variable: bene_aged_no_esrd <dbl>

``` r
# Disabled Beneficiaries
levels(period = "year", level = "state", group = "disabled")
```

    #> # A tibble: 285 × 7
    #>     year state state_name           bene_tot bene_dsb_tot bene_dsb_esrd_and_on…¹
    #>    <int> <chr> <chr>                   <dbl>        <dbl>                  <dbl>
    #>  1  2017 AL    Alabama               1007423       225590                   5685
    #>  2  2017 AK    Alaska                  91879        12601                    369
    #>  3  2017 AZ    Arizona               1226671       154344                   4979
    #>  4  2017 AR    Arkansas               616231       135239                   2710
    #>  5  2017 CA    California            5965489       697407                  28986
    #>  6  2017 CO    Colorado               847702       102520                   2503
    #>  7  2017 CT    Connecticut            654718        82153                   2057
    #>  8  2017 DE    Delaware               193585        26982                    853
    #>  9  2017 DC    District of Columbia    91051        15044                    984
    #> 10  2017 FL    Florida               4295216       548153                  15765
    #> # ℹ 275 more rows
    #> # ℹ abbreviated name: ¹​bene_dsb_esrd_and_only_esrd
    #> # ℹ 1 more variable: bene_dsb_no_esrd <dbl>

``` r
# Beneficiaries with Hospital (Part A) and Supplementary (Part B)
levels(period = "year", level = "state", group = "partAB")
```

    #> # A tibble: 285 × 7
    #>     year state state_name     bene_tot bene_ab_total bene_ab_orig bene_ab_ma_oth
    #>    <int> <chr> <chr>             <dbl>         <dbl>        <dbl>          <dbl>
    #>  1  2017 AL    Alabama         1007423        935026       568207         366819
    #>  2  2017 AK    Alaska            91879         80134        78805           1329
    #>  3  2017 AZ    Arizona         1226671       1122760       650109         472650
    #>  4  2017 AR    Arkansas         616231        572605       436607         135999
    #>  5  2017 CA    California      5965489       5314498      2825802        2488697
    #>  6  2017 CO    Colorado         847702        764106       448313         315793
    #>  7  2017 CT    Connecticut      654718        587661       402823         184838
    #>  8  2017 DE    Delaware         193585        179142       156719          22423
    #>  9  2017 DC    District of C…    91051         74444        60015          14429
    #> 10  2017 FL    Florida         4295216       4026464      2199974        1826490
    #> # ℹ 275 more rows

``` r
# Prescription Drug (Part D) Beneficiaries
levels(period = "year", level = "state", group = "partD")
```

    #> # A tibble: 285 × 7
    #>     year state state_name     bene_tot bene_ab_total bene_ab_orig bene_ab_ma_oth
    #>    <int> <chr> <chr>             <dbl>         <dbl>        <dbl>          <dbl>
    #>  1  2017 AL    Alabama         1007423        935026       568207         366819
    #>  2  2017 AK    Alaska            91879         80134        78805           1329
    #>  3  2017 AZ    Arizona         1226671       1122760       650109         472650
    #>  4  2017 AR    Arkansas         616231        572605       436607         135999
    #>  5  2017 CA    California      5965489       5314498      2825802        2488697
    #>  6  2017 CO    Colorado         847702        764106       448313         315793
    #>  7  2017 CT    Connecticut      654718        587661       402823         184838
    #>  8  2017 DE    Delaware         193585        179142       156719          22423
    #>  9  2017 DC    District of C…    91051         74444        60015          14429
    #> 10  2017 FL    Florida         4295216       4026464      2199974        1826490
    #> # ℹ 275 more rows

<br>

### County

``` r
# Medicare Beneficiaries
levels(period = "year", level = "county", group = "total")
```

    #> # A tibble: 16,113 × 7
    #>     year state state_name county   bene_tot bene_orig bene_ma_oth
    #>    <int> <chr> <chr>      <chr>       <dbl>     <dbl>       <dbl>
    #>  1  2017 AL    Alabama    Autauga     10510      5784        4725
    #>  2  2017 AL    Alabama    Baldwin     48910     28388       20522
    #>  3  2017 AL    Alabama    Barbour      6275      4372        1903
    #>  4  2017 AL    Alabama    Bibb         4840      2480        2360
    #>  5  2017 AL    Alabama    Blount      12286      6070        6215
    #>  6  2017 AL    Alabama    Bullock      2008      1259         749
    #>  7  2017 AL    Alabama    Butler       4755      3748        1007
    #>  8  2017 AL    Alabama    Calhoun     27024     20110        6914
    #>  9  2017 AL    Alabama    Chambers     8722      6492        2230
    #> 10  2017 AL    Alabama    Cherokee     6943      4701        2242
    #> # ℹ 16,103 more rows

``` r
# Aged Beneficiaries
levels(period = "year", level = "county", group = "aged")
```

    #> # A tibble: 16,113 × 8
    #>     year state state_name county   bene_tot bene_aged_tot bene_aged_esrd
    #>    <int> <chr> <chr>      <chr>       <dbl>         <dbl>          <dbl>
    #>  1  2017 AL    Alabama    Autauga     10510          8046             48
    #>  2  2017 AL    Alabama    Baldwin     48910         41590            146
    #>  3  2017 AL    Alabama    Barbour      6275          4706             52
    #>  4  2017 AL    Alabama    Bibb         4840          3389             21
    #>  5  2017 AL    Alabama    Blount      12286          9542             38
    #>  6  2017 AL    Alabama    Bullock      2008          1434             20
    #>  7  2017 AL    Alabama    Butler       4755          3571             30
    #>  8  2017 AL    Alabama    Calhoun     27024         20142            125
    #>  9  2017 AL    Alabama    Chambers     8722          6342             61
    #> 10  2017 AL    Alabama    Cherokee     6943          5195             38
    #> # ℹ 16,103 more rows
    #> # ℹ 1 more variable: bene_aged_no_esrd <dbl>

``` r
# Disabled Beneficiaries
levels(period = "year", level = "county", group = "disabled")
```

    #> # A tibble: 16,113 × 8
    #>     year state state_name county   bene_tot bene_dsb_tot bene_dsb_esrd_and_onl…¹
    #>    <int> <chr> <chr>      <chr>       <dbl>        <dbl>                   <dbl>
    #>  1  2017 AL    Alabama    Autauga     10510         2463                      56
    #>  2  2017 AL    Alabama    Baldwin     48910         7320                     113
    #>  3  2017 AL    Alabama    Barbour      6275         1569                      54
    #>  4  2017 AL    Alabama    Bibb         4840         1451                      34
    #>  5  2017 AL    Alabama    Blount      12286         2744                      22
    #>  6  2017 AL    Alabama    Bullock      2008          574                      15
    #>  7  2017 AL    Alabama    Butler       4755         1184                      45
    #>  8  2017 AL    Alabama    Calhoun     27024         6882                     141
    #>  9  2017 AL    Alabama    Chambers     8722         2380                      53
    #> 10  2017 AL    Alabama    Cherokee     6943         1748                      25
    #> # ℹ 16,103 more rows
    #> # ℹ abbreviated name: ¹​bene_dsb_esrd_and_only_esrd
    #> # ℹ 1 more variable: bene_dsb_no_esrd <dbl>

``` r
# Beneficiaries with Hospital (Part A) and Supplementary (Part B)
levels(period = "year", level = "county", group = "partAB")
```

    #> # A tibble: 16,113 × 8
    #>     year state state_name county   bene_tot bene_ab_total bene_ab_orig
    #>    <int> <chr> <chr>      <chr>       <dbl>         <dbl>        <dbl>
    #>  1  2017 AL    Alabama    Autauga     10510          9810         5085
    #>  2  2017 AL    Alabama    Baldwin     48910         45818        25302
    #>  3  2017 AL    Alabama    Barbour      6275          5878         3975
    #>  4  2017 AL    Alabama    Bibb         4840          4553         2194
    #>  5  2017 AL    Alabama    Blount      12286         11570         5355
    #>  6  2017 AL    Alabama    Bullock      2008          1840         1091
    #>  7  2017 AL    Alabama    Butler       4755          4464         3457
    #>  8  2017 AL    Alabama    Calhoun     27024         24953        18039
    #>  9  2017 AL    Alabama    Chambers     8722          8221         5990
    #> 10  2017 AL    Alabama    Cherokee     6943          6602         4360
    #> # ℹ 16,103 more rows
    #> # ℹ 1 more variable: bene_ab_ma_oth <dbl>

``` r
# Prescription Drug (Part D) Beneficiaries
levels(period = "year", level = "county", group = "partD")
```

    #> # A tibble: 16,113 × 8
    #>     year state state_name county   bene_tot bene_rx_tot bene_rx_pdp bene_rx_mapd
    #>    <int> <chr> <chr>      <chr>       <dbl>       <dbl>       <dbl>        <dbl>
    #>  1  2017 AL    Alabama    Autauga     10510        7009        2396         4613
    #>  2  2017 AL    Alabama    Baldwin     48910       34959       15298        19661
    #>  3  2017 AL    Alabama    Barbour      6275        4649        2828         1821
    #>  4  2017 AL    Alabama    Bibb         4840        3602        1403         2199
    #>  5  2017 AL    Alabama    Blount      12286        9583        3523         6060
    #>  6  2017 AL    Alabama    Bullock      2008        1571         841          730
    #>  7  2017 AL    Alabama    Butler       4755        3592        2626          966
    #>  8  2017 AL    Alabama    Calhoun     27024       16854       10498         6355
    #>  9  2017 AL    Alabama    Chambers     8722        6392        4213         2180
    #> 10  2017 AL    Alabama    Cherokee     6943        5228        3275         1953
    #> # ℹ 16,103 more rows

## Month

### National

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

### State

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

### County

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
