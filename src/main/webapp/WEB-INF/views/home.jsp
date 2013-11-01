<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="">
<meta name="description" content="">
<title>Dashboard</title>
<!--CSS Files-->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet">
</head>

<body>
	<div class="row-fluid mainContainer">
		<div class="subContainer clearfix">
			<!--Top Header and Top Navigation-->
			<article class="centerSection clearfix">
				<!--leftmenu-->
				<div class="centercontent">
					<div class=" row-fluid">
						<h1 class="pageTitle">Dashboard</h1>
						<div class="filterbox borderRightBox">
							<form enctype="multipart/form-data"
								class="form-inline">
								<fieldset>
									<legend class="hide">Aircrafts:</legend>
									<div class="clearfix span3 marginLeftzero">
										<div class="control-label span12">
											<strong>Filter:</strong>
										</div>
										<div class="control-label span12">
											<select name="filters[state]">
												<option value="">Select</option>
												<option value="NY">NY</option>
												<option value="CO">CO</option>
												<option value="NV">NV</option>
											</select>
										</div>
									</div>
									<div class="control-label span1 pull-right">
										<button>Go</button>
									</div>
								</fieldset>
							</form>
						</div>
						<div class="row-fluid clearfix">
							<div class="span12">
								<div class="row-fluid">
									<ul>
										<li class="span5">
											<h3>
												Aircraft by type 
											</h3>
											<a href="${pageContext.request.contextPath}/report/aircraftType.pdf?${filters}"><i class="icon-download"></i> PDF</a>
											<div class="dashBGraph">
												<ul class="nav nav-tabs">
													<li class="active"><a href="#aircraftType"
														data-toggle="tab">Type</a></li>
													<li class="borderRight"><a href="#aircraftEngineType"
														data-toggle="tab">Engine Type</a></li>
													<li class="borderRight"><a href="#aircraftTypeCustom"
														data-toggle="tab">Type custom</a></li>
													<li class="borderRight"><a href="#aircraftByStateAndRegistrant"
														data-toggle="tab">Aircraft by state</a></li>
												</ul>
												<div class="tab-content">
													<div class="tab-pane active" id="aircraftType"></div>
													<div class="tab-pane" id="aircraftEngineType"></div>
													<div class="tab-pane" id="aircraftTypeCustom"></div>
													<div class="tab-pane carousel" id="aircraftByStateAndRegistrant">
													</div>
												</div>
											</div>
										</li>
										<li class="span5">
											<h3>
												Aircraft by type and year
												
											</h3>
											<a href="${pageContext.request.contextPath}/report/aircraftYearType.pdf?${filters}"><i class="icon-download"></i> PDF</a>
											<div class="dashBGraph" id="aircraftYearType"></div>
										</li>
									</ul>
								</div>
							</div>

						</div>
						
						<div class="row-fluid clearfix">
							<div class="span12">
								<div class="row-fluid">
									<ul>
										<li class="span5">
											<h3>
												Aircraft by type Highcharts
											</h3>
											<a href="${pageContext.request.contextPath}/report/aircraftYearTypeHC.pdf?${filters}"><i class="icon-download"></i> PDF</a>
											<div id="aircraftYearTypeHC"></div>
										</li>
									</ul>
								</div>
							</div>

						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<!-- centercontent -->
				<!--contentwrapper-->
				<!--<br clear="all" />-->
			</article>
		</div>
	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
<script class="jasperreports" type="text/javascript" src="${pageContext.request.contextPath}/resources/js/highcharts-2.3.2.original.src.js"></script>
<script class="jasperreports" type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default.service.js"></script>
	
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/app.js"></script>
	<script type="text/javascript">
	var reports = [ "aircraftYearType", "aircraftType", "aircraftEngineType","aircraftTypeCustom","aircraftByStateAndRegistrant" ],
	reportsHC = ["aircraftYearTypeHC"];
	var index = 0;
	$(function() {
		showReport(reports[index]);
		showReportHC(reportsHC[index]);
	});

	function showReport(report) {
		$.ajax(
				{
					url : "${pageContext.request.contextPath}/report/" + report
							+ ".html?${filters}",
					dataType : "html"
				}).done(function(data) {
					var $htmlNode = $(data),
					$reportContainer = $("#" + report),
					$contentTable = $htmlNode.filter("table");
					$contentTable.find("img").each(function() {
						this.src = this.src + "&jrprint=" + report + "_report";
					});
					var $pageAnchors = $contentTable.find("a[name^='JR_PAGE_ANCHOR_0']"),
					totalItems = $pageAnchors.length;
					if(totalItems > 1){
						$pageAnchors.next().each(function(i, elem){
							if(i){
								$(elem).hide();
							}
						});
						var $carouselAnchors = $("<a class=\"carousel-control left\">&lsaquo;</a><a class=\"carousel-control right\">&rsaquo;</a>");
						var currentItemIndex = 1;
						$carouselAnchors.click(function(){
							var $anchor = $(this),
							$currentItem = $contentTable.find("a[name='JR_PAGE_ANCHOR_0_"+currentItemIndex+"']").next(),
							$targetItem = null;
							if($anchor.hasClass("left") ){
								if(currentItemIndex > 1){
									currentItemIndex--;
									$targetItem = $contentTable.find("a[name='JR_PAGE_ANCHOR_0_"+currentItemIndex+"']").next();	
								}
							}
							else{
								if(currentItemIndex < totalItems){
									currentItemIndex++;	
									$targetItem = $contentTable.find("a[name='JR_PAGE_ANCHOR_0_"+currentItemIndex+"']").next();	
								}
							}
							if($targetItem){
								$currentItem.hide();
								$targetItem.show();
							}
							
						});
						$contentTable.find("br").remove();
						$reportContainer.html($contentTable).append($carouselAnchors);
					}
					else{
						$reportContainer.html($contentTable);	
					}
					
					if(index < reports.length - 1){
						index++;
						showReport(reports[index]);
					}
				});
	}
	
	function showReportHC(report) {
		$.ajax(
				{
					url : "${pageContext.request.contextPath}/report/" + report
							+ ".html?${filters}",
					dataType : "html"
				}).done(function(data) {
					var $htmlNode = $(data),
					$reportContainer = $("#" + report),
					$highChartsParent = $htmlNode.filter("div.highcharts_parent_container"),
					hcScripts = $htmlNode.filter("script.jasperreports");
					$reportContainer.html($highChartsParent).append(hcScripts);
					if(index < reports.length - 1){
						index++;
						showReportHC(reportsHC[index]);
					}
				});
	}
	
</script>
</body>
</html>