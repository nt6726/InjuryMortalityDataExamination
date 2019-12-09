dfA <- eventReactive(c(input$selectSex_18), { 
  project <- "https://data.world/andywang6666/s18-db-project-3"
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "
    select 'Injury mechanism', sex, deaths
    from injury_mortality_in_united_states
    where sex in (?, ?, ?)
    order by sex
    ")
  paramQuery$params <- c(input$selectSex_18[1], input$selectSex_18[2], input$selectSex_18[3])
  data.world::query(paramQuery, dataset = project)
})
dfA1 <- eventReactive(c(input$selectSex_18, input$yDataMin__18_, input$yDataMax__18_), { 
  if( ! is.na(input$yDataMin__18_) & ! is.na(input$yDataMax__18_)) {
    dfA() %>% dplyr::filter(between(deaths, input$yDataMin__18_, input$yDataMax__18_))
  }
  else {
    dfA()
  }
})