## code to prepare `data_dict` dataset goes here
data_dict <- dplyr::tibble(
  var = c(
    "bene_tot",
    "bene_orig",
    "bene_ma_oth",
    "bene_aged_tot",
    "bene_aged_esrd",
    "bene_aged_no_esrd",
    "bene_dsb_tot",
    "bene_dsb_esrd_and_only_esrd",
    "bene_dsb_no_esrd",
    "bene_ab_total",
    "bene_ab_orig",
    "bene_ab_ma_oth",
    "bene_rx_tot",
    "bene_rx_pdp",
    "bene_rx_mapd"),
  desc = c(
    "Total Medicare Beneficiaries",
    "Original Medicare Beneficiaries",
    "Medicare Advantage and Other Plan Beneficiaries",
    "Total Aged Beneficiaries",
    "Aged Beneficiaries with End Stage Renal Disease",
    "Aged Beneficiaries without End Stage Renal Disease",
    "Total Disabled Beneficiaries",
    "Disabled Beneficiaries with End Stage Renal Disease and Beneficiaries with End Stage Renal Disease only",
    "Disabled Beneficiaries without End Stage Renal Disease",
    "Total Beneficiaries with Hospital (Part A) and Supplementary (Part B)",
    "Original Medicare Beneficiaries with Hospital (Part A) and Supplementary (Part B)",
    "Medicare Advantage and Other Plan Beneficiaries with Hospital (Part A) and Supplementary (Part B)",
    "Total Prescription Drug (Part D) Beneficiaries",
    "Prescription Drug (Part D) Beneficiaries with Prescription Drug Plan",
    "Prescription Drug (Part D) Beneficiaries with Medicare Advantage Prescription Drug Plan"))


usethis::use_data(data_dict, overwrite = TRUE)
