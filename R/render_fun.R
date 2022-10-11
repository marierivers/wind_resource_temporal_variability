#' Parameterized Report Rendering Function
#'
#' @param site_name # name of site
#' @param site_lat # latitude of site in decimal format
#' @param site_lon # longitude of site in decimal format
#' @param start_date # start date in YYYY-MM-DD format
#' @param end_date  # start date in YYYY-MM-DD format
#' @param cut_in_speed # minimum wind speed for turbine (m/s)
#' @param cut_out_speed # maximum wind speed for turbine (m/s)
#' @param req_annual_avg_speed # required annual average wind speed for turbine (m/s)
#'
#' @return
#' @export
#'
#' @examples
render_fun <- function(param_df){
  quarto::quarto_render(
    input = "report.qmd",
    execute_params = list(site_name = param_df$site_name,
                          site_lat = param_df$site_lat,
                          site_lon = param_df$site_lon,
                          start_date = param_df$start_date,
                          end_date = param_df$end_date),
    output_file = glue::glue("{param_df$site_name}-report.pdf")
  )
}


# render_fun <- function(site_name, site_lat, site_lon, start_date, end_date, cut_in_speed = 3.6, cut_out_speed = 24.6, req_annual_avg_speed = 5.8){