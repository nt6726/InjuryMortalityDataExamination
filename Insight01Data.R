dfA <- eventReactive(c(input$selectSex_1), { 
  project <- "https://data.world/andywang6666/s18-db-project-3"
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "
    select sex, deaths
    from injury_mortality_in_united_states
    where sex in (?, ?, ?)
    order by sex
    ")
  paramQuery$params <- c(input$selectSex_1[1], input$selectSex_1[2], input$selectSex_1[3])
  data.world::query(paramQuery, dataset = project)
})
dfA1 <- eventReactive(c(input$selectSex_1, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfA() %>% dplyr::filter(between(deaths, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfA()
  }
})