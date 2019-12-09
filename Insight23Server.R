# Change all __23_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__23_ <- downloadHandler(
  filename = function(){"Boxplot.csv"}, 
  content = function(fname){
    write.csv(dfA1(), fname)
  }
)
output$table__23_ <- renderDataTable({
  DT::datatable(dfA1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$Boxplot__23_ <- renderPlotly({
  plot = dfA1() %>% ggplot() + 
    geom_boxplot(mapping = aes(x = 'Injury intent', y = deaths, colour = sex)) +
    
    theme_bw() +
    theme(plot.title = element_text(size = input$titleFont__23_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__23_), 
      legend.text=element_text(size=input$legendItemSize__23_),
      legend.key = element_rect(size = input$legendKeySize__23_),
      legend.key.size = unit(input$legendKeySize__23_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__23_),
          axis.title=element_text(size=input$textFont__23_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste(Sex(), input$title__23_)) +
    xlab(input$xLabel__23_) + ylab(input$yLabel__23_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
    scale_color_discrete(name = input$legendTitle__23_)
  
  if( ! is.na(input$plotWidth__23_) & ! is.na(input$plotHeight__23_))
    ggplotly(plot, tooltip = c("deaths"), session="knitr", width = input$plotWidth__23_, height = input$plotHeight__23_)
  else
    ggplotly(plot, tooltip = c("deaths"), session="knitr") 
})
# ---------------------------------------------------------