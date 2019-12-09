# Change "Boxplot", all __23_s, and edit tiles below:
tabItem(tabName = "Boxplot",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
                   dataTableOutput('table__23_'),
                   downloadButton('download__23_',"Download the data")),
          tabPanel("Plot Size", 
                   numericInput("plotWidth__23_", "Plot Width (Required)", 1000),
                   numericInput("plotHeight__23_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
                   textInput("title__23_", "Title 1", "Deaths"),
                   numericInput("titleFont__23_", "Title Font", 10)), 
          tabPanel("Plot Legend",
                   textInput("legendTitle__23_", "Legend Title", "Sex"),
                   numericInput("legendTitleSize__23_", "Legend Title Size", 10),
                   numericInput("legendItemSize__23_", "Legend Item Size", 10),
                   numericInput("legendKeySize__23_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
                   textInput("xLabel__23_", "x-Axis Label", "Injury Intent"),
                   textInput("yLabel__23_", "y-Axis Label 1", "Deaths"),
                   numericInput("textFont__23_", "textFont", 10)),
          tabPanel("Data Size", 
                   numericInput("yDataMin__23_", "yData Minimum (Required)", 0),
                   numericInput("yDataMax__23_", "yData Maximum (Required)", NA))),
        plotlyOutput("Boxplot__23_", height=800)
)
