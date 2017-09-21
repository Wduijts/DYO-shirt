#BASIC SETTINGS
Info = require "Info"
{InputField} = require 'InputField'
for layer, title of Info
	fabricsTitle = title.fabrics.name
	fabricsPrice = title.fabrics.price
	fabricsDescription = title.fabrics.description
	fitsTitle = title.fits.name
	fitsDescription = title.fits.description
	collarsTitle = title.collars.name
	collarsDescription = title.collars.description
	cuffsTitle = title.cuffs.name
	cuffsDescription = title.cuffs.description
	monogramsTitle = title.monograms.name
	monogramsDescription = title.monograms.description
#navigation
nav = new Layer
	width: 375
	height: 44
	image: "images/nav.jpg"
	index:2
nav.states.add
	hide:
		visible:false
#Font what we are using
Utils.insertCSS("@import 'https://fonts.googleapis.com/css?family=Roboto+Condensed';")
#FLOW COMPONENT OF MULTIPLE PAGES
grey = "#fafafa"
grey2 = "#999999"
grey3 = "#eeeeee"
blue = "#183051"
white = "#ffffff"
#ScreenB-btnB
screenB = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: white
	index:1
	parent: flow

#Button components - A
buttonBox = new Layer
	y: Screen.height-60
	width: Screen.width
	height: 60
	backgroundColor: ""
	shadowSpread: 1
	shadowColor: "rgba(51,51,51,0.1)"
	shadowY: -2
	shadowBlur: 4
	parent: screenB
	index: 2
buttonBox.states.add
	hide:
		visible:false

btnSize = new Layer
	parent: buttonBox
	x: 0
	width: Screen.width/2
	height: buttonBox.height
	backgroundColor: "rgba(255,255,255,1)"
btnSize.onClick ->
	sizePage.stateCycle("open")
	sizePage.visible = true

btnSizeText = new TextLayer
	parent: btnSize
	x: 20
	y: Align.center()
	text: "size"
	fontSize: 14
	textTransform: "uppercase"
	color: "#183051"
	fontFamily: "Roboto Condensed"
	fontWeight: 400

btnSizeIcon = new Layer
	parent: btnSize
	image: "images/chevron.svg"
	x: Align.right(-20)
	y: Align.center()
	width: 10
	height: 5
	visible: true

btnStart = new Layer
	x: Screen.width/2
	width: Screen.width/2
	height: buttonBox.height
	parent: buttonBox
	backgroundColor: "#183051"

btnStartText = new TextLayer
	parent: btnStart
	x: Align.center()
	y: Align.center()
	text: "start"
	fontSize: 14
	textTransform: "uppercase"
	color: white
	fontFamily: "Roboto Condensed"
	fontWeight: 400
btnStartText.states.add
	atb:
		text: "ADD TO BAG"
		x: 45
	nextstep:
		text: "NEXT STEP"
		color: "#183051"
		x: Align.center(-14)
#Events
btnStart.onClick ->
	flow.showNext(screenA)
	PageBg.parent = screenA
	PageBg.y = 20
	Welcomes[0].visible=true
	optionAnimation1.start()
	optionAnimation2.start()
#screenA - btnA
screenA = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: "#fff"
	parent: flow
	index:2
	x: 375
#Button components - B
BbuttonBox = new Layer
	y: Screen.height-60
	width: Screen.width
	height: 60
	backgroundColor: ""	
	shadowSpread: 1
	shadowColor: "rgba(51,51,51,0.1)"
	shadowY: -2
	shadowBlur: 4
	index:1
	parent: screenA
BbuttonBox.states.add
	hide:
		visible:false

btnSummary = new Layer
	parent: BbuttonBox
	x: 0
	width: Screen.width/2
	height: BbuttonBox.height
	backgroundColor: "rgba(255,255,255,1)"
btnSummary.onClick ->
	flow.showNext(screenB)
	PageBg.parent = stepScroll.content
	PageBg.y = -1
	
btnSummaryText = new TextLayer
	parent: btnSummary
	x: Align.center()
	y: Align.center()
	text: "summary"
	fontSize: 14
	textTransform: "uppercase"
	color: "#183051"
	fontFamily: "Roboto Condensed"
	fontWeight: 400

btnNext = new Layer
	x: Screen.width/2
	width: Screen.width/2
	height: BbuttonBox.height
	parent: BbuttonBox
	backgroundColor: grey3

btnNextText = new TextLayer
	parent: btnNext
	x: Align.center()
	y: Align.center()
	text: "next step"
	fontSize: 14
	textTransform: "uppercase"
	color: "#999999"
	fontFamily: "Roboto Condensed"
	fontWeight: 400

OptionBg = new Layer
	parent: screenA
	width: 375
	height: 140
	y: 465
	x: 0
	index:0
	backgroundColor: "#fafafa"

PageBg2 = new Layer
	parent: screenA
	width: 375
	height: 463
	y : 0
	index:0
	backgroundColor: "#fafafa"
	
PageBg = new Layer
	parent: screenA
	width: 375
	height: 375
	y:20
	index:1
	backgroundColor: null

btnNext.onClick ->
	if selections[0].visible == true
		scrollFabric.visible = false
		scrollFit.visible = true
		Welcomes[1].visible = true
		Welcomes[1].text = "select fit 2/6"
		btnNext.backgroundColor = grey3
		btnNextText.color = "#999999"
		optionAnimation3.start()
		optionAnimation4.start()
		
btnNext.onClick ->
	if selections[1].visible == true
		scrollFit.visible = false
		scrollCollar.visible = true
		Welcomes[2].visible = true
		Welcomes[2].text = "select collar 3/6"
		optionAnimation5.start()
		optionAnimation6.start()

btnNext.onClick ->
	if selections[2].visible == true
		scrollCollar.visible = false
		scrollCuff.visible = true
		Welcomes[3].visible = true
		Welcomes[3].text = "select cuff 4/6"
		optionAnimation7.start()
		optionAnimation8.start()

btnNext.onClick ->
	if selections[3].visible == true
		scrollCuff.visible = false
		scrollMonogram.visible = true
		Welcomes[4].visible = true
		Welcomes[4].text = "select monogram 5/6"
		optionAnimation9.start()
		optionAnimation10.start()

btnNext.onClick ->
	if selections[4].visible == true
		sizePage.stateCycle("open")
		sizePage.visible = true

btnNext.onClick ->
	if btnSizeText.text!= "size" && selections[4].visible == true
		flow.showNext(screenB)
		sizePage.visible = false
		PageBg.parent = stepScroll.content
		PageBg.y = 0

screenA.on Events.AnimationStart, ->
	Welcomes[0].visible=true
	optionAnimation1.start()
	optionAnimation2.start()
#stepScroll
stepScroll = new ScrollComponent
	parent: screenB
	y: 0
	width: Screen.width
	height: Screen.height
	scrollHorizontal: false
	index:1
stepScroll.propagateEvents = false
stepScroll.directionLock = true
stepScroll.on Events.Scroll, ->
	if stepScroll.scrollY <= 0 then stepScroll.scrollY = 0
stepScroll.mouseWheelEnabled = true
#page
allIndicators = []
cardimages = [
	"images/products/front.jpg",
	"images/products/side.jpg",
	"images/products/back.jpg"
	]

page = new PageComponent
	parent: PageBg
	width: 375
	height: 375
	scrollVertical: false
	backgroundColor: "#fafafa"
	x: -1
	y: 44
	directionLock = true
page.states = 
	active:
		height: screen.height
		y: 0

arrowRight = new Layer
	parent: page
	x: Align.right(-10)
	y: Align.center
	width: 11
	height: 18
	image: "images/arrow.svg"

arrowLeft = new Layer
	parent: page
	x: 10
	y: Align.center
	rotation: 180
	width: 11
	height: 18
	backgroundColor: null
	image: "images/arrow.svg"
	
touchLeft = new Layer
	parent: page
	width: 30
	height: page.height
	backgroundColor: null
	x:0

touchRight = new Layer
	parent: page
	width: 30
	x: Align.right
	height: page.height
	backgroundColor: null

touchRight.onClick (event, layer) -> page.snapToNextPage()
touchLeft.onClick (event, layer) -> page.snapToPreviousPage()

arrowRight.states.add
	zoom:
		visible:false
		
arrowLeft.states.add
	zoom:
		visible:false

# Generate card layers
for i in [0...3]
	do(i) ->
		card = new Layer 
			backgroundColor: "#fafafa"
			width: page.width
			height: page.height 
			x: page.width * i
			superLayer: page.content

		cardImage = cardimages[i] = new Layer
			parent: card
			width: 250
			height: page.height
			x: Align.center()
			y: Align.center()
			image: cardimages[i]

		indicator = allIndicators[i] = new Layer 
			backgroundColor: "#d9d9d9"
			width: 8
			height: 8
			x: 28 * i
			y: 600
			parent: page
			borderRadius: "50%"
			opacity: 0.5

		# Stay centered regardless of the amount of cards
		indicator.x += (Screen.width / 2) - (12 * 3)
		# States
		indicator.states.add(active: {opacity: 1, scale:1.2})
		indicator.states.animationOptions = time: 0.5
		# Store indicators in our array
		allIndicators.push(indicator)
	
		#Images states
		cardimages[i].states = 
			active: 
				scale: 1.3
				y: 120
				animationOptions : 
					time : 0.2
			inactive:
				scale: 1
				y: Align.center
				animationOptions:
					time : 0.2

		# Set indicator for current page
		current = page.horizontalPageIndex(page.currentPage)
		allIndicators[current].states.switch("active")
		cardimages[i].onTap (event, layer, moon) ->	
			cardimages[0].states.next("active", "inactive")
			cardimages[1].states.next("active", "inactive")
			cardimages[2].states.next("active", "inactive")
			buttonBox.states.next("hide","default")
			BbuttonBox.states.next("hide","default")
			page.states.next("active", "default")
			arrowLeft.states.next("zoom", "default")
			arrowRight.states.next("zoom", "default")
			nav.states.next("hide", "default")
			TotalInfo.states.next("hide","default")
			stepList.states.next("hide","default")

# Update indicators
page.on "change:currentPage", ->
	indicator.states.switch("default") for indicator in allIndicators
	current = page.horizontalPageIndex(page.currentPage)
	allIndicators[current].states.switch("active")
#TotalINFO
TotalInfo = new Layer
	width: Screen.width
	height: 120
	backgroundColor: "#fafafa"
	parent: stepScroll.content
	y: page.height + nav.height + 2

Return = new TextLayer
	parent: TotalInfo
	text: "Shipping & Return"
	fontSize: 14
	fontWeight: 400
	x: 20
	y: 20 
	color: "#999999"
	fontSize: 14
	font: "Roboto Condensed"
	
ReturnInfo = new TextLayer
	parent: TotalInfo
	text: "Free"
	fontSize: 14
	fontWeight: 400
	x: Align.right(-20)
	y: 20 
	color: "#183051"
	fontSize: 14
	textAlign: "right"
	font: "Roboto Condensed"
	
Shipping = new TextLayer
	parent: TotalInfo
	text: "Shipping on"
	fontSize: 14
	fontWeight: 400
	x: 20
	y: 50
	color: "#999999"
	fontSize: 14
	font: "Roboto Condensed"
	
ShippingInfo = new TextLayer
	parent: TotalInfo
	text: "June 6th"
	fontSize: 14
	fontWeight: 400
	x: Align.right(-20)
	y: 50
	color: "#183051"
	fontSize: 14
	textAlign: "right"
	font: "Roboto Condensed"
	
Total = new TextLayer
	parent: TotalInfo
	text: "Total"
	fontSize: 14
	fontWeight: 400
	x: 20
	y: 80
	color: "#999999"
	fontSize: 14
	font: "Roboto Condensed"

TotalpriceValue = 89
Totalprice = new TextLayer
	parent: TotalInfo
	text: "€" + parseInt( TotalpriceValue, 10 ) + " EUR"
	fontSize: 14
	fontWeight: 400
	x: Align.right(-20)
	y: 80
	color: "#183051"
	fontSize: 14
	textAlign: "right"
	fontFamily: "Roboto Condensed"
	
TotalInfo.states.add
	hide:
		visible:false
#Size Dropdown
sizePage = new PageComponent
	width: Screen.width
	height: Screen.height
	backgroundColor: "white"
	y: Screen.height
	scrollHorizontal: false
sizePage.states = 
	open:
		y: 0
sizeTopL = new Layer
	parent: sizePage
	x: 0
	y: 0
	width: Screen.width/2
	height: 70
	backgroundColor: "white"
regular = new TextLayer
	parent: sizeTopL
	y: 20
	x: Align.center()
	text: "REGULAR"
	color: blue
	fontSize: 14
	fontFamily: "Roboto Condensed"
	fontWeight: 400
regularCM = new TextLayer
	parent: sizeTopL
	y: 36
	x: Align.center()
	text: "168-187cm"
	color: "#999999"
	fontSize: 12
	fontFamily: "Roboto Condensed"
	fontWeight: 400
sizeTopR = new Layer
	parent: sizePage
	x: Screen.width/2
	y: 0
	width: Screen.width/2
	height: 70
	backgroundColor: "white"
regular = new TextLayer
	parent: sizeTopR
	y: 20
	x: Align.center()
	text: "LONG"
	color: blue
	fontSize: 14
	fontFamily: "Roboto Condensed"
	fontWeight: 400
regularCM = new TextLayer
	parent: sizeTopR
	y: 36
	x: Align.center()
	text: ">187cm"
	color: "#999999"
	fontSize: 12
	fontFamily: "Roboto Condensed"
	fontWeight: 400
sizeTopDivider = new Layer
	parent: sizePage
	y: 70
	width: Screen.width
	height: 1
	backgroundColor: "#f2f2f2"
buttonBoxSize = new Layer
	parent: sizePage
	y: Screen.height-60
	width: Screen.width
	height: 60
	backgroundColor: ""	
	shadowSpread: 1
	shadowColor: "rgba(51,51,51,0.1)"
	shadowY: -2
	shadowBlur: 4
btnBack = new Layer
	parent: buttonBoxSize
	x: 0
	width: Screen.width/2
	height: buttonBox.height
	backgroundColor: "rgba(255,255,255,1)"
btnBackText = new TextLayer
	parent: btnBack
	x: Align.center()
	y: Align.center()
	text: "Back"
	fontSize: 14
	textTransform: "uppercase"
	color: "#183051"
	fontFamily: "Roboto Condensed"
	fontWeight: 400
btnSizeHelp = new Layer
	parent: buttonBoxSize
	x: Screen.width/2
	width: Screen.width/2
	height: buttonBox.height
	backgroundColor: "#183051"
btnSizeHelpText = new TextLayer
	parent: btnSizeHelp
	x: Align.center()
	y: Align.center()
	text: "Size help"
	fontSize: 14
	textTransform: "uppercase"
	color: "white"
	fontFamily: "Roboto Condensed"
	fontWeight: 400

btnBack.onClick ->
	sizePage.stateCycle("default")
btnSizeHelp.onClick ->
	sizeScroll.scrollToPoint(sizeAdvisorBox)
sizeScroll = new ScrollComponent
	parent: sizePage.content
	y: 70
	width: Screen.width
	height: Screen.height - sizeTopL.height - buttonBoxSize.height
	backgroundColor: ""
sizeScroll.mouseWheelEnabled = true
sizeScroll.scrollHorizontal = false
sizeScroll.on Events.Scroll, ->
	if sizeScroll.scrollY <= 0 then sizeScroll.scrollY = 0
row = 10
column = 2
heightH = 50
widthW = Screen.width/2

#cell array
cells = []
#creating rows
for i in [0...row]
	#row 
	rowLayer = new Layer
		width: (widthW) * column
		height: heightH
		y: (heightH) * i
		x: 0
		parent: sizeScroll.content
		backgroundColor: ""
		
	# creating a loop for the cells
	for j in [0...1]
		# cell
		cell = new Layer
			width: Screen.width/2
			borderRadius: 0
			borderColor: "#F2F2F2"
			borderWidth: 1
			backgroundColor: "#fff"
			parent: rowLayer
			x: j * (widthW)
			height: heightH
			html: 37 + (1*i)
			color: blue
			style: 
				"textAlign": "center"
				"fontFamily": "Roboto Condensed"
				"fontWeight": "300"
				"fontSize": "14px"
				"lineHeight":"30px"
				"paddingTop":"35px"

		cell2 = new Layer
			width: Screen.width/2
			borderRadius: 0
			borderColor: "#F2F2F2"
			borderWidth: 1
			backgroundColor: "#fff"
			parent: rowLayer
			x: j * (widthW) + (Screen.width/2)
			height: heightH
			html: 37 + (1*i) + "-7"
			color: blue
			style: 
				"textAlign": "center"
				"fontFamily": "Roboto Condensed"
				"fontWeight": "300"
				"fontSize": "14px"
				"lineHeight":"30px"
				"paddingTop":"35px"
			
		#pushing cell in cells array 
		cells.push(cell)
		cells.push(cell2)
		
		cell.onClick ->
				for cell in cells
					cell.backgroundColor = "#fff"
					cell.color = blue
					this.backgroundColor = "#f2f2f2"
					this.color = blue
				btnSizeText.text = this.html
				sizePage.stateCycle("default")
				flow.showNext(screenB)
				PageBg.parent = stepScroll.content
				PageBg.y = -1
		cell2.onClick ->
				for cell2 in cells
					cell2.backgroundColor = "#fff"
					cell2.color = blue
					this.backgroundColor = "#f2f2f2"
					this.color = blue
				btnSizeText.text = this.html
				sizePage.stateCycle("default")		
				flow.showNext(screenB)
				PageBg.parent = stepScroll.content
				PageBg.y = -1

sizeAdvisorBox = new Layer
	parent: sizeScroll.content
	y: heightH*row + row - 10
	width: Screen.width
	height: 60
	backgroundColor: "white"
	borderWidth: 1
	borderColor: "#f2f2f2"
sizeAdvisorIcon = new Layer
	parent: sizeAdvisorBox
	image: "images/icon_sizeAdvisor.svg"
	x: 20
	y: Align.center()
	height: 22
	width: 21
sizeAdvisorText = new TextLayer
	parent: sizeAdvisorBox
	x: 64
	y: Align.center()
	text: "Size advisor"
	fontSize: 14
	textTransform: "uppercase"
	color: "#999999"
	fontFamily: "Roboto Condensed"
	fontWeight: 400	
sizeChartBox = new Layer
	parent: sizeScroll.content
	y: heightH*row + row + sizeAdvisorBox.height  - 10
	width: Screen.width
	height: 60
	backgroundColor: "white"
	borderWidth: 1
	borderColor: "#f2f2f2"
sizeChartIcon = new Layer
	parent: sizeChartBox
	image: "images/icon_sizeChart.svg"
	x: 20
	y: Align.center()
	height: 11
	width: 24
sizeChartText = new TextLayer
	parent: sizeChartBox
	x: 64
	y: Align.center()
	text: "Size chart"
	fontSize: 14
	textTransform: "uppercase"
	color: "#999999"
	fontFamily: "Roboto Condensed"
	fontWeight: 400	
#steplist
class List extends Layer
	constructor: (options={}) ->
		options.width = 375
		options.height = 60
		options.backgroundColor = "#fafafa"
		options.clip = true
		parent: stepScroll.content
		super options

		title = titles[i] = new Layer
			parent:@
			x: 20
			y: 20
			html:options.title
			backgroundColor:null
			style:
				"font-size":"14px"
				"font-weight":"400"
				"font-family":"Roboto Condensed"
				"color": "#d9d9d9"
				"lineHeight" : "1.7"
		title.states = 
			active:
				style:
					"color": "#183051"

		selection = selections[i] = new Layer
			parent:@
			x: 20
			y: 50
			html:options.selection
			backgroundColor:null
			visible:false
			style:
				"font-size":"14px"
				"font-weight":"400"
				"font-family":"Roboto Condensed"
				"color": "#999999"
				"lineHeight" : "1.7"
			
		price = prices[i] = new Layer
			parent:@
			x: Align.right(130)
			y: 50
			html:options.price
			backgroundColor:null
			visible:false
			fontSize: 14
			fontWeight: 400
			style:
				"font-size":"14px"
				"font-weight":"400"
				"font-family":"Roboto Condensed"
				"color": "#999999"
				"lineHeight" : "1.7"

		checkIcon = checkIcons[i] = new Layer
			parent:@
			x: Align.right(-20)
			y: 20
			width:16
			height:9
			html:options.checkIcon
			image:"images/check.svg"
			visible:false

titles = ["1.FABRIC", "2.FIT", "3.COLLAR", "4.CUFF", "5.MONOGRAM"]
selections = []
prices = []
checkIcons = []
lists = []
stepList = new Layer
	width: Screen.width
	height: 5 * 60 + 8 + 62
	y: page.height + nav.height + TotalInfo.height + 4
	backgroundColor: null
	parent: stepScroll.content

stepList.states = 
	state2:
		height: 90 + 4*60 + 8 + 68
	state3:
		height: 2*90 + 3*60 + 8 + 64 
	state4:
		height: 3*90 + 2*60 + 8 + 64
	state5:
		height: 4*90 + 60 + 8 + 64
	state6:
		height: 5*90 + 8 + 64
	hide:
		visible: false

for i in [0...5]
	do(i) ->
		list = lists[i] =  new List
			height: 60
			y: i * (60 + 2)
			parent: stepList
			title: titles[i]
			selection: selections[i]
			price: prices[i]
			checkIcon: checkIcons[i]
titles[0].states.switch("active")

flow = new FlowComponent
	width: screen.width
	height: Screen.height
	backgroundColor: null
	index:1
flow.showNext(screenA)
#go to nextpage
lists[0].onTap ->
	flow.showNext(screenA)
	PageBg.parent = screenA
	PageBg.y = 20
	optionAnimation1.start()
	optionAnimation2.start()
	Welcomes[0].visible = true
lists[0].onTap ->
	if selections[0].visible == true
		flow.showNext(screenA)
		PageBg.parent = screenA
		PageBg.y = 20
		btnNext.backgroundColor = grey3
		btnNextText.color = "#999999"
		scrollFabric.visible = true
		scrollFit.visible = false
		scrollCollar.visible = false
		scrollCuff.visible = false
		scrollMonogram.visible = false

lists[1].onTap ->
	if selections[0].visible == true
		flow.showNext(screenA)
		PageBg.parent = screenA
		PageBg.y = 20
		optionAnimation3.start()
		optionAnimation4.start()
		Welcomes[1].visible = true
		Welcomes[1].text = "select fit 2/6"
		scrollFabric.visible = false
		scrollFit.visible = true
lists[1].onTap ->
	if selections[1].visible == true
		flow.showNext(screenA)
		PageBg.parent = screenA
		scrollFabric.visible = false
		scrollFit.visible = true
		scrollCollar.visible = false
		scrollCuff.visible = false
		scrollMonogram.visible = false

lists[2].onTap ->
	if selections[1].visible == true
		flow.showNext(screenA)
		PageBg.parent = screenA
		PageBg.y = 20
		optionAnimation5.start()
		optionAnimation6.start()
		Welcomes[2].visible = true
		Welcomes[2].text = "select collar 3/6"
		scrollFit.visible = false
		scrollCollar.visible = true
lists[2].onTap ->
	if selections[2].visible == true
		flow.showNext(screenA)
		PageBg.parent = screenA
		PageBg.y = 20
		scrollFabric.visible = false
		scrollFit.visible = false
		scrollCollar.visible = true
		scrollCuff.visible = false
		scrollMonogram.visible = false

lists[3].onTap ->
	if selections[2].visible == true
		flow.showNext(screenA)
		PageBg.parent = screenA
		PageBg.y = 20
		optionAnimation7.start()
		optionAnimation8.start()
		Welcomes[3].visible = true
		Welcomes[3].text = "select cuff 4/6"
		scrollCollar.visible = false
		scrollCuff.visible = true
lists[3].onTap ->
	if selections[3].visible == true
		flow.showNext(screenA)
		PageBg.parent = screenA
		PageBg.y = 20
		scrollFabric.visible = false
		scrollFit.visible = false
		scrollCollar.visible = false
		scrollCuff.visible = true
		scrollMonogram.visible = false

lists[4].onTap ->
	if selections[3].visible == true
		flow.showNext(screenA)
		PageBg.parent = screenA
		PageBg.y = 20
		optionAnimation9.start()
		optionAnimation10.start()
		Welcomes[4].visible = true
		Welcomes[4].text = "select monogram 5/6"
		scrollCuff.visible = false
		scrollMonogram.visible = true
lists[4].onTap ->
	if selections[4].visible == true
		flow.showNext(screenA)
		PageBg.parent = screenA
		PageBg.y = 20
		scrollFabric.visible = false
		scrollFit.visible = false
		scrollCollar.visible = false
		scrollCuff.visible = false
		scrollMonogram.visible = true
#CREATE CARD CLASS
class Card extends Layer
	constructor: (options={}) ->
		options.backgroundColor = "#ffffff"
		options.borderWidth = 0
		options.shadowY = 1
		options.shadowBlur = 2
		options.width = 265
		options.height = 120
		options.clip = true
		super options
		background = new Layer
			parent: @
			size: @.size
			backgroundColor: "#ffffff"
			borderWidth = 0

		photo = new Layer
			parent: @
			size: @.height
			x: options.photox
			y: options.photoy
			image: options.photo
			height: options.photoheight
			width: options.photowidth

		titled = new Layer
			parent: @
			x: @.height + 20
			y: 10
			width: 105
			backgroundColor: null
			html: options.title
			color: "#183051" 
			style: 
				"font-size":"14px"
				"lineHeight":"1.7"
		price = new Layer
			parent: @
			x: @.height + 20
			y: 55
			width: 105
			backgroundColor: ""
			html: options.price
			color: "#999999" 
			style: 
				"font-size":"14px"
			clip: true
		infoIcon = new Layer
			parent: @
			x: @.width - 30
			y: @.height - 30
			height: 20
			width: 20
			image: "images/icon_i.svg"
			visible: true
#Overlay
		
		infoIcon.on Events.Click, (ignoreParent) ->
			overlayBG = new Layer
				x: 0 
				y: 0
				width: Screen.width
				height: Screen.height
				backgroundColor: "white"
			overlayScroll = new ScrollComponent
				parent: overlayBG
				size: Screen.size
				backgroundColor: ""
			overlayScroll.scrollHorizontal = false
			overlayScroll.mouseWheelEnabled = true
			TitleOverlay = new Layer
				parent: overlayScroll.content
				x: 20
				y: 390 + 10
				width: 375
				opacity:0
				backgroundColor:null
				html: options.title
				color: "#183051" 
				style: 
					"font-size":"16px"
					"lineHeight":"1.7"
			TitleOverlay.states.add
				active:
					opacity:1
					y: 390
			PriceOverlay = new Layer
				parent: overlayScroll.content
				x: 20
				y: 420 + 10
				width: 375
				opacity : 0
				backgroundColor:null
				html: options.price
				color: "#3376c9" 
				style: 
					"font-size":"16px"
					"lineHeight":"1.7"
			PriceOverlay.states.add
				active:
					opacity:1
					y:420
			DescriptionOverlay = new Layer
				parent: overlayScroll.content
				x: 20
				y: 450 + 10
				opacity : 0
				width: 335
				height: 250
				backgroundColor:null
				html: options.description
				color: "#999999" 
				style: 
					"font-size":"16px"
					"lineHeight":"1.7"
			DescriptionOverlay.states.add
				active:
					opacity:1
					y:450
			ignoreParent.stopPropagation()
			TitleOverlay.visible = true
			PriceOverlay.visible = true
			DescriptionOverlay.visible = true
			TitleOverlay.states.next("active")
			PriceOverlay.states.next("active")
			DescriptionOverlay.states.next("active")
			currentImage = photo.copy()
			currentImage.parent = overlayScroll.content
			currentImage.frame = photo.screenFrame
			photo.visible = false
			background.visible = false
			currentImage.animate
				properties:
					width:375
					height:375
					x:0
					y:0
					options:
						time: 0.3
			overlayBG.animate
				properties:
					width:375
					height:667
					x:0
					y:0
					options:
						time:0.3
			#Return
			currentImage.on Events.Click, (ignoreParent) ->
				ignoreParent.stopPropagation()
				TitleOverlay.visible = false
				PriceOverlay.visible = false
				DescriptionOverlay.visible = false
				TitleOverlay.states.next("default")
				PriceOverlay.states.next("default")
				DescriptionOverlay.states.next("default")
				currentImage.animate
					properties:
						width:120
						height:120
						photox: photo.screenFrame.x
						photoy: photo.screenFrame.y
						options:
							time: 0.3
				overlayBG.animate
					properties:
						width:265
						height:120
						x:background.screenFrame.x
						y:background.screenFrame.y
						options:
							time:0.3
				this.on Events.AnimationEnd, ->
					photo.visible = true
					currentImage.destroy()
					background.visible = true
					overlayBG.destroy()

class CardMonogram extends Layer
	constructor: (options={}) ->
		options.backgroundColor = "#ffffff"
		options.borderWidth = 0
		options.shadowY = 1
		options.shadowBlur = 2
		options.width = 265
		options.height = 120
		super options
		background = new Layer
			parent: @
			size: @.size
			backgroundColor: ""
			borderWidth = 0
		photo = new Layer
			parent: @
			size: @.height
			image: options.photo
		titled = new Layer
			parent: @
			x: @.height + 20
			y: 10
			width: 105
			backgroundColor: null
			html: options.title
			color: "#183051" 
			style: 
				"font-size":"14px"
				"lineHeight":"1.7"

#Overlay
		background.on Events.Click, (ignoreParent) ->
			overlayBG = new Layer
				x: 0 
				y: 0
				width: Screen.width
				height: Screen.height
				backgroundColor: "white"
				opacity: 0
			overlayBG.states.add
				active: 
					opacity: 1
			overlayScroll = new ScrollComponent
				parent: overlayBG
				width: Screen.width
				height: Screen.height
				opacity: 0
				backgroundColor: ""
			overlayScroll.states.add
				active:
					opacity: 1
			overlayScroll.scrollHorizontal = false
			overlayScroll.mouseWheelEnabled = true
			TitleOverlay = new Layer
				parent: overlayScroll.content
				x: 20
				y: 390 + 10
				width: 375
				opacity:0
				backgroundColor:null
				html: options.title
				color: "#183051" 
				style: 
					"font-size":"16px"
					"lineHeight":"1.7"
			TitleOverlay.states.add
				active:
					opacity:1
					y: 390				
			currentImage = photo.copy()
			currentImage.index = 4
			currentImage.frame = photo.screenFrame
			currentImage.parent = overlayScroll.content
			
			
			
			text = new TextLayer
				parent: overlayScroll.content
				text: ""
				x: 64
				y: 223
				textTransform: "uppercase"
				style:
					"font-family": "Roboto Condensed"
					"font-weight":"300"
					"color": "#183051"
					"text-align": "left"
					"font-size": "26x"
					"textTransform":"uppercase"
			Input = new InputField
				parent: overlayScroll.content
				type: "text"
				width:  overlayBG.width - 40
				height: 50
				x: 20
				y: 440
				borderWidth: 1
				borderColor: "rgba(153,153,153,1)"
				fontFamily: "Roboto Condensed"
				fontWeight: 500
				fontSize: 28
				indent: 20
				placeHolder: "Type Your Initials (Max 4)"
				placeHolderColor: "#999999"
				textTransform: "uppercase"
				autoCapitalize: true	
				autoComplete: false
				autoCorrect: false
				maxLength: 4
				pattern: "^#?([A-Z]{4})$"
				value: ""
						
			Input.on Events.Focus, (value, layer) ->
# 				print "cow"
				@.placeHolder = 20
			Input.on Events.Input, (value, layer) ->
				text.text = value
				text.color = blue
				lists[4].text = value + ", Blue, " #+ monogramTitle[i]
			blueBox = new Layer
				parent: overlayScroll.content
				width: overlayBG.width
				y: 511
				height: 70
				backgroundColor: "#F2F2F2"
			blueText = new TextLayer
				parent: blueBox
				x: 20
				y: Align.center()
				text: "Blue"
				fontSize: 14
				color: blue
				fontFamily: "Roboto Condensed"
				fontWeight: 400
			blueCircle = new Layer
				parent: blueBox
				x: Screen.width-50
				y: Align.center()
				size: 30
				borderRadius: 15
				borderColor: "#183051"
				borderWidth: 1
				backgroundColor: ""
			blueDot = new Layer
				parent: blueBox
				x: Screen.width-45
				y: Align.center() 
				size: 20
				borderRadius: 10
				backgroundColor: "#183051"
			whiteBox = new Layer
				parent: overlayScroll.content
				width: overlayBG.width
				y: 511 + blueBox.height
				height: 70
				backgroundColor: ""
				borderColor: "#f2f2f2"
				borderWidth: 1
			whiteText = new TextLayer
				parent: whiteBox
				x: 20
				y: Align.center()
				text: "White"
				fontSize: 14
				color: "#999999"
				fontFamily: "Roboto Condensed"
				fontWeight: 400
			whiteCircle = new Layer
				parent: whiteBox
				x: Screen.width-50
				y: Align.center()
				size: 30
				borderRadius: 15
				borderColor: ""
				borderWidth: 1
				backgroundColor: "#f2f2f2"
			whiteDot = new Layer
				parent: whiteBox
				x: Screen.width-45
				y: Align.center() 
				size: 20
				borderRadius: 10
				backgroundColor: ""
			overlayClose = new Layer
				x: 0
				y: Screen.height-60
				width: Screen.width/2
				height: 60
				parent: overlayBG
				backgroundColor: "rgba(255,255,255,1)"
				shadowSpread: 1
				shadowColor: "rgba(123,123,123,0.3)"
				shadowX: -2
				shadowBlur: 4
				index: 10
				html: "back"
				style:
					"lineHeight" : "20px"
					"textAlign":"center"
					"font-family": "Roboto Condensed"
					"font-weight":"500"
					"color": "#183051"
					"font-size": "14px"
					"textTransform":"uppercase"
					"paddingTop":"50px"
			
			overlaySelect = new Layer
				x: Screen.width/2
				y: Screen.height-60
				width: Screen.width/2
				height: 60
				parent: overlayBG
				index: 2
				backgroundColor: "#183051"
				shadowSpread: 1
				shadowColor: "rgba(123,123,123,0.3)"
				shadowX: -2
				shadowBlur: 4
				index: 9
				html: "select		"
				style:
					"lineHeight" : "20px"
					"textAlign":"centerY"
					"textAlign":"center"
					"font-family": "Roboto Condensed"
					"font-weight":"500"
					"color": "white"
					"font-size": "14px"
					"textTransform":"uppercase"
					"paddingTop":"50px"
			
			whiteBox.onClick (value, layer) ->
				blueBox.backgroundColor = ""
				blueCircle.backgroundColor = "#183051"
				whiteBox.backgroundColor = "#f2f2f2"
				whiteCircle.borderColor = "#ffffff"
				whiteDot.backgroundColor = "#ffffff"
				text.color = white
# 				monogramSelection.text = Input.value + ", White, " + monogramTitle[i]
			blueBox.onClick (value, layer) ->
				blueBox.backgroundColor = "#f2f2f2"
				blueCircle.backgroundColor = ""
				whiteBox.backgroundColor = ""
				whiteCircle.borderColor = "#f2f2f2"
				whiteDot.backgroundColor = ""
				text.color = blue
# 				monogramSelection.text = Input.value + ", Blue, " + monogramTitle[i]

			
			
			
			
			
			
			
			
			
					
			ignoreParent.stopPropagation()
			TitleOverlay.visible = true
			overlayBG.states.next("active")
			overlayScroll.states.next("active")
			TitleOverlay.states.next("active")
# 			currentBg = background.copy()
# 			currentBg.parent = overlayBG
			
			overlayBG.frame = background.screenFrame
			photo.visible = false
			background.visible = false
			currentImage.animate
				properties:
					width:375
					height:375
					x:0
					y:0
					options:
						time: 0.3
			overlayBG.animate
				properties:
					width:375
					height:667
					x:0
					y:0
					options:
						time: 0.3
			#Return
			currentImage.on Events.Click, (ignoreParent) ->
				ignoreParent.stopPropagation()
				TitleOverlay.visible = false
				TitleOverlay.states.next("default")
				currentImage.animate
					properties:
						width:120
						height:120
						x:photo.screenFrame.x
						y:photo.screenFrame.y
						options:
							time: 0.3
				overlayBG.animate
					properties:
						width:265
						height:120
						x:background.screenFrame.x
						y:background.screenFrame.y
						options:
							time:0.3
				this.on Events.AnimationEnd, ->
					photo.visible = true
					currentImage.destroy()
					background.visible = true
					overlayBG.destroy()


class Card2 extends Layer
	constructor: (options={}) ->
		options.width = 265
		options.height = 120
		options.backgroundColor = "white"
		options.shadowY = 1
		options.shadowBlur = 2
		options.borderRadius = 4
		super options
		
		titled = new Layer
			parent: @
			x: 10
			y: 10
			backgroundColor: ""
			html: options.title
			color: "#183051" 
			style: 
				"font-size":"14px"
				"lineHeight":"1.7"

gutter = 10
width = 265
cards = []
#Option pages
updateList = ->
	if lists[0].height==90 && lists[1].height!=90 && lists[2].height!=90 && lists[3].height!=90 && lists[4].height!=90
		stepList.states.switch("state2")
		lists[1].y = 90 + 2 
		lists[2].y = 90 + 60 + 4
		lists[3].y = 90 + 60 + 60 + 6
		lists[4].y = 90 + 60 + 60 + 60 + 8
		btnStartText.text = "Next step"
		btnStartText.x = Align.center()
	else if lists[0].height==90 && lists[1].height==90 && lists[2].height!=90 && lists[3].height!=90 && lists[4].height!=90
		stepList.states.switch("state3")
		lists[1].y = 90 + 2
		lists[2].y = 90 + 60 + 4 + 30
		lists[3].y = 90 + 60 + 60 + 6 + 30
		lists[4].y = 90 + 60 + 60 + 60 + 8 + 30
	else if lists[0].height==90 && lists[1].height==90 && lists[2].height==90 && lists[3].height!=90 && lists[4].height!=90
		stepList.states.switch("state4")
		lists[1].y = 90 + 2
		lists[2].y = 90 + 60 + 4 + 30
		lists[3].y = 90 + 60 + 60 + 6 + 30 + 30
		lists[4].y = 90 + 60 + 60 + 60 + 8 + 30 + 30
	else if lists[0].height==90 && lists[1].height==90 && lists[2].height==90 && lists[3].height==90 && lists[4].height!=90
		stepList.states.switch("state5")
		lists[1].y = 90 + 2
		lists[2].y = 90 + 60 + 4 + 30
		lists[3].y = 90 + 60 + 60 + 6 + 30 + 30
		lists[4].y = 90 + 60 + 60 + 60 + 8 + 30 + 30 + 30
	else if lists[0].height==90 && lists[1].height==90 && lists[2].height==90 && lists[3].height==90 && lists[4].height==90
		stepList.states.switch("state6")
		lists[1].y = 90 + 2
		lists[2].y = 90 + 60 + 4 + 30
		lists[3].y = 90 + 60 + 60 + 6 + 30 + 30
		lists[4].y = 90 + 60 + 60 + 60 + 8 + 30 + 30 + 30
		btnStartText.text = "Add to bag"
		btnStartText.x = Align.center()
		btnNext.backgroundColor = blue
		btnNextText.color = white

#Fabric
scrollFabric = new ScrollComponent
	y: 0
	x: 375
	width: Screen.width
	parent: OptionBg
scrollFabric.scrollVertical = false
scrollFabric.mouseWheelEnabled = true
scrollFabric.contentInset = 
	top: 10
	right: 10
	left: 10

fabricContent =  (fabricParent, fabricType, fabricTitle, fabricPrice, fabricDescription) ->
	for i in [0...10]
		do(i) ->
			cardA = new Card
				parent: scrollFabric.content
				x: i * (width + gutter)
				title: fabricTitle[i]
				price: fabricPrice[i]
				description: fabricsDescription[i]
				photo: "images/#{fabricType}/#{i+1}.jpg"
				photox: 0
				photoy: 0
				photoheight: 120
				photowidth: 120
			cards.push(cardA)
			cardA.onClick ->
					for cardA in cards
						@.borderWidth = 1
						cardA.borderWidth = 0
					btnNext.backgroundColor = "#183051"
					btnNextText.color = "white"
					selections[0].html = fabricTitle[i]
					prices[0].html = "+ €"+fabricPrice[i]+" EUR"
					extraPrice = parseInt(fabricPrice[i], 10)
					Totalprice.text = "€" + parseInt(TotalpriceValue + extraPrice, 10) + " EUR"
					cardimages[0].image = "images/fronts/#{i+1}.jpg"
					cardimages[1].image = "images/sides/#{i+1}.jpg"
					cardimages[2].image = "images/backs/#{i+1}.jpg"
fabricContent(scrollFabric.content, "fabrics", fabricsTitle, fabricsPrice, fabricsDescription)

#CHANGING STEPLIST BASED UPON SELECTED OPTIONS
scrollFabric.onClick ->
	if btnNext.backgroundColor.isEqual(grey3)
	else
		lists[0].height = 90
		selections[0].visible = true
		prices[0].visible = true
		checkIcons[0].visible = true
		titles[1].states.switch("active")
		updateList()
#Fit
scrollFit = new ScrollComponent
	x: 375
	y: 0
	width: Screen.width
	parent: OptionBg
	visible: false
scrollFit.scrollVertical = false
scrollFit.mouseWheelEnabled = true
scrollFit.contentInset = 
	top: 10
	right: 10
	left: 10

fitContent =  (fitParent, fitType, fitTitle, fitDescription) ->
	for i in [0...3]
		do(i) ->
			cardA = new Card
				parent: scrollFit.content
				x: i * (width + gutter)
				title: fitTitle[i]
				description: fitDescription[i]
				photo: "images/#{fitType}/#{i+1}.jpg"
				photox: - 89
				photoy: - 92
				photoheight: 250
				photowidth: 250
			cards.push(cardA)
			cardA.onTap ->
					for cardA in cards
						@.borderWidth = 1
						cardA.borderWidth = 0
					btnNext.backgroundColor = "#183051"
					btnNextText.color = "white"
					selections[1].html = fitTitle[i]
					cardimages[0].image = "images/fronts/fits/#{i+1}.jpg"
					cardimages[1].image = "images/sides/fits/#{i+1}.jpg"
					cardimages[2].image = "images/backs/fits/#{i+1}.jpg"
fitContent(scrollFit.content, "fits", fitsTitle, fitsDescription)

#CHANGING STEPLIST BASED UPON SELECTED OPTIONS
scrollFit.onClick ->
	if btnNext.backgroundColor.isEqual(grey3)
	else
		lists[1].height = 90
		selections[1].visible = true
		checkIcons[1].visible = true
		titles[2].states.switch("active")
		updateList()

#Collar
scrollCollar = new ScrollComponent
	x: 375
	y: 0
	width: Screen.width
	parent: OptionBg
	visible: false
scrollCollar.scrollVertical = false
scrollCollar.mouseWheelEnabled = true
scrollCollar.contentInset = 
	top: 10
	right: 10
	left: 10

collarContent =  (collarParent, collarType, collarTitle, collarDescription) ->
	for i in [0...4]
		do(i) ->
			cardA = new Card
				parent: scrollCollar.content
				x: i * (width + gutter)
				title: collarTitle[i]
				description: collarsDescription[i]
				photo: "images/#{collarType}/#{i+1}.jpg"
				photox: 0
				photoy: 0
				photoheight: 120
				photowidth: 120
			cards.push(cardA)
			
			cardA.onClick ->
					for cardA in cards
						@.borderWidth = 1
						cardA.borderWidth = 0
					btnNext.backgroundColor = "#183051"
					btnNextText.color = "white"
					selections[2].html = collarTitle[i]
					cardimages[0].image = "images/fronts/collars/#{i+1}.jpg"
					cardimages[1].image = "images/sides/collars/#{i+1}.jpg"
					cardimages[2].image = "images/backs/collars/#{i+1}.jpg"
collarContent(scrollCollar.content, "collars", collarsTitle, collarsDescription)

#CHANGING STEPLIST BASED UPON SELECTED OPTIONS
scrollCollar.onClick ->
	if btnNext.backgroundColor.isEqual(grey3)
	else
		lists[2].height = 90
		selections[2].visible = true
		checkIcons[2].visible = true
		titles[3].states.switch("active")
		updateList()

#Cuff
scrollCuff = new ScrollComponent
	x: 375
	y: 0
	width: Screen.width
	parent: OptionBg
	visible: false
scrollCuff.scrollVertical = false
scrollCuff.mouseWheelEnabled = true
scrollCuff.contentInset = 
	top: 10
	right: 10
	left: 10

cuffContent =  (cuffParent, cuffType, cuffTitle, cuffDescription) ->
	for i in [0...3]
		do(i) ->
			cardA = new Card
				parent: scrollCuff.content
				x: i * (width + gutter)
				title: cuffTitle[i]
				description: cuffsDescription[i]
				photo: "images/#{cuffType}/#{i+1}.jpg"
				photox: 0
				photoy: 0
				photoheight: 120
				photowidth: 120
			cards.push(cardA)
			cardA.onClick ->
					for cardA in cards
						@.borderWidth = 1
						cardA.borderWidth = 0
					btnNext.backgroundColor = "#183051"
					btnNextText.color = "white"
					selections[3].html = cuffTitle[i]
					cardimages[0].image = "images/fronts/cuffs/#{i+1}.jpg"
					cardimages[1].image = "images/sides/cuffs/#{i+1}.jpg"
					cardimages[2].image = "images/backs/cuffs/#{i+1}.jpg"
cuffContent(scrollCuff.content, "cuffs", cuffsTitle, cuffsDescription)

#CHANGING STEPLIST BASED UPON SELECTED OPTIONS
scrollCuff.onClick ->
	if btnNext.backgroundColor.isEqual(grey3)
	else
		lists[3].height = 90
		selections[3].visible = true
		checkIcons[3].visible = true
		titles[4].states.switch("active")
		updateList()

#Monogram
scrollMonogram = new ScrollComponent
	x: 375
	y: 0
	width: Screen.width
	parent: OptionBg
	visible: false
scrollMonogram.scrollVertical = false
scrollMonogram.mouseWheelEnabled = true
scrollMonogram.contentInset = 
	top: 10
	right: 10
	left: 10

monogramContent =  (monogramParent, monogramType, monogramTitle, monogramDescription) ->
	for j in [0...1]
		do(j) ->
			cardB = new Card2
				parent: scrollMonogram.content
				x: 10
				title: "SKIP MONOGRAM"

	for i in [0...2]
		do(i) ->
			cardA = new Card
				parent: scrollMonogram.content
				x: width + (i * (width + gutter)) + 20
				title: monogramTitle[i]
				photo: "images/#{monogramType}/#{i+1}.jpg"
				photox: 0
				photoy: 0
				photoheight: 120
				photowidth: 120
			cards.push(cardA)
			cardA.onClick ->
					for cardA in cards
						@.borderWidth = 1
						cardA.borderWidth = 0
					btnNext.backgroundColor = "#183051"
					btnNextText.color = "white"
					selections[4].html = monogramTitle[i]
					cardimages[0].image = "images/fronts/monograms/#{i+1}.jpg"
					cardimages[1].image = "images/sides/monograms/#{i+1}.jpg"
					cardimages[2].image = "images/backs/monograms/#{i+1}.jpg"
monogramContent(scrollMonogram, "monograms", monogramsTitle, monogramsDescription)

#CHANGING STEPLIST BASED UPON SELECTED OPTIONS
scrollMonogram.onClick ->
	if btnNext.backgroundColor.isEqual(grey3)
	else
		lists[4].height = 90
		selections[4].visible = true
		checkIcons[4].visible = true
		updateList()
		
#welcome animationiWx:1
Welcomes=[]
for i in [0...5]
	do(i) ->
		Welcome = Welcomes[i] =  new TextLayer
			parent: OptionBg
			x: Align.center()
			y: Align.center()
			text: "select fabric 1/6"
			fontSize: 16
			textTransform: "uppercase"
			color: "#183051"
			fontFamily: "Roboto Condensed"
			fontWeight: 300
			visible: false
			index:1

optionAnimation2 = new Animation Welcomes[0], 
	x: -80
	opacity: 0
	options:
		delay: 3
optionAnimation1 = new Animation scrollFabric, 
	x: 0
	options:
		delay: 3

optionAnimation3 = new Animation Welcomes[1], 
	x: -80
	opacity: 0
	options:
		delay: 2
optionAnimation4 = new Animation scrollFit, 
	x: 0
	options:
		delay: 2

optionAnimation5 = new Animation Welcomes[2], 
	x: -80
	opacity: 0
	options:
		delay: 2
optionAnimation6 = new Animation scrollCollar, 
	x: 0
	options:
		delay: 2

optionAnimation7 = new Animation Welcomes[3], 
	x: -80
	opacity: 0
	options:
		delay: 2
optionAnimation8 = new Animation scrollCuff, 
	x: 0
	options:
		delay: 2

optionAnimation9 = new Animation Welcomes[4], 
	x: -80
	opacity: 0
	options:
		delay: 2
optionAnimation10 = new Animation scrollMonogram, 
	x: 0
	options:
		delay: 2
