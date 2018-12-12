shinyUI(
  dashboardPage(
    dashboardHeader(title = "ReliaShield Dashboard"),
    dashboardSidebar(
     sliderInput(inputId = "opioid_deaths",
                  label = "Opioid Deaths Lower Limit",
                  min = 0,
                  max = 4500,
                  value = 0),
     radioButtons("radio_year", label = h3("Choose Year"),
                  choices = list("2014" = 2014, "2016" = 2016), 
                  selected = 2014)
    ),
  dashboardBody(
     fluidRow(
        box(
          plotOutput("deathbar")
        ),
        box(
          plotOutput("deathcapbar")
        )
     )
  )
  )
)


## make above a tab for deaths... add in fill for population