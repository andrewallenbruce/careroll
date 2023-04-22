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
    dplyr::mutate(dplyr::across(dplyr::contains("bene"), as.numeric))

}
