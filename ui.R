library(shiny)

#Use the scrolling_nav functions
source("scrolling_nav.R")

mytab  <- function (tabname) {
#Setup the content 
    
	#first content is a plot of something 
	content1= fluidPage(
		  h2("Plot1"),
			fluidRow(
			plotOutput("plot1",height=600,width=800)
		)
	)
	#A plot of something else
	content2= 	fluidRow(
			h3("Plot2"),
			plotOutput("plot2",height=900,width=1400)
	    )
	
	content3= 	fluidRow(
			h3("A Table"),
			dataTableOutput("tbl1")
	    )


	#insert the content into the nav_content_section and scrollable_navmenu part
     tabPanel(tabname,icon = icon("bar-chart"),
	 scrollable_navmenu(c("Plot1","Plot2","A table"),toptarget="thistop"), #build the menu to navigate scrolling page, use toptarget if using multiple navbars in an app. We definte toptarget as a unique page target for this section
	 nav_content_section("Plot1",class="intro-section",toptarget="thistop",
			content=content1
	  ),
   	 nav_content_section("Plot2",class="intro-section",toptarget="thistop",
			content= content2	
	),
         nav_content_section("A table",class="intro-section",toptarget="thistop",
                        content= content3
        )
	)
} 


shinyUI(    
	fluidPage(
	nav_include_css(),
	nav_include_in_UI(), 
	h1("Demo of Scrolling Nav using Bootstrap and CSS"),
	div(class="jumbotron",
		p("Create your content as separate UI elements and add them to the scrollable_navmenu(). Each section menu name must match each nav_conent_section() name.")
	),
	tabsetPanel("T",
		mytab("section1")
	)
	)
)

