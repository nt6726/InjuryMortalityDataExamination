# Change "Boxplot", all __18_s, and edit tiles below:
tabItem(tabName = "Boxplot",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
                   dataTableOutput('table__18_'),
                   downloadButton('download__18_',"Download the data")),
          tabPanel("Plot Size", 
                   numericInput("plotWidth__18_", "Plot Width (Required)", 1000),
                   numericInput("plotHeight__18_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
                   textInput("title__18_", "Title 1", "Deaths"),
                   numericInput("titleFont__18_", "Title Font", 10)), 
          tabPanel("Plot Legend",
                   textInput("legendTitle__18_", "Legend Title", "Sex"),
                   numericInput("legendTitleSize__18_", "Legend Title Size", 10),
                   numericInput("legendItemSize__18_", "Legend Item Size", 10),
                   numericInput("legendKeySize__18_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
                   textInput("xLabel__18_", "x-Axis Label", "Injury Mechanism"),
                   textInput("yLabel__18_", "y-Axis Label 1", "Deaths"),
                   numericInput("textFont__18_", "textFont", 10)),
          tabPanel("Data Size", 
                   numericInput("yDataMin__18_", "yData Minimum (Required)", 0),
                   numericInput("yDataMax__18_", "yData Maximum (Required)", NA))),
        plotlyOutput("Boxplot__18_", height=800)
)
