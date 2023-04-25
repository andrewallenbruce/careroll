#' Download Medicare Beneficiary Enrollment Data
#' @return A `tibble`
#' @examples
#' \dontrun{
#' careroll()
#' }
#' @autoglobal
#' @export
careroll <- function() {

  # build URL ---------------------------------------------------------------
  http   <- "https://data.cms.gov/data-api/v1/dataset/"
  id     <- "30fe2d89-c56c-4a48-8e3a-3d07ad995c0b"
  post   <- "/data.json?"
  url    <- paste0(http, id, post)

  req <- httr2::request(url) |> httr2::req_perform()

  resp <- tibble::tibble(httr2::resp_body_json(req,
          check_type = FALSE, simplifyVector = TRUE))

  resp |>
    janitor::clean_names() |>
    dplyr::rename(level                       = bene_geo_lvl,
                  state                       = bene_state_abrvtn,
                  state_name                  = bene_state_desc,
                  county                      = bene_county_desc,
                  fips                        = bene_fips_cd,
                  bene_tot                    = tot_benes,
                  bene_orig                   = orgnl_mdcr_benes,
                  bene_ma_oth                 = ma_and_oth_benes,
                  bene_aged_tot               = aged_tot_benes,
                  bene_aged_esrd              = aged_esrd_benes,
                  bene_aged_no_esrd           = aged_no_esrd_benes,
                  bene_dsb_tot                = dsbld_tot_benes,
                  bene_dsb_esrd_and_only_esrd = dsbld_esrd_and_esrd_only_benes,
                  bene_dsb_no_esrd            = dsbld_no_esrd_benes,
                  bene_ab_total               = a_b_tot_benes,
                  bene_ab_orig                = a_b_orgnl_mdcr_benes,
                  bene_ab_ma_oth              = a_b_ma_and_oth_benes,
                  bene_rx_tot                 = prscrptn_drug_tot_benes,
                  bene_rx_pdp                 = prscrptn_drug_pdp_benes,
                  bene_rx_mapd                = prscrptn_drug_mapd_benes) |>
    dplyr::mutate(fips = dplyr::na_if(fips, "")) |>
    dplyr::filter(state != "UK") |>
    dplyr::filter(county != "Unknown") |>
    dplyr::mutate(dplyr::across(dplyr::contains("bene"), as.numeric))

}

#' Download and sort Medicare Beneficiary Enrollment Data
#' @param period year, month
#' @param level national, state, county
#' @param group total, aged, disabled, partAB, partD
#' @return A `tibble`
#' @examples
#' \dontrun{
#' levels()
#' }
#' @autoglobal
#' @export
levels <- function(period = c("year", "month"),
                   level  = c("national", "state", "county"),
                   group  = c("total", "aged", "disabled",
                              "partAB", "partD")) {

  if (period == "year") {
    if (level == "national") {
      if (group == "total") {

    return(careroll() |>
      dplyr::filter(month == "Year",
                    level == "National") |>
          dplyr::select(year, bene_tot))

      }

      if (group == "origMA") {

        return(careroll() |>
                 dplyr::filter(month == "Year",
                               level == "National") |>
                 dplyr::select(year, bene_orig, bene_ma_oth))

      }

      if (group == "aged") {
        return(careroll() |>
          dplyr::filter(month == "Year",
                        level == "National") |>
          dplyr::select(year, bene_tot, dplyr::contains("aged")))

      }

      if (group == "disabled") {
        return(careroll() |>
          dplyr::filter(month == "Year",
                        level == "National") |>
          dplyr::select(year, bene_tot, dplyr::contains("dsb")))

      }

      if (group == "partAB") {
        return(careroll() |>
          dplyr::filter(month == "Year",
                        level == "National") |>
          dplyr::select(year, bene_tot, dplyr::contains("ab")))

      }

      if (group == "partD") {
        return(careroll() |>
          dplyr::filter(month == "Year",
                        level == "National") |>
          dplyr::select(year, bene_tot, dplyr::contains("rx")))

      }
    }

    if (level == "state") {
      if (group == "total") {

        return(careroll() |>
                 dplyr::filter(month == "Year",
                               level == "State") |>
                 dplyr::select(year, state, state_name,
                               bene_tot))

      }

      if (group == "origMA") {

        return(careroll() |>
                 dplyr::filter(month == "Year",
                               level == "State") |>
                 dplyr::select(year, state, state_name,
                               bene_orig, bene_ma_oth))

      }

      if (group == "aged") {
        return(careroll() |>
          dplyr::filter(month == "Year",
                        level == "State") |>
          dplyr::select(year, state, state_name,
                        bene_tot, dplyr::contains("aged")))

      }

      if (group == "disabled") {
        return(careroll() |>
          dplyr::filter(month == "Year",
                        level == "State") |>
          dplyr::select(year, state, state_name,
                        bene_tot, dplyr::contains("dsb")))

      }

      if (group == "partAB") {
        return(careroll() |>
          dplyr::filter(month == "Year",
                        level == "State") |>
          dplyr::select(year, state, state_name,
                        bene_tot, dplyr::contains("ab")))

      }

      if (group == "partD") {
        return(careroll() |>
          dplyr::filter(month == "Year",
                        level == "State") |>
          dplyr::select(year, state, state_name,
                        bene_tot, dplyr::contains("ab")))

      }
    }

    if (level == "county") {
      if (group == "total") {

        return(careroll() |>
      dplyr::filter(month == "Year",
                    level == "County") |>
      dplyr::select(year, state, state_name, county,
                    bene_tot, bene_orig, bene_ma_oth))

      }

      if (group == "aged") {
        return(careroll() |>
          dplyr::filter(month == "Year",
                        level == "County") |>
          dplyr::select(year, state, state_name, county,
                        bene_tot, dplyr::contains("aged")))

      }

      if (group == "disabled") {
        return(careroll() |>
          dplyr::filter(month == "Year",
                        level == "County") |>
          dplyr::select(year, state, state_name, county,
                        bene_tot, dplyr::contains("dsb")))

      }

      if (group == "partAB") {
        return(careroll() |>
          dplyr::filter(month == "Year",
                        level == "County") |>
          dplyr::select(year, state, state_name, county,
                        bene_tot, dplyr::contains("ab")))

      }

      if (group == "partD") {
        return(careroll() |>
          dplyr::filter(month == "Year",
                        level == "County") |>
          dplyr::select(year, state, state_name, county,
                        bene_tot, dplyr::contains("rx")))

      }
    }
  }

  if (period == "month") {
    if (level == "national") {
      if (group == "total") {
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "National") |>
                 dplyr::select(year, month, bene_tot,
                               bene_orig, bene_ma_oth))
      }
      if (group == "aged") {
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "National") |>
                 dplyr::select(year, month, bene_tot,
                               dplyr::contains("aged")))
      }
      if (group == "disabled") {
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "National") |>
                 dplyr::select(year, month, bene_tot,
                               dplyr::contains("dsb")))
      }
      if (group == "partAB") {
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "National") |>
                 dplyr::select(year, month, bene_tot,
                               dplyr::contains("ab")))
      }
      if (group == "partD"){
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "National") |>
                 dplyr::select(year, month, bene_tot,
                               dplyr::contains("rx")))
      }
    }

    if (level == "state") {
      if (group == "total") {
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "State") |>
                 dplyr::select(year, month, state, state_name,
                               bene_tot, bene_orig, bene_ma_oth))
      }
      if (group == "aged") {
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "State") |>
        dplyr::select(year, month, state, state_name,
                      bene_tot, dplyr::contains("aged")))
      }
      if (group == "disabled") {
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "State") |>
                 dplyr::select(year, month, state, state_name,
                               bene_tot, dplyr::contains("dsb")))
      }
      if (group == "partAB") {
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "State") |>
                 dplyr::select(year, month, state, state_name,
                               bene_tot, dplyr::contains("ab")))
      }
      if (group == "partD"){
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "State") |>
                 dplyr::select(year, month, state, state_name,
                               bene_tot, dplyr::contains("rx")))
      }
    }

    if (level == "county") {
      if (group == "total") {
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "County") |>
                 dplyr::select(year, month, state, state_name, county,
                               bene_tot, bene_orig, bene_ma_oth))
      }
      if (group == "aged") {
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "County") |>
                 dplyr::select(year, month, state, state_name, county,
                               bene_tot, dplyr::contains("aged")))
      }
      if (group == "disabled") {
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "County") |>
                 dplyr::select(year, month, state, state_name, county,
                               bene_tot, dplyr::contains("dsb")))
      }
      if (group == "partAB") {
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "County") |>
                 dplyr::select(year, month, state, state_name, county,
                               bene_tot, dplyr::contains("ab")))
      }
      if (group == "partD"){
        return(careroll() |>
                 dplyr::filter(month != "Year",
                               level == "County") |>
                 dplyr::select(year, month, state, state_name, county,
                               bene_tot, dplyr::contains("rx")))
      }
    }
  }
}

#' Download and sort Medicare Beneficiary Enrollment Data
#' @param df year, month
#' @param col national, state, county
#' @return A `tibble`
#' @examples
#' \dontrun{
#' change_year()
#' }
#' @autoglobal
#' @export
change_year <- function(df, col) {

  df |>
    dplyr::mutate(
      change_abs = {{ col }} - dplyr::lag({{ col }}, order_by = year),
      change_pct = change_abs / dplyr::lag({{ col }}, order_by = year))

}

# change_year <- function(df, col) {
#
#   df |>
#     dplyr::mutate(
#       "{{ col }}_change_abs" := {{ col }} - dplyr::lag({{ col }}, order_by = year),
#       "{{ col }}_change_pct" := round("{{ col }}_change_abs" / dplyr::lag({{ col }},
#                                                                           order_by = year) * 100, digits = 2))
#
# }
