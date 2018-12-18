shinyUI(
  dashboardPage(
    dashboardHeader(title = "U.S. Opioid Epidemic Dashboard"),
    dashboardSidebar(
     radioButtons("radio_year", label = h3("Choose Year"),
                  choices = list("2014" = 2014, "2016" = 2016), 
                  selected = 2014)
    ),
  dashboardBody(
    fluidPage(
      tabsetPanel(
      tabPanel("All States - Deaths",
       sidebarLayout(position="right",
               sidebarPanel(sliderInput(inputId = "opioid_deaths",
                                        label = "Opioid Deaths Lower Limit",
                                        min = 0,
                                        max = 4500,
                                        value = 0)),
       fluidRow(
          box(
            plotOutput("deathbar")
          ),
          box(
            plotOutput("deathcapbar")
          )
       )
      )
      ),
      tabPanel("Single State - Opioid Prescriptions",
       selectInput("select", label = h3("Select State"), 
                   choices = list("Alabama" = "Alabama", "Alaska" = "Alaska", "Arizona" = "Arizona", "Arkansas" = "Arkansas","California"="California","Colorado"="Colorado","Connecticut"="Connecticut","Delaware"="Delaware","Florida"="Florida","Georgia"="Georgia","Hawaii"="Hawaii","Idaho"="Idaho","Illinois"="Illinois","Indiana"="Indiana","Iowa"="Iowa","Kansas"="Kansas","Kentucky"="Kentucky","Louisiana"="Louisiana","Maine"="Maine","Maryland"="Maryland","Massachusetts"="Massachusetts","Michigan"="Michigan","Minnesota"="Minnesota","Mississippi"="Mississippi","Missouri"="Missouri","Montana"="Montana","Nebraska"="Nebraska","Nevada"="Nevada","New Hampshire"="New Hampshire","New Jersey"="New Jersey","New Mexico"="New Mexico","New York"="New York","North Carolina"="North Carolina","North Dakota"="North Dakota","Ohio"="Ohio","Oklahoma"="Oklahoma","Oregon"="Oregon","Pennsylvania"="Pennsylvania","Rhode Island"="Rhode Island","South Carolina"="South Carolina","South Dakota"="South Dakota","Tennessee"="Tennessee","Texas"="Texas","Utah"="Utah","Vermont"="Vermont","Virginia"="Virginia","Washington"="Washington","West Virginia"="West Virginia","Wisconsin"="Wisconsin","Wyoming"="Wyoming"), 
                   selected = 1),
       box(plotOutput("singleState")),
       box(plotOutput("singleStatePP"))
      )
    )
    )
  )
  )
)


## make above a tab for deaths... add in fill for population