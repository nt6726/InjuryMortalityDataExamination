dfA <- eventReactive(c(input$selectSex_23), { 
  project <- "https://data.world/andywang6666/s18-db-project-3"
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "
    select 'Injury intent', sex, deaths
    from injury_mortality_in_united_states
    where sex in (?, ?, ?)
    order by sex
    ")
  paramQuery$params <- c(input$selectSex_23[1], input$selectSex_23[2], input$selectSex_23[3])
  data.world::query(paramQuery, dataset = project)
})
dfA1 <- eventReactive(c(input$selectSex_23, input$yDataMin__23_, input$yDataMax__23_), { 
  if( ! is.na(input$yDataMin__23_) & ! is.na(input$yDataMax__23_)) {
    dfA() %>% dplyr::filter(between(deaths, input$yDataMin__23_, input$yDataMax__23_))
  }
  else {
    dfA()
  }
})