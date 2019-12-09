# Change all __18_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__18_ <- downloadHandler(
  filename = function(){"Boxplot.csv"}, 
  content = function(fname){
    write.csv(dfA1(), fname)
  }
)
output$table__18_ <- renderDataTable({
  DT::datatable(dfA1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$Boxplot__18_ <- renderPlotly({
  plot = dfA1() %>% ggplot() + 
    geom_boxplot(mapping = aes(x = 'Injury mechanism', y = deaths, colour = sex)) +
    
    theme_bw() +
    theme(plot.title = element_text(size = input$titleFont__18_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__18_), 
      legend.text=element_text(size=input$legendItemSize__18_),
      legend.key = element_rect(size = input$legendKeySize__18_),
      legend.key.size = unit(input$legendKeySize__18_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__18_),
          axis.title=element_text(size=input$textFont__18_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste(Sex(), input$title__18_)) +
    xlab(input$xLabel__18_) + ylab(input$yLabel__18_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
    scale_color_discrete(name = input$legendTitle__18_)
  
  if( ! is.na(input$plotWidth__18_) & ! is.na(input$plotHeight__18_))
    ggplotly(plot, tooltip = c("deaths"), session="knitr", width = input$plotWidth__18_, height = input$plotHeight__18_)
  else
    ggplotly(plot, tooltip = c("deaths"), session="knitr") 
})
# ---------------------------------------------------------